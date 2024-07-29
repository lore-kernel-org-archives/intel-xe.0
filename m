Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA218C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 15:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6E10E41C;
	Mon, 29 Jul 2024 15:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zbq48Mn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404910E413
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722266517; x=1753802517;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=PyBLp9k/rNboCw6YTB/8IhPK5qvkilNepcqAB/VXpBg=;
 b=Zbq48Mn2Bp+W5GDcUpLjmgiKzNE0B1i/72Q8P0gad+EgGBwplfDpcLEM
 YPODu+wM0N4pIYe5icJBtphZHafHKwIUf5RQ9wTPVDvK7ZvB92kQVR6ZF
 TqfHe05FgW6a2Q839kecy/RyoVuXjWhmINcIHmkJEkUdZeJ9UPst7eBtb
 wAGAxXCM2kSHv401V61KLUfWkqZpDp8EQeLvVx+od08TINRsJ3OTMmFZD
 O86da5bO6UO4GqlQs0qmqm1K2SSrldGIrTHgFE5LfKZVsZzfN8eR8VwIQ
 62xqLyYIsWnsSgQaElxYqeXQjZ7jZnVLQ/y1CF5iFxBg62tRTAjxPaIjW A==;
X-CSE-ConnectionGUID: 8Momoat3Qw+jHy67PsFDsg==
X-CSE-MsgGUID: V+DJ9OsYRua/s3+cZ0NlZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20172703"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20172703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 08:21:57 -0700
X-CSE-ConnectionGUID: ZIze17bVStuC5g50t5WISg==
X-CSE-MsgGUID: NfklCk8ZS++ao9XVSehAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58806842"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 08:21:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 08:21:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 08:21:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 08:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwdty8jMLvfek6E6BEzjDw99WvG5GD9KAn4RGT3BF+DIkmPafWkBTZVSrzid5oP+x27JP3b8gOsIu7lmNfafx+3+orXHWgzu0aY13OXwKNs3GZuSI13K3LiYbfZp/AZ1oRa4B0Fb8pL33DYtpBucPpTDqdaaQtA5dTHjC1xlzsDVHevJ1RoWxMQBFL+ZeWAz2M2gdgvGeXAYawiCMVuXNLYfmS7WG5eNdJ7JmjiWLKUAS7CAoA8VQ//sA44bG1HUgOgNyf1DA6RDSMUluZnPKxd8JG/9+jFwBYV5e+kSSHlLW0EwkTPN3UG6RSeS5rtyTkr3QpVoxZPB0SkyQ2QbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqPooddT6R53DVQtX782o6evpR7BtI3Out/o+UetWaE=;
 b=mAdvOg7M3GMrpPvF+qDsdVHRVt3uEVtNkgjOZblw6aoezHe/Ycs/U2+CoJMr7GpnXtFaIVf9Z7Nq67nkmZc/WHnInpIpQV15EddX8Rogck0LFcr831+t/4FiBR8FFm16JWKdP4RdRQ5zEIf2qk/PE68WsAF7yvUz6GZLuPLaBnJw3jcoQlGmks/OZ1b3sKWR/LNZuls1Qm8pxMRv8RJldOY4PTjdoW7QPdufxaoP97G1klyn9/Nk1/9dc4AkAGbAyggDGRbJgfEWtSUVyYzHaA9KPxHJp5/luobTaTymdA18vI6EC7zCjfWf4cvC14zciHoEW2rorRKhx/2aya/g8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 15:21:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 15:21:35 +0000
Date: Mon, 29 Jul 2024 08:21:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe/migrate: Future-proof compressed PAT check
Message-ID: <20240729152132.GA2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240726171757.2728819-2-matthew.d.roper@intel.com>
 <172205718283.387764.639247587330579951@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172205718283.387764.639247587330579951@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 429882ec-de26-42d7-e630-08dcafe2221e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h5O0Roxl3yU6AGSjODP/qcG96ROjEqo7uIqjG+3OFHt+rZk2JFX5bnYxGll2?=
 =?us-ascii?Q?VK1ZGdZPwualt5qjnYpE1fr/zc8rRBzg8xBsT2WauFLaZJqx8xTADk6pEbQj?=
 =?us-ascii?Q?4zn6DBRrww2DwpwuOD3w/3o33L7FQNLgplUDXjoB7lfQG+8W23NJwhcN0p0F?=
 =?us-ascii?Q?qyIDZlGQUMU0RIl7MurfCnYxuSosDX5tSw4jCW5KNJVz1kmNEjoNONdrk0mI?=
 =?us-ascii?Q?KqgI1wjed4WgNEsaOpgfFMbcURP0jh4ZviDiRrSgDdG3JanabaRpur93XwMl?=
 =?us-ascii?Q?cfs3E6ABOFdeW31ykakCAjqutl9s1XwQD5X3H7IQUCbMs48gMLMrH8PUf+Px?=
 =?us-ascii?Q?3BRPk/KAJuIydrNG6UqRSEDSxWznoVHcnBgVs8+o7mVWJmhUVHXGUGsUAHOP?=
 =?us-ascii?Q?jJU/5kd6O/EIQ0qKDrvUejdbRvby502zjvQtpLIOtDruwSKKNWMzh26qauXe?=
 =?us-ascii?Q?gKMVoKm8OPFR2tPPNWtMlC1FI3MBj95Xhkk++nWrs6er4wIp7zYFdFLYX+Qm?=
 =?us-ascii?Q?9Yp7gVp8UKYSMAdWH1/Pwn9Ymwtcl/coPbtFUkE+iBXzoSi/9aGqYvGoiRYM?=
 =?us-ascii?Q?Ssx11mzdxHAmlQaYzMx3fJAWg7plVDmzUMz6NYqhFOZUUMyYxu6bQWQkEGVi?=
 =?us-ascii?Q?JSgVg9sifqktsRP9BZIJJ00tYWns5mzkrbojBGSVEpEQS2Q7k8ibLnUDGwIA?=
 =?us-ascii?Q?ULWQfQj08T0YV3XIpNenPI+78nRCUk2RX5K5r051F6iox2XsH0NPfkHKANxW?=
 =?us-ascii?Q?46oat+d+HWG9ZvHPFX6CiVWPgTWnOFI6fIHo6Mo8O3qc1DiOetyY6zmavFWT?=
 =?us-ascii?Q?MkYQXB0ibh0nN6QlEk1NXzAtZwNY9+bc/BKWyTrxH8GdhuyDkdyKeUt+RWZh?=
 =?us-ascii?Q?gXmpI8fAxGQEktf0Yan0454EHpl4zY1z6brcRiB0xxJVipZu8h8eSwnEyPOr?=
 =?us-ascii?Q?ls8XhsevuxG3HZixMbHX1eDwdHmmyw3/cSx8QGOeFFQRqdkxoxzPMWXXY7eT?=
 =?us-ascii?Q?bDbwZ4sYgRyMKatW5x8aQZ056qmMCISNUZAYV+8uJCnIyV11WxgGelNmXn61?=
 =?us-ascii?Q?p4zxdxszIMoEypNX6odG68JwHqE366e1Dr9HiDwjo3MnpDM8maGQj0GSmvm9?=
 =?us-ascii?Q?zS1Ypq4ozciKWFQmcl+0vOssyyg2+WJ4oX25/UtpoblphPqqvY+V8U02CGHQ?=
 =?us-ascii?Q?E3YEWZoficLrLMDt5GkAtonBB4WwA3m+ZKYFV/Uy2zdW5JkH4q4oFXJ9iR4i?=
 =?us-ascii?Q?SEHjk6NbIq2dQIgI1QR7waY+fxll/YO7EMLF9+Kr36ob7+KOlwAXXbBBMMit?=
 =?us-ascii?Q?/Bo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6yRszRGW9LhBFpAzzYnesmr3xq7NYYqV2C+pZfFs0i1C7IndHT1t2tTXYtFd?=
 =?us-ascii?Q?TvTzSWISXQKYCUm+PkP96NbaIJ7qKkupS473MlsiulGi52OAFTTOv0+f9zIX?=
 =?us-ascii?Q?LRbrdYlseX6PtNNPVh1CyUw2rIkYwmoacrrbUA2JYLu9DGr9YPn1S54onEqR?=
 =?us-ascii?Q?6ZY8E9GAvqYitbfk3yYr71ATyJB6LblrefTQqyMG9l8gO1gmZ/fh8GJP88aR?=
 =?us-ascii?Q?EFsNcguRNogR9+6hACQe2CfFKaERSh/f1zHfi1qM40riTXn0dc8gGeIeiW5A?=
 =?us-ascii?Q?s9GqwVzoOj5TZrgeBiv61dY7dpPbc7T1zIK+VsAjPAF9g8TYO++ac+IGKqlt?=
 =?us-ascii?Q?dPGsRO4FAgy2/opN/XKwfqrUS0xcGxazzUGEZ5SAy2B6N36plgxFWYsRWEPM?=
 =?us-ascii?Q?R55FT63E+CzrPzS1zoFL1psbWhRelZmiCPQitUWVjqJzNj6wJ3EloshSlC1q?=
 =?us-ascii?Q?aLeFoA/PFKDVQI4LtwHKsf+oblB04xVWSmj1W+h8WUpcpe/ZJVssyyC9LI1H?=
 =?us-ascii?Q?rNTPi/588QAvTKOxEgwbg2VDhtsDzpgyJAsOvg8NLgEjr5P8so6x059zs6L4?=
 =?us-ascii?Q?G70KHpibzL8PZ9mwYqY0qwy7Uqo+6aQc2gQK/IiYFtqd8qKNsYcB+9MTy44T?=
 =?us-ascii?Q?zeSb5gtTA0W0e2p3APiPw/GDHowH5ZS8UJyXGcppf0O876s505r3sjDVn1CC?=
 =?us-ascii?Q?eLx0rtckF6ZdMggCzkE/ymEcIlvRTYap34DR+FhClEGVQgN1WmskBDoIXb+Z?=
 =?us-ascii?Q?qjEAUfPyGXieygwusC1JfDVMAr6TR50uifVVHLhmO3MXy8b9tOyGouVCP7pD?=
 =?us-ascii?Q?kZkaW/lebICUtRGH7T53XPfBNxEaBd1ktTNcFu8Xq7YzB9klmpUhwYtyNulT?=
 =?us-ascii?Q?6MysBOG8rD4vvLHzaRItVW7kKawPE1CAiA9QBHEtqg5PJjTN2zGLSmFJJ7EB?=
 =?us-ascii?Q?oycXQ5v+w2rEMtRqxAQYWFmy48fqQEA6JY2cRKYmVkjMMyse2RxpdFU3HPNx?=
 =?us-ascii?Q?r8E2gd7v0n8sdP+aySgpKQPhvIvUEBQ+JRdJaHh+EzudY4iwOlr3Y6ygSN+E?=
 =?us-ascii?Q?Qt+gJjY021cqMmkeZY+H45Xdm+Q0aKuW3o/kjYOFTl0yogOVUY+kNkbiG9fV?=
 =?us-ascii?Q?aF+zSOd72N0bG0+5cpv9BORm3aweVUvJRqqCz2PXtXimmbLHDDl8+NcgcRE9?=
 =?us-ascii?Q?RAKwnBVnj8XWQxOYdbtPxsl1cocxTlcYgCq3gheyVM8CEI7aEXHT9RqrvID6?=
 =?us-ascii?Q?rEm4ULBzk6tYdG6goVcDuOI+ET0m68JteAy+r89wuSmdFnIA8hji9Gy6YMe9?=
 =?us-ascii?Q?nlbuoAV7p3hDsaVjlMV6kz6v2s0YTzSHzaltXcvrSz+gaLS8ehNYw+UsThki?=
 =?us-ascii?Q?TU88A8TX15FVeEbMrZWGDHF6th0uAldyajsFeFXoJMjwVsXhDKzSikS22+Mq?=
 =?us-ascii?Q?sgEZ5bYiU1pL+6MYcztABLdFcpP7qIBr9DBne8kb+udpeJpPbzHovVCLLtsi?=
 =?us-ascii?Q?1tqaZuchrmpZ+ShmB7UXiyfSrX5rJwSXCmXcpXfm/Br3Kg4CeXmTdnfgnUZk?=
 =?us-ascii?Q?wjZvNTDoAfVKxaYrNzDJ3Hq+G0NV1MEGu2wVko6hytbIEvRqnYvHAWdvk7FO?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 429882ec-de26-42d7-e630-08dcafe2221e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 15:21:35.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ez1LVS69Rep/zYnxf8v+Dn3Idxpc+RoSEJZRLY1+y4s67z/rAXR3/yPmR57LaBL3CtPvbZ/6aaIQFG1k2jEUSbMvH6QsBh4ASx9WeC4XXGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On Sat, Jul 27, 2024 at 05:13:02AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/migrate: Future-proof compressed PAT check
> URL   : https://patchwork.freedesktop.org/series/136577/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f_full -> xe-pw-136577v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136577v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136577v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136577v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_sequence@queue-busy:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-8/igt@kms_sequence@queue-busy.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_sequence@queue-busy.html

Unrelated display failure, not caused by this patch.

Applied to drm-xe-next.  Thanks Akshata and Lucas for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136577v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1466])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-set-prop:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#2226]) +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-6/igt@kms_addfb_basic@invalid-set-prop.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-4/igt@kms_addfb_basic@invalid-set-prop.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#827]) +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1033])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1467])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#610])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +10 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#346])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1399]) +15 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1152]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +9 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#307]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1204]) +1 other test fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1188]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1413])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424]) +6 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#323])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#323]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#1541])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#703])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1138])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +8 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-lnl:          NOTRUN -> [TIMEOUT][43] ([Intel XE#1504]) +1 other test timeout
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#886]) +4 other tests fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1401]) +6 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1401] / [Intel XE#1745]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#651]) +12 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#658])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656]) +44 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#605])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1450]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1450] / [Intel XE#599]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#356])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#1035]) +1 other test abort
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#599]) +9 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#361]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#498]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2318]) +11 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#870])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#718])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#1430])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1439]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-a-edp-1:
>     - shard-lnl:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#1705]) +1 other test dmesg-warn
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-a-edp-1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-a-edp-1.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1128])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1122] / [Intel XE#1201])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406]) +4 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][77] ([Intel XE#294]) +1 other test fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1127]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#327])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1437]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#1729])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#899]) +1 other test fail
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#756]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#1050])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1123] / [Intel XE#1201])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1062])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][89] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#688]) +10 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][91] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1392]) +11 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [PASS][94] -> [FAIL][95] ([Intel XE#1204])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#379])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#979])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1061])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#366]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2284] / [Intel XE#366])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#944]) +3 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-adlp:         [DMESG-WARN][102] -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][104] -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][106] ([Intel XE#324]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][108] -> [PASS][109] +2 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - shard-lnl:          [DMESG-WARN][110] ([Intel XE#2052]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * {igt@kms_plane@plane-position-hole@pipe-b-plane-4}:
>     - shard-lnl:          [DMESG-WARN][112] ([Intel XE#324]) -> [PASS][113] +2 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][114] ([Intel XE#771] / [Intel XE#899]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [FAIL][116] ([Intel XE#771] / [Intel XE#899]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][118] ([Intel XE#899]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][120] ([Intel XE#899]) -> [PASS][121] +1 other test pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [FAIL][122] ([Intel XE#1523]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][124] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][126] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@no-exec-userptr-invalidate-race:
>     - shard-adlp:         [DMESG-WARN][128] ([Intel XE#2226]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-6/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-4/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
>     - shard-lnl:          [DMESG-WARN][130] -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-dg2-set2:     [FAIL][132] ([Intel XE#2203]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@xe_gt_freq@freq_range_exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [ABORT][134] ([Intel XE#1794]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][136] ([Intel XE#958]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#316]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][141] ([Intel XE#316]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][142] ([Intel XE#324]) -> [FAIL][143] ([Intel XE#1231])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][144] ([Intel XE#1231]) -> [FAIL][145] ([Intel XE#1242])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][147] ([Intel XE#607]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][148] ([Intel XE#1231]) -> [DMESG-FAIL][149] ([Intel XE#324]) +1 other test dmesg-fail
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1124]) -> [SKIP][151] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][153] ([Intel XE#1124]) +7 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#367]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#367])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][157] ([Intel XE#367]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#787]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1252]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#1252])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][163] ([Intel XE#787]) +90 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][169] ([Intel XE#306]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#306]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_chamelium_color@gamma.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][173] ([Intel XE#373]) +6 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#373]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#308]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#308])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][179] ([Intel XE#308]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][181] ([Intel XE#323])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#323]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#776]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#776])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#701]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#701])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#703]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#703])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][191] ([Intel XE#1137])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [INCOMPLETE][193] ([Intel XE#1551] / [Intel XE#2049])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][194] ([Intel XE#1195] / [Intel XE#2049]) -> [INCOMPLETE][195] ([Intel XE#2049])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#651]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#651]) +29 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][199] ([Intel XE#651]) +25 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][201] ([Intel XE#653]) +23 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1158]) -> [SKIP][203] ([Intel XE#1158] / [Intel XE#1201])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#653]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#653]) +28 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][207] ([Intel XE#455]) +12 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-WARN][208] ([Intel XE#324]) -> [DMESG-FAIL][209] ([Intel XE#324])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-lnl-3/igt@kms_plane@plane-position-hole.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#498]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][215] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][217] ([Intel XE#498]) +2 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#2318]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][223] ([Intel XE#2318] / [Intel XE#455])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][225] ([Intel XE#2318]) +2 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#870]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#870]) +2 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][229] ([Intel XE#1489]) +2 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-update-sf.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1489]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][233] ([Intel XE#929]) +12 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#929]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#929]) +17 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#327]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#327])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1127]) -> [SKIP][239] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][241] ([Intel XE#327]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#455]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_vrr@flipline.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#756]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#756])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][247] ([Intel XE#756]) +1 other test skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1123]) -> [SKIP][251] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][253] ([Intel XE#1126])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1126]) -> [SKIP][255] ([Intel XE#1126] / [Intel XE#1201])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#288]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#288]) +23 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][259] ([Intel XE#288]) +20 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][261] ([Intel XE#255])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [TIMEOUT][262] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][263] ([Intel XE#2026])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-adlp-6/igt@xe_module_load@many-reload.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-adlp-1/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][265] ([Intel XE#1337])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#366]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#366]) +2 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#944]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][271] ([Intel XE#944]) +2 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f -> xe-pw-136577v1
> 
>   IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1673-182c9eda37b57fc679f05fe230977abc3a50cd3f: 182c9eda37b57fc679f05fe230977abc3a50cd3f
>   xe-pw-136577v1: 136577v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136577v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
