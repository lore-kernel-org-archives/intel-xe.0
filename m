Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31A8D0D14B
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972DA10E0F3;
	Wed,  7 Jan 2026 17:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R727hdbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F2210E0F3
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767807859; x=1799343859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iJiNaXE8pv1bYSeVs7cqHLtm8whnlFP+MztdA+f8EMY=;
 b=R727hdbOCKzjXTaR/ocDI3zAKLMoAdaQko5BKDo8wKCSfAUGA9hNzduY
 EMBL7QbnNgSl4hT4xIopI29Z/1jnePUxq8EGKnRdTsg5L1ZrDH1Xer2pD
 qBCOI/if+HmOu7Dfcel4Da7Z1IJ1/GC+Nievk4IeTSsX7YAQLFVr52S9m
 sB5lFUw0dRVt49PvsRQJNm2Gs2uvq7+lUexXbMJ+Oo6BpLm4YP22+QhK4
 ORoQj7cxIjF233cg31qEbe0u9a60CtFdiFwjEUrpqFlk8qT0Tky6Di7ei
 1nXaE6LKWAH12QcnzVHi24wyGYxU2xLmiTfc5DYD4bNfaILSFRGUBsDXq Q==;
X-CSE-ConnectionGUID: Ai8X/iSRRWqbwHyeh77wJQ==
X-CSE-MsgGUID: Emt2lFIJRKSf3dwFWOArzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80297247"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80297247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:44:19 -0800
X-CSE-ConnectionGUID: zQKrnHvpSp+fZew27rQajA==
X-CSE-MsgGUID: O1PcMQaQTz2LINKNp0POdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="234129563"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:44:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:44:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:44:18 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:44:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PX+NEqQgyZRAhw/Ll64iLwxwUIfxqM/MCJUSXwQEUCRRevMX7p8sMi3yasEutb8EENJefqRQtPUXCDyQ07uSH/gD18eLjdv7JnOk+p66SRIbPCJUHhs8k+Kq1Z23B7AikogfIzOsqspccgEzb3TdUWarSzWMRN3O1bD/rm4qHlbwHKubtMr0dC+lTaGwhBpnKzQOYbjjnFKu2S4qHG96toJHV1OVcCwHPypd8kM3Kfw4bLiKtiaVb8w+ZPzk+pRTUF0k0/CtaSbZZ9zK2GTg6am3EWDkgKQXMdp+J6q/J+w7MX0h4IIe9vlcdCizeeRhvoU7Aqd2jXcZ9thge21gyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEtGkE+E+rHs8/ANAmKMODXAhol9riYAHChX6j92eRM=;
 b=Fai4ZQF2+RDGI/JaBlQbZsxT0uuV5DeKgMq5VZSrxmDpW9bQuFacx2mOfYfGJAu0NtxKMZ/BAe9CToKvTuLGuO9X47qMjQ2ZWvpntdKPgTDMICVa60JLKgNO2856JYN0vXq1tlMVe/E4wKaaoJVOONvaKuMm/7jCj5l+bJ4njdPQeRxzd8Ar82N1VTVzIVEs5GjnEP6SICWqOI15VXX5sUJ5zf+R0wMCPN83JL4M47kk3DUFzVmTTOQaNKtrxou66px/Bh2zgeXH6j+2Fk4Vwrb+vtNPIizAi5ACW7/1AsiuATqdOuADiAHfzSYEwzVsfAmRw3UYCgiuiFbmLmSvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB8963.namprd11.prod.outlook.com (2603:10b6:208:55c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:44:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:44:11 +0000
Date: Wed, 7 Jan 2026 09:44:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
Message-ID: <20260107174408.GQ1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe204c0-0b75-4fc2-1f58-08de4e145da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C02xrV+FaU4fd/D5S+xUTiYq272e6EgVRqtjb+zp8pnoi/F9MKKj56A9IsGf?=
 =?us-ascii?Q?yrf2XtSSWBxTU6kkhm8Nt06hQqNtCHSvPu1DQbWOCYPupHa1Dg3L3Slgc6GJ?=
 =?us-ascii?Q?AUPJCkl4m7UlshIAKQ//CJwpy8Bt2ofFhbwB3db31ktB+eEDFKxuq2x9X5Yr?=
 =?us-ascii?Q?4zhbbRT0ZSBu/AqcfNGETcqGYkoJLWWVXcC95+4/uATcQgRBlO/rmau83OIM?=
 =?us-ascii?Q?1ltZCo8ZaWRieplgJe9jhTBwVUxFg0L+vgda/vy26/Uksytrj+qi6EYQKexU?=
 =?us-ascii?Q?VHIDdz7Z07972lDM5/nLlc5EZ70faW3yHF4bZfbcoJy2tODuugizzQtOoJck?=
 =?us-ascii?Q?U19EOi5A0qS9rbER99mpXoYLgCI7krObkjiw4SZS55iFZKZsvuLDI/5Czw4m?=
 =?us-ascii?Q?QnpNulq44x8iFFO045JZmt8sUt0dy1vBzNfa67I15JfI77F+qeps3NC6gPvQ?=
 =?us-ascii?Q?PnHwUMVikvHVYPRqi/8b/LVMJmwofvSrJIuI54XG00yo0u/jzIUQWzJkF10J?=
 =?us-ascii?Q?ykZmHIYZTZMYuoPPjziWp3Uhytpq90taUe/4HMBv5ixe19YgQ/bsxdKB/j2L?=
 =?us-ascii?Q?953cMk9+IUAUUutuK93VZuhpN6Dx19XRvpiaSLvdt8mbyYogS1wfGBz7k2R5?=
 =?us-ascii?Q?c8ulf3ikCsJpDYImbgJML7t0Muyf7H4wPOYdlhQTq+k45PebkAy0t4vpeqpc?=
 =?us-ascii?Q?6rd8Q7Ru0iD+EdWN7l7zz5CNecCpCtls/AxOZT8JFl/NcNfiK1flADGW667f?=
 =?us-ascii?Q?rlqv+rhzN0nTDG2IsrrKVO+6lGzQqneeRERv2/czV42yKQAX/Fi71QYs1RBM?=
 =?us-ascii?Q?H4r5kSgRDYXlz3SvtfZ+FyHn16fq6R9ITEabjIXUb4oqWQmvT8PBa2wanFw+?=
 =?us-ascii?Q?5GBuHBCDrfb5EJRZ56T/tkQ7yINCvxG0i6EdmYzDnF+4c2GvxGHDlSCyI6Fv?=
 =?us-ascii?Q?t/nhoSIxO4QeEVQhduH2ALRRyKYKR9RZZs411uUuF6tMR7/GtveQQsHw3Wn1?=
 =?us-ascii?Q?n6UeSHZHHAAH5d1jbmNGebz80x5pIqtoZS/1uU3cEJnR46NSOTD5i6RP9SKq?=
 =?us-ascii?Q?ESbv7DKsryvgtY5PGBFTFA5D+8NksiKF+8fXPzAjTzuQQRC5Ey1F4/RVcltL?=
 =?us-ascii?Q?Xy6tQgItAZ8U85kLqrJjYyOIDc4EJqyXQEcAuZS+dTlu4iD5+8dn5coJ/fy/?=
 =?us-ascii?Q?UF/NjgEjIKS4mlXxNGyvzFk5GDHs5ThzP4QU0Okh6JUvpf1xNgx23YlensGi?=
 =?us-ascii?Q?uUnKXInPKFkBvGPYKcGlHkBDPEhv7v5WBQwEa1RFMZK+GyEkB+TWXE/qtlnq?=
 =?us-ascii?Q?gegFz+hU6vqkNQ28sCNTxV0I4ayQrr1TL3wy4Dxj+8Jpuyy/bwALW2126Q+B?=
 =?us-ascii?Q?tc6FQqBOH5Hh7JWayUqHSSh1L/0hq4VoSVSOEpNmyvf+t0/S9hwV40pex0N8?=
 =?us-ascii?Q?qfzbMNV6trKC+3fkns0zJRFAwbCecHPo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0J+9/76wotgW5nsW9q0HMT98viK90bSR0A5TLRelP2+IrkDtywJbAvX3hHEU?=
 =?us-ascii?Q?UYB4RYmH5QMK3ZF7MC5o/7os4K6LlAmRf5U1OjEXlMxqYCZ66zLySZvGkBpJ?=
 =?us-ascii?Q?M1YCInebSNH9ruD+KY+CBQQ6K7i4uelw434C81T4XSFkKdae7cPiq5cYaxVA?=
 =?us-ascii?Q?8H0d5hDzoRx9XFKN8mjCD8KWJKA6KL75Dy6lSuLesMZ+26k6eONXFz3CqP/r?=
 =?us-ascii?Q?iExt5rRKtPPMKkahYJbXl8WK9bmvcPkcoV+SaY7gHg6p6wDnywxm1XidR1cR?=
 =?us-ascii?Q?7LTAdEWQbOmyjDfwiz5mdh08X2mXAQZzOWe0vmFHm9eY23u8wMr/5BPpdndl?=
 =?us-ascii?Q?olHtU62IGKsriIcZSH7MMrb6sZSgPH7AA/4w+65+a7UYKY2RAZ1WpXFSz3SX?=
 =?us-ascii?Q?FAt8Sjzx3/8CIuIuzVi9wbMOdNb2ho/e2Nke9jkkXF5sl5SyhbJHz6r0exQU?=
 =?us-ascii?Q?s59QrTB1ISZIhA8+2GLE1YGzZaO2vj2R8itIs7obFKe5btKh+kyVOMO25554?=
 =?us-ascii?Q?MwGvpbkb6qkQ9RLCdBjLGFD9PKYTDJ207ij36IzZgcm8HM4t8BnO/gbZo8XE?=
 =?us-ascii?Q?o+5L590dim4vhhEAJhI2lRxNschfVa8w21d4l7z/NXkn4/Cbdrth9wlm+M8n?=
 =?us-ascii?Q?md/0kwf8O79Gre42Q7BBGJABaRj5MkLPI7XLjkRKAT2FUvrGoxGVOgCkO6m5?=
 =?us-ascii?Q?LxzbVZ9Le84fm/poGcEumDVWTcpSquoji+IL1LWd7zJc/3wsuiZvFWGRCgIn?=
 =?us-ascii?Q?EyameYxWi0/1BRFkEtPkqipsuw4GM/btWinlYW8KGAa44m1nvSDpWaTFM1vg?=
 =?us-ascii?Q?EdKsF4ThIofV7i/iV4dpP7vGU/cKkZU5YMHoTeT6zbohjFdWFGUmhF2gOjss?=
 =?us-ascii?Q?0eaWjfrCVNhAAzs4HO917APsPB+LMBw6gpDw/AeBDN6xZWB6HeF3JR5XntzF?=
 =?us-ascii?Q?gCjfXvS99R/rNdWt5XIc/Km24BBG1B4dMIuEoVj4Agmp7lvvH+6Dz/gYmyOo?=
 =?us-ascii?Q?1Ng+pP4Noin5ijSG4VZ0sAKCEfsrTeEMIDZPe1Yg50zYdHXaJZH/c3apkj5m?=
 =?us-ascii?Q?GiR23v7gY8IfTG392l5cG+FBUpcb0NV2XJ+p2XU/+I+FmNH4Gc8rkTOHg264?=
 =?us-ascii?Q?qgWVE2DAFiogGMez5mUR5cadWKM7hRNw7/3tjWQA8j1oGlYd+0OOZH49otjL?=
 =?us-ascii?Q?tS6g+NOm9b5q77N56arfATrGQNBb5sg3TFiBlqZtO4GhTU8FexQ0mpsZfdjy?=
 =?us-ascii?Q?oYOSS1311UQhtgrbXgLzg3c6BzkcZO+o/dU/k0EUz4O/cf7rLQ7v5QJl3Sx8?=
 =?us-ascii?Q?fi/9DwF4Yv2vQpoCXf7Z17ZISOgZFhkMD+oFWVxnMD4GsVSFIS8wkGvpW5xQ?=
 =?us-ascii?Q?fsuiSinNhvwURLBIEI5EuLw28DeAw9oDL3aY+tDMqiWwYRF2NLO84Lc+afL4?=
 =?us-ascii?Q?tpfZkvH4ngxILJsqVeE3e4zqb6SsbpGUIi2IyP7pFUaeDS2BKGKfr+knJPjF?=
 =?us-ascii?Q?pGMWxp5AgKZkD11fpKvbfri19y18CU0ZxjPB50pGb9RWOGQ9OZ/g0ddf47hU?=
 =?us-ascii?Q?Mg9H3XUn+tEM6DPTtSCYHW9pKyJwofh7dxyG1mpT8hTbSBTvP7xpI7hnGppQ?=
 =?us-ascii?Q?+2JYL4UKSh4InGE1ATS5nkJ8m31iI8n0JerIXkolY1vfMd+cYrqX4ocoZjQV?=
 =?us-ascii?Q?ijzwmQYoBWUKR7ZfRqAn8/e457zD7eUPc0djwwPe/6Ny/A5YbA42J4dMtKlB?=
 =?us-ascii?Q?FCCasqWZvQK1FdWIh1BOQtoeZjR4Rrs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe204c0-0b75-4fc2-1f58-08de4e145da3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:44:11.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZydMW2N3egWoGwSunXx9XW11NpPw50YBg2gO1Dr5GbF7u6q+emiNDq4vabgHpcR31B06f23wpNPpqBRbliFcStzNTxyt+ebG2jDxSVO7O2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8963
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

On Wed, Jan 07, 2026 at 05:53:57PM +0200, Jani Nikula wrote:
> Fix kernel-doc warnings on struct guc_lfd_file_header:
> 
> Warning: ../drivers/gpu/drm/xe/abi/guc_lfd_abi.h:168 expecting prototype
>   for struct guc_logfile_header. Prototype was for struct
>   guc_lfd_file_header instead
> 
> Fixes: 7eeb0e5408bd ("drm/xe/guc: Add LFD related abi definitions")
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> index b6ed20d5b508..5c48459f365f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> @@ -148,7 +148,7 @@ struct guc_lfd_data_os_info {
>  } __packed;
>  
>  /**
> - * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
> + * struct guc_lfd_file_header - Header of GuC Log Streaming-LFD-File Format.
>   * This structure encapsulates the layout of the guc-log-file format
>   */
>  struct guc_lfd_file_header {
> @@ -163,8 +163,7 @@ struct guc_lfd_file_header {
>  #define GUC_LFD_FILE_HEADER_VERSION_MASK_MAJOR	GENMASK(31, 16)
>  #define GUC_LFD_FILE_HEADER_VERSION_MASK_MINOR	GENMASK(15, 0)
>  
> -	/** @stream: A stream of one or more guc_lfd_data LFD blocks
> -	 */
> +	/** @stream: A stream of one or more guc_lfd_data LFD blocks */
>  	u32 stream[];
>  } __packed;
>  
> -- 
> 2.47.3
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
