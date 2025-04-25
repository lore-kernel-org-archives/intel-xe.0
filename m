Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A572C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 19:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ADC10E9BB;
	Fri, 25 Apr 2025 19:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4k0G8my";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CB010E9BB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745610577; x=1777146577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CpUfrNYTr9GYD5lzSOm2My3Dk3zhSrytdj9nTq/LzsY=;
 b=G4k0G8myORKUftFdKIE7tWVxXCNojT4Nuts+zyYSPm68HJ4jIJzDV2bf
 qzqHKiU4ShLlD6oIV5I80hyeArZnNkNk/ebC1Z1o5IN46zlCFy12HwNCA
 H2HCzz/XuRFCP8AcirzQfqdtIS0U6kSiPaefNt+zLvCbU6wxojeHCECOf
 zUOZU3z1Xk+WrHWwCxdA+kEgE2kZFL5FwlnuYn/fFYpavdq0gN8pBNlw0
 LT/pYnpXjZREpCTuDrWjLxIRUonajqz42CDKnqm4zvdfHCBPhGD/NQt3u
 T0C8BFm62wPnz1THDBhOuCnCzPNc8L0dVF+UMAf37JWwQmJXMfA2gGPpw Q==;
X-CSE-ConnectionGUID: r/55khQESpmZoiEHfRRWqw==
X-CSE-MsgGUID: n4PgdXiHROK9kutQo1zWmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46399794"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="46399794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:49:36 -0700
X-CSE-ConnectionGUID: bFBFTOsVTBuWlwti6nykqA==
X-CSE-MsgGUID: HQSP34hES4eZ5D3UXh4fTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137800047"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:49:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 12:49:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 12:49:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 12:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL6nzBI9H3Noy4MlFN3pAin/mSxF8UZ32TyzbHXxPuNeJSytz+Sn3QoZsLRCNdv6Y5zOoTrLEc17a1r/SkM7IJt5Avh1WJmn1qaggzBO0kaKuUDFN5Qf7Y6pnzwSr0QpZhTHUkC5oGCA5Fg6TYOdbr4jXAL7Bpkqyx5DYtgCpMKZmQIYBloU44h9J7XKerwH0/BBZrvie/B/MVl9T36jLyxmpVZsrwAf1Ut+Wq7c44YB/I8hnmVKuxN2FRnlh9rxyvJIhcWgmsWVC11ginHd0H1M5LA5lLJKy52ufAxVorsZEfLGQ7YgdDxRhjyiyLixdLsprMLbcBc69cAroR7k4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itQRc/Sb7uIq8suLRw9z1o9irEKCVNfMYRhkiYmMfW8=;
 b=hahijp+lYst7DGaIpOCtc3shTdFrW5MIkfoVAfbPmR+4MfyZ/U72xZMxmvMYbn63OTBDbmFO/rUhRifp4v2VtKYSbqVsMoSfWXNU8o5VFQRJpanlATpVYic2RmD7JfSFM4ny/XSV+Gy4hYBcvmh61oDASnvlww3ZtwaQ2g8zrf4HDFRDQWz/YYcmD5h7U5+FXkRyJL/dbBxtHX9N+OHc55rxekdsRSL/GTDNPQVOiivPa8s+d5QQzZK8AcrONu1Ooo5P5GL854Ss5VeyoYaQlIXQra1ucNeR3XDnQ+uqUYTcY2M6gcm+sTxdhDFsVomIN9kufTX8rnbxVs2PNzQeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 19:49:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Fri, 25 Apr 2025
 19:49:33 +0000
Date: Fri, 25 Apr 2025 12:50:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aAvnnnVaY2qsmCtI@lstrano-desk.jf.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 46880a67-092f-46e3-3981-08dd84324cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nMJMMYQa20Ta+bXOf+MaIL639RzGw57MiNtCoKKT0E33Ou4FygNc+yeaBFVI?=
 =?us-ascii?Q?cnF7u8tnpbUetEPd3DWF3S8Ybni0jnkMpJPwnB+nfI1Chp4aW5cMam0FwYPw?=
 =?us-ascii?Q?Td2G422PfELW9GGsoKlvNDduLPlJuXht0N8fh1TMaBaHKbv8v9Xb6gsgi1oU?=
 =?us-ascii?Q?HeYjSlF9yxqFMKWY2S8HkkbE4eqLjlDi9kZiMb0rRi5thYlDOVmvatLLIBt5?=
 =?us-ascii?Q?b9EfLJquXUTY/0Zm63WOCHBBeD8JbmeTQUlonXTfhoFeHVm/jJbLdc0VOQ6Y?=
 =?us-ascii?Q?raQt+MAwgNejRxNIEeNDfp65+WXx4J9GGNzTTm4vlvf4xKUX1nAnhRhPzIY2?=
 =?us-ascii?Q?bFhx3IM3onTVxQ4uUwk4QlzRaRTupmRLn9c6IQIGoOCTT8vROnyyTfUXr2EG?=
 =?us-ascii?Q?0IfZA/tMivvSoAdfStwK4PQ6fVT46CaQZLrNQLBB4jAafj++We47w8fhJU/6?=
 =?us-ascii?Q?5trVv1psj53dh2ptaOHpNAXo53sba8og6kqanQ9RlNUTWS6T29jSkObECoMI?=
 =?us-ascii?Q?vCHffEGNo7fKNntpoWf+1VcqXZMucpCZ2NtzFpW+dkMVTQEyf/vxUEqS9vEo?=
 =?us-ascii?Q?EoHV3ZHWVN47zqVhUa3mYHOpFlhDw2yiWUw/i6io2yI/A5y59XOFUI393r/U?=
 =?us-ascii?Q?gl5P5Qap1BcfkAngP5ZIpFhreTh8Jkw9J/FnUVr6Wa9LE8BjSRANOy5HlW4u?=
 =?us-ascii?Q?39ls0lviH5/E8NMDCW+/eN5lLaDG1TyUSzA3GaRbkSAObNwcDW1nlkyOoArQ?=
 =?us-ascii?Q?oA0rbq9xErpe8P0JDcrmo2qIEaYJ7vv2rG4JRqoFAl3z6IRS5XiUqvBKtHqD?=
 =?us-ascii?Q?jWxd+IGA2Usd2SO3HweJDKZvKoOb4dId2gD1lLvD+x8Ct8mV06Ek/yZNiMvW?=
 =?us-ascii?Q?2DeUXWiYYAvz0bn3Jmzel4RviSowIZJvgnVvxiS0wjS/LqmvIhJQZbafK4tc?=
 =?us-ascii?Q?ktFuPrjUf4dLuFP8kNWh4NzlBxV55hobcM68HbvqAgHDHIuSM2lahZQresdt?=
 =?us-ascii?Q?U/+teFG3iGITubbaL/RO7e+y98drdVptfNTXVZOwNIG+qWtNLhnqWXeD8iOO?=
 =?us-ascii?Q?iWrSobHPMXXqFzxw0U4k5hSlv6pQcCunjCgv4Oxpw3zo98vsMHXZvX/y4G9i?=
 =?us-ascii?Q?FbeqpGBz95LdJGEnhMvDaMf+jZlXX81R7Lw7hP2q6Ttv23GAwMJkc4aBEPWs?=
 =?us-ascii?Q?UPvbC4fsDTePFAK/MMC6umnZRoNaj2Tdsg80DkfHsyKiRytsDM5Y9z2TLUoA?=
 =?us-ascii?Q?zUzHkkw8xulNVkMWBwqqhzv4y84pRT3VysVydgSz6YR5REuJNOPDQ/gBEaTN?=
 =?us-ascii?Q?2ueClQ31Gm8LSfwWPe2UdTbcW7rU5VHbVJPl+sPDMeWSGnRdTI1U41B7J7CF?=
 =?us-ascii?Q?jz7CkocbLgMu1BHZJRMtyzyjTKTO6RITFL8BOnMdgnvP/GQZSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dGf83WfMgRUWVBvImq+ms/n76D7i6uyFNxU1MKy44JPNwnHroGXXp4BEtKs?=
 =?us-ascii?Q?5pBr+nCmaUubL8LW/0I3T707CP3vnZS7a/ol+M6PG8ohKmpa6aSbo0eYyixl?=
 =?us-ascii?Q?MiT3jpUyZkKPmnfRdQ4D1hqsLlb757oK8rRg12dd64eIpo5vjj0izm6niwx3?=
 =?us-ascii?Q?ZvAuJXNO1wZ0TklmWG0y7jZRFYpSavOt0p4TnSNKEAK25dpItih9bk7vKfnO?=
 =?us-ascii?Q?RgS1YymRKZkbtQZx74iYXJukUE0Oc7gTSvuik8ObHWCjEGe9RCMAaYkQZyK2?=
 =?us-ascii?Q?D7g6O5S2JUFPmMm8eMrwZAMjsbxfp0zwZrSwOnfLrDJkSAunAJ11f08adEQ5?=
 =?us-ascii?Q?HisRl/e6fw7KLlgSy0f9dZihtMArs4ai3ROgWVeQJNd4XbO7+GCJzV/Rfvnx?=
 =?us-ascii?Q?XijeKaLoJjeAmXJDX59F4V+PRSwVGPvnlhBMn3OqA1ErX8QVPy60i6k4TyoQ?=
 =?us-ascii?Q?ajOTL2Jz2BEgwwzo64dCAvchCQ0qdtEPyavAtnWKYMv1dCpEHpBBqagWd6iR?=
 =?us-ascii?Q?yqO38XJ7RvTMWnJ195LiCej3Np4dNGtdExLqcdq2A4Td3EodhfbcllY8pTIp?=
 =?us-ascii?Q?1lT0AWVMLpytQ7fPlM/7Wu4ni+ut300Gcf4Np0SgIU/fcsOuOcfts7UDTUIc?=
 =?us-ascii?Q?0rai+joX4mUKnvgHkJnI3GJge6MjI4E/YccxSof0X+Iuxk+vD949lVYaWPql?=
 =?us-ascii?Q?c5EMQXFuGffU36GYSfAn178GTRTgninVJLDEdxwjusNWsuyOT7jMP9q5waTn?=
 =?us-ascii?Q?fw+/5Cl+MqIIBtjU6p3Cs8qXKc6RLo/Gh28R1/LqkpBr8O0NOMVy8raWvmfI?=
 =?us-ascii?Q?M5RnT5/zI6uSMzvZVWVjHemBAsjlly9DJe/2VrBfK4CUbHvhqui+cSxHmwBD?=
 =?us-ascii?Q?Fx+F8e8Al/ygO+SeELZJf7wYOLw+eA6vvlkw8XUKLX7bRO+jd2SVy5gXIzSn?=
 =?us-ascii?Q?4zhrp26Kotdc2erdffCSHgeCdxR19bNfH7wDmS6qQhyRKnZbkbRbMnOaJTSU?=
 =?us-ascii?Q?Dlv4mmpqxa3IcHFY/XguVZI3cvX+PKNd8a2fApfEURnKEkR7T5hRAQKp5BGz?=
 =?us-ascii?Q?FfO3zpkb2Zo71ZqE5zno3fgGYTQ7ACEYjGFzi7qSeBkrUpNNtl05EvJzhDOa?=
 =?us-ascii?Q?Xwl7YPHUsBF/rKlYxfW5wHCm5rTjOaHtQBt07zfQsLbZTYOvfgDEvOZ/LiWl?=
 =?us-ascii?Q?2YjET4J6eM1wARKNtSm+kz8mR+BTJKwP9Jz2gQc0uaDSAoeeHzZiZ+NVChEd?=
 =?us-ascii?Q?bKD+f86ab5htzoo3ze+OLhNxaWUOqxbCPeTuGO7dyq9aCfaX+CetmJy5o6Ph?=
 =?us-ascii?Q?eb2Ch05rh7dvtvtaYA0OTrH7pYYW23QXQK9RU5DLtbJ2GSZkJlKwGgKwHzua?=
 =?us-ascii?Q?v6ABoLUX/Pyc6r1fgQlGSygBZkeiWlA0I1GQMWfdkoOS7k3QVcKhSvwlNRod?=
 =?us-ascii?Q?L3G1xiJQAU/V1hr6S6uWljvDuIZowD/EXPIkH1mE+S69I/Lsy+iAyjoWj6Vu?=
 =?us-ascii?Q?z+iSuPkQwhdJYTCGCGBwbvUo/RmJqpB2pRxDL+RVangqxtP6AbSwCFjr/Hix?=
 =?us-ascii?Q?OKR2zHS65/+IlqXlso8nMCCSGfKivIYPdHvVpHV2Zu1vA7jKshGl3yXCaJgL?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46880a67-092f-46e3-3981-08dd84324cda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 19:49:33.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmIGnZU6t9jndnfqIRww8LCc5jv4dqNZnmCg7kdkX0fZ8g8tXPKD83ON/I/5qIpODO42Xnjy4b/26xRPpZ7ldg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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

On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:

One more nit...

> Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
> of the context, but only gets updated when the context switches out. In
> order to check how long a context has been active before it switches
> out, two things are required:
> 
> (1) Determine if the context is running:
> 
> To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
> in the lrc. The value chosen is 1 since 0 is the initial value when the
> lrc is initialized. During a query, we just check for this value to
> determine if the context is active. If the context switched out, it
> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> Note that wa bb will run after the context has been restored, so reusing
> this lrc location will not clobber anything.
> 
> (2) Calculate the time that the context has been active for:
> 
> The CTX_TIMESTAMP ticks only when the context is active. If a context is
> active, we just use the CTX_TIMESTAMP MMIO as the new value of
> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> for the specific engine instance. Since we do not know which instance
> the context is running on until it is scheduled, we also read the
> ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
> 
> Using the above 2 instructions in a WA BB, capture active context
> utilization.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
>  5 files changed, 181 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index eba582058d55..9153a7cd2ceb 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -62,6 +62,10 @@
>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>  
> +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
> +#define   MI_SRM_USE_GGTT		REG_BIT(22)
> +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
> +
>  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index da713634d6a0..cc698136a6f6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -43,6 +43,10 @@
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define GSCCS_RING_BASE				0x11a000
>  
> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> +
>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 57944f90bbf6..210be0ef12f2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 855c8acaf3f1..11eabe4216ef 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -24,6 +24,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
> @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>  }
>  
> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> +}
> +
>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>  }
>  
> +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	/* Indirect ring state page is at the very end of LRC */
> @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
> +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
> +DECL_MAP_ADDR_HELPERS(engine_id)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_unpin(lrc->bo);
>  	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> +}
> +
> +/*
> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> + * context run ticks.
> + * @lrc: Pointer to the lrc.
> + *
> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> + * context, but only gets updated when the context switches out. In order to
> + * check how long a context has been running before it switches out, two things
> + * are required:
> + *
> + * (1) Determine if the context is running
> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> + * initialized. During a query, we just check for this value to determine if the
> + * context is active. If the context switched out, it would overwrite this
> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> + * after the context has been restored, so reusing this lrc location will not
> + * clobber anything.
> + *
> + * (2) Calculate the time that the context has been running for
> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> + * engine instance. Since we do not know which instance the context is running
> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> + * store it in the PPHSWP.
> + */
> +
> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +{
> +	u32 *cmd;
> +
> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +
> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	*cmd++ = ENGINE_ID(0).addr;
> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +
> +        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +        *cmd++ = 0;
> +        *cmd++ = 1;
> +
> +	*cmd++ = MI_BATCH_BUFFER_END;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> +
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	int err;
>  
>  	kref_init(&lrc->refcount);
> +	lrc->gt = gt;
>  	lrc->flags = 0;
>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
> @@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +						  ttm_bo_type_kernel,
> +						  bo_flags);
> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> +		goto err_lrc_finish;
> +	}
> +
>  	lrc->size = lrc_size;
>  	lrc->tile = gt_to_tile(hwe->gt);
>  	lrc->ring.size = ring_size;
> @@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	xe_lrc_setup_utilization(lrc);
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>  	return __xe_lrc_parallel_map(lrc);
>  }
>  
> +/**
> + * xe_lrc_engine_id() - Read engine id value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: context id value
> + */
> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_engine_id_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
>  static int instr_dw(u32 cmd_header)
>  {
>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> @@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  	kfree(snapshot);
>  }
>  
> +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
> +{
> +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
> +		{
> +			RENDER_RING_BASE,
> +		},
> +		{
> +			BSD_RING_BASE,
> +			BSD2_RING_BASE,
> +			BSD3_RING_BASE,
> +			BSD4_RING_BASE,
> +			XEHP_BSD5_RING_BASE,
> +			XEHP_BSD6_RING_BASE,
> +			XEHP_BSD7_RING_BASE,
> +			XEHP_BSD8_RING_BASE,
> +		},
> +		{
> +			VEBOX_RING_BASE,
> +			VEBOX2_RING_BASE,
> +			XEHP_VEBOX3_RING_BASE,
> +			XEHP_VEBOX4_RING_BASE,
> +		},
> +		{
> +			BLT_RING_BASE,
> +			XEHPC_BCS1_RING_BASE,
> +			XEHPC_BCS2_RING_BASE,
> +			XEHPC_BCS3_RING_BASE,
> +			XEHPC_BCS4_RING_BASE,
> +			XEHPC_BCS5_RING_BASE,
> +			XEHPC_BCS6_RING_BASE,
> +			XEHPC_BCS7_RING_BASE,
> +			XEHPC_BCS8_RING_BASE,
> +		},
> +		{ 0 },
> +		{
> +			COMPUTE0_RING_BASE,
> +			COMPUTE1_RING_BASE,
> +			COMPUTE2_RING_BASE,
> +			COMPUTE3_RING_BASE,
> +		},
> +	};
> +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> +	u32 mmio_base = base[c][i];
> +
> +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
> +			    "Unexpected engine c:i %d:%d for context utilization\n",
> +			    c, i))
> +		return 0;
> +
> +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
> +}
> +
>  /**
>   * xe_lrc_update_timestamp() - Update ctx timestamp
>   * @lrc: Pointer to the lrc.
>   * @old_ts: Old timestamp value
>   *
>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> - * update saved value.
> + * update saved value. With support for active contexts, the calculation may be
> + * slightly racy, so follow a read-again logic to ensure that the context is
> + * still active before returning the right timestamp.
>   *
>   * Returns: New ctx timestamp value
>   */
>  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>  {
> +	u32 ctx_lrc, ctx_reg, engine_id;
> +
>  	*old_ts = lrc->ctx_timestamp;
>  
> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	if (ctx_lrc == 1) {
> +		engine_id = xe_lrc_engine_id(lrc);
> +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
> +		if (!ctx_reg)
> +			lrc->ctx_timestamp = *old_ts;
> +		else
> +			lrc->ctx_timestamp = ctx_reg;
> +
> +		/* read lrc again to ensure context is still active */
> +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	}
> +
> +	/* If context switched out, just use the lrc value */
> +	if (ctx_lrc != 1)
> +		lrc->ctx_timestamp = ctx_lrc;
>  
>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 71ecb453f811..1c973d71ba98 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -28,6 +28,9 @@ struct xe_lrc {
>  	/** @tile: tile which this LRC belongs to */
>  	struct xe_tile *tile;
>  
> +	/** @gt: gt which this LRC belongs to */
> +	struct xe_gt *gt;
> +

You don't need to store the tile then. The tile can be dervived via gt_to_tile().

Matt

>  	/** @flags: LRC flags */
>  #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>  	u32 flags;
> @@ -53,6 +56,9 @@ struct xe_lrc {
>  
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>  	u32 ctx_timestamp;
> +
> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> +	struct xe_bo *bb_per_ctx_bo;
>  };
>  
>  struct xe_lrc_snapshot;
> -- 
> 2.43.0
> 
