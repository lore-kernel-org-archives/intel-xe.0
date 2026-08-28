Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B2CC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 19:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9E10E036;
	Fri, 28 Aug 2026 19:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIET8gv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5238510E036
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787947110; x=1819483110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C0wXebYdNLhwE2qNeqD6LLpIpubk1RVKknves9h5wyE=;
 b=LIET8gv9TE5nfuxNxLl2e2lPGQT6GODi63GH9fe8Ppg1U0kftLJmWVaq
 DD54et9D9/fSWlJM5MXa5k1RImzb36cGTYunCreMO6qo5FFtp4t+KF6Am
 u7aES+borMUIBs2OC5yM+ESkBZGHLGuXpqjRECOQgrNQuiGha2HXW4aL5
 U4lf/9gUu3hd6A7cvek4PLjUI6xEBJ/uykG328XKPpVu1n8BcaqhO5539
 /+DbGp+Vuuq1OZXOPAB5ejcKwvOiewCOKZA+BSjDqPOabarMEXpi4oZZ/
 5Qch6KDeJovFEUcLpD4ukiUz9RMk0fxOGfqSmFxG0oh8UcE/jmZ+PmoGx w==;
X-CSE-ConnectionGUID: F1mvafuBTJmgLu9R/fCUvg==
X-CSE-MsgGUID: sN4MPfpPQ+aYFV8Lva6vOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88486153"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88486153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:58:29 -0700
X-CSE-ConnectionGUID: HjX0lgN1TqqMzDYW8W24UQ==
X-CSE-MsgGUID: gjzKcgP1T0iyaLWhXLN4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="291731993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:58:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:58:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 12:58:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIrnMOm9ExNkBmvlYlgCq1ZNaxnTW9NJtUogODd90v7kQfsQNz77zid5oZzOmui2GkodEbD/Ux8qYTgOSYDVkWDNIh7Ei7aKY51kaN9TdS1dZbdRKPlcQKmiDc4WeoELj6jzP26q4R2ryGj3Q72wzY1efHa9DCwixbSpnJHqD0xAGUJ5mQ9I0YPFHg0Cs+TZ+WSKSwbCxDqwCUEEgbpLSQjmWJDvii26x/PaF//xojjdyBVX99lTvCq01+3gThGz/p5oZDpXHNT7l90uDdcaNiw8E5kndklEjwEI/lGU+TK2bI3Crd1UVEbHuT+SkOhm+mlcz16IQlm93ktvqXSQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3hEtkn1UI29pOUC6Xgnlub3w5qDWBdvtl5RDh96qms=;
 b=JXA4Mz2bBb9cUecjzZ6E044WXVIKjBXviubOGzqqwIMNgDLrUveotS6laW9AV80PI0W+mz4zPCXxR5fIAi3r9vR8mO/Bs7VX+Uui9vpVGHoozwJIHPHU3N2GT2PxMCxLc0pXNtQ4tZsioHq5KwCQ/AD6YrrJ+/bUN0rVY/gVT5iZXb+TWw1rn06Gb17gFhPGCU0vOaAdb7KVhdT1Q639IMvbJ2s64A2Z5Q42n9oz7Vhu8D8zV1Qunx45Ktop67LF4f7oFs5tHjUyFFnkGrg6zCwY4IsxSoJq6qrghDToUEze7i53e6PBTJ2PZvvcfAQ4Q9kYDcH+fVgPKVOvjgRWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9447.namprd11.prod.outlook.com (2603:10b6:208:571::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:58:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:58:18 +0000
Date: Fri, 28 Aug 2026 12:58:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/vram: add early VRAM health check
Message-ID: <apHoVwMsJtrSDIVb@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-12-matthew.auld@intel.com>
 <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b16c46-e1b3-4f7a-a725-08df053eb456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: i4O7jypnBvE9JuARuIu/GFup/wyCn/wBmQGIpZxRXyoZG53san9Pl8Ks/T+jH6U1htAGmVwOTTW3byUIkGwMQX++DhxQroVCwVpu7tJTeaFmGqDBFBRVXNVBgR/i9FzYTrnIpzHasqBp03iQXpId8B+UP8my7hzTAnvC0C2D6pzFNO1TEad++LYAhgmRu2bEcK55qlpMXn0epuY9LPhv4BFg9CCWeGxbfDUzVeroruQNPukydiNzs4SLyQDgSjMcXky+G21MY0QIniTijMvPnC7fh8yIzRD8V3uugC+jzqBNSl+TBqh9imLP1Hvol+34mnk9i67SCLTt1FWIFs6ejIHWK5bKifYFPNal2E+x2p1+Hl01N9Zf1GVDJIwobI3w/5R4ouEA/497gb4E3ccxyG8adriMciIKkHuCfV3s9Qmldmx/QPoyX0Xe2w4+0s6ot6sEHpu4UmIo5/2rpsJ850yhlzjHjIHlEhQBedCm/Yic56LjDURV94UHTIRNZ0lJtWhpcQfsMHqmOSK1r/Lj3pjmnX5eCqkbguaXK9J+msQJIVzDW30nI/c7S08Gfo77R+yc5Qg3tmHC2Ep88xoHh9WKh1xkcHGymLtXDNAij/yTg273xebLkexKU1pn/xir
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6fE/jAzMzo32irOwBVeqC+wocNe6oWWSJKmil8pbOQUREmZ3oNTbQsE+WVj?=
 =?us-ascii?Q?kDolsUuIKKzo42ei798CYnm/jayqIiXZ0DPyfl7bZaSKDFBnJPjiGK4soimM?=
 =?us-ascii?Q?sRd1UZMh8uc6H16mwQrsw5mxYuQUvxtN/NFyqBSBP6AAUU08lfgN11gJBtXy?=
 =?us-ascii?Q?4khiRtB0SnkS0WfFTk8izG2Z77ZocCCh8eid2+P9Rah2EJK9HUW9chwUTYH4?=
 =?us-ascii?Q?sQIAw2HqGu7Hvl34H6mImRNOej1ND/cqIrksYxw1F95VL4NDlVvVWYM7KDwn?=
 =?us-ascii?Q?GrQBwSHYysc79kG0foAfdFboiM2oIpv5bOsvBUIKofqRBvcpkenhZwJvw23+?=
 =?us-ascii?Q?HhAeiCBnOp/cKI0igoUOeeXsSyEWTMBpA3MBwFExJyc1wio0/Dwf0GzBiKdg?=
 =?us-ascii?Q?td5g50HUJ3JPopZ8NK889JY8OmZW3ueKXD1H0H5mghRgdeWHf6pLScWA+hFJ?=
 =?us-ascii?Q?Z+KPI2x9lktMBoeVFY20a3eoUT2p12sx4B5W/CgDBUq0Bc3kT0MQV5Zh6pRk?=
 =?us-ascii?Q?w1ZAEA4qqHjNH/vmBx7/rju5R6vT8P9D0vt12ZEt+S6+aBGI/+QOXG8j2k7O?=
 =?us-ascii?Q?aGy0XKD7y4ZO7zMuVs2MAYJ52iZpSyNOZFotM5riwtNEVv6JvU4Yn4HR5F+R?=
 =?us-ascii?Q?zSH1fPWtaTMkNpe1//SQDTS3jIGPEFTKuIIPUAtR1ZlEckDTY+VaLeo+KQun?=
 =?us-ascii?Q?+Wmn+CgtRRu4a5mVfuuwUKX2MaMSrV0IRE49oNS+c0H8NutoiNwMMYhY7g5L?=
 =?us-ascii?Q?kvZUQ9VE6Hm1bsD32yTuFiKoSzZFGoSi9zmqfdW1pNFUGxk5WiJwfTo83gWY?=
 =?us-ascii?Q?rVliE1TneMCZQV9M4EkkceDOnw4797QSVdjq5bqbnBrlx4uLLY7rF9IfBO3u?=
 =?us-ascii?Q?DC8sjSQYcFPYIVAMzYd0+WhGR0fIt0ojtd3f+iDD0o+5MIhE1HEKPfcNfhx2?=
 =?us-ascii?Q?J0GyywRHd2dZ3H6ZuwpXj17ouBBDomT3VnIU0NMNERChA2iXEX8yy1iR//Ly?=
 =?us-ascii?Q?4vZuqR2IZEQVWb7jgvZkoihGUcn08h6L4Lxnh+gXysReW91A44n3eKbHfFS6?=
 =?us-ascii?Q?/tqQ+z8BoUrmV0N8ruKFYTJ0ekIVVh7gR0J1Av4TbDiNUFe6fQlXuCOZ34N8?=
 =?us-ascii?Q?0Qx9Z35kfm0iqW7zJGm/KQaxQom+h2qBBpboND+qZig3LjYaV784eq8z4Hpx?=
 =?us-ascii?Q?MhYMiauwnMpRLty7U8s1P8+h0smcuE5EysbvLUW6YhtHS4B+MONZuY/faysh?=
 =?us-ascii?Q?ejn1Nu3rejukYnV5J5FgSU4+MQf5vONlXWEnEWj6pLAk3yV30JeofX8tL/O6?=
 =?us-ascii?Q?iRVgTq6XxjS9ps2Ktrh/hVcpMUddB2a8OJ9Y9r0SS5FjIkOM5o1z8kXqTM59?=
 =?us-ascii?Q?p2/V3rPeZnglcC5RgvgKphIRVVCVoSfPT5auG7UCXLwptA3+kfkiJWtaPgwa?=
 =?us-ascii?Q?vxETv4Hlq9zPQLEm4lBC4piciEjcnX5EHVYUE4pUUR4QVH3wS4gdMll8bHDL?=
 =?us-ascii?Q?L5dByfzRxjBXnc5JL3BF5VrRo9B1RBcF5eOXmdv/o0pMlIu5Ye6esGaPR1pI?=
 =?us-ascii?Q?1g+H7c9WDulSdajTUyv4TgnaJ10d+nvvNijt7jQ68xGbo0AjGEbE+ugwstZQ?=
 =?us-ascii?Q?HYNlsMHTIh7+PG3LL4TxYvjTr2IC1GsKK4PeXgFZS2EtnMQjcjQCXm7VeZn7?=
 =?us-ascii?Q?2vR7DIsyGaVECzsnZq0X4oHtuBFKTD0hbexR+CIeX2tFVkF6n7WCVaLhbz4g?=
 =?us-ascii?Q?Uqg+C6EzBjURrzLjmilMMrigiVxO3P4=3D?=
X-Exchange-RoutingPolicyChecked: h+9s9ijgpZXBP034lVVHzmpK4ByzWV19RAE4W3m2rKTYBSgO/fRLtJ8G9Ug0h+0mSJRysh9wGNnNTEg4SEU3/g/7pMFimGE7xGqkjdLLGoWmPGGWtprx8SOCqAw6lWfzeLXEP4hl928bqGY2NdOHKKg1psFX0naxo8GnwMK5pcUHqoy3AQVp+7XKkTWgm9thsyjMWuMkvunMnFHRtEKhN0rlfCyB4TLrgwxrrBbe3kv1XbYCnmYkMzhwzrr0PkTbwz69+w8ccqmZ+1y7t1elwEWZH8OdhohPZlml8XITeS0aGHqlFHxBc+rDMK3h6XsvJ8xCDGT44ziCvbs4zu9GkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b16c46-e1b3-4f7a-a725-08df053eb456
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:58:18.2844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYWwSJKY9n1gZSRma5OjNLnZWMGhRPg1O7WT/QpITpb/WJ1D/HhDXb19Oj2cgIqpF00cdzBMvbdLXMkEeUrxGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9447
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

On Fri, Aug 28, 2026 at 09:13:07AM -0700, Linus Torvalds wrote:
> On Fri, 28 Aug 2026 at 08:14, Matthew Auld <matthew.auld@intel.com> wrote:
> >
> > With the fix from Linus, this goes away:
> 
> Side note: I told Greg KH that he should hold off on applying my fix
> to stable - because while it looked ObviouslyCorrect(tm) to me, I had
> only ever tested it on one single machine.
> 
> I'm taking it that the fix has now been tested much more widely and
> found no subtle issues? If so, I should let Greg know to go ahead and
> put it in the stable queue.
> 

I think it's OK to go ahead with backporting your patch to stable. I had
an open question about whether we wanted to implement the fix slightly
differently to avoid asserts triggering elsewhere in the code [1], but
Matt Auld has figured that part out while still carrying your fix
verbatim [2]. The asserts are also harmless and only appear in debug
builds. CI is passing as well [3], which should exercise this path
across several configurations.

We should discuss whether we want to backport [1] too.

Matt

[1] https://patchwork.freedesktop.org/patch/749151/?series=172984&rev=1
[2] https://patchwork.freedesktop.org/patch/749152/?series=172984&rev=1
[3] https://patchwork.freedesktop.org/series/172984/

>                     Linus
