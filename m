Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240FCDD553
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 19:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D171B10E1B5;
	Wed, 18 Sep 2024 19:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7BqszRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2B810E1B5
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726689535; x=1758225535;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=CXLTYNbzOI9jy+E5mhTLNEppJtWwwUX28zGUpfUvGXU=;
 b=Y7BqszRi38GnXpwm4qyNwRM96gOQQehtpXBDvKBWV0UTEdMj/7SN/S0w
 7wo1nyxY/ANcbBSFkIMoqqBYDdxKknQjqAYu68Z6V3IHnu86os7YHAGla
 xg3CQOhx7xHOu+/1U2G5cm5X4C1JZTVzn9MNKJAFoykFvv22DEPaJdcXr
 N1623Y1tu2LSiL4V3JcxrFcRRvh+SmzTbOfiyGSDLnBeNEfWrByPZqwHP
 jgYWc6d8LlRjprcEHBOvowfgnyCni1oKUQPSReA1UeEG88JhhlJWiB6gN
 GRAfs02zKeK04vJFeBeJncvqs3kgC5o1XASu+eklQXAh8bUcG58+54srl w==;
X-CSE-ConnectionGUID: oztPOwWDT3+eZDuLPKy+6Q==
X-CSE-MsgGUID: h7OQZ+IxQ4ec124PUz0Mng==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25498025"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25498025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:58:55 -0700
X-CSE-ConnectionGUID: jufGA15hSaqDWMzrEK9KWw==
X-CSE-MsgGUID: kl7TGXg8RU+9Ac8wHLt1PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74476953"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 12:58:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 12:58:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 12:58:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 12:58:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 12:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw/Iy63wSxpHvkYJi7UYU9eHsZ9VkKienzksGLncaVIJ8Xo6F2OkG3JlA5uSobJiPitbZ9tJHGtOiwreWlev2TlseSlrmpXqmcuBMy0Ucm0C0ogDbiTYrdcC/igjR6ioDfraCcN/8De/Nth4+tnSO6HVIKp37EM3dT3uA2+YmfReZLqzsnFwUWhTa/ZCajMfIxbprxntGMJ3wF7Kc991nOUJrLXLcT7L4/yv6+geA8wlUMjGRK5nX4SUpCyFI6ruGBKm4f/s7swrMfE/Y3is2Mn4HxyWONUN5KxJOUsLtlDe3byo0Utm+fB9LAnmk2okdAWU4qcGYmv0WAOu0yPgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcWSNWeyFCSI1PSyH3lZwXyPA9W6WQfMSMHs4HttpLE=;
 b=cGWMoq19JgleFT+EkUu4+GwQvkKlMo6NbJWVc9qtdn0xPpKd322jnThPyLlnJzwiJUZ2OtF05aXjM9NCpMcB6IV9KATmlMhzXFrVKOQrLnNyt8XJVvtSa++eYXuwqKEoAGQKNVjf0qUfD5EXToSdqlcy86VatJv7qiRlchI4YKEXyeGEHQd0cSjynqDoifDZjjV38Ngrtsidou0OW2VCCFIY5wkXyMb6gNCuVV4VsWHVLuHvHPpigl2l4xFzgzOotFZoG9KXAeQH54Th+gNJW/ky0p8QXnKOOCgT1+NAkEUottLK/Koy/wQM0R1/qEn84qvctZGN7lhcZFagUJpQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 19:58:49 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 19:58:49 +0000
Date: Wed, 18 Sep 2024 12:58:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_drm=2Fxe?= =?utf-8?Q?=3A?= Defer gt->mmio initialization until
 after multi-tile setup
Message-ID: <20240918195846.GK5774@mdroper-desk1.amr.corp.intel.com>
References: <20240917221615.875962-2-matthew.d.roper@intel.com>
 <172661787839.1024102.2112287160420255074@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172661787839.1024102.2112287160420255074@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: b256e0fc-8d2a-478c-21cf-08dcd81c4fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gboVw+3sK2gPzvBeJa0oBpr121lWCiZR4JEh0bur7amzoDgt1bUJoiGGgWyI?=
 =?us-ascii?Q?noPHTYZ1zXTtgYXoReBXHO6iBKJEiCDLJW7gFOSvmgZ4KQUKyb7yFof+9aWp?=
 =?us-ascii?Q?9gfwR8ED8hKz8oZdxsdjnZ/zFS7xTtcO2OucXIbgVdLTsYh652wJHZa9evqo?=
 =?us-ascii?Q?vUR8envH34OxofLACOM3FAIo6ugpZbqDFu1/CO2gPFpMXJq42X5nyU01uejA?=
 =?us-ascii?Q?VpgYog8jQBXPy+ENKox7NriCz8PEfGSbrEX9+fpIcVuoeoDvTD42xE8FoX45?=
 =?us-ascii?Q?9WO4pWznGPwJm8i79EA3wwm9Sqpzzi/9Qhb08Hkjz9zvs6EloM/HPH+h2etI?=
 =?us-ascii?Q?WjY0W23G6ByuptFjQ/YlZ+CeZ0L+xhVdEdBmOSeVjkqh5coOv+CSGRGDKuhv?=
 =?us-ascii?Q?cKf9m9gmgr8rlVtBsCXKsmwy6MUzPGRpnFe8B+qOGjKWklam7T4SS955p3QO?=
 =?us-ascii?Q?xX5a/Nfe9H4xulrz9y/7znY7OdsTZ+kcZdrjg7OProtPNiZegM2J8HC6vn+S?=
 =?us-ascii?Q?7/Jg5YSYGyGfs9Ra4ZrXsNLyRTAyA+cgSLL/odiLNFL6fgr/FaB3dzo75Y10?=
 =?us-ascii?Q?SzGPM4xED8DRWgesG1PPHq8pvvRq+2wbMDPYPNr5pexZqMCZSZb11XDGSWce?=
 =?us-ascii?Q?E9/pP8DUbEEqbG/IBTgvDlA8WnL2mRnMzkhbpv+pTQtoojZOT3zqDJqsC59s?=
 =?us-ascii?Q?0Dg68q5azH8nS0Ic/JB1c0OjJbuuC87AMzfxtej2JTvro44z6WJxJ4RdN/zZ?=
 =?us-ascii?Q?Zffre+8HRTjWUH0tw4cnQlWnH7lDxrR5B5OtCUvQCKYP079YxDu13cjhKI+H?=
 =?us-ascii?Q?oWAG+dDcCuPIRIuX83QczIO/aIjCCdd7I2WgVXhPw1jxgY+h5Oq2y/wEduDa?=
 =?us-ascii?Q?rlriC66Zo6mlp3oje7B55f2a/czwZJZqWbkiadf9CCftUqOiMiX/+xMg9h/l?=
 =?us-ascii?Q?2Vu9jrbkRzs3KomcBofJV9ix9RYFLd88i71dhrfp3AY09MLMsf8FPwv8SgkG?=
 =?us-ascii?Q?y6UaNcyLxoPLXnSEYc2sqc97xQkGTNGxqzY423RQeEbBhDnC2JW2SwY/jmDL?=
 =?us-ascii?Q?jcDKxXaRFIl706y1SWdW1nj+kxTa4u5LoCny3CpV89dWnS85UBLU3STo7j/o?=
 =?us-ascii?Q?FpCyxpU0RsUsk+49WvP4U0f0kZlXq2DMeJyt7IU3x5ysn0Wz/ZrdujEFaqz3?=
 =?us-ascii?Q?0X74MO8JuAVkf0dlq8sPYNM/LCS2aT8ML7YI9znU08pkLZncddrDjTbXmthm?=
 =?us-ascii?Q?mfTXz6cV4qJgqjjYiYtpH38qgMXOqA4vZBoVeLfTFqsThKYeaI3ygof9Tdrv?=
 =?us-ascii?Q?cuM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+h4PvlRZz6LXRcZ596FvUHnjljE41QZqFwn2Fgah4R+wXcUIp0tJ41XADe8C?=
 =?us-ascii?Q?WqxU27i39HN4DcPDnpL+jTv5C50lhzT2j2tk8a7V/lM39na29dEmy2gAbAXB?=
 =?us-ascii?Q?2wRNjvlhc+1WRqELwWoMdkX8fnyoz1kPMQVnn4ZH5GD4ITMaYnlOsSKRRY07?=
 =?us-ascii?Q?qdZGE6NvFfzD+NcP+pjAzgjh0JOZctDMB4/hCtvnht/Y2t8/mQf1dzAKc66U?=
 =?us-ascii?Q?8n6E505BUIoFAqmMq7lWJJIUSicDrXmJWO9/gUVHNc1J546TRvKiIuZxk5Ye?=
 =?us-ascii?Q?aY9/MF84Jvz0EwmB7whzlQy3XstrrOqpZoknCs90gHJr2x2H6hLl1R+UjqeM?=
 =?us-ascii?Q?XySLeEIADifaVBNWyIC6ToVyqbt84+2oj4kkiVOehGb97pi7UIpm/0g+nbKF?=
 =?us-ascii?Q?EJQukKv6pZe79HLA/20Sbi/y4gNsjfm4fWpxHJkeSIcHzhYWpOZgAcAgTGBq?=
 =?us-ascii?Q?+0MEkI4/EBpBd97wxoUdrNx9HFClZxltZtL3kJjcwMJENYQhwAA6HgncRO2F?=
 =?us-ascii?Q?vKp+zZHEHDzn7oLNZPUXbTYALtmpEZ9KzDuL+5JWubRVPfXEcV55AU3eUK1u?=
 =?us-ascii?Q?3bPqoVlZSlAntTifMKlT9SlTy7iMRL/J91jkyhNYJEO+fVpggWFaUgPY4IeY?=
 =?us-ascii?Q?6Q+dL707dhMdkboRyW3CIGdMFB4mETpdbu1uOb3qZ7jmUtuYdMo+NMUWhN0b?=
 =?us-ascii?Q?zjI0UuZo4UL/RrCyy8p9tqu7A+r9qsISKmZ2bttZXG9rtL451Rw11YTi0t2y?=
 =?us-ascii?Q?u5ZlbX4gmV4pOeR4DFyk8QLtWrYyUvoFkBHMykPjoJc1gd+etXOWwXYT8BGr?=
 =?us-ascii?Q?XpipOOcwpWyV9T2Y2qvCRM/ZsZwhwLViJfFtNU3frj061tkKS4C+D99M9BcW?=
 =?us-ascii?Q?KKpM2Uy2SW4cPz2MpMQmbcQNlYv5gHucT/Gu6ldxgzwq7Ms6c3vIDzR8xEuC?=
 =?us-ascii?Q?dS6hiB5YMwMdZ5WvVfI4LT2COS7+SfYb12Ia84BW2lDGMFGDKwi1C1m9jBMf?=
 =?us-ascii?Q?BGN0VRl2YJmy4f9SmxVimTOvs1zUeC15SMhQ3ldVHZx9+IsItcMLz1Ze8Feg?=
 =?us-ascii?Q?QvsSsmALcSDl/FQWXW7C3b2hR2CJcQ3xA0KfDOgOk6nSnZxIbq7C9xXpvlYy?=
 =?us-ascii?Q?iwzON9ohUDE5iTuBSxKuKQvt+nxGYEuL5r6/haYX+GEnI5kEfwO8saXsr4R2?=
 =?us-ascii?Q?b+0f44D6vYKCZVaF/4gjSyR6DhdNCeZrYoxlDSMpt4uhW98T20fh0zpjtoph?=
 =?us-ascii?Q?4bqyZIL1r03WbfGqlZjeKEoemVDKn9rYY1PPfNGwtObroo362p8XSI2vh6ES?=
 =?us-ascii?Q?gZ9BuxZ7CW1CRVeSCqu5XVs9hq1aEcQ9Y1NkQvab0mYX4tpSnC8LY8gpX7ay?=
 =?us-ascii?Q?PukTXCpMp73hnhRDHmDCC5Nu7ghMPUPxf/laTbC+YGD66ZGhr5UN17nQC8pz?=
 =?us-ascii?Q?dr/OYIddZ2rjzSvyrteNDzjvvAZQz1qXRNDmzRqOUFC+eoUWWimhlw/shu78?=
 =?us-ascii?Q?FJaWLbAwHA1r7/UaTWRkRHTD5W41t8zdonaOU2N9PZ7kPtcp5s52my9bmx2U?=
 =?us-ascii?Q?fWK5fvJVQvSG0wCsAOIi6B7QRC32WFRu9iAWAAmACGs/Z2NEiUBTtJD6pE8I?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b256e0fc-8d2a-478c-21cf-08dcd81c4fc6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 19:58:49.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8+zBkQLpDolR5f7YjBn8Qw2O98mlsbqd7weQ1uFOXqPEMWgWVWXRjjbGO4ldJcL7kJ1tm6OuTfzrU6/QqgVULhayNM6Zef3rjpeSM6Oe+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

On Wed, Sep 18, 2024 at 12:04:38AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Defer gt->mmio initialization until after multi-tile setup
> URL   : https://patchwork.freedesktop.org/series/138788/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3_full -> xe-pw-138788v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138788v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138788v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-138788v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

Not related to this patch.  cibuglog shows the same failure happening
periodically for a little over a week (first report on xe-1906).

Applied to drm-xe-next.  Thanks Sai Teja for the review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201] / [Intel XE#362]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - {shard-bmg}:        [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - {shard-bmg}:        [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138788v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1125])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#911]) +3 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1033])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][15] ([Intel XE#1725])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1874]) +4 other tests fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][19] -> [FAIL][20] ([Intel XE#1231]) +1 other test fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1242])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +5 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#367])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1399]) +6 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#1252])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#306])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#306])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#373])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1413]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#307])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#1195] / [Intel XE#2597]) +1 other test incomplete
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397] / [Intel XE#1745])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1397])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [PASS][47] -> [DMESG-FAIL][48] ([Intel XE#324]) +3 other tests dmesg-fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +18 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +7 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1861]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1450]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1450] / [Intel XE#599])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-dg2-set2:     [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1551]) +1 other test dmesg-warn
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#324]) +1 other test dmesg-fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-7/igt@kms_plane@plane-position-hole.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#324])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#599]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1129] / [Intel XE#1201])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1437])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#771] / [Intel XE#899])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#771] / [Intel XE#899])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#899]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#899])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][77] -> [FAIL][78] ([Intel XE#899]) +2 other tests fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#2443]) +1 other test fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@kms_vrr@flip-dpms.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#756])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#1050])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][83] -> [TIMEOUT][84] ([Intel XE#1473])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#688]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-8/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1392]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#2360])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#584]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-lnl:          [PASS][90] -> [SKIP][91] ([Intel XE#1192])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_oa@non-sampling-read-error:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#2541])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@xe_oa@non-sampling-read-error.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [PASS][93] -> [DMESG-WARN][94] ([Intel XE#1551] / [Intel XE#569])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][95] -> [ABORT][96] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][97] -> [ABORT][98] ([Intel XE#1794])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#958])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#944])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][102] ([Intel XE#1760])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-5/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][103] ([Intel XE#1033]) -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>     - {shard-bmg}:        [FAIL][105] ([Intel XE#1426]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][107] ([Intel XE#1426]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][109] ([Intel XE#1659]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][111] ([Intel XE#1231]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][113] ([Intel XE#1204]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         [FAIL][115] ([Intel XE#1874]) -> [PASS][116] +3 other tests pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_legacy@forked-bo:
>     - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#1195]) -> [PASS][118] +1 other test pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_cursor_legacy@forked-bo.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_cursor_legacy@forked-bo.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
>     - {shard-bmg}:        [DMESG-WARN][119] ([Intel XE#877]) -> [PASS][120] +3 other tests pass
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][121] -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][123] ([Intel XE#886]) -> [PASS][124] +1 other test pass
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][125] ([Intel XE#324]) -> [PASS][126] +1 other test pass
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [FAIL][127] ([Intel XE#1861]) -> [PASS][128] +2 other tests pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [DMESG-WARN][129] ([Intel XE#324]) -> [PASS][130] +2 other tests pass
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][131] ([Intel XE#361]) -> [PASS][132] +2 other tests pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][133] ([Intel XE#899]) -> [PASS][134] +1 other test pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][135] ([Intel XE#1473]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [DMESG-FAIL][137] ([Intel XE#1069]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - {shard-bmg}:        [FAIL][139] ([Intel XE#2249]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html
>     - shard-lnl:          [FAIL][141] ([Intel XE#2249]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_oa@oa-exponents:
>     - {shard-bmg}:        [FAIL][143] ([Intel XE#2723]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-1/igt@xe_oa@oa-exponents.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-2/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-lnl:          [SKIP][145] -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@xe_oa@privileged-forked-access-vaddr.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-4/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - {shard-bmg}:        [INCOMPLETE][147] ([Intel XE#569]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-bmg-8/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][149] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][152] ([Intel XE#623])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][154] ([Intel XE#316]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#316]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#316])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][157] ([Intel XE#1204]) -> [DMESG-FAIL][158] ([Intel XE#324])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][159] ([Intel XE#1231]) -> [DMESG-FAIL][160] ([Intel XE#324])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#607]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#607])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][163] ([Intel XE#324]) -> [FAIL][164] ([Intel XE#1231])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1124]) +8 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#610]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#610])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1124]) -> [SKIP][170] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#2191]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][174] ([Intel XE#367]) +4 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#367]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#367])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1252]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#1252])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#787]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][184] ([Intel XE#787]) +55 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][186] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#373]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][190] ([Intel XE#373]) +8 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#307]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#307])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][194] ([Intel XE#307])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][196] ([Intel XE#308])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#308]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#308])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][200] ([Intel XE#323]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#455]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1137]) -> [SKIP][204] ([Intel XE#1137] / [Intel XE#1201])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][206] ([Intel XE#455]) +18 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#651]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][210] ([Intel XE#651]) +19 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][212] ([Intel XE#658])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#658]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#658])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][216] ([Intel XE#653]) +21 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#653]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#356]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#356])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#2763]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2763]) +5 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#870]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#870])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [FAIL][227] ([Intel XE#1204]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#734])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][230] ([Intel XE#1489]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1489]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][234] ([Intel XE#1122])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#929]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][238] ([Intel XE#929]) +12 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][240] ([Intel XE#327])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][242] ([Intel XE#2168])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_vrr@lobf.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@kms_vrr@lobf.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#756]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#756])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-463/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][246] ([Intel XE#1123])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][248] ([Intel XE#1126])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_exec_fault_mode@many-userptr:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#288]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][252] ([Intel XE#288]) +18 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [TIMEOUT][253] ([Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][254] ([Intel XE#2026])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@xe_module_load@many-reload.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-adlp-4/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_oa@create-destroy-userspace-config:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][256] ([Intel XE#2541]) +3 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_oa@create-destroy-userspace-config.html
> 
>   * igt@xe_oa@mi-rpc:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#2541]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_oa@mi-rpc.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-466/igt@xe_oa@mi-rpc.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][260] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#944]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#944])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][264] ([Intel XE#944])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8022 -> IGT_8023
>   * Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 -> xe-pw-138788v1
> 
>   IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3: 38e1b615fb395b928e514108e908cd6edf3d34c3
>   xe-pw-138788v1: 138788v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138788v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
