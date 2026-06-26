Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248AC43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 16:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62E310E3CA;
	Fri, 26 Jun 2026 16:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dptSROUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE63D10E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782491984; x=1814027984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ihk+LEW50YeS8L/Lax7/3S8Ho950YuacnnIeiUXtvC4=;
 b=dptSROUxBPQ90Cu+N/pIVhOvyhcLCvDZbuQ3VMknMXv/DppPpL9Effzs
 CTBG1FByzcFyFeowLVdDBzi/sw/ul8OtO+GE5vMppeCUAbmM8j5NGxHGU
 fEoOqGc7yz8Mtw40tNqtQE3RuTBqCE5ZOHVtppQiLn6Ns5AnEeVZkA3z0
 ryz4xxECJJBeT7OCGESPeTZAD0iRGYzzFpOlqi7vwsntt5TcmxwncdRIO
 S0Jd86PddKkWC9Rsk93CvWC1ncuheoIuIjUwq+fnDk6RZ+Lw4EDS4/ufI
 6HSsaZTv9aItszCkyyBUEkaa4JCZCP+0PBGBRrfz7HPWDwzF0VMD+LWTr Q==;
X-CSE-ConnectionGUID: OaUoAeA2QiaFFa6Kk4BalA==
X-CSE-MsgGUID: GPfWRRdfRIKbx37Tr0r1LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85837799"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="85837799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:39:44 -0700
X-CSE-ConnectionGUID: jPTlxX9cTa2/evQjXoZmiA==
X-CSE-MsgGUID: dtkfAC+fTKGqthOIh0Oedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="274575663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:39:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:39:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 09:39:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDfnVA3Ibtoi9YKZQxfIyg7LOj4lAZmeg4XGjx6LjR3Vf5YvB411Ed7O8ZXktx8/WsNZNSdQdfAyqGw97JSqBjkOvuPcXgsRhHISE05qaXFlYEjOx4tsiu4GbeY+9N3qpQ2ZTyXznhL32uHtLBeGUGf/+T7674Nsc367S7eaUpMsjwBGHi1ysyLNoZjPGtrAtZqB5XDdnpODrpCOEpzr9cwoSqxP3u8ixCOnRBgnOKofYm7VEAoBimBSY0x3+ZOcm1TloFg3tBQ2Fu3JEseQHJe6w5QfvDA5P8vBbLIwAoOMeV7yyqP9mzTdJVkTenBg4GJvlwdTjQctkQRM5/Ok9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ajff96DKDAB26yeWx71OuGPP2Sb/Rc3kzmBmH+gxFQE=;
 b=kQxW7ZnjO/H87fQWU6ZsY89r0jh/rqAUn0gZHhQ2fCzcUVreoPINmQeTHS4vqjfQYEWSHOB+1f2OkP8p7fuzGBlr8VtebFvb13uuSMVrcnhjKXP/SFykDIZFa6k1YScOtITIqVxhONNZ5v3L2Pl1bP7UyFiQiI6dtyn2N2VIGgWuBf/hRd/FLTZycgPTx0Bfm4jt7GnkKbHaOTyr4gmSglHd2Svr3shRYNsqFt+60vQtBpOuAY/3bfl16IUVjWpfWITt3QS9RjCH9ug+woxEamKqKV3WLPE510CO45md/385xU9CzEZj5k9mRRXKWeBTbmsINeSu7gHU1chQcMr2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 16:39:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 16:39:40 +0000
Date: Fri, 26 Jun 2026 09:39:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/oa: Rename last argument of
 WHITELIST_OA_MMIO_TRG
Message-ID: <20260626163937.GR6214@mdroper-desk1.amr.corp.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260617015422.226177-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd696d9-7719-4132-6b1d-08ded3a184b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: NjEzKNXaJfi6aev/zpkl5VrXw0B3gustP60uyT0K/+wa/OuWu8udzwe5oGE+0cjgh4/rPx1/XnTjA9PzoSioFdKE6mPQk0rucxQad0JZtBo+LrlYFyTiq2GULFCrkRt/aViN6xtNQb6fuMURsBxbQzm32afxBUVXx5iLIJTHE26ZWpE3eznvMp16zmGXMEXhBr3Hz9C6TjbeECPrShH8f0zvxG0lUpRWjO8ul74g0bLkQkMQBGEdFvUbTI+an81G2tLUf/VWPSkYLNFIuor5mb07bcbHHVCqAHyiG0ragkaqw7ZidWwKzX8HW5lcRzhfphPkhixmdAZA1pVORLr6EkQBRboGq+FUoEAE9BR/fGQtRYCTbrbnwkUXVb6OigUVjV7CzeSQsTG2SdAHFsU6jY7yDNohLwRlWKhDrHimpEKb+ZSLlJFKJAcOgDAlW0u6nECQdTLKnNt7aGnt4l6/S0hVIfoWjzWXHJOZUB5kgw1qj2da7jyAV9Oww0+yiEFg7VGQg3E20+8W0pg+Lq+ZjBtpv9GKlo1s71EGlfUh2Fi5KFtFvziNHPZgmmLS2EKicPLnL5A2b2A4SRcRyraN8YMe51pVpZydGTc9QRR7nLNyLeGlA8fCH0qvIS40kz8xxMeNG40v1eFpjrL7uvtlk+t11I6UDj8oBPpaajj5JDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnVzGjwOsCYScR4Y+vzWBxO89Fptp9nyPZdVbXBuBhyBsZhwBPiLePo0yAT4?=
 =?us-ascii?Q?hDKaf7AKvoyU2hODq1Dn8kw1eGsFM+7NZaqcbv5AFgiJwk7bplBx+Vmmsrzc?=
 =?us-ascii?Q?gV2nvZp7pfonCatSi+cS1vF1lC+E9m9gVPgGaFq4pWpMgxbQLDQH4QjKlTll?=
 =?us-ascii?Q?JpHcLpm5uNzd6s6onPBw85Z62mqu6M1VGa0oBRSengYhAbD1gJG0WRqa15iC?=
 =?us-ascii?Q?86nPpk7VT0c8qCJg1Qx9edYxxsJ+UaN7KpBzWaGoSblKZlvwK/tWdLiLTUUl?=
 =?us-ascii?Q?54mJ3mY06fEhwxeqPiP+zlKTNjnkcq4fh1eWyTC6gHuY35mjCuMxWbPYeJaB?=
 =?us-ascii?Q?ZCxflk2bqtv8EvwK0gTebX1NWnOa2V4U7aYffRXh8A3HZE9J+zVqCH8YnFVE?=
 =?us-ascii?Q?jrkD/cl0cDQuNvd4PIUplGKX+E1eZFVTlS2cmYSyPMyH9g84h+BAzZ9INQgl?=
 =?us-ascii?Q?sW1HyByyjRgQy9HPp5JfWyhY+VjfJKAkm23qMctwHKefLFNMLKQDu0ElK+ft?=
 =?us-ascii?Q?74P/3ekAG4E24g7lfDWktaw7J+8MFQGeEfdYVAYNcLfkMA0zstdRHCqiis/o?=
 =?us-ascii?Q?UElMYHYgnsianMmAGhiTg/JkBMPp4nDN50dinzWfU0V8+4t2ULtkLp1Iy7dK?=
 =?us-ascii?Q?3xUfCPtiChQ5hecITMIuPEjz5uzfRT+/qJz7cgxDq3rwNBRl3yHWTp5dy6Ri?=
 =?us-ascii?Q?3deUNJ6Vf51/3iyi4N9mx1jAoJ8Ngi7ApQsblm1uvrie9DhhZ3FawB1vwjY1?=
 =?us-ascii?Q?Z9PXgynzdcN5m5FqnhrkoQkTBkAa6jMVbZxUhrD/SEWI7W/OjLbEfQbZgheR?=
 =?us-ascii?Q?4d9uERHdPhGiZ9dtv5veucvyKDtREEEtEXNd/cS74mbrec2OKMutXw6bx7y2?=
 =?us-ascii?Q?k2Svd2t2Ow8zR5TiN+9cO+u36msSnQVKyqBOEsdsTzpHjy3p5xilFlBiksUs?=
 =?us-ascii?Q?SznMaz6rmvqbwv0nq91isud7+agbWJwCkpgX9gOgNLSQ4xX4KkvKAfZsUQA/?=
 =?us-ascii?Q?VEcaBnWGh5aCdX2iuQubJubV1P8xBiMbh6GhkOAgPLrpKcvZqH9odcYFLHiN?=
 =?us-ascii?Q?Y/s1RZ0X6drRGaJuyOtrChMCcln8qhAHPPaLd/6LSL8HH8KfWNpv/bYe9SXx?=
 =?us-ascii?Q?Ie99cz2ac4jBz0PSNdQBGNscQK4quQGbOPjdjgpcnxhlWlKwgDo35TspptwI?=
 =?us-ascii?Q?c2jG20BZEX1ui/gBsh97GJcnt08GhtNr3QFWePN3w713KOCd15cFhDp02F+l?=
 =?us-ascii?Q?F0jnPLtsAWoSInReSomFdA4uWnQgp+djYKUCnIv9489iaEpIIJM4R1Dp0Ro2?=
 =?us-ascii?Q?AGuIiL8QVW0T8VtCQ60HlyivF/JnpHHVPvGwgLW5Vy7I9B9O1/VM0iUNF+Hs?=
 =?us-ascii?Q?qbqiFg/kb7R/AFLEBtlql6gPFI9SxlZS4NBGiKUiAbq2YApSx+NEqGYmEjuU?=
 =?us-ascii?Q?d1ICf1qNWuGjTwfJiFGah+23BZtR4oTVsSRJ8h3+vH/ADh10g5r88KLPftY0?=
 =?us-ascii?Q?aNeVKMXELhSLzTpZiCNjKSvphXm24tpNgxRRhAvnhDpgXhTQKahbuPQgiO1O?=
 =?us-ascii?Q?GIS7ThHYGKQ+B8QywAibyKOo0A1ZI7HvKzzwQNtQW9cipvjh+p0yOx4KfWhM?=
 =?us-ascii?Q?PGDHCAdb1jpXzQQm5PcPBaoqcjGdKV5/P9b67C+Nk3L8ic4E2A/y+RgKsIrV?=
 =?us-ascii?Q?o8w0GOiKLHFZ6WiaOz0P24Gw/FqT6b+jiggyUhs35m6mO8hUegXdFAjcqhnc?=
 =?us-ascii?Q?+ztJhMBm+SNpDqyM01H3Y0AuXiDYNiQ=3D?=
X-Exchange-RoutingPolicyChecked: qKFekq5XrqKroYs5yJhfF+lXRdKJvOCz+q6s6/dxvOOCJGYvb3oECQr/Z70sdioP0ZBMhBrekgLDQnFQsIjF9vr1Dm9An+mfiG4DogmDuVwXDCLIT7W7n1TwhvtqVCc9ayvnjdictZ7TRMtxuM/Wn3jNHSC4/+hJ7AP7mVdo9ZZi/6uZKvcytdB10TZZ5R4Jeu/J57Az0fr/6RLsiygfhlTn10xJkEPXQhumCZIyUHWYNOm4JK9jfPOwG2Y1ip9zToUyLn1wZ/D8RHKnV2g4UrX6J2wxyaq6GFlJazP7qNPqS/N7a75t7KCpARqrmEx89q/eqqZL+xWNdZnur4BbXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd696d9-7719-4132-6b1d-08ded3a184b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:39:40.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ4tAYfITjiey/oowpARtwaRnCWnt05DkrY/uyIjRic8nJIFes/RJzJuzDwZzphA5M+/v7bCYpedOib+66BtNUN5YVTThySNB9fK9o7nSxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
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

On Tue, Jun 16, 2026 at 06:54:19PM -0700, Ashutosh Dixit wrote:
> OA head pointer registers are not used by UMD's and do not need to be
> whitelisted, the last argument of WHITELIST_OA_MMIO_TRG is actually used
> for whitelisting tail pointer and OA buffer registers. Rename the argument
> to tail_buf to reflect this. OA head pointer is sometimes provided to the
> WHITELIST_OA_MMIO_TRG to have the correct register offset alignment (16)
> for RING_FORCE_TO_NONPRIV_RANGE_4.

I think the proper fix here is to get rid of RANGE_4.  We should only be
using that in cases where we definitely have four consecutive registers
that _all_ need the be accessed by userspace and that are documented as
okay to whitelist in the specs.  If userspace only has a need for two
consecutive registers, there's no reason to be using RANGE_4.  Granting
userspace access to two extra unnecessary registers is a DRM uapi
violation (and also a potential security risk depending on what the
extra two registers wind up being).


Matt

> 
> Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 2e84b1c49f374..a17ebacc1455b 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -104,10 +104,10 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
>  	},
>  
> -#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
> +#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
>  	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>  	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
> -	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
> +	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>  
>  #define WHITELIST_OAG_MMIO_TRG \
>  	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
