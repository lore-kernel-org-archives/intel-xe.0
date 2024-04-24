Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033FC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 15:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58710E59B;
	Wed, 24 Apr 2024 15:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqkNt6z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D6510E4C7
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713971897; x=1745507897;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8gvqlCan91d2txhGBLbpVNHeVrz1athXasOZ6tEE8ew=;
 b=ZqkNt6z0T2KY/Ro+44xLt8OGaA8llUkQTCtBrDrgssd/P/Hnh3x61XdM
 es8pxLNHEqlW5Z5bEUlS+YXrqQH9A1CgmRiqzUDlwrdSf1Ec3+No3HQdB
 k3YptEaC6I1jc1MNnAvDyp/Pk7E4e0orikWsFpec6iiiiI1mXp2mXKzcD
 iT4UUeuPEpWLMDp2x78HzYpRn2kJuEmfqah7Qj/m76VSsVUPyQHWHDH10
 9Ulbu0yha+QFw6gIRHQ3srQREUSSr+sYbqUH7b5SowA9Xp1wxPQYBzrA4
 NETH8rSsSykuCa3fY7lh0AGoSe7Sw4O93kN1L65hKlxtBuC6jWcsAV7M/ w==;
X-CSE-ConnectionGUID: WX4K6ZQgTlS1SVZ5Ltq8Bw==
X-CSE-MsgGUID: BMds4qynSeyz/m7C0Gm/TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35008942"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="35008942"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 08:18:16 -0700
X-CSE-ConnectionGUID: MlcBssT7TRiyWkHWfzJITA==
X-CSE-MsgGUID: aT7Vm9QkRjWSLX1qmYPs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29551366"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 08:18:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 08:18:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 08:18:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 08:18:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 08:18:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXAKswSbS18U+FkrNAKIPnQQ+ayzX54mhwE7LHDqOwy427SjNcU3IJawsegiIFQP5iGdXfqZ8QWnIJv4lQa3Ab27shaEE+YzCFQiLrFVL8oSmjzVVrpbpkYT6jk1p9BH54tYuHUb7DHUNMgNH0tI+p0Z6gu2wsBpP94O1neJtlVPcCuT4I/IUsaqnW7yJYyLUFCSq9NW097n7phjQGNumC7X/0U4OKztA038PJLqD+QnNlGQVYlg8e3YIh7U/ZwfSgBRqPN4dzBk4g33kSlWMdUl6rsL1w1RTZMsL2IUsxZyZ2SU9ZFV8avMOndOkmHxYp7JdcwSFsm/3oBFHTRuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfjY2p0Z4NZLqwyXcyEkCN6t4TBMKbaYktd9wwBGd24=;
 b=hxj906GyrE8R+UnxpKgX5TsU8VncB2ZGQRSqRvKkb0pf97X0cyPJNMJfwT94PTNFydKkqVumdMkUFRZ2QAOx2ZnY/vv+mxWa0hU7KdGk1tT6VDo4a2sbh23X1Jvuzi6MuAIDFT/9+KbsWBYR07LMs+aqLo+eBfnIM2jbM/qVybvZH1oF+A+Qy/oqgt5nNOX5w1NJXc3SDMpSZWGimTmV4D/IOO01ezBswCr5x8NbnBcqNZJYYWqrG5vEATLpGy0KtwsK3DXpt7jC5PWE1GubH4KUxzsZOb/BQW0h4nCaoZzF/igbBPG1L6oCNGPYi/ezU0gZwu1hBruf5wHLLV0ZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 15:18:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7519.018; Wed, 24 Apr 2024
 15:18:12 +0000
Date: Wed, 24 Apr 2024 08:18:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH V3] drm/xe/xe2: Add workaround 14021567978
Message-ID: <20240424151810.GA7068@mdroper-desk1.amr.corp.intel.com>
References: <20240410064640.1010098-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410064640.1010098-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 344ed4d6-ec84-4bcc-a7ff-08dc6471c1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?91UgLubuOcme469PqFYleq8mIYtvTLwbEIRHLpEBkBRNYfUqnsLCWXZwdsf1?=
 =?us-ascii?Q?Sv7bEwwMk1WRyIeOslcskPKYUMFyEvKEmhGRZ/1bUD3LUH/mORENXjL2e4Ws?=
 =?us-ascii?Q?Xme8L1fc2Kt834QOZ84ajgfmAtRJ8IW2xyVxjxsYavWZAyOR64LALcTlprut?=
 =?us-ascii?Q?zim5tnbnH8mPQXLruMDKjbAyHNVDAexBoUr3OSdIbzfBAGMUM6+XSL2ZeUcM?=
 =?us-ascii?Q?XkbILJKF4toKkwxNQ1Ga4UZkbEOREEcKFPfpsZShzcu47+ar5IJmisBX6p3s?=
 =?us-ascii?Q?mo10T0sDysAbROgD5wMvNIk36En1RkrmTJzS6E3CxnRj2ae27/PkDJ8mupFN?=
 =?us-ascii?Q?w8yYtDs++Y1RSxF/fLJ2Y1cYx2AnHXwsbC9xZaJePMz6Q53ztd2XhvSiM3MB?=
 =?us-ascii?Q?1UhL1dwvRALEtP/uYsZBRCAviR8w8tkrLkdNQ125W3JO6CDrJzDniDeFsz/V?=
 =?us-ascii?Q?HlBDrAbyNnSWEUvf+lJrvp0JzbSqXK1PZzrkGUTRb0ADOTjYTu1okJvF3Y59?=
 =?us-ascii?Q?jh35fWqZWxw0ExJGCWWWLw5gyud7+OWbavXhaTwKWVPFDJWRAhUvwyzraMdM?=
 =?us-ascii?Q?WM6xpwhByJdt9ykD1vJsU2EEnGjyHSPDb8lfxsdCTYOkJ4hBysMGU4TKlMIB?=
 =?us-ascii?Q?S/ubH3SCgJpjwU5MWCbDKcp2xkIGYML0+RUusOhGiewiHQsYB1By0qgeGyDb?=
 =?us-ascii?Q?QL1/pdWhDNbFyJLoo0ZxHri6qWUWT/pSiVerq2u6eE0sjGd+IKamyyLp3RgG?=
 =?us-ascii?Q?NkMphMu/+ZqfmZwqfAWuvdX14IW59TZ34+nlhw+ZGRi+8fyjXwofJWXXlIaZ?=
 =?us-ascii?Q?zoMxqkGuY4CX+/fNmn+xjurJWRt8AiBptlUG0PGB/mS8JH75depqxMkhGeqW?=
 =?us-ascii?Q?xGn59w2+b9J38EPtTtRXOmt0ttGQ3qWwDHYhsPB2qTr23bDybnDmZJsnFj4O?=
 =?us-ascii?Q?IYdLGcQve9aHNLv+9A5h1mkZh/mYbAFhksc/3JCD1IcwgRJY3UwUYdS/WTJh?=
 =?us-ascii?Q?0ZmVPQQONTi3y/tVV91kI5wZhif91+u82kBYbjVkpyyl1S4ch6wVdobgb5Wv?=
 =?us-ascii?Q?nspGkwgtRCs0KjjlZjEozPRewU3PLtsP1OlU5uNqhD3J4YGQe2vXEzQQekFm?=
 =?us-ascii?Q?dAwSVl1TGFu2JXG1pdtijyATTl1pC2lKbFHolNSMvB7kFrXPwVFuCQS8u1pJ?=
 =?us-ascii?Q?bo/p8WYeVM5QWXOYhYoqzmufK9aD7d1VXxH5CJksEN8RdyGlwSGw4TG1uDNV?=
 =?us-ascii?Q?EmL9oH3Oazb4Od0wB+zYtB9HL39TI9Zng5nHrvbWiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wtw2TbuUAUZJckUKgHCxjbUx3QPMz+O+ADZVse6U2UycNBnf5443LsKcvpKR?=
 =?us-ascii?Q?fS5icQJWHj6IFcIEYzQpuQHGrE1iptmjxRVENu+1D56Uyq8qSA2kHkEhjB93?=
 =?us-ascii?Q?fHaIXdE1/Dm7IrXq12yM2XXGifUEEVSsQhUxafIy5AfJMBCcP2kDIUwePfC2?=
 =?us-ascii?Q?vj1GO8uGrr/ImnL/5DKyPT94cQCvXYotMWDH5X2azHWOl8psTT8WH1ieIFzT?=
 =?us-ascii?Q?PVdfEsPQw2QGJN2oHffMOc0IHsQJkxEz92GHKJODtseMlPcjQdqHZmMyDC2Z?=
 =?us-ascii?Q?ExKKY6ppQKuO9tAiBtNN2V19u5+CkZoXmJKaPJJQuqr/1K57WmeUyt9DZ6jH?=
 =?us-ascii?Q?PgQ1anDyxEZcsaubiGNyILl/tSQuAIUlvznO+j2AfcwnAZl3M3LIlBWiacxv?=
 =?us-ascii?Q?bEzv3fJiqJ0uypwHlGIgr+AasHA9VROcXP+H1KFnTlkLrIV9sLsoIfEQvt3m?=
 =?us-ascii?Q?yq8uX4+bL8XKV5GBtaEjdgQjHgicx0H8K/07RMsrIYCv6RpHMbHPvN2AUWvV?=
 =?us-ascii?Q?RM9/tyPw0b9NGRNZzi4oLsZVk7lOqzwvP2UPISTYbzFMyQ13XSKuFJDFNnqR?=
 =?us-ascii?Q?2cEG8cvwTuR+fX6AnZ37w4jdqYkuuxEwYk3qMd7W4LDhMyOj67V4Byufhqy7?=
 =?us-ascii?Q?u2lyYp3rnvw5UKrR5az5EOVZL+dZbJmZoYELcu0VHgAVPV/kId7ckncZk3I4?=
 =?us-ascii?Q?/vMMx8G3RFgwcIv0YBfYZRPU3XNdpBHpgHFH3/Z4GXdhqnSIHKOnZvMaGsdH?=
 =?us-ascii?Q?Yq2JmOJGIzGhHMcf+56T9LXapkFYy/tPi74LlliQSIUpKwkvHE4IRHOspW/v?=
 =?us-ascii?Q?NCRmQAphAZY6ECfZ6+Ubp4XdqqxAmLCaVfmW/TY79Smq8j7ztX8MPT5dan36?=
 =?us-ascii?Q?AQGCEKW2QJPGw9FyRbE7QqvHCkD9uLD1v62ynot9Z5MdDj9aoVgwmzP4aiBM?=
 =?us-ascii?Q?37BgnTnne7Wf6rGhP7ADneWvHPIHkNtebhO9rYfQKaiqBTafE9YK07egb5lq?=
 =?us-ascii?Q?+phO/p00rzrcVaT1fCjcpYR9Ngd/E3FHoftIEd30Wfoez+iuEQ1qTs1wmr5z?=
 =?us-ascii?Q?j1+RC8828sCARlfnh9jY+lP7ciOAkoiQIaEPfcCkXEoPVszoldwy/R0ZOfYV?=
 =?us-ascii?Q?KXML+g06NspXcXLRbcS2Gd8ha/fNsSaALZmMBJeVagwR4RpWBubUhO1JXpzn?=
 =?us-ascii?Q?5oHP3uQ8mf9e+1iGmpvnFrvWdcjQYgCnCDGkUIvDPTANthCVOmQaVN30QRq/?=
 =?us-ascii?Q?Ek+rRfc7wuQ4VXlXTZlmqski7/X786DuJ+7U++qNxUUFJ3HlONeDY5U0i6fK?=
 =?us-ascii?Q?ulSgVj4R0/6edmDasTkY+BQvI5F9CgDhxNdgFtYhJbbY/PqePOkpBlKBF1Hy?=
 =?us-ascii?Q?WZUnz+ujAG7TdYxvJ/2GcHoDgBkQrJ5yyK6jpc+tRyWmcCSOH1GKdYoBnfJ6?=
 =?us-ascii?Q?7ZIeu+mlmHAvvBLjvEkI9WOKAV3f/TPKSz1e6kyNPDBstedUlcvYHL5BQO4M?=
 =?us-ascii?Q?jXiuxCjeNXK9f9avjijT0eJunFc4tnBSIW2DAq+2OKLxTt/RMl0pls22inYj?=
 =?us-ascii?Q?V5yE6x1s8FsRYoLTvjew5dKiDSEVe1rw4cM2MeOwz7bvdQynLqrguiaZJwP8?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 344ed4d6-ec84-4bcc-a7ff-08dc6471c1e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 15:18:12.8705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIr4sc/abDmJOGJ2mmLpNkj98DTX0fXDdkoomJGKkkz6k4EJvai7xK3uTAIrnGni8KwABXtJAJpZp07LQBbuzNpG7YHx/slR9s6nECE2lq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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

On Wed, Apr 10, 2024 at 12:16:40PM +0530, Tejas Upadhyay wrote:
> Workaround 14021567978 applies to RenderCS xe2
> 
> V3:
>   - Cover xe2_hpg as its landed upstream now
> V2(MattR):
>   - Move tuning to wa and apply to xe2
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 632bd9066f8d..56bd23e79fdb 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -669,6 +669,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
> +	{ XE_RTP_NAME("14021567978"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> +	},
>  
>  	/* Xe2_HPG */
>  	{ XE_RTP_NAME("15010599737"),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
