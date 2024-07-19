Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E0DC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 20:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8128B10E147;
	Fri, 19 Jul 2024 20:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gobfoUrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A907310E16A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721419561; x=1752955561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lcgUuD9yruBnwSPEjXSgz0eGZG9AZGY1QmFPNQJdy1o=;
 b=gobfoUrnOTTZHzh2hhT+tPjjVlVUJr518ieTHhxOBNO15KCbEe8OHkRK
 CTt7MLaBw9cAzw/LGrjXeKV4AQVw2xKO7Fku7gJsVM6YgTldlEVN6pwVH
 AcLkQh3JNDIRDGbPiOrN+3/jk6gw5beflySlafAEz9keusvf2gFAUlZpd
 ch2lqv2zkVsro92qwkiw+PBISeY63cDHiv0YdqepEdiIf4AVTN7UYyTNF
 BvIb1Zl2HtML9r+GH01+y72jOfBCeepSV3T2jL8LHu8tE96TZQ8FXo4Yh
 3qdmp5xlLQiEYeef6Gldtr4qJZC24fo44fO1uDl6NapQFgAUwRsA4ylfi Q==;
X-CSE-ConnectionGUID: Ei+zQYTISGemN6WBt2JMhw==
X-CSE-MsgGUID: alJZbiH5QNKNHUVp/+vo5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22919040"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="22919040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 13:06:01 -0700
X-CSE-ConnectionGUID: /9/BStefTZGak3iRDcTRLg==
X-CSE-MsgGUID: Fnvm9J+XTLOxjaj/Ueeb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51504887"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 13:06:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 13:06:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 13:06:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 13:06:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 13:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkQW/aYN2fbnxImqTNOiIKRpeGkFv6M0XQ+V4p+dMtyDj0OSTAQED8IiyUcWBzjxfo9RTOH0tcAI4CVS/90LkOyYcbOUNsiI1AwErNYAelJ3h8i5ydjpTckMLiK6JtWHmnPaNWf2eqIqXDOp5Hk7wHglorimJcZsHuU+5BpMt1S2a0ik9gjJH2l3z92GMkkj8FJ11FIyI5Y9pNXFXtnnzWkSbXWGFFq7QpTXPEm8J4fWE8AugNFr1A+tNbeF9Hcr2PDnzehFDOhTfWKI+U/JufSqkmnbTeHncEVRJSfF/YU9Sr9xW5Bnf9YC0Qtm8o878VWFWdQKt+hZ4WUEGb0y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+1T6gQ5u6pRR6SemIINjqtVdsAtCCUoISnWbU3PNCA=;
 b=Z16F/cSR6HcHvXSG0EUoxE1gcuolSvBjq1P426O7DxCRisoSRBdPkbA3p/wv4DZyoB6SVGegIcTk9YjEgAJOynqesjB1CpXbED8w7jSqV+IOXJF1ZUw+kL62no3U9MP7Y1BQ4Kpy6P1EY/6AzEIhDRypTNeks3fbzsADBjkBNv7fGFBU4ChY3bv7zDoz14pWE7F6zK59IrsQjPp85GMluzPHsd8l6cZuOpeBUVZfbw2M+Jsyv/gGgZBq/Hp6MZAPVQlleSwB/e1Lt1DxQLZDztRNh8U5VF0wLhuBOgPeaxTNnDiM2HgVSJUgy+g2CW8n6upvsyeACkqIDUJdlTobmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8291.namprd11.prod.outlook.com (2603:10b6:303:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Fri, 19 Jul
 2024 20:05:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 20:05:57 +0000
Date: Fri, 19 Jul 2024 20:05:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Wedge the entire device
Message-ID: <ZprG9fdMQJCw6ctP@DUT025-TGLU.fm.intel.com>
References: <20240716060343.1310088-1-matthew.brost@intel.com>
 <iltzke4nifu4uzt4yphxmxxt4lfoq2tklkihdzhuqumqcqoktv@7mkpalgxn4ej>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <iltzke4nifu4uzt4yphxmxxt4lfoq2tklkihdzhuqumqcqoktv@7mkpalgxn4ej>
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 9442ece4-7c28-4bc6-e9fb-08dca82e342b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cPz0SSzoYhcp8NDmne65/+ygzL58nvkc3eAkMI45tvGm0tIKc9WGNVARtTVv?=
 =?us-ascii?Q?ASCaFvEB+agNCoU9YpcNp/YPxeKkZ25TrTkbfPbUym0NhLcwqEPe88OAmvJ6?=
 =?us-ascii?Q?2aVFIVTmUSG3aaqHnp1iPEelUK8oTI3EA2latLQXdvrpebj4epdR7/CMzJ7V?=
 =?us-ascii?Q?/JQF5YHH+lSjULftPkWytQtjfqotEyQyX4XYrHKPv/0tI1NBQnwuWmHmqoKJ?=
 =?us-ascii?Q?RQeSDQqpUHn1ccocJTbBEEvuhgWCGae3ydb0zzKH1wmbedZC6fQp2+z1EHvG?=
 =?us-ascii?Q?orWkcihnShnloVgIr0mDXMXRg9Ea+4B03M17c9WvKf5h2sG6Y6/KAfykYBKj?=
 =?us-ascii?Q?TgxCLRayYz167KPsfDhZt+xHfgznJCbNz72Ov5JPZU5FtZoDSJO2hyziB2sh?=
 =?us-ascii?Q?LQUTYJbe8VimGbsvmzObK3qVh4sP2KrwcCiShB0Va34XzpTpd8yIilmbDhqV?=
 =?us-ascii?Q?DzOG1edI/IaJcJ221pPXUfHeoA1VKfIMYqLZUAb6OHyukF6cf/FlSz35LdtX?=
 =?us-ascii?Q?5Wb+nZbj3cCQBwYXrq+c/Bnk0oV0e+PX7SiyajRBzd6VbioKDNX8jwcutRv9?=
 =?us-ascii?Q?0JltpXeYAWP82B6RKsRc+9+shKF2Rhhv48olj9DLhKNR62AgoJxMQrl9vMk4?=
 =?us-ascii?Q?Fen/THsr3tOKKbxwk5z/j0bFpUSsIVETjSKZXKKZqaljW0ZQOhkO8gU95d53?=
 =?us-ascii?Q?stpmAkYynxxJoX5w9oPRwrPiUSOH65ze7pNfjFn/qugjUW/5SCWfZPTq18kC?=
 =?us-ascii?Q?DBu37Dx14DVUf/VVZeovsrMS4YN6XljxIpA1d+ItpHxF9ffp9xXoSZZG18fv?=
 =?us-ascii?Q?vYJ0ddmZliynbUGkli2Azsg1opzJTsUw54tTwMgqmPfubZUx7ZfF92MhoN9N?=
 =?us-ascii?Q?m4rjakQoEgiT3M2gz6E8NyRdKucQa9CZ4vurG0yJPvesoIptfl2QrsrTkWPK?=
 =?us-ascii?Q?kn5AU1BqS8AGPOc3LWyEw6KTA5qrZqRtzPOwqBnUFK3AvdoDePNsPRlyEQZF?=
 =?us-ascii?Q?r1TRwt+B5X2QDzt6xs5Hz+qCAPwI0iphmM2KkPnFMc1r6hiQfH1jg1WZLDvK?=
 =?us-ascii?Q?mS+/o238X7i1G5t7FOyvuV0mF2D3tCcpe7E6p37R5kuIsivyUXZrfv2whGYX?=
 =?us-ascii?Q?BH+xOnFgcjG36hw5hjLhbROpFe+I9cgI5EFSF4DonKQXfZaAH/UHm0dxDHLH?=
 =?us-ascii?Q?UnoXp0z7wV2uQ1kCQZNuPtZRkIGqX//UAyx9mI4M8/Fdq678IQ3bSPPw+Tzh?=
 =?us-ascii?Q?jRwjhcDCtqY2s9j4EjIg6y+xP/OoDoN5Tk0ZymCJNWtiw52EO833RB8A84oY?=
 =?us-ascii?Q?kdc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?em59AFCezVNSTf+n2PRLiEcCKi8lbTLbjyyIM2oxlDcGi/O4PoubaRLB+q25?=
 =?us-ascii?Q?CVIkK3+NLhfmHAXmHAy9Y4gBxM1UYqsjW75c5D4Y0ns8Jl+LIMiTDCU1yIjZ?=
 =?us-ascii?Q?MMfQfnQEoNMRV0tF96g+ezOtFuI60rcVYbqqmvpyXTI4eEQBxRmMNfCPsSl1?=
 =?us-ascii?Q?AXYU++zqXi+zRqCxdh0ES7/7SVLF2gA8BGPHycPhQJNJ8xri7E0Fm0hfOdZC?=
 =?us-ascii?Q?HXA5d5nwPzFfjlYEl7NXceO09QNMzfmOay6ws+RpfimjqSahf5NKxMPpmvDf?=
 =?us-ascii?Q?in5qljHr1oKzw2SzQvMITUvkOYYxfstCzudj7Vi9ABTp1ZcUNHjgbiocTsyA?=
 =?us-ascii?Q?hJGIEyZP1tU8CN0o/5fv5mAZJhBMo87Dh1IlLnHlZoexnLfItGUjA/i81eT9?=
 =?us-ascii?Q?NqXUynX0m6Ftf913dzrmNaYnDYkS5SrEZkTMXM0NeLingc+VOXPM2q4PD2PA?=
 =?us-ascii?Q?aLmik6YavwceFOM17kW4kdS/rYrNqpgJHiL2xn3FfFdGIzhNC8G6KK+UqmEX?=
 =?us-ascii?Q?JDwSYYXJ7c5Vvn9PtwZspg9juIeUBzX/WeVlrKIptkryb/ugQLhyV9bn57gg?=
 =?us-ascii?Q?dSLH/FUHHG78JQGV9JNY4jKLdE/dSmhE0ULoN7sukm+x9xUyDs+Adpt2rzRm?=
 =?us-ascii?Q?5+E9ZcCW7zQIJiZYaKiJM4X3CKJcaxBr0sKFh3Lg8Vkpj4iwQmL+4tVf/Ia4?=
 =?us-ascii?Q?3p/c9C6do6LOUTuEI7gXQVliD69/zhBsmS5DibG0gfcJXS2PMgstpsGIozzi?=
 =?us-ascii?Q?4OcRn7stU+Wz/a6LLv1V8xl8dRY8Dq2f34vLTAZeeD5D+1QH2erbFA9YhmSC?=
 =?us-ascii?Q?MiZNNWn8qzzmI552A/VMKXxcLjFqYN236ifKC7t/MGbhyOvIE3WrxUKJQRV4?=
 =?us-ascii?Q?JfyrY+C1OsiKKmEF0F4iVtTBVNRcVsltw8UKOWf25CHCZ4sOM/BebhTS5pb8?=
 =?us-ascii?Q?3gqeUEWZsV62WoRLbloowETeojyV7Wq4YEsWQRHvTjiurAfxL3aS/c7c//Ie?=
 =?us-ascii?Q?HuXuMyxJOFEnWV9z3CZ/TT7Rqj7tf3jcVEIKCSSW/b9AC0FoRcmqeOzVGVjA?=
 =?us-ascii?Q?zGRwwLc3Q1rVm2l5azb3Bxg8FaL0dsYEMjJdvacSo0R4Ro7bvX+1PuD0HnMC?=
 =?us-ascii?Q?ZoZXTns2Uvk2xdRt9anOH7BfGGaowrI7w52e1fN76utBDs22jInoGQtUN6eu?=
 =?us-ascii?Q?45w+Mnu8jm8BXQKc8EU2kVzwt7UTK3hTrx/XAsTl9Yvc5RzM7GqjPl7xy86x?=
 =?us-ascii?Q?yRr1bpNsYzUNljgvvyX2thJhV4inP5dx9EDDLE/pr5c3VIOedAaa5aHAQYhw?=
 =?us-ascii?Q?iQmiPTXfxU2WpmD+0oHqpYoTtuxnnYbFvEJXLO+h7KOX6OSkWGECQ4QJyMyI?=
 =?us-ascii?Q?c82CfJ/8qx9nAFkBQa6Sd4JF7lvDJHYMYHEF+gns7ko2rumxwlfSoI3uyRih?=
 =?us-ascii?Q?fG96Lq+posIDSEpi2ZA70AwAS7KGjsTShsCUcs92Lg1AEMnShmMv25OV3yEo?=
 =?us-ascii?Q?LoHFu/ClWoNlqw/pTU3Eu9ZR9ixmMt1HgLXiAj8ViCCJmv8Ux7yisVMG4YyM?=
 =?us-ascii?Q?TUKy0FZmBrKWsemLI+UmsdfSoSPrCbsLZqTaMvuz22J/dkf4cdZpF5LSwVH/?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9442ece4-7c28-4bc6-e9fb-08dca82e342b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:05:57.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWVFoA4IUtAj0u+0aXLp2YTZuyiAXuIopXckEdQG1NN8MoNauA/xrDa4/xv9Bhsao52cFVfaQysKv/1TTHhsdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8291
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

On Tue, Jul 16, 2024 at 11:27:46PM -0500, Lucas De Marchi wrote:
> On Mon, Jul 15, 2024 at 11:03:43PM GMT, Matthew Brost wrote:
> > Wedge the entire device, not just GT which may have triggered the wedge.
> > To implement this, cleanup the layering so xe_device_declare_wedged()
> > calls into the lower layers (GT) to ensure entire device is wedged.
> 
> cool, I like the layering.
> 
> > 
> > While we are here, also signal any pending GT TLB invalidations upon
> > wedging device.
> > 
> > Lastly, short circuit reset wait if device is wedged.
> > 
> > v2:
> > - Short circuit reset wait if device is wedged (Local testing)
> > 
> > Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c     |  6 +++++
> > drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++
> > drivers/gpu/drm/xe/xe_gt.h         |  1 +
> > drivers/gpu/drm/xe/xe_guc.c        | 16 +++++++++++++
> > drivers/gpu/drm/xe/xe_guc.h        |  1 +
> > drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++----------
> > drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
> > drivers/gpu/drm/xe/xe_uc.c         | 14 +++++++++++
> > drivers/gpu/drm/xe/xe_uc.h         |  1 +
> > 9 files changed, 80 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 64aea962afd5..1e3d3a7e74d5 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -909,6 +909,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >  */
> > void xe_device_declare_wedged(struct xe_device *xe)
> > {
> > +	struct xe_gt *gt;
> > +	u8 id;
> > +
> > 	if (xe->wedged.mode == 0) {
> > 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> > 		return;
> > @@ -922,4 +925,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > 			dev_name(xe->drm.dev));
> > 	}
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_declare_wedged(gt);
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index b04e47186f5b..a4fd3665c1b8 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -957,3 +957,18 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
> > 
> > 	return NULL;
> > }
> > +
> > +/**
> > + * xe_gt_declare_wedged() - Declare GT wedged
> > + * @gt: the GT object
> > + *
> > + * Wedge the GT which stops all submission, saves desired debug state, and
> > + * cleans up anything which could timeout.
> > + */
> > +void xe_gt_declare_wedged(struct xe_gt *gt)
> > +{
> > +	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> 
> this and the other one(s) look more like an xe assert rather than gt
> assert...
> 
> 	struct xe_device *xe = gt_to_xe(gt);
> 
> 	xe_assert(xe, xe->wedged.mode);
> 
> > +
> > +	xe_uc_declare_wedged(&gt->uc);
> > +	xe_gt_tlb_invalidation_reset(gt);
> 
> this line could had been left to a separate patch
> 
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 1123fdfc4ebc..8b1a5027dcf2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > int xe_gt_init_hwconfig(struct xe_gt *gt);
> > int xe_gt_init_early(struct xe_gt *gt);
> > int xe_gt_init(struct xe_gt *gt);
> > +void xe_gt_declare_wedged(struct xe_gt *gt);
> > int xe_gt_record_default_lrcs(struct xe_gt *gt);
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index eb655cee19f7..de0fe9e65746 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1178,3 +1178,19 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> > 	xe_guc_ct_print(&guc->ct, p, false);
> > 	xe_guc_submit_print(guc, p);
> > }
> > +
> > +/**
> > + * xe_guc_declare_wedged() - Declare GuC wedged
> > + * @guc: the GuC object
> > + *
> > + * Wedge the GuC which stops all submission, saves desired debug state, and
> > + * cleans up anything which could timeout.
> > + */
> > +void xe_guc_declare_wedged(struct xe_guc *guc)
> > +{
> > +	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> > +
> > +	xe_guc_reset_prepare(guc);
> > +	xe_guc_ct_stop(&guc->ct);
> > +	xe_guc_submit_wedge(guc);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index af59c9545753..e0bbf98f849d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -37,6 +37,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
> > void xe_guc_stop_prepare(struct xe_guc *guc);
> > void xe_guc_stop(struct xe_guc *guc);
> > int xe_guc_start(struct xe_guc *guc);
> > +void xe_guc_declare_wedged(struct xe_guc *guc);
> > 
> > static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
> > {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 6392381e8e69..eef671db2f0b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -861,29 +861,27 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > 		xe_sched_tdr_queue_imm(&q->guc->sched);
> > }
> > 
> > -static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > +/**
> > + * xe_guc_submit_wedge() - Wedge GuC submission
> > + * @guc: the GuC object
> > + *
> > + * Save exec queue's registered with GuC state by taking a ref to each queue.
> > + * Register a DRMM handler to drop refs upon driver unload.
> > + */
> > +void xe_guc_submit_wedge(struct xe_guc *guc)
> > {
> > 	struct xe_device *xe = guc_to_xe(guc);
> > 	struct xe_exec_queue *q;
> > 	unsigned long index;
> > 	int err;
> > 
> > -	if (xe->wedged.mode != 2)
> > -		return false;
> > -
> > -	if (xe_device_wedged(xe))
> > -		return true;
> > -
> > -	xe_device_declare_wedged(xe);
> > -
> > -	xe_guc_submit_reset_prepare(guc);
> > -	xe_guc_ct_stop(&guc->ct);
> > +	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> > 
> > 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> > 				       guc_submit_wedged_fini, guc);
> > 	if (err) {
> > 		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
> > -		return true; /* Device is wedged anyway */
> > +		return;
> > 	}
> > 
> > 	mutex_lock(&guc->submission_state.lock);
> > @@ -891,6 +889,19 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > 		if (xe_exec_queue_get_unless_zero(q))
> > 			set_exec_queue_wedged(q);
> > 	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> 
> can we have a comment above this function on the layering flow?
> Something related to this being the "bottom entrypoint", then delegating
> to xe_device_declare_wedged() to wedge all the layers from top to
> bottom?
> 
> > +static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > +{
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +
> > +	if (xe->wedged.mode != 2)
> > +		return false;
> > +
> > +	if (xe_device_wedged(xe))
> > +		return true;
> > +
> > +	xe_device_declare_wedged(xe);
> > 
> > 	return true;
> > }
> > @@ -1704,7 +1715,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > 
> > void xe_guc_submit_reset_wait(struct xe_guc *guc)
> > {
> > -	wait_event(guc->ct.wq, !guc_read_stopped(guc));
> > +	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> > +		   guc_read_stopped(guc));
> 
> another thing that could had been done in a separate patch.
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> but I'd like Rodrigo to also take a look before merging.
> 

I asked him (usually my policy to ping original authors code I modify
before merging, should really should be everyones policy IMO) and he
gave me an Ack.

I merged this series this morning before I saw this review.

I guess you have a couple of nits assert usage plus a comment I can do
in a follow if you like?

Matt
 
> thanks
> Lucas De Marchi
> 
> > }
> > 
> > void xe_guc_submit_stop(struct xe_guc *guc)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 4ad5f4c1b084..bdf8c9f3d24a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -18,6 +18,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > void xe_guc_submit_reset_wait(struct xe_guc *guc);
> > void xe_guc_submit_stop(struct xe_guc *guc);
> > int xe_guc_submit_start(struct xe_guc *guc);
> > +void xe_guc_submit_wedge(struct xe_guc *guc);
> > 
> > int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0f240534fb72..0d073a9987c2 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -300,3 +300,17 @@ void xe_uc_remove(struct xe_uc *uc)
> > {
> > 	xe_gsc_remove(&uc->gsc);
> > }
> > +
> > +/**
> > + * xe_uc_declare_wedged() - Declare UC wedged
> > + * @uc: the UC object
> > + *
> > + * Wedge the UC which stops all submission, saves desired debug state, and
> > + * cleans up anything which could timeout.
> > + */
> > +void xe_uc_declare_wedged(struct xe_uc *uc)
> > +{
> > +	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
> > +
> > +	xe_guc_declare_wedged(&uc->guc);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 11856f24e6f9..506517c11333 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -21,5 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
> > int xe_uc_suspend(struct xe_uc *uc);
> > int xe_uc_sanitize_reset(struct xe_uc *uc);
> > void xe_uc_remove(struct xe_uc *uc);
> > +void xe_uc_declare_wedged(struct xe_uc *uc);
> > 
> > #endif
> > -- 
> > 2.34.1
> > 
