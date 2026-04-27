Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3AFF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED0A10E8F5;
	Mon, 27 Apr 2026 19:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo634t5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61410E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777319485; x=1808855485;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=8AdBooWrbf6mUH13MDdIdTE1mSYSRx72IQZlxC0/5HU=;
 b=Lo634t5PscmAFSTZ6cC0PsgJbqf4FHc8oidzdid9CASbb3wtnw6CUIn2
 DgadUIi168fLdeXEqnGSnqW+n5RLnNJSBko3ijXwcJEcgrGhwrklsXCK/
 FoWIZLd9K1oPeY7FIUS/yoE1icU5WC+ASYUpLJcUrM/u1JZNQXCFxzXcv
 fk2Xyke8KQ0FQXHPDSNDTDfsujAVJRzCClPbStMbVRW4hfkSybeJ2g414
 j1+vXZU5UiginkdFywxKL+ThjHaWyKtOzrKyQm7BWQM8DxziFWIqiVW5Q
 NfllHLqxO//XPt/ZzIecStylNeXFkUxw0Zt7JwJJ8gEJT1Q577Sj0A0xe g==;
X-CSE-ConnectionGUID: yWHPoVK+RP+fvXsYorDIWQ==
X-CSE-MsgGUID: VYL5vaiPQ0a4RJSi+3jAgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78327836"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78327836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:51:24 -0700
X-CSE-ConnectionGUID: TL61u7qvSI2/UDOB1VZ8vA==
X-CSE-MsgGUID: 3Dw0hgBDSYGGbKT5vjIyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237699852"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:51:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:51:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 12:51:23 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la2JqI4+tEcgDBeGCM7z8newbLGkt5THWFbW+seSCj9or/PTCp1RmyFg6GGZKlfr96jS3oMJYAIrosCQrBSxFJGKkOOTqsZ93mGhJgdyVYXq+skrS9MseIB0vQ2Uv2GNG5PI5E53JZa2sPNC9QOAIGDFcECtVjrB4X8tKSfuGZPyTcHb3InPE0+f+zYdRiJW5+A9h9DObgXG24F/0aLiodQYYkWqmnkwwhM71JABYj56JWBx00rJJsTnFoVc0Vpxx8ql76fzdQ9X8aiAtJJoZXyFvf7IPyFebaHTqlEnuHX6g0SthNvzzcXVcZfuhKntT+TDnjETXV9m6f9a0+tVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBFKgLwiCzEjkYco7od0oHIb1FPzCpC/XnK1dZSVcSM=;
 b=MbnAYJQ5KhAehJK/0ETyzMTnLeEuZwBa7DRVqGpHJ3VL4UmenYCYjRaKeTCcmCAvEdG6R5bggi7hpDESN+XTUwwBC/7wDaEqFG9tQrp9Ne0IUhn1H6AdGl1cub4nwkUep+WUqrm4ad8w3V2OheI9kimPuxRP8AvN41cGzHLCxbgNjPkunTV4Ep73rrldUW+nGctpKXsSh/ZUcyPZZIl1it7DIc1FqzAMZ454+53IzjOvQe5/cS4WilVdHzqY+WjzqMB31fUiF5Ur2DcOnM7+/9FwnJyTDXhEJI6do/wFgdQc4xzNPw2vVRGkgEvETnB+xotmyFfRJsZ+m3hEG/SxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 19:51:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 19:51:19 +0000
Date: Mon, 27 Apr 2026 12:51:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe?= =?utf-8?Q?=3A?= Steer MCR for NODE/L3BANK
 according to L3 fusing on Xe2/Xe3
Message-ID: <20260427195117.GI2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260421-xe2_l3bank_steering-v1-1-613158a27383@intel.com>
 <177683001768.484499.17891293529640343631@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177683001768.484499.17891293529640343631@a3b018990fe9>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: b8654d01-a8c1-417c-63b9-08dea49659f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: xS4Ns/6q6ZI4A2twRpV7RBEoQIiHozPYL2oRP2ikecN/nT9jiRIPmV1grBw5qkR6aHnXhvHQrR/0UquLDKu2VFM1WO8ENO2tqczQWDcwJhrKVgf2l87y1qQb4EhXMI0JVkjAA2kwSvNBFj0VlONcnJD+vYKR+i7S08/Xd0f7njpkgG8UPmLEKCsdpG3sHCApZAwGfl09DwJ1gHlmM1sZf6BDh1wr8hutxfIxZLwAqfgtjAaOXLaF+Hz52aFG5qyJ95eG87WvRcdp6ky/TEuQhDhkW4JeoY7DbsT/hv29FF6QAGEeVftRO5ztkpbUxnngo5C0VUkrv9rLe6EoZxs+5wB1p4PI2TIrmRVqkEjiCiYwSqUuO1f/9fAzgh+eqqOfmNpJ0VJKM/5GFFqXLPuhnzFtIr0qWDmvuWrXTaB3NbYGoVLNR6D0NnqST75ifLdAh+uoIBnubhivTvLfcRYO7rYtg4pLjZCpbbZ44eiGT1pzO5gkJy4pzqmvnqFR/4BD7K1Ol0whYqaUkT4mtzcb3PffF/VxusAPWPKiU502td5Nw7OJATJGPdhNlz3h7G2bhmQHyQtIWRiOep3d/Dqab0pF0Z/KeGvXS41+90sOqFe3OZcspvjA6wgdMzGQWg6kDWU6wU6VcPK4VmAO1Wzh42LT7ETvbcK3LZWe8+S3UB6fPac5meYbioODZyKEQdj8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETLZ3M+4232/SkBzewgMrnih8a4hiLuyUU3HjdgBv/FCLobV2tzf+Kbs+lB2?=
 =?us-ascii?Q?+q5g3NS7ZiQb/sF/c9utcfeX4Ls+shE8FNXFHgPrrfVjS1xkbzkgN+QvLEek?=
 =?us-ascii?Q?8e+bWSQoW6u1EvmwIi2l679H7OxFNt+2QopVJZrJ8Y2+sv2/isDmBTYBLf6T?=
 =?us-ascii?Q?CAK/lljI6jkAw45whLtZZ066MhkoFPVSTtvlOHDmCXjflSDvhqbrdnr7kWUg?=
 =?us-ascii?Q?9mti6iFJWFIjAL9n4pYFKEgsWs4E/L9P7UC+bhwwHAnZvNtBabzUOglVo5pV?=
 =?us-ascii?Q?VdEmzAFslpuiSJOc5sqQQ3J+t8hyHGzYC54wQNvCTqBiWdMmM0As7NuZA604?=
 =?us-ascii?Q?CULy5KSG2883CWP0s599oaZSLwlZH1GYmMH/pJxiC/EIgb3H0pnu0IsV3Cmv?=
 =?us-ascii?Q?qcSPMVw4bPnORBO9eOXalcwVUGVkeu/3rGxBFCxWBTd9L+SaToSptiRX28oC?=
 =?us-ascii?Q?cyK7QZN0Id178YgD6fn45xJAdHrqp/Oww42Gis1Z7+7vph8/M/+jr0GLDAts?=
 =?us-ascii?Q?CedWhHQ8pQLJm6aOYDq21K5I7ngeTed/lO60LqJUYVLeOD1M7Pnr54kPCJ3T?=
 =?us-ascii?Q?n51cdUUlFhkKezYTCCLPkdQ3pmtsfgA4Rpz7J2d8LdhANzIYqxNMCbIqrHsb?=
 =?us-ascii?Q?C9UP/Acx8UjS2gmrHK8OgdLzY4wni3/brleZ20bVlrSXsdNXjwwRIXJSmjMB?=
 =?us-ascii?Q?2F3a1K90/VwAIERDHx9Dl9Jcq9PVLJES4IOeF3kAN17bFda2t8qcVc2xR1l1?=
 =?us-ascii?Q?lw5LhsX0h4kTHzFD3RogovZ19Xpfemwy8FxwZph/dshNGvA4dSEimHRfhvTt?=
 =?us-ascii?Q?m4S9rcJe3891WfsmJc5lgyCo1ZnbiIKcAt5sE/3AG3EFOMu+BpFerPMZgRPm?=
 =?us-ascii?Q?5NTKNzbXwcCCBvq1YLn5vRYyLayvEPwQclW1n2VPJT+QRwE1t1o3dw9X1bvt?=
 =?us-ascii?Q?tJSD8m7N6kmNku2labK0CMBDch26u/ZH+O7QoYD14l7aD+/35rK6ly9BxEOk?=
 =?us-ascii?Q?zkCHoKmV5f0w2oIPG0yLoPTJUfb6RSoukELLkySrlgdMBcghnrrP0ffXsPIP?=
 =?us-ascii?Q?fuCt3op3Uw5/gMtP8Z5hIOhd9Zslt3NZFG1UN2w3xkIbK7C1DmBfhlUupEf0?=
 =?us-ascii?Q?O2Jlo38iI/ke11iSvHv06ntQ6A9nQg5QgX9RYdn3tivMOFNR/42mA7dLKMN2?=
 =?us-ascii?Q?ueGTMb347BV7d3nWW6zZA/OvvNJI2yidOpQVi5LwlhfCOI2H+SuOfv6TJDWR?=
 =?us-ascii?Q?QnABmOW0eXJoJidYCS6nhtn+c6chBfp7KjiSIHzA60VLiwQ+tE1HbQjWkDNe?=
 =?us-ascii?Q?P/PXRyttQp6x879Lrs9nEQV+zyiJ+WmpLA6c9GlE/YM3shJ9QWneaO4f4AZc?=
 =?us-ascii?Q?6qCDnieNicpjc8JUxeDEkUCX7JYMrEv0qVQ5lL+WmxjqjTqOTDETQpXiicm9?=
 =?us-ascii?Q?ysCyM6gRqI5E8ItfBjQwLsCcmqFoKPJdVrHCKJs1VIjSMzetGUX3Dd3MTTYl?=
 =?us-ascii?Q?krm/9lBpheZAKQ5ogJ3r7CyWhxWcb1fDFK5Yfsq99ZFzoaHF0gvwtXaOvA0d?=
 =?us-ascii?Q?CnF/amgIWtwBEcplsG6zRojCCEFy57jGK1jDcRKnwuUGBu1jJCgvCTTbax3t?=
 =?us-ascii?Q?KIonkEZvKlAHjzdvZibJ6XGSOuMddvu5G6VET7TGEG9z1TDkeF5N6N9KjZgO?=
 =?us-ascii?Q?hoGip98swgerVgN9oyFhheyu8/jdt9Guclgqr56z3yk2BPOf5xjegGph3Ozk?=
 =?us-ascii?Q?eze694qsDNXEQID5yYwbviiZLrYj/08=3D?=
X-Exchange-RoutingPolicyChecked: mbTjbvCLZMqK7IfiVOqeEqhwiFSTGo+mqXkbcumxnCONERu8VNSaCoXq6VTOViGkMUogb8WoQKfxyBX989/sHBT9NY+25IRtOGPpscI/vfaOnIltOMfe2q61NcswIAQTCZyIY0POsyUJIlORUgZjblTaJ185KpF5QnDoYWG7j4llD2UTlYc2uQx6NLncx528mJuxcBY3ZNcv4tyF59HnPWjabBFCbM9PFS7CvPahJj9UQhYhW1IZj8suakM2n2au/kfzKWCYrf4jwen8KkbrxWC30ERMdMGl7RRRDTU1Bl4qzP2PG67z7TKzO4PMFmZ9h/7oyYHhif7hI8llsoehKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8654d01-a8c1-417c-63b9-08dea49659f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 19:51:19.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCJwl0QeM74hbZQz69h+h1JmsdOMy1X3Ippkc/G//aKWXYEVoZnb3zobduTehfihuVcDkzVDFmQ+e30dEHJNN2UjFieNYWCx2dZJo4F0pQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

On Wed, Apr 22, 2026 at 03:53:37AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Steer MCR for NODE/L3BANK according to L3 fusing on Xe2/Xe3
> URL   : https://patchwork.freedesktop.org/series/165258/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169_FULL -> xe-pw-165258v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-165258v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-165258v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-165258v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_page_reclaim@basic-mixed:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html

Expected skip; page reclamation is a new feature on Xe3p platforms and
does not apply to BMG.

Patch applied to drm-xe-next.  Thanks Matt Atwood for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-165258v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +10 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#607] / [Intel XE#7361])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7679]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7621])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367] / [Intel XE#7354]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +8 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +17 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2724] / [Intel XE#7449]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +8 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6507])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969]) +10 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#6974])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2321] / [Intel XE#7355])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4210] / [Intel XE#7467])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4354] / [Intel XE#7386])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2244])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4422] / [Intel XE#7442])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7349])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141]) +15 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2311]) +34 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +30 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4298] / [Intel XE#5873])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6911] / [Intel XE#7378]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6901])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6912] / [Intel XE#7375])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7130]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2393])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6814] / [Intel XE#7428])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1489]) +9 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2330] / [Intel XE#5813])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_sharpness_filter@filter-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6503]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2168] / [Intel XE#7444])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1499])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@kms_vrr@max-min.html
> 
>   * igt@xe_compute@eu-busy-10s:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6599])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_compute@eu-busy-10s.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7636]) +13 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][53] ([Intel XE#6321]) +1 other test incomplete
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7140]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7136]) +14 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6874]) +29 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
>     - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#6703]) +63 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#5625])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontunmap-eocheck:
>     - shard-bmg:          [PASS][62] -> [DMESG-FAIL][63] ([Intel XE#5545] / [Intel XE#6652])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontunmap-eocheck.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ro-dontunmap-eocheck.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7138]) +7 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6281] / [Intel XE#7426])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6964]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1420] / [Intel XE#7590])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@xa-app-transient-media-on:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7590]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@xe_pat@xa-app-transient-media-on.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2284] / [Intel XE#7370])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#944]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-lnl:          [FAIL][73] ([i915#4767]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][75] ([Intel XE#301]) -> [PASS][76] +1 other test pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@xe_pm_residency@idle-residency@gt1:
>     - shard-bmg:          [INCOMPLETE][77] -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-5/igt@xe_pm_residency@idle-residency@gt1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-8/igt@xe_pm_residency@idle-residency@gt1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2370]) -> [SKIP][80] ([Intel XE#6703])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          [SKIP][81] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][82] ([Intel XE#6703])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          [SKIP][83] ([Intel XE#2887]) -> [SKIP][84] ([Intel XE#6703]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>     - shard-bmg:          [SKIP][85] ([Intel XE#2252]) -> [SKIP][86] ([Intel XE#6703])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          [SKIP][87] ([Intel XE#2320]) -> [SKIP][88] ([Intel XE#6703])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][89] ([Intel XE#4141]) -> [SKIP][90] ([Intel XE#6703]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][91] ([Intel XE#2311]) -> [SKIP][92] ([Intel XE#6703]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-bmg:          [SKIP][93] ([Intel XE#2313]) -> [SKIP][94] ([Intel XE#6703]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][95] ([Intel XE#7283]) -> [SKIP][96] ([Intel XE#6703])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-bmg:          [SKIP][97] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][98] ([Intel XE#6703]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@kms_psr@psr-dpms.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@kms_psr@psr-dpms.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-bmg:          [SKIP][99] ([Intel XE#7636]) -> [SKIP][100] ([Intel XE#6703]) +3 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_eudebug@vm-bind-clear.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null:
>     - shard-bmg:          [SKIP][101] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][102] ([Intel XE#6703])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-bmg:          [SKIP][103] ([Intel XE#7136]) -> [SKIP][104] ([Intel XE#6703]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@one-queue-userptr-invalidate:
>     - shard-bmg:          [SKIP][105] ([Intel XE#6874]) -> [SKIP][106] ([Intel XE#6703]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-userptr-invalidate.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
>     - shard-bmg:          [SKIP][107] ([Intel XE#7138]) -> [SKIP][108] ([Intel XE#6703])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [SKIP][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [DMESG-WARN][144], [DMESG-WARN][145], [DMESG-WARN][146], [DMESG-WARN][147], [DMESG-WARN][148], [DMESG-WARN][149], [PASS][150]) ([Intel XE#7725])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-1/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-1/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-1/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-8/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-8/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-5/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-10/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-9/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-5/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-9/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-9/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-9/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-10/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-10/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-6/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-2/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-2/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-2/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-1/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-8/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-10/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-9/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-10/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-5/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-7/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-8/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-6/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-1/igt@xe_module_load@load.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-suspend:
>     - shard-bmg:          [SKIP][151] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][152] ([Intel XE#6703])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
>   [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
>   [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
>   [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
>   [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169 -> xe-pw-165258v1
> 
>   IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a80249e26c78435f169
>   xe-pw-165258v1: 165258v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165258v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
