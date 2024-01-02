Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA6C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 17:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A721C10E0E7;
	Tue,  2 Jan 2024 17:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695F10E0E7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704218384; x=1735754384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OkWToo8M1nz0C1qTP1L0k6+7KDMzElR1q7x7pKCWkx8=;
 b=Tk6rAUndr/ZG7PZcGQIRPgqsFqYH0thskbHD4RcqIS7QfGmkvA9Un/f5
 sBLwfb68ADXYS6S1phF8ylv5T9rot7/qQy2BXb37OIybvEW9zy0zkX+Xr
 UVG3gPjs39TT382WNCIFA7eYKddBYIACJBx7wRVrkbleIqWhNLYl5QHzO
 xrK2XT0/32j0lhYWYKvYONV80mQW0pD/z7MWnCIH3Jqa5R1q90oMiP15h
 npK1GPUhfe9sHtUk5Gq4zv/bu6Jh6UdT7CxYqprJa29Vi/Dv1UZw9SOrk
 N4PDEkS3kxGYKVzb8/IsZCYUmXwMgrQ2/Hme+dDqbrlQ45HtXQza9iiFO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3978145"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="3978145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 09:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="952988812"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="952988812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 09:59:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 09:59:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 09:59:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 09:59:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHU0o0P2t8Jil5UYY0pF3+da4K6GtQyTwavYQBELeqBVnxsPEUmslLP3k8lbi7bhRUUnW1vt/Z/9JSlFzD+UQmQEvxURiobG/OkYgsauBdn9BkCmmFN5pI1qFusj53bGeUWN0LyrY7GE0o08Sz4OeDHOzsT35l82uh+BQmawBDBViKzThaHNQiWFbFjRuLkOOvWx7XdhfNkPD2nCECcoAJRXDQ3MHFEbiNBIkI4EOhc2IYMNcivZQZnbqHe+iK+FJFuL2OPEuzUweel71/5yHjUXgBZkS+hS1fvZflqiXm0iFmcN5yrgiSey04YsX9vbSoQ+E9IzsxJ53luTep6ZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2uP0hzs/pQm9TzIZpNdwD2NV1dWBAfzuibrjY2j/vY=;
 b=L9fuUxO+vvnbq0stZjduD3Fv/vazpXhA25HHLU2DclOg4sBcbQFdakyzB6yaNY+sSZ86KLKxg2knOo0qWTRMYFwrzuHgtgB9lEIGdAEzq2z7kycG7BvMxd87ltOKN3pc+bLzeYVzEsW1kf9rdk+JKyZ/G966zhaK0kCL1dUAcodJubkAFvkwSKkDusmzOlhgSSL+GS05yB8hyI/SP3CwEle9ATXnw9VUJx9GgUKZXCYmSoICQ4aONJmxUKgojNGMTs2sCdQdo91dA5LmC9QhRlYj7ojx/BG5V4w3ckAABdQYV9gqn/F+nczZQdB3Ppepiahijv1PwhYp1TzSM9zTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Tue, 2 Jan
 2024 17:59:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 17:59:39 +0000
Date: Tue, 2 Jan 2024 09:59:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Message-ID: <20240102175937.GB3529480@mdroper-desk1.amr.corp.intel.com>
References: <20231227152249.3570-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231227152249.3570-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 8158dff6-a195-4121-5221-08dc0bbc970e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTtkCUWYjSW3v/fNeq7SioRHytW3KlwGiytOda9twyIOMG/R3Y3lL+sPzofLHbK1J81Q/QzMMRut2tjNg4I8o17f1gfKqh9apYGX+A7rB0eyUv5Vo80EoUKCkovL3m4o9lcwghenwtppC6y4lK34w4YlEtv0+U4wEuG3murcXh3ZCAxuxbcykZ06ogp17tNwRCbQwMiMTURMk1dgHaLvE9WrUoDfYFJlLuC0a/w84y+m/KzQqEe8C7u5hMaJfH0k5IZDbh3tZaZpJ0u79sbecFow7d/YIDP/Gn7VOUXSISuBrRXY3zkFX0lLt/SEyx9Xxr5w38iHjav+bvTeW5kLqmJUW4fW5rKl1aVvACwxqozsQMznadFz4XWCk6V+bwtebvRHokpMeXgc5VoBTDmlvSp5F6orf9tAMY1XhJqdzoMzEk4pDUmsDXilXKWwQXjOroH46NqcELfaVWUku4gry+BvgWeCcfAIweB3hQC92A/2jrChf0ArFhfAj1BOr6b+536flPEnEZyYPF+HyNrGd9QBoG6xlSsam+U5ZdwJ31warOJ1TlhOTTWwl3pDy+h3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6506007)(6486002)(86362001)(38100700002)(478600001)(33656002)(82960400001)(41300700001)(2906002)(107886003)(83380400001)(1076003)(26005)(66476007)(4326008)(66946007)(5660300002)(6636002)(66556008)(316002)(6862004)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aCfmXD3PvSderYXAZf0m8WiC3QfOLG/PYwgLxB8lPRSg4QGBc8Wutu6LVQnR?=
 =?us-ascii?Q?ZCPSCcOFZ05F3sIrNIZFnHMhjSGo2LCMtvrtw5m8ZNM0XYXyI88hE7aVCjKX?=
 =?us-ascii?Q?Sy5UGWF1ZliFrIY2Jm2MMsfFmghjSeRtTxO2f69VSvCNTG3IonhkZr6S/7Ri?=
 =?us-ascii?Q?mPneEaVtFjX3tSSZNx75Kf1I3Z/iPS0mZNOH213R+tN8+TB+NGZWcUaGWeR4?=
 =?us-ascii?Q?wtXtBLRkK29iwB9QlouVzv0n9gpqxCdn07JDl52G79Vv4uSfn86ibiiWZsJR?=
 =?us-ascii?Q?dVQ4w5nLiYiTfBaqkeS4enbAR1yc5M4gF3aWFsmvrditpxMETut7dF7a4Ikt?=
 =?us-ascii?Q?AZtVVWqXq6CroiVGlvpSAnq/F5sUi81xHhxXPMtaEc8F3GDjZ6Q+3pX4PRxu?=
 =?us-ascii?Q?R4cYUF+BZOu3+REf78AmwlVQU/XIVlNdSiyqZTCaDKVLPGwEnJ1Pipi0JRNm?=
 =?us-ascii?Q?i3HjP5NtILpn9L+NaD1LMKHSeiY+Ynn53vp1BsrhMLk3kTCkFmDjzPzHs/ed?=
 =?us-ascii?Q?+qBH3VoyNu4S2vvJINmNxoDCeHeAJWS+ijQmW+AlbshhU3OrnWmUJ8B7639G?=
 =?us-ascii?Q?mjUyBeC8jv7s7K70arTgp0KOFk7m3z+WCJcPVb4PBiNFbZOiYmUUoQjxG9yl?=
 =?us-ascii?Q?ijRacXxFavan/XU8R1rp7w8Wze7g2RezgIJTZ5i1dm8Qo1xUAN72tEe3gnsK?=
 =?us-ascii?Q?cJTDxv1Snn+sEgnPrffk7b/3uX0ksLwbBbMRtY+CjrRlN4xYfrpGQUBZbB5C?=
 =?us-ascii?Q?lrW/0bf0H7ICFQedTLY1QtuNzXJZpKDYIChInsD+9B/AZpPsoQwTJol9TmW9?=
 =?us-ascii?Q?5sblijzFNl2v3tFsPaqjk2SofnWylviL+BEtlqPZwIPFDQyyUswB5ALYnLOd?=
 =?us-ascii?Q?4HEszmSo0o4S+Xmi7Q4qFbGng16e2ssPMKdXHSndP9eGkIl176jqX/BdUpwn?=
 =?us-ascii?Q?d1Es6RjG1CdtlwV2eRb3DBBXsV8o/p5EFwoO2FkjaRGu5MqDCQZuEisRMXR7?=
 =?us-ascii?Q?Ade2tcjKdqqyFY+/ao6vZvzYk1uX/ZfBRzuiEL7NeDAO+wuucq/mxKNk+LSc?=
 =?us-ascii?Q?QtbtR2ocqMTQK8pMFs8IUpbcCxylbzx6nlkkYgT3OYBXXbrwR7tTemuWmxdk?=
 =?us-ascii?Q?TVicpq0PPWs1Z91wrmeCv+eSisDAkAmlaWuKYqvL5GIOzonjijLGLkQj00vB?=
 =?us-ascii?Q?a6Rk7y8s2vXD799NYuFDJyunqFWQtLkeRBLeKAQ/GZocAGdN9IgxPucQrijy?=
 =?us-ascii?Q?vMcQrXLZWyyiIAk554EzraNjlHGHh9lUINaf6RQpbNHN8C+fuzlLuAQW+VHO?=
 =?us-ascii?Q?p9vawlISxordi9DCaYQ+U2Y/7ZaRhAJqgw7NY/KHXUvA2OVtn9MQmFTYsoXv?=
 =?us-ascii?Q?c5PFvJQ3oVkFyqxoTfVBKuOOSYt/HYbOh/19pcMkr7QKmpAKPYwCHjgzVBDl?=
 =?us-ascii?Q?rMtBntu2DwfjNB+N8cN57/V23WZwM+GVMOmeFNtW44BjHC+hwJcydWia6eay?=
 =?us-ascii?Q?AZKiMeNcNxpccGkNoiLRg/jKziHPPNzIIY+eKmo/Yn/kv/V6yLaZyfymLxLV?=
 =?us-ascii?Q?ilTEehdWA5Q8q3MhuGdlAiJZ1Wle02dKnvnHCnh9r+XnR9QPc2w1Ax3St88W?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8158dff6-a195-4121-5221-08dc0bbc970e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 17:59:39.6960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8faQTz5sepbtFH56gHEa7Sk8Czf8RWoak3pU6kqtr22a/BzfDVCocBeUddjGVd8cMKj1xW921klr3ILITprno7MqbaW1t/Q323S6nxgIbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 27, 2023 at 04:22:49PM +0100, Nirmoy Das wrote:
> Recommendation is to read FUSE4 register to check if WMTP has been
> enabled/disabled by HW. If enabled we don't need to do anything special,
> however if disabled recommendation is to also disable the WMTP mode in
> the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
> mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
> is how userspace controls pre-emption, so instead use the default lrc to
> disable WMPT using CS_CHICKEN1, if disabled by HW. Userspace is still
> free to set CS_CHICKEN1 to whatever they want later.
> 
> HSD: 16016466292

We don't need this line.

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6aaaf1f63c72..37bb54187d1d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -148,6 +148,7 @@
>  #define XEHP_FUSE4				XE_REG(0x9114)
>  #define   CCS_EN_MASK				REG_GENMASK(19, 16)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
> +#define   CFEG_WMTP_DISABLE			REG_BIT(20)

Nitpick:  bits are usually defined in descending order so this should be
above the 19-16 field.

>  
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 832989c83a25..c212ca2c8625 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -316,6 +316,26 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>  	       xe_rtp_match_first_render_or_compute(gt, hwe);
>  }
>  
> +static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
> +				      const struct xe_hw_engine *hwe)
> +{
> +
> +	bool mtp_disabled;
> +
> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> +		return false;
> +
> +	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
> +	    hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return false;
> +
> +	mtp_disabled = REG_FIELD_GET(CFEG_WMTP_DISABLE,
> +				     xe_mmio_read32(hwe->gt,
> +						    XEHP_FUSE4));
> +	return mtp_disabled;
> +
> +}
> +
>  void
>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
> @@ -346,6 +366,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>  					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>  		},
> +		{ XE_RTP_NAME("16016466292"),

ID numbers only get used for workarounds (i.e., the lineage number to
let us correlate the status across multiple platforms).  For
functional/feature-based programming, we should just use a descriptive
string instead of a number.

> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> +			       FUNC(xe_rtp_cfeg_wmtp_disabled)),

The xe_rtp_cfeg_wmtp_disabled function already checks the graphics
version, so filtering based on graphics version again here is redundant.

> +		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
> +					   PREEMPT_GPGPU_LEVEL_MASK,
> +					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
> +		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> +		},
>  		{}
>  	};

It sounds like it might be important to also convey this information to
the userspace drivers so that they'll be aware of whether WMTP is
available or not, so we'll probably need to add that to the uapi at some
point.  But that's separate from the work here and can be done as a
follow-up after this patch lands.


Matt

>  
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
