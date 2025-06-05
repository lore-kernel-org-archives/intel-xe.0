Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2A3C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552FA10EB8D;
	Thu,  5 Jun 2025 22:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNEywG+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862AE10EB69
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749164369; x=1780700369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9+XGRBxVookPeuxl8dukUrxOueivsuBe6xbfr2LDO10=;
 b=iNEywG+UQL5JNZ5WV167Q0FdTb17ihGakfcSuFjwFyndaHYFI3ZlwUjb
 A2oG++AhLPi+/uWhSsKV9B6IA8/D4O15b+TdPoLrD34Bn1CY5X9eHnXzd
 NvJGWRPspqfygZvkGO3VA9O+GNPkxtTO/H1p4jeIBk4pDqG7IkDp/FrV8
 BcUi66taLvLXfFSxGPEXTaKffWpoWwHHEKmmFc54aZog/LeFpl5CDRBw0
 sA/XO4LRm13HyVEqQM3k3jagh2V3H6yoIRIHuyNsPYc69GGSD6iLhsEJ+
 owxjijZanTBdUpvCsZKx6HfxRaRaDk6J0ui3jgBk3A42HnAvvnOyFPKpi g==;
X-CSE-ConnectionGUID: P0onE44ISs6yCzphH1eI1Q==
X-CSE-MsgGUID: AahW9gvWQGW9zbHE174rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51214404"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51214404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:59:29 -0700
X-CSE-ConnectionGUID: gciOl2l6QgaJQraM7A9CWg==
X-CSE-MsgGUID: c7Pznqi3TG+nNTmGj8cGwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="150663128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:59:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:59:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 15:59:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2RB3X6P4DzV+FI2T57AOIPnMcHrGbS/5lKjJCF+98BLuw9jdRYQkWsOCn6mJJ2y8LKrz1YT/DyJvUClEjga7JgBM/SiPCY8p6LHOlSV/sIA4DkDPQhVs7yKpK874fr1NJ008+bipZzPdJfgsWlOLIVSsWwcO/jMze9l6V9Q03KuHVLAd6JGf3fqjGss1Yi1576qyOqew0v3YhU/DMlQj86gLn71e0T3pkRG5vW+b5FMisBlYNHsbHovdnI9rlXVETFxyrITGKOZeiDxEUhlaNN0SfJCTWYUx62S85L8D43E2B/myBvg3LH0iUjk1/pulOkI9pvtKhMubva5XlkvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxUeE7U/WadX9ASEi+7dLTUTMo6lyxUOVIEqaIFRatE=;
 b=QtIHGfxTpblHlFRs04Vpjv/JsVyVSyQ55vgHREdT+pbhaZmQ9buyhh7hjC6QBSQR1AK3vUvOoHJht/Y/s/IRL6D0WsnXG5g6/zH4cYQKstlarUfuFFcTH7UZC2IhlX1plo1Bn0wTeGYjnoD0w8eKjnSt9nfIrX5YIsnzNptiXCzw1z+aEnmO3begHZM3fVZkXLGmblritGEu0nSY8kaO8a4tPJ5EpA/Q34CUaHs4GZSTrHIkbRStF/T0I4De7ifkCKJ7XqlY1jiX1HTPXFbpL9UJsJgJOXYQkSkLPp31fMiFKYN7tbAXLlgNM4aZaGbiNJVaVwGPgNujC2wxQka8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFEF920636F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 22:59:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 22:59:24 +0000
Date: Thu, 5 Jun 2025 15:59:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Message-ID: <20250605225922.GH5080@mdroper-desk1.amr.corp.intel.com>
References: <20250605100812.2547808-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250605100812.2547808-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFEF920636F:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f86fbe2-98c2-4c15-b649-08dda4849dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XVam0OwDDH5RTKDsemI0bw2+KYgUpEYY73KSRpIndkK+ryEX4wHM+2I8U22b?=
 =?us-ascii?Q?meD02oecRpE0zQtLNpYxNW8GYxQa6Y57uXJ5CU1geihXloHzKVviXOawbmY3?=
 =?us-ascii?Q?+/w+3A5I1I3/+LaJ/TygLM2uaGlXysAJrZOkD99Tp4avIuMI0EG9WDpFAjZS?=
 =?us-ascii?Q?OjlY6RKI1pO26yVKFn5Hx5xpqoW/mytUz28G0IF/EilYY4IzUi09raHu9GHb?=
 =?us-ascii?Q?KP1F4nX34VJ07nBAtDf1RPA7V0iquPbAvEmsUc7X81TY5zNituPAOiWW8Uzo?=
 =?us-ascii?Q?WQ1+fXcbd/Ir/8HFZ8ZGEQaBIiFRZeJd987Dt587Nb/FE0uG34P2LWXTtLn2?=
 =?us-ascii?Q?vkyT7TSkfoCW/Jrw36aNtpVXVXeWsm/MBRgpMwFcCFX0fKTAq04GadF0YCc8?=
 =?us-ascii?Q?mfCUk1cVv5YrEHrrtSuwrUJ3PGS71fxAhyio5zGIPyDos+29kR2ifBBBzSCs?=
 =?us-ascii?Q?5F6yue41JGdWVPQiANOYpaZeSn2Ct83RY6tWG0kECTX71YyJVhwBevU89dVV?=
 =?us-ascii?Q?Ing6ft9/+4zGc1kvTMRCbTZfHAe0fUYTM5G+ag6WxqUNQQLhMXZNZEg75Q2G?=
 =?us-ascii?Q?CDc7NCu2nZAd41MjwuTEkP0JupYQc+h//nw/voICkMzUhjGKn57TDEgPRIew?=
 =?us-ascii?Q?pGVY2UmlClY4FSYWU7ywBH/8w0wJpDjDsd2Srxr5/0gLgbE+oLQk2ILfIAJX?=
 =?us-ascii?Q?vpgchi4wee99cYpvpU0XBEof9CuzyoqNoVtyA1myxdwGsQgiQADCoz2wmh1/?=
 =?us-ascii?Q?sbScjxw3uyDgYy4G8DZiVzq4tIIw97okbLrc1OTwVCGmOp46D0jjXPij2gor?=
 =?us-ascii?Q?pZdghuY71s+1NL58Tp3TjJUxAxl5+y78qMP1z0PySutPdwbb6XOLJmmN3GXH?=
 =?us-ascii?Q?Ugbub5Mo1L/++/fj3wNaNPBMt6fOhz4n9ZrX2NVWO9tIcKRc/d+IWfEotTt+?=
 =?us-ascii?Q?9H4MxeeaKvHPTyDLgIfknhax5ZSLHpMxnvcPUGJF0cvPhq59H5Ae2TWhW+f/?=
 =?us-ascii?Q?Y7mWImNmaBecPCdpMJJH+fcrZlY8titVaU4LXxOZq4VpHq7b25fDPuJGm6mM?=
 =?us-ascii?Q?R169jMYumzhH0vTdic427z1NLHsXRBkTOPm0X5yaILH3OHie2025uVdTM2Mj?=
 =?us-ascii?Q?6GUdVhPmUFnygcJej7RPprf51IeAlEXpRXDHonL2of6XxaRBKbsdt/Vb1X/R?=
 =?us-ascii?Q?li0D1weMCzoCu8pwd+BBEUJ99UE2Wo2e4dKx42ZIhSFOgByjKnivO/20bdud?=
 =?us-ascii?Q?AGiBemYAwim1bG1tMpNdRz896rJz68qwrdzrF3x+T+Ww0FJ3ur3ZetNYM/B3?=
 =?us-ascii?Q?w5Ccvgs7yP/Hm/G1NmO2S590gmnT3kvrTKWh4r2ojB4MnZXaL85SDSkmAEWF?=
 =?us-ascii?Q?sl5w6urBXL9RsQQ6RsjKjSwGdK1kRFm/IA2CE4Ozn0q2H85d9LIvFXw8lY+B?=
 =?us-ascii?Q?EN8NXwphW48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8KLbhkN8JHaUbsgUtWPMw0OY5+lt+vNdbx1TJaAhM1Hag3MMwXOsWbiz50x?=
 =?us-ascii?Q?fmeMTMc6jmkakyiS0AS2VxsNftynHF3URucCrJ8VlLES1s+Vv+v0j88+x/x6?=
 =?us-ascii?Q?ufUricec8Qwp3Nf33iLAswakor/zvZZMVeWtpGqqyawPOGOodT7IwHGG8+C6?=
 =?us-ascii?Q?TnZd6ChCmzOpaHWJGQVR/NnDN3HGln7UlMK3l/elaEa/fGf95gmbogY7ujI0?=
 =?us-ascii?Q?0ZndADe/JtibgtZT3HErujmCPjABxX1iSgvJo0SRIshl16Fy6t8hRfnNdCQp?=
 =?us-ascii?Q?PfHSXHV604uWsCI/Qk/C+wgLuWC0d2pHGsQZK+rV1oLtdim58O9grCxst8jC?=
 =?us-ascii?Q?jbf7jSVMluh1uew2gGCYy+YG0b0p0saORzfwql0Yo1PuOm8kblPw8iK6d69G?=
 =?us-ascii?Q?FAs7vL6CBk7Q+weSW3qk95YZyw1phhDy1dQt+xMfa/xQg8K7pBzP3AMauzmm?=
 =?us-ascii?Q?ewX0/L7RI6ecx6QFsGCrjok5rYYRUSAYM4/AFnTpG6pHjhsY4CRz8JDuRgFP?=
 =?us-ascii?Q?KFUv0xpqJEOjFij5UjiZAVUB441MRxtAFzU/l5sMRPxgEzpUQGvTvE3QROus?=
 =?us-ascii?Q?a1agJKSUcYKfpzmT1c1m3s7fwO6CigECpSBJ4rg+mpRLG4IILkSjVOVz87fg?=
 =?us-ascii?Q?u6RZRF13Ml/7OWUjc2hgAUe/mMswErQ/3WDdlZZolpBLf4Cxm0kNOP+3KW3X?=
 =?us-ascii?Q?7FEQV2/c0Xw2wtJy+Oerb9lCK3dZFaZMleILwZxCCLlKoGs6BwgpXKOWfPeR?=
 =?us-ascii?Q?lOgckOXWDAyxgrhTmTzFCZfqa52Z+BFfkZ96QvmlVbWlDF0rN4u6tYtb+l6y?=
 =?us-ascii?Q?sBeZmHkCHwiZkJbh2JYBfXZ5DYJ9cYCkWGDRlKrSE4ETYVAzW7ab/Q4ZdZev?=
 =?us-ascii?Q?yBu4CMcT0DYuQ5Bplo6qZxmpcDO17X/YzEQFYk9t1vy7T261GSv7Ph4UU86z?=
 =?us-ascii?Q?k3XKaoFdzf4KSutkvnM9vs5ca4OA8v1YAcmKBE7CsWUBu96EVhIyPyocWs6X?=
 =?us-ascii?Q?IiVi3lJMBXMzTEZF/IBgmQj+BZrKr6i27Og8QNbJWc6+JVxSOhLhgZcrfjwc?=
 =?us-ascii?Q?30bRbcwiVJJXuhZYcMC50MEvhqX6ULDZVsR+4+EE+crZgioltENY46N8FviV?=
 =?us-ascii?Q?uFEnBH0+pDtglIx8oTYu9EIHkCz71HuF55f/+HIqbZcUTF7LPtpePvv67y1T?=
 =?us-ascii?Q?A29bTvrrNl83D8IUFbfwi59BAgyQAWhfNxQ2cGxLsaDBz2A4HWEqKlNAdzob?=
 =?us-ascii?Q?mRQaS0zCQ/gUusWDU3ATzGq2le+mypCKVONrf4wEPPEbM3Atj9ClkA0q6jWC?=
 =?us-ascii?Q?l+INXbNdvUvLzEDcYd8TMKJ0Dpv0WQFuOkjdkBSSmGGHUoDUiDBRgTM1AE75?=
 =?us-ascii?Q?vlht24L8MBvdS8SM5+2x+EIGN59fDHjbnln8ZHQxwxA//P1EKkch6xzbh852?=
 =?us-ascii?Q?msTsmrwmueyURPr8eQFlngc9Mqz5ovLjxOYK+ZeVrVg897L0sCSh9e6n1RwC?=
 =?us-ascii?Q?SB7w0YdEsVPW4ks3OMKwQA5gLbY084rIabRB/MFI2SfqMNaUqHN/or2nvUaH?=
 =?us-ascii?Q?XoajcnDJtZIjXIODFFdAYwi4KoQC1tcM1x+m2Q52UpMchiMQfmoGNx4QeGBf?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f86fbe2-98c2-4c15-b649-08dda4849dad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 22:59:24.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyZ+eh5txbEBmnJz2Bw6OA9iqP+ZnMCVJkx5rE4zsBJGmq4TDPJu/H0nlA4Bg6nSGrwKU+C9la10Vmn3wJM+3oy5cMDyhSNR/5Aa4d929JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEF920636F
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

On Thu, Jun 05, 2025 at 03:38:12PM +0530, Nitin Gote wrote:
> Set DIS_NULL_QUERY bit of RT_CTRL register to disable
> null query for anyhit shader for Xe3 IP.
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
> 
> Changes in v2:
>   - Use xe3 IP and not ptl in commit title 
>     as this is  not platform specific.(Gustavo Sousa)
>   - Update a commit details properly (Matt)
> 
> Changes in v3:
>   - Use XE_RTP_END_VERSION_UNDEFINED as upper bound. (Matt)
> 
>  drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 49ddbda7cdef..828b45b24c23 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>  	},
> +	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
