Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16322C5CFEB
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 23:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DA910E08C;
	Fri, 20 Feb 2026 23:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkafefMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB4C10E08C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771628862; x=1803164862;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xZ8+Gp7H641bjBv02HJtgLiGWF7B8Q6pW6qqYyoSKGQ=;
 b=mkafefMSZnDQ3sUziSL+o1Ys91bXWgWVM5zRdbBR8tDqToTg0eA4H/RB
 yVpDCL6RdSa+ILkiE/QeR4Xbnyqvy/P4vDwltSHGqPiIWWbb20fWBp1GZ
 wQ+ScBu+4jmiXidsOg8uW7C6dnCQ28QbQB6JHgAqoJBCKXJdz9P3R6SCf
 e53Vq4r8E9NPI0bjmRtVvLmmU2qjY6PPDgIJ0vMzFOKaofaaKi/Ss0iA5
 /HKQ+qv7VZgJMBukwnW2eAviGNbJFn/3f33fMYdPZLbhYhp4QB5P67NKW
 rczVeHGD2zOCX2VwrHmxqvC3COLBmgI5XrT+Gm4BZAnScDRgGuBW8TpDD A==;
X-CSE-ConnectionGUID: qm7A4xEnQsetHkGKTbOqTg==
X-CSE-MsgGUID: qN9ES86rQjud23MjKfKsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72769482"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72769482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:07:42 -0800
X-CSE-ConnectionGUID: XkB1lUQESnaCs1idcgP6nQ==
X-CSE-MsgGUID: YD0xeev8RPmP27UgWR9URw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214988932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:07:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:07:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 15:07:41 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:07:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQbAylsLcj6CPaIvnVrCF0KMyHwCJYkb4Bneio6Sy+5j8nOaadhjQYrKlC3Be1DgkPCBt2XEy2h+4goRLJmtz28fvZkKLQtftawgmf5TsaRJ/IE0NYAWA/03SRB8y6S8AcIB67GVJG2CDrVHnBHPIudGTt5AVy6BQ1tvsRg6t74oLqlp9HVMZlBAfS8RjDF0B7YhYIj5GRCluKBBJUIdpdLhI7Ym4jY/CmhIHlTUksFeuTWthE6C9gd7OJXBdvKpQjF3PEULb/56rTm9KD91e+LXSQFXiliwA9a1+fWlaQj6GFu5ZJoNUmshSPLaapQvyh1740AKqAg3y21k+yooEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8iM5/d15MNCAMb9t/kzwpb6KtODwB6gEI92F63veZw=;
 b=h235Z6Ne2Z0Zx3lWv89dJNR8voem+VBQtRZ77lY6Z/TazxGUwY1utJvGtx/4RV79rA0QaZgoV02KRb2ehBsxWKl2/C+94eUjsBmgDc8vHUISM14ThuVwrB9yy7SqR7kP1c4vcViPs3hFVp+O5Z8+gfQPMec7gIvT4cmuIxvtl9Bz9OHUchYL2RKNcTow7e0z3NgLdGHhCZ9vsGWwRCEUUMaH9CsMJFYPGZbI+z+wD3TjwipN0YYQkBXMAO4kBzaCt62/kuqumWRpkcCAjM2Shmp4+CTdxQz0qKqGOtyHJtWg2Xvv5Bp113aasolUFELKRPJ3h35mb4m2xZIKyEI/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 23:07:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:07:38 +0000
Date: Fri, 20 Feb 2026 15:07:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Use explicit VRAM BO flag for VRAM
 provisioning
Message-ID: <aZjpN7jKqthA5Gk/@lstrano-desk.jf.intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
 <20260220201857.6113-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260220201857.6113-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 444b183a-1b02-4ee5-74c8-08de70d4d751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XMk8TLcUhKc0Q6DH4lSFzYiHUmVUm25yJEH/Cp8Uvyhn2hGrQsN2Q5ryva/3?=
 =?us-ascii?Q?fscWRuLV0jr3NogI3Q3gzU6FbxmPhvo4StV6mtqacKcsRD8ZPhdoENXwLKn9?=
 =?us-ascii?Q?zw/k4b6a6dm75Wkvw+XLapNao1apNIVqNczAyElq51AKp+W0Z9TWK0FIcoQF?=
 =?us-ascii?Q?c66lC0bM5BI74RoOXejIwLib1zxMuMSDhBoa35iF3+1gyoMn+gR4xEC57T1+?=
 =?us-ascii?Q?nVbINUG8b8TXyeOSSYg8yudYQczWbstVgpAhn4yBwDqBkxabJN9Hg2WgxJFV?=
 =?us-ascii?Q?RtWwcZA99z/zxR1bUmPac7HfrnO1Gcx6bWre1mHUQYnXi/bqGXCEpg1cnZg5?=
 =?us-ascii?Q?QGUeKEJ6P0+zgFUPnu10b17vvGAT1e2bpka9GJw98/aICfW5+MKwQId7UWM+?=
 =?us-ascii?Q?/RL5+iLgceUMmeXabd2+W2XifK0GEyjmrGKpnEEuszffhabsV5jl5wYwgsko?=
 =?us-ascii?Q?tvWWyFnQcEvQH1w1tgcbRzAbhoByDi4ctlGnUYdJIWWXa+RfPB/TJ8XMI8uJ?=
 =?us-ascii?Q?3UjuF/2zAqxN9f1mXiJPIajE0VMP+lWHoPIUl3V9nfx3cJ7Yf+z9pN5CCNK2?=
 =?us-ascii?Q?oqc8iPQlblI+ImwmLCdjsisj0mXstZXDCzUvO916GjCB14aPz2V4zYxoptuV?=
 =?us-ascii?Q?h4DwzMngchOAUHWNwOSov6W0MOhwNtLa5xobYE1Dn5FCTho4I3pAnWaESXic?=
 =?us-ascii?Q?FXjHmxE3XLJjRjzxPzIi1TTgSFSI9wXaG7BKu5zOQ8QhqaisC6/ztPOxWh7a?=
 =?us-ascii?Q?hHGRDhUPNekoOx24PNytJ1ZWCk+YO5E9qM04pU/aDUx1U2fKAi0oXyNcQ03G?=
 =?us-ascii?Q?wYm1p7xeMSn2yuGFmLQV3Fi7xPyKxzA8N9eWun8VeZagvpCRGc6cHfprQgDW?=
 =?us-ascii?Q?mAgqOIJ1fQogoZuBe+fPh+CNFLtSMhqW6gn62h/JmFV/U4Jk+TXc0OnOz4ib?=
 =?us-ascii?Q?N4FZGdF7mOqSKc5kztOhuOrs1izqZccdmpygxqPC5Uo2aoptm0/fKochyt0D?=
 =?us-ascii?Q?df0p2myh+IA8AtnvSKIlmLk//9HghoX1Wcg371JxnYN1Csq7qBGZj48f+/iv?=
 =?us-ascii?Q?KHy2KEwRZ4qj9Hx+x62Wad1yAaF/5IJTBWcktIVsMFQJXO8qNaia9bG//ZhU?=
 =?us-ascii?Q?wejwZtUHxOtbgivuvi64F5wThzmz52Uib+ALxOFDNDUvDQpXU/KDLYg5i63E?=
 =?us-ascii?Q?bjO2C4VDBqV3HSbXnRnf7mGCJTM21XG9OMwV11leOwFaipxRbKuJEkZu+k+U?=
 =?us-ascii?Q?mmBfgGrr9O44UfBGdy/OMBOrBeNDQia+G6tP6vYqJ9Z8pwIAobWkWhMAIWrC?=
 =?us-ascii?Q?+higEmX/DKzZU6Gn293nxegcHys1ImtIITAeIxoeodmnO3QWK0PkO5SEqE81?=
 =?us-ascii?Q?C4rAd/SulgiDhFNDrHrSsVUrD1VPTkjUmzV+GSzn1dBvpXLGn7FiWs5IHcod?=
 =?us-ascii?Q?BfnCUqIQ/W0ryQAfDBZiDQuBz77XLZu8c4vYmXbqsFCktebmg6zwnNoLNxGS?=
 =?us-ascii?Q?iEUPxS9HH2YCWisauJWfWrRfxeROm4sUpwr5V5ekFRps09XaQLHRyCxQKaNq?=
 =?us-ascii?Q?WXtllReaKT7vQLoB0SM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xfnmXeYy7W994fxdC7gm45Jbk+aCrE+DZO9sYSgUv0EigpiRUuGPlBK5RZdj?=
 =?us-ascii?Q?mpeZJpgiWprpwmbsNMGwWhoVJb9n20uqoonAw3lT9bHak0Bb8d22cCHTxPhP?=
 =?us-ascii?Q?RUvG34lmnWzIJQjFZ5vJnIxBIo6TisgwHZNFsdxHsOSNunvC9sLYuu9853r4?=
 =?us-ascii?Q?F47JMRasJn6Wa1YeXFX6MfQwnVcYbKpfGtqQsLHdwOHIKiKyV0zSqJy21uoS?=
 =?us-ascii?Q?jIA8L8BTF0fB50gUJ7E7ktAeCZqmoQN18VABDf25RODQdstw9vDaQRCHg78v?=
 =?us-ascii?Q?C0li5yRmLPd59v5jVKj6AXxd9x133fNoYmScpDiNjnnqrJHGnzKR0ygMluke?=
 =?us-ascii?Q?lVdg5TX+Niqgg15SJN1xNhwIAb9T6DBiUEN3aVhngVgWZ6CDTcQq1KlzAPaU?=
 =?us-ascii?Q?OvrY/hmDjNEsnPecTZHLrrJ4gYE13d41nti3uXqew6DbpWGz2SObDLUIiDUr?=
 =?us-ascii?Q?bqbJwPVXZEHwZhk3VpIYTFzWV82+Z9gryH6Kzqi1aJICgkj2SZvrnZEw791m?=
 =?us-ascii?Q?mV3gN3Qf5DrYH8BRI0xNIu778u+/hNmkCu6gdAde7W6jn30bLOBlo0J3LDKt?=
 =?us-ascii?Q?0VDQTJHVGUSVHH9SUcixZbRm2GfmjEbfhqdTi9XmMR394ogWu5ews2yBXm70?=
 =?us-ascii?Q?JAd8RdTJihE0AEv8nu7unsqGxcovCHcUD+m7Pigb/3JUds0dqhzfTkJ2wTQp?=
 =?us-ascii?Q?QCGk/bZINrZAMEcaIaFPvr/Lt6nwon5Yz6vESxdoC4Gr87tn2PSmWOAhR0Gl?=
 =?us-ascii?Q?8NXM96hU44QFzI+vxZ9hIBHLYa1baYqUNLxCw7qMKByuPeynJB+N9FUowUiO?=
 =?us-ascii?Q?qgz96ytmxqhWWTt1ZtVfpT3A2RMwpJ6gR4SzV8QfvNzEhJuqOe8cdBZ8tFk5?=
 =?us-ascii?Q?a3BoblLDP7kL0ZCNpmRCtpMJpRDpR5gidk/eFMd4umQjCko0nj63SY/WCMMt?=
 =?us-ascii?Q?dXUAwiGc52rbUMjBtBReLqBE52u+Yg2I+HXm96o66qA0We9ma5U3PA7ifwsR?=
 =?us-ascii?Q?0fqnbuNeosctP8YgXKrlE6Tm2E03vX9mvyM4bltCE2kciDppYrbSTZyX6SiX?=
 =?us-ascii?Q?bhRXOPsVbKnWCQRwQd5v9IdEriiJg3TwsYzSMERxQ9vhw8TWurrzeZKzmR8t?=
 =?us-ascii?Q?5kV2RS0z/FxxFPijxyxDB9qvHFoHFssKtYFMTbOYK2NjXn4qCmezEOC40dSe?=
 =?us-ascii?Q?xnYzKMMPUcaGBgu9Nz5xxh805endttMX4ZsvrgYOMfxUBhHpjazRrkiP0sGh?=
 =?us-ascii?Q?ecdELZyOo62do5SmTsUDHNcmk+gh2VwNAPyITro4hpUMhMa0O5y7eJpVuXzw?=
 =?us-ascii?Q?LeS2/dx6Vm82xoZMLf/6UXAY7ocWIQH3JfWNBsXNLPCckDFuWhRlgCo8HSKV?=
 =?us-ascii?Q?MvxPw8+FK1LlhtBd8kfoNZiQPFI0srlZa9OK4HEeDzECRf4thnl0O8m+dNKs?=
 =?us-ascii?Q?gZM/Jl69ICHORtL4dCwyxY/Mwc6Ui9CWdKHFlGqKHvCw6Ykdav9vDUMD0miS?=
 =?us-ascii?Q?WMuuFwgGJXa6qt+v7Co6YWTSzQjD99nKokGFa6YBm9RAuD5vCMCsv3OPE40Q?=
 =?us-ascii?Q?EACSpBVbSE4U3NA3Rxm9KzuKXBawkAVhogZ9I9KpLeDPPLHIB3eGCiODkQjA?=
 =?us-ascii?Q?jTV0/UXLUiLh+1Ij9ivZPx/2Omg/nnG5K8uBPoRkq8H2LRDs9mrpQ/Pu1b9x?=
 =?us-ascii?Q?mD/ZC3IpvJuUUSxlv7cNqjgAtoh7Ny9gPhN6ENMF+jJznvb4Iu+efIKP1Npb?=
 =?us-ascii?Q?rL5zD8u5DHIPbuFWD9HWCD2M3qjq3Sg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 444b183a-1b02-4ee5-74c8-08de70d4d751
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:07:38.2107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rBVL1HC8IRlU/IG1oAdku4o8CtTVjMokL0mbYv3eeFFhEHsLgqW4eqDsL2ieKSbKItm6L0LdCFODgSUyJSi2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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

On Fri, Feb 20, 2026 at 09:18:53PM +0100, Michal Wajdeczko wrote:
> When we are about to provision VRAM/LMEM for VF, there is no point
> in using semi-automatic flag that supports fallback to the SMEM.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index cba20eb6b36b..6383763d02ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1652,7 +1652,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	bo = xe_bo_create_pin_range_novm(xe, tile,
>  					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
>  					 ttm_bo_type_kernel,
> -					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					 XE_BO_FLAG_VRAM(tile->mem.vram) |
>  					 XE_BO_FLAG_NEEDS_2M |
>  					 XE_BO_FLAG_PINNED |
>  					 XE_BO_FLAG_PINNED_LATE_RESTORE |
> -- 
> 2.47.1
> 
