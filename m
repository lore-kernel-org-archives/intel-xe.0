Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EF9EB26F3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 17:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1810E5E6;
	Tue, 10 Feb 2026 17:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgpNYEur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F75E10E5E6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770745505; x=1802281505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uh4FIsKBMZ0Zl1YziIdqawfjeAliuAHC7hJ2OoThsAI=;
 b=ZgpNYEurHO/6GvW9PLd8k3xgmLr6BHUR9T8325JA4lVDmJ/3jtHT8LI9
 W6sbGADLYaELsSYzP9ReFP4amX/a8xmbfTI9ARE2GAUyyXGriPeGSCYeL
 JqHJf2rbc0ahTR8tk8482ST/gwLNRqsu533HoxKz/r6t9r2ziu/OWFgla
 SOxKDv4WDgzv2K0GEqQ9AGZwEQVOXt5i9wmBpMX46UvQYIplC0IEZ5xcB
 idDTDUNdRrotQqLsdI1Ypp99VigebVxc8BSBzYD5CeRk4LIqt0UipSJMg
 dQG7v03vmujvuSoENUOLb7zlqK2uBjlYgG1n1H5NCvhiNF9zQ885d6QVH A==;
X-CSE-ConnectionGUID: P2KoPfVpQz+TeUP7kA+Cmg==
X-CSE-MsgGUID: Ku3jsSTiQMq37Ju55CWpCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70897921"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70897921"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:44:56 -0800
X-CSE-ConnectionGUID: 9D1ohvkgQridWeHzvOd9Zw==
X-CSE-MsgGUID: 5wBwL+3lSDGVr+bywaivyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211461600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:44:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 09:44:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 09:44:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 09:44:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tP28WOsmXZA2kbgjYEhhnRE7gp9+FmpCRr1nzX2jh1LHLHos/4fLXYbKOejK8lYxPVG/XHoZAa28qM/DXKrnzz7n+z560BSijLstbL78/mB1HsA+HWeJefjIJuDfjMmDdYTO+UDsPjt+ZFwgEVPa/Iju2zcD0Tgs3d/JHOmtgo3fo4hO0/RhZSFWZVjofeRVlj3kl2XVImkBzng+g8Uu3LgmZVAdxlUxdVQwCWwatBvrQDI3Siicex7UpBltm2UKFFm9CrmFTZzQnITRO9ExGL6gexKS4hJvTV7G2fWBMxTMRfCHXR0ueUYQSeuUy5NtdCweN7fJ2qRyUUi6JzSh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqPYwNUJvvc412TEoTnF8BafVxXqzyB7a0Ntmsrpmp4=;
 b=cVn0e+bD6NeYzPJUsIVZmQa8I3PVzqA7ZBqP/hRYUcrZ6KABQzcNtZoaYucu/9OUS9i4+K6LihEzvQS+Fh12AsWF4B1DZo3M9A7ELme9SZaSUCO+iifHqTXfPsd5EHasA6Hk50n6iT3Z9JDhhW3nn4b28ssmQE7P1EmWEhW8BvG6TOso2GVCarSinOiRERN6xekv3UsxYKe5L38zvIX0joW1yYc3GbG5biFpkWyCw6w6byZm6ELFh8pXrdF3icUIh7Ql9A2lfv7vp/wIbaNRUT+BlkeYXEFcL/TziqrPfGugkhBAmymWUPLQDhlnfhivcEO8i+n+SFyf0RUmSdl/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:44:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 17:44:44 +0000
Date: Tue, 10 Feb 2026 09:44:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nitin.r.gote@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe2: Apply Wa_14024997852
Message-ID: <20260210174441.GB4694@mdroper-desk1.amr.corp.intel.com>
References: <20260210055023.890477-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260210055023.890477-1-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8a0ec1-9731-4f67-d62e-08de68cc13aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fhpxn9bvW0+mX77UgPlnSMRVcywSZtOek8FbWIkfs4H8VXmmG7gX4d3p2Vpu?=
 =?us-ascii?Q?B0Qcuva/VHYiQV05mxmmug3fUU4w6FvPUTFy6+RZqonqMHwfr7yjHBJdpjzn?=
 =?us-ascii?Q?n44rjgy50gMwQk8qxwKFqt50uxpJJtwZv4fCxICwjzF5ig20UluOkdrBEuy2?=
 =?us-ascii?Q?QKuWXJqANXCx1xDluFkD0DQeBLkyOn6M84zcMvTDcUK2diIqrMcLllE8tqOJ?=
 =?us-ascii?Q?yehCJOIDxbvJNaoEGYlhTO+CWJxEFrnSUgvriBbIQSohpkdc1HpIbirLri6T?=
 =?us-ascii?Q?DHCCUEz+wi3QfgcvZeBrEXRL/QRYxUcC6upgmbR6VNCUqyuPYjYxpR9vvR5z?=
 =?us-ascii?Q?m6qw6gB+0AoI0PEEwtwAo/UN9eIVZliHeGIHF/svQL7shVJyp6eeyBkDskIT?=
 =?us-ascii?Q?gocHWJiCEqP3KQJfMzy2i5CReNGVyOiGu7kcKifUuIOQ0bYQiV4yd4nq5rMI?=
 =?us-ascii?Q?hVqktFJZf5cJRoBsemm9+neiX4z+2JgtNffbfrlhbv0WVa6dn3RdEcQwP8Dy?=
 =?us-ascii?Q?49Ay3mhA7XoWgIa8WWqxKLq8OqtJtmdO+52C4s0e0XlvI0NOEIEwGzxK38Bv?=
 =?us-ascii?Q?3XstjJh2a07LQq2JYi/4kxo4ZGiX5Fp0tx89EMkmQwyndROkMvr7Ioo4CDQt?=
 =?us-ascii?Q?7tXVfggWnvAZ5XWns3co8RRNjDPUG/Y59ZCtMjyeEVXX6KZmiZ/MlWhhLOkE?=
 =?us-ascii?Q?jLCHZjYf+7dIcS3zFZVIFB900sjF+aBpr7MnH3A6yYq4fKBBM8ph9GkdEtyN?=
 =?us-ascii?Q?hQrPQ0+UsbjSrAgM2PhnVpA6z/Z/0XF11FYfYmtQ/1E/3fwrtf5dgE8jfd4l?=
 =?us-ascii?Q?4Yy4KE8k6Haw4BqDTiCyB7sA7UBsCMwh3h4JhqRenPDKv+CrE9v9QPEVk3T+?=
 =?us-ascii?Q?4++dXD2orzTiyQ/VwZHkzXRuDNcaLLjx5Q/WaQz/tOAgjQ2N++xeQ3b3Bbr7?=
 =?us-ascii?Q?rCgHPMoY4jFTZpXlj8fHA+MD+GifSyRfQ9xEvYwtQSRvHMhLa18iww5SffBr?=
 =?us-ascii?Q?vjYZj9v/a5jTOu2Bfm2il66chb3al2K8iY9rtjAaLv9IXpsCIeiC7WSQSXuM?=
 =?us-ascii?Q?cKJWV/LG6QpXn6NnyE8DemQbSMiqrhOcoT09rlOGPW1UvUYD2HeTqWilUXYe?=
 =?us-ascii?Q?q1qf3jFIxH/BDMcP40sEkG6GAd6NscqOi2V3hbdT7I2UJ3DKTUMJ9gRvNrqc?=
 =?us-ascii?Q?xGgzc7Od6oSiPp5qI5GXKYBL+UPMZOk/JwqVCxLQoBfHIrCorwUrhoiyfSpz?=
 =?us-ascii?Q?6WbMNXy5ERJ4u2uik0ucGH5bSHzXKLon9fqbpVcGhTezBDYhjj8YHtPLl31W?=
 =?us-ascii?Q?xxAJN04m7B3zFz52ywzj6fpDQcv1Tp0wwGUGAKUGnvAcPbF1GGVPpHFTKTEM?=
 =?us-ascii?Q?3lvTTyaYaTl0rN5IUvvPO4qOLh6Otz3OrPOWpyG9XuxozM76KFmJ85t8UnY8?=
 =?us-ascii?Q?AgkRykpJMZkRjvKJYok2CPQUMjuYQIUF1WJygz0YyIPRqnI3QVkYTakuPS57?=
 =?us-ascii?Q?godxivzACKN/mfQlI7LnM6aWgPjDxRwpg4LZ3Emiz3UhsPwkArr3OIK3qsVD?=
 =?us-ascii?Q?qnOKmT9B+rcfqLVr//urFkXjYxABv6n8qobuHw5H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tzFKP5IR4CBPEdMGf4KZgZ/2HNQ0bltnVsCLzAO4ZoXrQbrO3ASvme8EpoZy?=
 =?us-ascii?Q?1rErAhU35oruBJE9afR1K0W9l7M0fCfK9yavapqxrozA/3pqiisMV7EkAYaN?=
 =?us-ascii?Q?UFut+1TzIQDyX/D/JoN+UsuqKwlBEKIGoshxma+VJVEduYLe6he2BKTsCpPV?=
 =?us-ascii?Q?YVYCG0UenlpU2/lpNif1qxzMSP+IzJYxjlHlIPYOjij2j2X7Agvq0tFUfql7?=
 =?us-ascii?Q?8vbuTipjfmiXKFM6Aj7n5SlGJHvGvm8cEHftimbe1X5hlb/L2PVAaDCqrxCO?=
 =?us-ascii?Q?a4xOUl2qO3RgXlBUYHVoAG1bADgdlpiG9E2JK1Ptm3CE/TYIbw6CTB0N+ufP?=
 =?us-ascii?Q?NdGPLqvWoA/NnwlT7qchnn2Ql3sQmffsfoBIJr3z0NOtPHKw//j1VK6xjp/U?=
 =?us-ascii?Q?QQpWiReY9uom2fIMqdcCLM6Gyzhv9LWSmVnZY3i2y+B7HqJXvFkOo50ZqZ5Q?=
 =?us-ascii?Q?oLjAcj7r0uez5Mz+yjNZOiIVv1Lo6aHBOgX4+rR/oWzS+Wl2NCyY9pQi//Uo?=
 =?us-ascii?Q?smu8uusmmd6trrp9c60rMoSHTnjHSx0Xwd0Kz5piXAz6OyWhqGPjYml/wjv2?=
 =?us-ascii?Q?WXnRhj5rM1xXPXvVuEz468WA8j8elBPfJNYYaRIQNHCFXtL35Jq1PS0Wmi1b?=
 =?us-ascii?Q?6NnOwmf0wb/W0oSFPb2cPnRF0Wlrnkloi3+uUb7sWcK7dHb48ITk5wiZawQn?=
 =?us-ascii?Q?OE0njND5xbmbw8jenypdwU8ydyYwsVIKENIlW9PBy8r4R3TSNrI9rx3Vh88R?=
 =?us-ascii?Q?i5VJbuwGYkHHer80cetUpqcH70UFU9lmMhrPhsx9LthQxYZh6TaarE+CNMEx?=
 =?us-ascii?Q?ID+3ifMgi6aqssxMVm6JofpIieFVnX0ODM6BJgIQmYODNolNd7Y7PMmRmohY?=
 =?us-ascii?Q?x/laQmwP3JauFxX8dq5ILZjfJdMLK+vz4POCG/8SUSwer1d8OPUvXkrfI+Dk?=
 =?us-ascii?Q?6AUV8uCFdQjYi2v67LXkecG0pN8779MVEo31+Vk8fQwWNMWE+T0AQI2ys8fo?=
 =?us-ascii?Q?c21X0SkeHafb2AjeIVmM6WhfsopVoeqY7nMj6+9kD+1B24ys4j5C48XPii+C?=
 =?us-ascii?Q?t4lr56lJTbaaUGdjuqgUxmROyj1AQ8l+AiB4ai8tYl54XzURch7zZP4teOsZ?=
 =?us-ascii?Q?cfC2Uy2q+wGiY9Y+rlpQWp9ZAARQeXA5Ayspv3GmKiMKMCE0Tar1EjfaaTPI?=
 =?us-ascii?Q?QGcrS7daN1jL+2AHid8ZB2z0nT8aMWjicX/tfJRTXTrNJpIqur6dyNrc0zFL?=
 =?us-ascii?Q?ORK3EUo0k8lBTYc2Dn/7xSm20XkmdHKoRrIF4td4qI+OOZXkyLXOQbkHX+tO?=
 =?us-ascii?Q?sMyx42NTKKD22Q6l41xDTmrcLtK62mnYLW4PDQhaM0/8o7Op+siUvSOg8YtD?=
 =?us-ascii?Q?2BRBS6tepS6gFT4kGDhqbMdO4fRdHUelDBZXyuVBiahgQvXBAhP2sJe/lAw/?=
 =?us-ascii?Q?bVFg29imCCRfoXRM6ECAKxUvux0Rbm2snAvWxmk3K2VgdEmekMc8Xu/IQh87?=
 =?us-ascii?Q?7uPbBRcl8vtqMIEt4KB6EyNZcRiVotytees7sOaCSlbiNMnGfSVg4fIQ/Ot6?=
 =?us-ascii?Q?7gVIXMOjYCbbLyvaA1C3OrzeTVjTlIQ8eHcvSyD6F7AeLwGYl981LjzOoN2/?=
 =?us-ascii?Q?TjW08PgihL9AkUjeyFBtQUnL54uCwxqW4WGNDTKo3m8hBL7oHTMf0bssvhZO?=
 =?us-ascii?Q?+kz3d1QcaFVC82/+Oqk2+ptDieoXGOSeNMPxHcS3MmmpMz2Xxq9lY46US46J?=
 =?us-ascii?Q?rNBMdnYGgbJ6kUs3ijcCeMfyQJY2FzA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a0ec1-9731-4f67-d62e-08de68cc13aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:44:44.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIKp7JRG2MQgaJS2vngOCSGJtODCadpgv51uIa8Zpbg/nQKs20wZUxDF92oLA7gunogHwBTogv1+dLwRQCggt2KlHw/vrAYqCuBKfkBw5+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

On Tue, Feb 10, 2026 at 11:20:23AM +0530, Arvind Yadav wrote:
> Applied Wa_14024997852 to Graphics version 20.01 to 20.04
> Whitelist registers needed for userspace to control autostrip on xe2.
> 
> v2:
>    - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)
> v3:
>   - Need to whitelist these for Xe2 IPs (MATT R)
> 
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 1d36c09681aa..9881a2d2f10c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -75,7 +75,8 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
>  	},
>  	{ XE_RTP_NAME("14024997852"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER), OR,
> +		       GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),

We can probably just combine these into a single range for simplicity:
(2001, 3005).  We used to avoid doing that in case new IP versions
showed up in and used the previously-unused version numbers, but after
some other discussions (e.g., [1]) we've decided to relax that policy.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


[1] https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/

>  	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>  			 WHITELIST(VFLSKPD,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
