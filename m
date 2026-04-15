Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B609F4385C
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 17:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D517C10E728;
	Wed, 15 Apr 2026 17:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3PWNbB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B99610E728
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776273559; x=1807809559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jKztrT/+DpaObxmrkhJkWeyRUNbc8HCX+ZwaIUdhG/4=;
 b=g3PWNbB9sg3t4ZNwnc71BVBp6fDwh9HuYwlu6ytwyI9JSunyMn0xx22f
 LuhiEoDHv10C+HvDS/vbu/N5uMBAlIQqU9a6Xde8TsmOyFv6y4lslRj0Q
 pJgywSkh9sNF6Zg9kyzL2zXdrjuqx8OKUj9qFnoEJYvv+jv/CwjvhadKh
 sKXNbQkknQOr4P7pOiq4m4aSYuYo9uGvs5Ap8zEPQh3dQWtbcefkBJKcL
 aQ3tl+VDWvDyVPkccRcYKh51gLnA6sWxoz0MqNSEBcE1GA0vH0e8MyWul
 1WtSGi/VoflF5Qzx6mN0IxW+484DBwI1WPlMzQr6U40aql7j7wgY4odRO g==;
X-CSE-ConnectionGUID: WgtCEt5lQtGe21EW9FEXyA==
X-CSE-MsgGUID: wtj9TfChQEGoheHXsuPMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88713210"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88713210"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:19:18 -0700
X-CSE-ConnectionGUID: gKWh+9WASQ60y9k8tVYQBg==
X-CSE-MsgGUID: rzaFZT2IRqu1AkITFsHObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229464229"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:19:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:19:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 10:19:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpQTZCr6y/O659EcBYPFXEF6nxHyY+qMLNe1AHZqCopN9zgi5j1g5eaQbvy2XP66aW4TvuSsOiEHFkITlnzwbCna47n6TPT+CSWsoKmxq9T2GTPHMQ6UBck5NwH/V0m4VsdtG4zjBWFuiZXRBd7A208ebEmVXJO+Kxw/LJ7Z1UhcTDX27/EfaqRn2mubLV49IUyHdG7E71CgpUOKaEAAgbvY5TsGniQQuhs7B2qQzxthXjk4ZethAhJyIzSBW7KX2HLDNU1oNkz5iMP36fN5XgrtplOAAcID0yI4XEjXccn0tbxNX4IDF5FzaJcQdJLcZPv3rAuEFOyOR4VIjyd97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypUJGqciS9Mo8tBohxHGB7qnsS7oHhbalhXsXly+x30=;
 b=XmglEZag4H9Dq9mai98p2ZiWgXAGhDXfxXakC59O78dIQ2hkjOPd4U4nq+HT/JoTct88I2lpfxdNW+Mn0YUtWwh1/oE3kpxnM1TdV4cIunpqqL5lARyf4nz/1UnJYxsgR9URLQTNNJjNY4e0H0BL1R1CjSSRBs8Z0cOeMR6ogn6Gc5ZPQvFzP3fk+wj+yZM7MlxkCFqUfujW+3/2Rh9lCMXoNL0g933jkYDRkULdHDqPaw86qNxMW4NRlOZanMx3gDWMDv5Nfpj6Xehl4kiNGznsruCsqhQzXa5rAMkMWnv94EJIAlSVaEWqFSu5SvzPI3HiBGXFI1HrCvddSdA63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SAWPR11MB9736.namprd11.prod.outlook.com (2603:10b6:806:4cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 17:19:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 17:19:15 +0000
Date: Wed, 15 Apr 2026 10:19:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/oa: Don't whitelist OA head pointer registers
Message-ID: <20260415171912.GA755471@mdroper-desk1.amr.corp.intel.com>
References: <20260415033532.789954-1-ashutosh.dixit@intel.com>
 <20260415033532.789954-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260415033532.789954-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SAWPR11MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f0174e-b5c6-43eb-5695-08de9b131e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: JDjp6nIiaSDYRJF/IJ79G/DweDrh8G/AH6lU1CAwma8bGsLnjkwt2/DK97uvIm13S+fti9RxSYM/uWl8V//AowZj0pNf2yvBmz4QUJi5rU9M8YNAWVPvUb/dt0hQYwR0P5X74K+g9sJAzkJy4VyLT7i0CFmTUMqtyvhdgTll/QXMNXNueML5sbkbawIpsKBqr8waXJzMuSU6a03nX6p3oewYVy0/OWO5b+pv5B8Lq/E3KuQBSE8iU6/POTC+L/A96sr9Hl3jWosgmdReJhE/I7jAY8nZgLuzySq1GSC0lIQNJycf6zfAMhSPFYDJvllXPMbXxFqcMuiGpNmRLfVUp7tWFS/6sqqHoZlvNpCxG0tgCgPQ/I4vVoVbgBTM44jZaklFANq0GapatevQm7VSmVHeTdb+nFGuuEUKgfaLLO6AVmVZNVDIsU+lajDuRZrb/kq8DaTaIKZjFbT9bAbaNkWcJ92+48VqDVdofKCbUvl9NrPotTtkgdna/3pDUEAustGfrGk1Lt72PdYqr6xXu4j+Ltkd9Ta+8oLOYP+i+jDxkot4j797y56k0gxS+5ifpTFBLBZ4Ivc35plfSMFSCHBtW62KbAmMshzYIapud291Z23M6X6pggv8JOTHPLj3GqxA6ekDri2G1VsAQRsjz6NGmiurBD8F0UevZug39xCQL9SLVW/c0HSmvkGJukWenw34OvL9jHozSu1fM2M/4RTVOM1FIBRhaJo999qzcG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cO4KH9TAZWp4zZLRyINy+IrkJ4QGmW+p4wFKP/jxyCoZI2DvNAQcsH1hx+AV?=
 =?us-ascii?Q?7Anz8IBa4tBsE9B6VrGtuyIuOjRnn/ZB/ttMkOYy90eA87JnXMETdpJbIIVp?=
 =?us-ascii?Q?Q9s5Lh63AK3R5gl1/Vsoe3WI9sxHWpXBY290CFC4r039jm0FyXlNmbLAfT6T?=
 =?us-ascii?Q?kWGuV05eptoxnoCpME4dF/g9vcL5rq6cD0AygX8j1uCn1LvPo+cy7PnAFY4Y?=
 =?us-ascii?Q?LWzKS2AfewyzRsEIWxJTip45W2eZopGI6QaGGOPPj4foO4hw0bPsMloKiGS6?=
 =?us-ascii?Q?gSlOj8l08pFS40vl1o+E63y6XSarKtmwBu64nxZDcvWx5r9Z7kc5FjfOSDQQ?=
 =?us-ascii?Q?F+CCuX9hujTjof0IuxLgu1a/qLV5txaEqf90LcpbkTlL4YM+1zmVPndK3BXh?=
 =?us-ascii?Q?W/1DM3+e0vHUrxsu0utdSgQQPsFplGAFE/drSYhbG9WIHBjNkcOPhbQJIkla?=
 =?us-ascii?Q?5JyE6pAjc+bGAomEmM6LmF3MKx+DPpp2d9t0n0sqwRIios8+IifwM3R7Za+a?=
 =?us-ascii?Q?mhcqFD7LYldqS1jw34spfMrxTMagBtLZpnv/Gd+Uv+vtAcfZSnYqSxBi3yCY?=
 =?us-ascii?Q?EXnhisU5UU2mB4U8xQAPtnFw0TqiVC+uRDACnOCWUCi08xD9ORUTFfbUddCn?=
 =?us-ascii?Q?qboTuFQBrn+unMHAq9KNESsLpSwrl9jnOTqjCpg9rnoNDXu/nFtFdudBvVKY?=
 =?us-ascii?Q?1W5ZZNbWtQuJzl/Q/XCqZ31sdjF7ZewP+yzTaKLuHmZ7YAavwbq2hhD+srif?=
 =?us-ascii?Q?fwYUYGnIsypj+teH5RsRA6IIIYXvLLzzAIU9l00BhgIMIqCc0R2gtF2S13rw?=
 =?us-ascii?Q?ol5zSwqqFdD+isrqbH2S61rNGufxVqIn58//8nrOtzXPKJL1k56bDh8N5s/x?=
 =?us-ascii?Q?SsFyLgVA9Av51ShRUT6DxudDDERI93N9xdMdeOIj8lq+/+bRA4OaILlO5VKd?=
 =?us-ascii?Q?yMrbgLRF8DVXTo4o5kkV7syWwycpl2GXlziq38j+Va5Ib3fYPm0ltuAdzsPh?=
 =?us-ascii?Q?VJ+NlcnJBnMPXftqQSGba6A0/KcU2AXwYs3WOCATvHu5XDdN24HMXJlQ8vRC?=
 =?us-ascii?Q?8WJ0UNY8W3HgQyQDhwj8LjJErlXFjLWkPSTmpo6s4OCt9NM5pPv5eMNdo9mF?=
 =?us-ascii?Q?kXeBWpjQb1DuK/bStYilRLiMdJg9galEIA2wfXaNiA5knaPeLbjQMttGiyyY?=
 =?us-ascii?Q?+oMwfodB777moHbKl+9Dhy/JG6gsAxDApTbInswdn29hIpljBHFFDB23Papl?=
 =?us-ascii?Q?aKKIz5EcvtJd7o5TI1rP4e+JKhpxgiisVTaWIqlwEvIKA7LxE7k8o0fyAhIG?=
 =?us-ascii?Q?x+Fxo4D5gRV36Tawl3wsP2Goq2RpSveTXQiz6vVmhBYQg+cgEo8+ej6iTNL2?=
 =?us-ascii?Q?JI9yI/lAsqd7UFoQxvbcigUU5tTActxGPNeaCj1tJP20d3LL6aPA6suBQVH4?=
 =?us-ascii?Q?jiQRmtLWBYtlKlIWH67nv9kmXUpVAtqnhNucsMdO7gZK2OPpjT/HGmJW1h2y?=
 =?us-ascii?Q?+Ub3M2Jzg6FKnaXivX/E9PYEMDdPF7F2I5eM5xBYhH8+UrVQ69kKlHESrbNO?=
 =?us-ascii?Q?1iDQdmRx11kxNmG90cu0h7ekTO+DNA3i76gguSS0bvm9kA52X4/Zf9r+tv47?=
 =?us-ascii?Q?5liYfEYlDrkXiXmMWUTN7732rPMgUomhAUH8UADD3QNIpVFAUUvhe6S+td7J?=
 =?us-ascii?Q?xzm0U+lsZck5084xZ2N/6FgECL/PcFVgPAcU8WIxQAJuqKbw/MA6iPhsvLAe?=
 =?us-ascii?Q?YftRFsT+h8X4zB60yRh5QesZQBtM+bE=3D?=
X-Exchange-RoutingPolicyChecked: cADUTCotzF7UChuleZy2OLyYm43q348jCkdPwg+HVAF3uvgm3EU7UCSs5aCyMDKJF/YtXBs2rO19fDGmKOWVkeDBehDt/71IclEzvU+EbfljQfg2yDvA+UdYGBrcU8nzDXbClncbuc+89TzPJ26ppfwstpvvD3huO3IIk6PTvXQa1zXyhUUatzqNQHD9YEiucERJNybuht9dIho9mSNuJm78O+rlvsHfePnxLyiyfCRuwxRnRwm+/+fiEXQ9nZfjMQDeQ5nGVs0hv8JppROQqNncGIkLrjlXYUxh08++peOKF3M8CA5njPGt3dL2ctTVfLxDNvnaKilmO6aGvV9T4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f0174e-b5c6-43eb-5695-08de9b131e3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 17:19:14.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blMlsKiJWwcFNJ6EWSYSktT5uJr00JNF8VXYh8bwj6CeidnXQ+wZLnh6q9DjcFtICzAWO6wLn9Mk92jWurHGxyVDE9CGPKim37LYkF0OQSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9736
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

On Tue, Apr 14, 2026 at 08:35:31PM -0700, Ashutosh Dixit wrote:
> OA head pointer registers are not used by UMD's and do not need to be
> whitelisted. Only MMIO trigger, tail pointer and OA buffer registers need
> to be whitelisted. OA head pointer is sometimes provided to the
> WHITELIST_OA_MMIO_TRG to have the correct register offset alignment for
> RING_FORCE_TO_NONPRIV_RANGE_4.

This patch doesn't do what you're claiming in the title/commit message.
All you've done is changed the name of a macro parameter without
changing what is/isn't whitelisted.  There's no functional change in the
diff below.

We need to eliminate the usage of RING_FORCE_TO_NONPRIV_RANGE_4.  That
flag must *only* be used when you actually intend to grant access to
four consecutive registers (which is very rare).  Including extra
unwanted registers in the whitelist because it makes the code shorter is
both a security risk and a violation of DRM uapi requirements.  Please
just delete the whole line and replace it with a list of the exact
individual registers that you intend to whitelist so that there's no
obfuscation happening.


Matt

> 
> Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index a4124f00c467f..09dcb6a422797 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -90,9 +90,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
>  	},
>  
> -#define WHITELIST_OA_MMIO_TRG(trg, head) \
> +#define WHITELIST_OA_MMIO_TRG(trg, tail_buf) \
>  	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
> -	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
> +	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>  
>  #define WHITELIST_OAG_MMIO_TRG \
>  	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OAHEADPTR)
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
