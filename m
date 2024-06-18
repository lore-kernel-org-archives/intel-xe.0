Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A6C2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 16:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED4D10E0E0;
	Tue, 18 Jun 2024 16:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbd3dliv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3E10E0E0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718726560; x=1750262560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kf92MFcZnV2vBCnaU1/0KPMtvns9pmJZuFNy1nY0gHo=;
 b=Wbd3dlivA2JNWtCU8kum8pyIE/s5KJvkHrnkHQP/prw1Z8zxSdKYOiGN
 awJyKiR1yio31ybuuji04X9wmtHgXGxBPF1tQW2oucf6iwpFz/MgwKAA/
 ICgiYEczSIdaUXFHCTssAcFovpDfLG/YPZR6TDtRMBh8NKlLyiAWytDO+
 jDF/dNqBaVBO23me8FcUgkzRCgrs3pX9aAN5sZGQYAViGWVh5EXh3Nlng
 vgk7wwukOSHHR/IMyrGPWvO7rcgbbhZm7UdQffJ5UCmjkODcSee0kyqR4
 k/H0zMdV3039O5d1CBt1G4H7c+KA2w/f7kSjyhMm0GHpW8KCfejb4Vk5X w==;
X-CSE-ConnectionGUID: pt8vvFRwQXm0knqoeMnBcA==
X-CSE-MsgGUID: J8B7vxBCR7ezpGnR0Q6MKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26743358"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26743358"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 09:02:39 -0700
X-CSE-ConnectionGUID: ip+Q8HrXQUO8y3p5k6gWAA==
X-CSE-MsgGUID: r4Zsc3PVS0KCtK7CUswz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41442120"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 09:02:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:02:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:02:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 09:02:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 09:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZUSgm213v4SFsx7FDmiRwNNukFlAfCnMWWYBTb2sFg4k4TM/Gz3nlXK13G4GsVmrX2a4i5WdHwOxyrmfOazsLWjX91/opQMe7qCc97xfzRmdTdkfNTCmq+APY2TeO6O5Ta61cKe21dn7KSfedKPYbi2k3itzg5qu28dGRkMWLkD58p5HkpLW9Q9K7/AGrlHUbxAian5muI3VEbFmmD15G8mpVjX3AyEYOfmW1EB2RRr2zYpHZGESwt9iWHYlKGxSSk5LJGtcC71AXEEH5T2AX++r/een4LCVFefd0YN0NllNw4fUkIpWRfn1H7SZo93585tWPDgQZ3HZNh87ZTZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUKbekFZRSzVR0hbKiU5+FI0HXKQLcm8MozeAKbhsdQ=;
 b=oWomJWW9bc+rlKv3LuntwF+aDS16l6N2U/MnWI2lA5bHUt1xEMpZzXruYy43FDx0JZWBSO0G0Xr3z3Yg10h6Ro0Cw4YUxiMr1TXVC0Xa7nTGkHMFmMfolJjCEruB0wXed1AbVRtKLzx73h3MEC09HjMk5t48q1OhyOktMsPbwp+kMEhKB6WjmGIwQxsS9xxFJzctzHCoYBW5PIXNhyrBPyTu3Wm5WNvo8AF8AZ5VXAl2Nrto3SVjFDXLdXxElH8aga1sDKANIygnTAmbAu+Jk2JYvyt9/n6kVX7TcGBYpZNAwShaF4W0vpSnL2topkkfdX5dDMCHQj1A4pb/fxiDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 16:02:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:02:06 +0000
Date: Tue, 18 Jun 2024 09:02:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/rtp: Add match on any GT
Message-ID: <20240618160203.GM2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
 <20240618050044.324454-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618050044.324454-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c4a643-71d4-4188-d9bd-08dc8fb00055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jOGB3SX2ZJniwD5CjwI/jS/hjkASDGJQGxJEh0+tkhiBTB6Im+rJXFkQUu3I?=
 =?us-ascii?Q?S1hCG7Rc5FgIaLCjP7GZfDMwDZnzhVPhWmhcbHeqnG9ZdV/RUrRR6605U7cW?=
 =?us-ascii?Q?vfLAUpBTzFqu5buFdSq608wWGiNUPcOjCArvNh3a5ysaDC0OjibiSx0n+SDB?=
 =?us-ascii?Q?0B2HgDCHdf3k65jWQGWTbx9gJOYfotHsDXhGIP7oRV+RHr5VT8TWBtjf3LPi?=
 =?us-ascii?Q?gxx67goNwl4EBEuWiD/4ZZRsr4gGGw9LYqJjanIFzMl7UrZnyHhDlMP8p3o7?=
 =?us-ascii?Q?3ub1yhKGXyPebSKIK721x0nNTv/AFFva4j6buny+lcCxScrQF7Bt9uPuhsxk?=
 =?us-ascii?Q?EBX18R+lb9C7KqpdnojgQj3w3QIdbDdxR+aIjZXpd773gWv0dEqes8QoKd9G?=
 =?us-ascii?Q?mWEs0IS2mpyqn0sTH+YHnr4fFcWqKoxX8IeU+YtiUYQhPvyWZ8w3xzHfQNE2?=
 =?us-ascii?Q?4t5B1EEhKUE/ogEJ60G1rTpn9anndXA/ZN+ZxYTvJ5okoJhrDxmxodA/PbUs?=
 =?us-ascii?Q?V2n5iuqfr76XY2Gx5s28J/gWPf+eOG2C37mSaTVyGi07p0g0wRQ1/Tv6oHJ/?=
 =?us-ascii?Q?vvAvJE5iFGh9AXiHMwncF/YB5jzkvsDectlfxuf8ibgY8vuNp56G1sq7Ij2g?=
 =?us-ascii?Q?mBltHp5fWgPbB8cj87wB+b0iTu7B6UQ0vC+1G9DLr9A0vI9bZ0zivmhdqVY4?=
 =?us-ascii?Q?pnQyoabTFf6Wg8GzhNgmQeOh0nQ9O89fWcc0PqstuPIOl+wjKTPr8M3u80cF?=
 =?us-ascii?Q?q7JgfpfNizR1k+TvOcJ9PAVlX2Yv2hL8Cd+65vrmxeG3AkfWxNK0YGNH8s+0?=
 =?us-ascii?Q?BaXVbkOKh2Hqm+BgtG56aLtqpbfYfWE5fVHmqHtfKqzl2Iq496Lyb+ymoiM+?=
 =?us-ascii?Q?3pNgUEJhXHLaPQImaqSoIrYb+MjffEC5BmOLyDa1kWPnnXKZd1DigiBujX7I?=
 =?us-ascii?Q?4LCuiwETn3aAQC3JHyMW0/cM2+rQuC4RInHLu27cENEYb2iQRGpOKcNcsluJ?=
 =?us-ascii?Q?A+wzGsD8aOOVlOTXCezPc6RFhoX8RDCg1MxKwunCYtvQ/kHrHr2eIZspX6JE?=
 =?us-ascii?Q?F4kC1GNHFG+0qlzs7ZlVibpBq3f7cIbm7PSc2lDMTZwwVhrSpG9Nr+c/SkWx?=
 =?us-ascii?Q?VPHH6Uwd3rmHtPxJFzq99jEkUT1deEqFQgqxwKGPx3nsAeUc9EbQ9FpBwAkO?=
 =?us-ascii?Q?ShEDRIYB65WPQoYsaXTp5ij8DYlkl9Qhg1uJEnbsF9ef6Aynl4WaHxSFpMuX?=
 =?us-ascii?Q?1lxuSpqURiwbVb4sPZvRn+O7TfxL2nX0euNM/y4lle3OPDrEDjHGMr27C0tz?=
 =?us-ascii?Q?/hF6pA90/RX/8Abp+PisLTlB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgHsaqt+e///3rvBc2kSF7q1Ph4t2/QPUB4p5q0apyP3SpH4ytF/MR64fKXf?=
 =?us-ascii?Q?h377kni/MAVnli3rPVrqEr8YiNN2LFI/Qn+lyHGlA/cKNwBb7bO60TNg1UPf?=
 =?us-ascii?Q?6brhKPE5W3JNSAk0mWdo5MjOypExBlwbeHhVekavTVG5ng5oKCFe+ew2wA18?=
 =?us-ascii?Q?Bnt2gpDNmbnKY7pc+Eb/rlQQIt3ozd9h/+onp4xiF1gA2JYC6ZgFtcvvxe+O?=
 =?us-ascii?Q?gs4Hu2Gg1lnf6Eq6n3A6Dw+rNuC318kBye2TZeQfHdmietxdz9drVO2LiC+8?=
 =?us-ascii?Q?TQESwt98N3dXOL7he23gbLS/lwkVpAtIic2gJ7f8i2k27dc62lggvk7Gu1s1?=
 =?us-ascii?Q?cdzxZSkdgqztdAM8ULnUAEdEv59q3/DAXaeVZF74Hu/zglpTopLZBwN3rd7s?=
 =?us-ascii?Q?xHKF4nnJjEhDFsgLulpgDqU+PHB/FbmXqm9pHPJAMBDAD4nzRxy3tnyvPdY2?=
 =?us-ascii?Q?qjGk/frbDbnl3a3/QIU95e37zjEAxoHhMiXQ+VC9HF2ZdvvD2NcF3y4MHe3D?=
 =?us-ascii?Q?Q6M16umEAUaX85QMUguUC1g89VcZl4KoEZo8BZQRljtNCwHPxymZEDZ17TTC?=
 =?us-ascii?Q?Vw/EcoZmGbaFtn+RfbDoATIi9+9LgyVm0+NLUeBf50wPVNCheahKzIrIX2o5?=
 =?us-ascii?Q?jGSJHmx61jzTt5PJC8UaP8HZKp+9TXqHqX4b6um02fTCHMOmBrFkod08GcSS?=
 =?us-ascii?Q?56ehAhX3eNvKPh0KieZT7STKa+4n9wVdDFHrlyeQcxn+Vcmgp5HoAPaISjYO?=
 =?us-ascii?Q?g0aVdcMfjN09jjXceMx8ifm+nRz667SaJn1WPCbaR6BkmU8T+NB1jwk7TD0H?=
 =?us-ascii?Q?s0nQSrg2NWrL5Tw+9ipT/1Oppj9Os+qcxst10f2TDLHtd7gnYJ85q1SFXsdp?=
 =?us-ascii?Q?Fb8sHOREVvrhYdUrK99mWXuhCvz5UfAZkuqkXec4DCbyxKmRzr6MXviZsPdg?=
 =?us-ascii?Q?ZGO7SCvlsAWvdOQVhBRDDbyBj1XQxy1ZxRD2EcRn7KWH/lydjJwJj3OR5/pm?=
 =?us-ascii?Q?NnXSyqNcznf9qqfSxtCvNohOXZ1zC+CLTqrPlFXJR9bTQ83jN+AG3vgO32L7?=
 =?us-ascii?Q?by3LA0TSEPsojV4EfDKuhpEm3AyLCY7cFfm30LE3FMD/1cesWdiZfwSTAt9s?=
 =?us-ascii?Q?7WEWBB0UnCTOovvYLG+RczRExySQJmoeDUIdPGWLFHqTjt2V+XqWEA40biIE?=
 =?us-ascii?Q?6kdVbqpTwzY9NWLv0gIoup5isCJROFCQl+voBw/j1NNhXuztar/TwzkOHB4b?=
 =?us-ascii?Q?E9fIpUi3JYV/K9SZfSkqpPlGbS8nIFZX8wahrbMOYcPZ0d7ghCMbVa3e6NIZ?=
 =?us-ascii?Q?E8zK2P7hZwfUVpBYACj+aB+nNCnim+FbE2hi5TTiGXVgTRQyu3D/kMT2et5j?=
 =?us-ascii?Q?h4feH6oNwZUgGobCEn16POnNBkXHnxoJmkk1HZGzVC55K4CkYIwO5UTfFMHr?=
 =?us-ascii?Q?09yZ5ojQiImeVZl6cXkqPCVPPfojFIxq6g9jV/F5AbSrCC2FDcN0dadblZue?=
 =?us-ascii?Q?0n5g1ZzgRr7ZRWdwiZaIyNUPp2rcTSPUloXwQUbB5iJFBEW8FCcu7wVYiMiO?=
 =?us-ascii?Q?dEpsd1cjAKnxNZjJsHs9eiKdHpdABLT7+90DzrnDAGvj9lSARZeW/18e3kmj?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c4a643-71d4-4188-d9bd-08dc8fb00055
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:02:06.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elIfrn0yCUYt2BEH3UZXt8W6Z0hDDfbA21vtq+vJM1RwxdqibJnrFKT+wsS+Ye9/QWYvHkc+YifzlIJeqfcn8G6AL826KrP509FDvjFxRfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

On Mon, Jun 17, 2024 at 10:00:43PM -0700, Lucas De Marchi wrote:
> One surprising factor of GRAPHICS_VERSION()/MEDIA_VERSION() matching for
> people adding new WAs is that it implicitly checks that the
> graphics/media IP under check is of that specific type and not that the
> device contains a media/graphics IP of that version. Add a new
> *_ANY_GT() variant that can be used in that case.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c       |  6 ++++++
>  drivers/gpu/drm/xe/xe_rtp.h       | 30 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
>  3 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index dc315b8aae07..ac31cba1dbea 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -63,6 +63,9 @@ static bool rule_matches(const struct xe_device *xe,
>  				xe->info.graphics_verx100 <= r->ver_end &&
>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
> +		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
> +			match = xe->info.graphics_verx100 == r->ver_start;
> +			break;
>  		case XE_RTP_MATCH_GRAPHICS_STEP:
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end &&
> @@ -82,6 +85,9 @@ static bool rule_matches(const struct xe_device *xe,
>  				xe->info.step.media < r->step_end &&
>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
> +		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
> +			match = xe->info.media_verx100 == r->ver_start;
> +			break;
>  		case XE_RTP_MATCH_INTEGRATED:
>  			match = !xe->info.is_dgfx;
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index bd5b5ba0fb31..ad446731192c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -140,9 +140,23 @@ struct xe_reg_sr;
>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>  
>  /**
> - * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
> + * XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT - Create rule matching graphics version on any GT
>   * @ver__: Graphics IP version to match
>   *
> + * Like XE_RTP_RULE_GRAPHICS_VERSION, but it matches even if the current GT
> + * being checked is not of the graphics type. It allows to add RTP entries to
> + * another GT when the device contains a Graphics IP with that version.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT(ver__)				\
> +	{ .match_type = XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,			\
> +	  .ver_start = ver__, }
> +
> +/**
> + * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
> + * @ver__: Media IP version to match
> + *
>   * Refer to XE_RTP_RULES() for expected usage.
>   */
>  #define XE_RTP_RULE_MEDIA_VERSION(ver__)					\
> @@ -163,6 +177,20 @@ struct xe_reg_sr;
>  	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_RANGE,			\
>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>  
> +/**
> + * XE_RTP_RULE_MEDIA_VERSION_ANY_GT - Create rule matching media version on any GT
> + * @ver__: Media IP version to match
> + *
> + * Like XE_RTP_RULE_MEDIA_VERSION, but it matches even if the current GT being
> + * checked is not of the media type. It allows to add RTP entries to another
> + * GT when the device contains a Media IP with that version.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_MEDIA_VERSION_ANY_GT(ver__)					\
> +	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,			\
> +	  .ver_start = ver__, }
> +
>  /**
>   * XE_RTP_RULE_IS_INTEGRATED - Create a rule matching integrated graphics devices
>   *
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 10150bc22ccd..1b76b947c706 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -42,9 +42,11 @@ enum {
>  	XE_RTP_MATCH_SUBPLATFORM,
>  	XE_RTP_MATCH_GRAPHICS_VERSION,
>  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
> +	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
>  	XE_RTP_MATCH_GRAPHICS_STEP,
>  	XE_RTP_MATCH_MEDIA_VERSION,
>  	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
> +	XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,
>  	XE_RTP_MATCH_MEDIA_STEP,
>  	XE_RTP_MATCH_INTEGRATED,
>  	XE_RTP_MATCH_DISCRETE,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
