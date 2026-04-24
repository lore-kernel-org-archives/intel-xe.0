Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77678FED3FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 19:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC4710E041;
	Fri, 24 Apr 2026 19:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uz8/1oda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD110E041
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777058502; x=1808594502;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=mUaXH+6OXUK7+Yi/BuHBzJ+pnXG2L8EInqbOvqgw7tI=;
 b=Uz8/1odaCk4+h9iG6OxanLWkNh+7ik9UhJkLrIEfNAyOg7krDpklP3W4
 F6lMyk7QF64gNsZZxUPBS46qeUuUDE5GE6xpDE7rFwWgzrptyKt+kZPiQ
 vCsh0Ffu+qHkDnXSrKugfO32AeZjCURZ+sS4YBwaejmr1wmMN2UWQeDNV
 a0IfXo9AHFV+UPpiya0rm6Vam+YZyl02d9Oqu4A7OmErBfixLPqeaCBFS
 zaWgfxhvtFZ2YRJIIKvQ/PQ+Zq7Wt5AjjX8bQQ14yJQowpf6cWiS5ELXV
 mE1+wA1dOPpCQxa4EE+nU1L85hAgwx10SJfaY1v3GHHw0FfFeNSYQQGn7 A==;
X-CSE-ConnectionGUID: PRYXAsT8S/OhVyUFvhEOLw==
X-CSE-MsgGUID: ZktoE9A8QSm5vU0vOLrJDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="95607271"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="95607271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 12:21:42 -0700
X-CSE-ConnectionGUID: soWe53eIRvew/kQ8JVrfsQ==
X-CSE-MsgGUID: XwmKUz5mRn6D4uOujG6rxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="228700244"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 12:21:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 12:21:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 12:21:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 12:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6VAti3a1ZZC6qkzuckQA+p+ruGCF+05WBp2rZCwnOd9s7bHiQymKbIw0naduAenlCLFLO543VP3ZIPKbvTk7+AXC83vSYQSIxaVd8KrlZqI5zyPY2DxDqpt2zdzfaDBrKyAZS3EYXI7m0LqIF9mFt51+hZo4vhEIe2NQy82muPuXOSlwXBfH++WGS8DOQ8fFOgUNSDCSFCD8pfCaxzJ1RjGXsFFkev5EnQKc1X31tqwkXYmjaVgAtnZFRuRY8F/kdPAqyp0rvyFulIaObIgX2sGPP0e8dtNYVuoq3s7S8IieCe23dy24pma4ztU4Skh2c7lC/I+oz03poGt4mkxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zxStEepYhfD6oHtSc7lyBY6IWgzjKbXbwP8PjocXSc=;
 b=lQ4UD4XnDisZGClDAievz+Hpha0XXM9rdiD6gnp6T33CAeiSv8W6IjmWxKkLViBkC0uwGEZyMHZkSyn+iCeAOYFxXDdFVcrX3DEJxy2n+pEz6yh4sgZMUjivYIEYgtSa9Axz29jIkQ1EIXjwrZONg/MdgReVd1kjjf1CdSnkg0SRbxPikpipNpqA9eyRdmlImGFNsXZzBiUiSdWw8b+qwAaBp75qi0CUm4KH5Fj3rlzwbPYKLXTYzGe8otOxoP6zCmrYs7bPZ6ExhD1HEViZcKtomrKCnrWsELYQsoxiMu1I4+BYs+Z96xXQxwCwCrOu5a1nTzvrZvZ7DXuwEkwHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 19:21:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 19:21:34 +0000
Date: Fri, 24 Apr 2026 12:21:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/10] drm/xe: Move CCS enablement to engine setup RTP
Message-ID: <20260424192132.GG2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-1-baa94014e3e5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260423-engine-setup-v1-1-baa94014e3e5@intel.com>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 40db4e6e-3d76-4d68-56b5-08dea236b2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vzybVVEDeplo7sqkbwx6m5PBxPYdFlfrXHasIpNGlaj1f4sV2O9D0QsqoB+D3pQRSo7VGhH7ryPtny45tvkbudyZ8TiuiZN85TmzoOPiS7oNkOjNtzNHcbMcmRZX5RAfSKToUv20ih1fHAgsVbejrRphQzYaEk5eD2elvRPidV0GPZBz8faLY/ISEWe764Opb/KbCajns4Gl4j2klj0hNbIetybpC1ci05LItaZkmFrNtgU9KgtjKWRvSognlFF9AY6hJPxoMmqtd5PNm1P6t2XlSOXgc3aRu6pTJSU230GbGfHhi1cl+3SRfW7aSoaZPGSsUGzfcncuNBjB63CyDjKD4S5GtesGjj7lbiQdM9Du1awZOdWRBRMaoxRorrxHTlbJjujqXJTJ8sCDOSGuHBAN0BenOp2Wi8kMa8H18WkjugwfiMHOq3DPG4/owPdwjRoWr9KifTnR6qyymZEewyY4LYh1TAGOyH73ym4uOTewBIWvMkuCRDBVyFC3T1+YW+v1e/78K+f6SMcdu9OgY1ggPOPl7RCdQB9Sd3U+7G8b8SjkgrA/KNuiDgCpF/ejapUNXYy13NILMDyJnnzxuW/ghBQZXrMe+YL66p9kwbWdBDOIkCIkFn/YlNnJG5s4FTpy4JT/o/WUpx4M9hrRndld28mAgWlIQIyeHlO5fjKO9JZgS8FMZBKnXhrkZDHzSaW/qpjBbddhUa9RuIUn209mO4GMH6qFlE2mWBCRyWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?44Xo21WFpcoynVG4ybUbHb4pP1dRT+TVB7v7ct9ezZaVXFcNJy8EGDAaiEwL?=
 =?us-ascii?Q?4cpfoIdu803JmB6NiFLwvnJIAhNEhs4dq9+nz0O9RcV2UHSU5QZJuajOXzEJ?=
 =?us-ascii?Q?bmItLBjYTWYMtQjDz6dR3ITNDhsz3L2XFMSo8pCDE1g0YsfY6uLvOuord1TE?=
 =?us-ascii?Q?Y6DddYPzbceZXBZja92PR/OPRvgKANJh0SrJbHr/P19W8dropfdy6t709yFz?=
 =?us-ascii?Q?qNwfiFIPQd3I7YmOa+Y2muZ5qeEznxAqa8Fl2oWjfNoX3ntEk+BXrLki9Abm?=
 =?us-ascii?Q?f/Odh3tQocBCiGjHwfQYJh5o4PSiEN8a4XRCybc9NI47xcFL/IlsBlWpHKCV?=
 =?us-ascii?Q?KGK6u/zeyVTlEogHLfqtUZrr0gnqNnrdvzBulUnF1c1jt7IpCGt3bXNrhElT?=
 =?us-ascii?Q?Rq8Ei+6qnF2tD84j/2JMFttXLQiff5odXB/bOv26sAU+Kziy6becB7vCjR1P?=
 =?us-ascii?Q?2FQ5tlSlKRKUqTJwWtgX8/GhGDV9y1X6r5fH/291H07vr0mfmQd1c02XxTzc?=
 =?us-ascii?Q?ddywkSes3wSjlZdqfA7v/B38Ocbz7tMc4tUKTIuA3nSWWH7ATRj1w+F5zs7x?=
 =?us-ascii?Q?8S3PZX9lZvojASPrZL1iHi+QlWCh53EY0jwxbaaz1j1uIUroKWMoz9JLygEt?=
 =?us-ascii?Q?u0yrlk8u3E3N+MyfFKC3uUvSJanYWZj3tOVvPGz39zu/21HMn3lYUhz9RSj1?=
 =?us-ascii?Q?BxzBlO8y00Mojw27J2qPhlcoekttkcUpnGIYJAeD1Przk1dhYIXjaVYwnD7T?=
 =?us-ascii?Q?u5sPLGhHpAXv0mwkDax6Fd6umkcFs6y69SmDlki/1ImsUb6CWxF5AxP+hB00?=
 =?us-ascii?Q?Vk1KWOtepJS+gWlFA6+1DottZDkgo05CPIE9+eW3VsTbohL2JoUEqITMPBqh?=
 =?us-ascii?Q?6kAm1F5015CKt1zG/4zjlsNtp816CPWzosJ2ciECTYhKLSKy+iHetZCBTvrD?=
 =?us-ascii?Q?BH71peIjag7MKE4oQ81aXkZ5AAdkAQ7KcOZ85nsxmsHoXXjhcYvBzdQz7yvH?=
 =?us-ascii?Q?tx44J2CgzuJKWMhjotRATu61/xSVk9kKmRGfQeGGV+O5Sv+G6gKhyFlNMaNR?=
 =?us-ascii?Q?0ks29W3ZxdUSWshoJQrg8aWFROM0cZpcqMLKJtCD5f4uWDBuZ6tV4VRQRBS9?=
 =?us-ascii?Q?buNfuI3PcWGdlwAMMfL9QQtIkMgwxzQ9BUp7d/Vz+WtCWiibEsAWg2iTQGhu?=
 =?us-ascii?Q?76qb3trjMHTO2MoDc2ChS9wRovOR6eToTMwCGZ8SHTmMgPaunXFtIMO/pFgi?=
 =?us-ascii?Q?huOTsCmrXbRY95E7uVw3kT0dwdcvwRrt6R5jqi9mL6XMAjABlJ5+dXn2B1qg?=
 =?us-ascii?Q?gUG0t8BbVhwlwfyao4rlxpAeUX+H7IxD6J+DflgB3hLg2kpQPEkWFI7PuSg+?=
 =?us-ascii?Q?xJgT5MVzkh/jZY2CmLBfkiXJqj1JjFGK/O8lyey1uCs0OWZkamInajNXgr0H?=
 =?us-ascii?Q?inIKKRd5hypUMmQAy3T7u21lT4qqSlo7cF/l1SW7MN1UQBeMxGdpNgZPajdr?=
 =?us-ascii?Q?vxbhMny71u3xFtJYa91wHFeQC2I+jccTZZec4PzzAQy4wYIiT0UxGci9nlUg?=
 =?us-ascii?Q?fPH3BumIu6BueFVNY8g8AA+7eK4lZuwX7gmXTN+q2VRLOWhSeU3TVjtX4sYP?=
 =?us-ascii?Q?GdFiOw0w24RXBLQRY3XvKaEqnehgCYY73pxf76AW2lRt6Ac64g4j65/Mvocp?=
 =?us-ascii?Q?MrlGka/qNOu4yhSWZf5Xo5OMDmmB8c1bfcUIwG9JNRgmWR88Up7yldwaGJhY?=
 =?us-ascii?Q?VIgWibDWe7sbu3H31n4yjRDRhG06Wu8=3D?=
X-Exchange-RoutingPolicyChecked: Lp4ALfXe+/OyGh9UHeXyJWgEIt1UV7lMmE5EQ5p++TBGfnMXyimDF8JsexTM4csgeW6x1aTSshfM9z1ntj9O5IpDTEf3lFUBVtml+P16FyY42nOLuhGQkwF9gp8g8YRwmVzMCBwamp5TtaGMKFmxt59POgaD+zNVxXaOlVgnjnTGhGgfP4TZV9831S+PAbCu6fhGp4g3AxENZ4C41D9ZXxBE//IL3WHfIK/BWyYteLtN6hPJskW414+VwdTs28CT+u57LFDvx3LUFN1nG+6p/oprz894159uWIXmq48p5NcMqJZm4mGXBcMFpeDfeQl7KM+wGnbAg0/HIEWOjQ1jAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40db4e6e-3d76-4d68-56b5-08dea236b2cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 19:21:34.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I72xE0OnYPWzdODlhY3dt++hrkJTC1WYlBJqtG3XGnKIYWKdz0TvXnbJItiyZxUdO12qXm3233DcpvlIcJ2su15WRwaj5T79IcUUKX2TO20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

On Thu, Apr 23, 2026 at 03:48:48PM -0700, Matt Roper wrote:
> Most register programming for engine setup happens via RTP tables in
> hw_engine_setup_default_state().  Move the programming of RCU_MODE[0]
> which enables the platform's CCS engine(s) there.  This both makes the
> code more consistent (other RCU_MODE register programming is already
> happening in this RTP table) and improves debuggability (since RTP
> contents and checks of their correct programming are exposed via
> debugfs).  It also helps consolidate the regular driver initialization
> paths with the vestigial and currently unused execlist (i.e., non-GuC)
> initialization.
> 
> With the original programming, the RCU_MODE register (which is a single
> global register, not a per-engine register) was getting re-programmed
> with the same value during the initialization of each CCS engine.  When
> moved to the RTP table, we use the xe_rtp_match_first_render_or_compute
> match function so that it will just be programmed once, while doing the
> initialization for the first RCS/CCS engine, which avoids the redundant
> and unnecessary repetition.
> 
> We can also safely drop the explicit addition of RCU_MODE from the GuC
> ADS save-restore list now since all registers programmed via RTP tables
> are automatically added to the GuC's list.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c  |  4 ----
>  drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
>  drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++------
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 1f8d358e60fd..026a1ec0c868 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -59,10 +59,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  		lrc_desc |= FIELD_PREP(SW_CTX_ID, ctx_id);
>  	}
>  
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		xe_mmio_write32(mmio, RCU_MODE,
> -				REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> -
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
>  	lrc->ring.old_tail = lrc->ring.tail;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 92c6981fe220..d0497d9f43a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -748,7 +748,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		{ .reg = RING_MODE(hwe->mmio_base),			},
>  		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>  		{ .reg = RING_IMR(hwe->mmio_base),			},
> -		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
>  		{ .reg = CCS_MODE,
>  		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
>  	};
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 2f9c1c063f16..3d9931f54cee 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -325,14 +325,8 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  {
> -	u32 ccs_mask =
> -		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>  	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
>  
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> -		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
> -				REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> -
>  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
>  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
>  				  xe_bo_ggtt_addr(hwe->hwsp));
> @@ -465,6 +459,10 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		{ XE_RTP_NAME("Enable CCS Engine(s)"),
> +		  XE_RTP_RULES(FUNC(xe_rtp_match_first_render_or_compute)),

This should also have a test for graphics version >= 12.55 since we
don't support the CCS engine on Xe_LP platforms; we should only enable
the CCS engine(s) on the platforms where they're actually exposed to
userspace.

This was the source of the CI failures; I'll fix this when I send v2.


Matt

> +		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
> +		},
>  		/* Use Fixed slice CCS mode */
>  		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
>  		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
