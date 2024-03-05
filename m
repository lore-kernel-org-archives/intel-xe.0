Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B6C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 14:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50915112B58;
	Tue,  5 Mar 2024 14:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKdc6yWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E5112B58
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709649801; x=1741185801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iqHNqnlnzDCXyYN/seg0G1T60i8z0sYAp/PjKr4KzWg=;
 b=TKdc6yWBi2DOW3bpwM6NPrBndCaO7LDz9WbVrrsxIO6FoN0tB7a3z8y0
 4NOQAEN8wVPH+Uc0O8Uvxo3HYJzYFw5XnnyoZX+DQd0EVsEodMwik5fPs
 m3d504Ig0ZnX52tWDCafr4gCZV17piE2Ut58MN4XLuKm1v9golAp36L2U
 sYZDA8gzTJ1ZjpdsEwM0pBGA8ac1JPaUn9dRfVWNnziljdZKAwgn3dR/a
 4xdoOIXOawlonRrjDvjnh/Th45Vq7V0b7US5Msur8ISuj8N7oc4pUDHtQ
 tQKfdg9Fw+11v4FPQ4bJ/y3C66tQk2x7vGmU9tg9WEDdpqmdQF4v8sGtr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15633061"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15633061"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9799510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 06:43:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:43:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:43:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:43:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:43:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy3pgDeJsb0TmjCbAr6qEgKPH6qfFfvjHoT2QvkDliXitr2G5XXluW0r1EzCiupPcKcvWYaksPAW26gTizicND3Lvf09fNOZWDVy8ulw1nrNflUL05vBs49mvpPpSgYeV98bVvc5d6wW7kwicaK+2973TTh0nramTPyYcwlp0wwaNdty2mGep04N/sErLkXX/Y4bKrW8/zZjb7yWHY0JO682WH4sVMNINw4T60nbYN0n1om/uQCliz9TV8j4l+HKJnCIS9cW7yg24Xn3D8YzbSuCZfVeIOAl4/dXBmMQ8la4XWXueHGBt21pz1S0ydfJ4FV1Wm+BkOL13bUK5DxPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKbC1cmoVoqVlo2LhAp7z8XvllIwAou9AygFQbznsr0=;
 b=C3//aAA8tl/zTIAJsobBTNFDSQtgTOhSqJo6y9h1uYisA3JamU0fsUFVoKzDsjvfgj/DCJprbUR/XB6sMl9MRDjBbssiSLzBsk9+5mA8PtIC6OI33TrGaQPqfd0D1CTYiZvKqxv+QcgGW85cG6ta6OoBSbIPm3MzoXDRMjOEElOMGUJi19Bc4GtmSpyySjg0RussAgAVT1RCLzpLWxH9ey45C0pJW9NBKr9U+2OFllHZfyu24pap+V/KTBrHZfP5t/GWu/3aLdsv0f3tUAx9zN7VWSyx3yRUrrs6FWoZhkLjht1qtVhp5g6WACpnQzLn+r2kfQ/kKxfKiCVav1uesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 14:43:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:43:17 +0000
Date: Tue, 5 Mar 2024 09:43:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
Message-ID: <ZecvgXV7OB-ZYeof@intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e35f6c-30d2-4cad-cb5d-08dc3d22982b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rs54xVRwJFRT/Hu6VaKtYDrs2ledWWNhND3q9q+YW4ALZD8YyuIIhc1YiFMBApK7UPgb7FPWobTYkYy3eahstRhdymkOP3mR1OoHighkVJ1Vnt4KI66eyQrpvbC1LK6SibYcvMMQsMZCJaYu7FZPphGdLZRgVi+c8iOm/Q1Gg1xc9ey3ArFtY6R5JPnmOs4QH7b99SNGiR1bVZP49l0tIN3Q55f3icHHvQ5CvLJ3aYfu9fDVqdghtNTS3JmWrf8cS0OFa28u49ElCrnvlAGL9f/TaCokg1zjIK4F2v0PIGlzAIniWsDeOpKqLT8SBPohB0eC8LQYWbyEribzn1CWEeucYUrpRSLu3cIwLeHKuxVjt+4m6APPB/DgqvyD+J/zN9vwU0cusxtmcFXpam5UrsxzYUGPmlCmzi4xTlbByf4iDqbtMKlzYZfIccF/P9UZa179amVTFRYvb/MNa1U9uZc0P/TEJjYQo1rR6HmV6wYzGT9aoH8zaVpNJvJG6joApI9BzOY89kDm5EJgQFx3V6sxrlFtL8ZDPENHi5WmG9YRztqk6BbVlQAJKcL879vnKdtZjZfA1MkxzSJIlKcsCwHqWfNRbpbVllDAm51ro+UuQkgk6Ts+Zd350LpT8bCpR/TOFObV8RVTyZGcqG+bBLSjFE7oALaoucIhj5MPi0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFvaOn87L70n00VKql1Prg0Xlwsz+HwlQ6rzB0sG8tyCmHDuQklQlaa3/L71?=
 =?us-ascii?Q?1Ln4C8+l2O9l6Brovz2cQKBrs2DpVm5s5cG0o4ZWFjSQ1i7/UDQvEZzcljqW?=
 =?us-ascii?Q?iy4W4McZpdAHJFqqWK7qI45Qq3uwdTwVR8Kgeab/VsSF536lZwk10EDZxR4Z?=
 =?us-ascii?Q?9odEUkc7Mq3rApu4DR4z6RbfVvS6N+T+VqDAsaBWCUaY+Gp+kWPaDwGh21+c?=
 =?us-ascii?Q?ekPtCHHCApKCwRm+y2o39XC5ORXNUdsaS+Fw5uH53gFJ1wN89OmN8PtO7QFr?=
 =?us-ascii?Q?Dfnn6w4Qr/zpOn5G1Sk7NBBo6faiGUAm0aV7Q4lV16WapHkMj1HAPMCCdOUP?=
 =?us-ascii?Q?7YIwnNBF76cDzlZ2j+giCUamkOSdyFBB6laf/RhP4k8JUtGvNpjffgF6mpOe?=
 =?us-ascii?Q?YKz5eMe/L5HFiIgGDQBIPDukFqBJLVQmEFct9YMNDSdHBm5okLzRp6cMWq4X?=
 =?us-ascii?Q?DrPwhuCbykpFJKvrmslFHaEYA3suE1JPTDNaSO7TzAYElt1Ol3IkZ7Nh2Ptf?=
 =?us-ascii?Q?CsJ3PGcokCI+qfhVXoxyLtzf8C671TBBFuVoFuYiFXJl/bmDoUB5rfkEZPoI?=
 =?us-ascii?Q?bjP1aivTBTtUKsDx/KiBwo9oIjLkN4JjcsjW29SAZE51cl+ATEmIvTzfEM2j?=
 =?us-ascii?Q?MpHsSFqAl24CTgFgV0s7MwL36yGoOpwQs7D57+6xa0ZI7yX5JWiFgtia5l9Y?=
 =?us-ascii?Q?H0gcZC/Wm/gsd4sZsWjjxdSAaJJqae+FA+cDl76q4/lFVgorzyE+WOdOKm9f?=
 =?us-ascii?Q?P5p1K7BnY3JjwihZVhTzbUNWcAwU9tLEir6TIuVsMPyn4LVZxZ9GhanzaNBs?=
 =?us-ascii?Q?lKix8HK72zTJICv6u41yLj07nJcTZuxic9A2+gafi5qSEopwxNpntKUGCLz/?=
 =?us-ascii?Q?ba/MhyBuBQJ0GT9TcL/EHvO8ohd6Ph4aFexWjgLfhZT+Qhr76T1rzS5THpCg?=
 =?us-ascii?Q?eBBaE45E+3Ez3x1JPBBf3WaB9ZVzoajU1FCTDAMCZxKbGHVpvRcKsi3LdD9q?=
 =?us-ascii?Q?yfv2ixVEJBI02kI86RQxWNSbqFojWLdxUeaH8f4+5zRyBh9bSJfdgN+TxisG?=
 =?us-ascii?Q?MEbXqkX8Yj97N1f3D4HJ45jwvWQZhrYHXXqN/gtwp2Z17D4bgfbmPsCuSRbK?=
 =?us-ascii?Q?+p9OOqp8MTdcEdfufnWLXLAJ8Z8FCziucAf0jdghQcdPtwjfFmYMc4flIrqC?=
 =?us-ascii?Q?dk6BaRHnY5I4BeNGSRtc/FJi8ra3XhMcD+hukPf0Suc2dnt+uVCAfePqTwrj?=
 =?us-ascii?Q?8ek98ljIKWgFO1uhdTOuCbtJ6w7lAO1oZT6z0XE++FonidAGtDBDJ7y5ZBo1?=
 =?us-ascii?Q?Uxek1UJii0tzdYRzUI1wIIppxEw5z91LMMVOWoJo8MJ2xyH80SCD+Eeq2VDJ?=
 =?us-ascii?Q?fz6IZGtL0RMGDUaNK4kBQkmwIqnptGVLXSMMt+8b7/+wADLlvPZDDI09e14S?=
 =?us-ascii?Q?OzqIvTrLP8c22t2lWtuYg9pHkSQmIHTXh/esPy+YJdJ1d0Pmt8bxPXLziwAv?=
 =?us-ascii?Q?bVeQqIn97Zw8c8Qj/dAnKLe+X6rXo8UCVoEnhJyzRmtOn+7P25qIa3FsP+jD?=
 =?us-ascii?Q?iZKFa3eyYnYggUw/GpqjPXFiRTuvZ9xa3xMvLSDXARtwTdbEJeFKlKoc4CvX?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e35f6c-30d2-4cad-cb5d-08dc3d22982b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:43:17.2817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ptj4wX0CdBOd4fD7pybRg96OnfN5tfWIjykrROmxSzu/p3IUXl0R7hEsxCgyFcEf4T6z3y+MxwjCdNUHcbJ+YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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

On Tue, Mar 05, 2024 at 02:12:48PM +0100, Maarten Lankhorst wrote:
> Forcewakes are not required for communication with the GuC via CTB
> as it is a memory based interfaced. Acquring forcewakes takes
> considerable time. With that, do not grab a forcewake when issuing a
> GGTT TLB invalidation via the GuC.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0435e1202c46..325337c38961 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -256,16 +256,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	if (!gt)
>  		return;
>  
> -	/*
> -	 * Invalidation can happen when there's no in-flight work keeping the
> -	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> -	 * and GuC are accessible.
> -	 */
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	err = xe_gt_tlb_invalidation_ggtt(gt);
>  	if (err)
>  		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
>  
>  void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f29ee1ccfa71..a3c4ffba679d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,6 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
> +		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -256,6 +257,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
>  		}
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
