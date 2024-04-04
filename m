Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C03CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 17:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79CB1133A3;
	Thu,  4 Apr 2024 17:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpXPIJI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944A31133A0
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712253102; x=1743789102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/fhODC+TZWF0PTGbVGaOQ5ic4I6A83uRX/6mPIL7rHE=;
 b=mpXPIJI3ELoTvQF4NfqWujuvoQ3hJeH7lCaiAmstNkCx2DPhtvTqQ/5l
 mBA6MPGm/PJpgS7r+vawX7dtqfXU2Sp5xwz1iotcsIR3IrWNGGyewyeSu
 6fyJTMiM00xvJcEx0eE9kTGjek8eP4IaeInqkIza7gqO7Dn/Qa/yNSUxK
 bYqmkz54xSNzlnxwW56s174rjlQdPip85+TIUyPowchue/jEitxp30Lik
 XQUGluUraSJiz9ZZ4umB8+7oEMoy03Z+bGrAGWbtzm7U9SPlAW1hDJ6QO
 jZTwpBrfWKH+/LWmI3jBVSJNYjq64WB32iOZC7cgd1vyVckzMRdFHVk7i Q==;
X-CSE-ConnectionGUID: PaRGcYUASsil5nFL09oGMQ==
X-CSE-MsgGUID: wLXXUbx7TkK9IxfrvLtqiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18118949"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18118949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:51:42 -0700
X-CSE-ConnectionGUID: QPVHomHlRw+FEUES6gcEcw==
X-CSE-MsgGUID: 40vUe8Z+Rm+ggY49jrrWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19323123"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 10:51:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 10:51:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 10:51:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 10:51:41 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 10:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F00L6zZV5sBGS3TYPxerGr5GL8UUPp8AJv91yfUMn3TmMB5K3pMYx9ccHvnOaaBqCSagDS56LdbRkkUgSXacewiKOei16d8CMCjTw541fe4rorMuBtYkHE6CMTM0oFaj7lnvY2ASWSKtEqDrovEZsJZsrZLXT1UXBRoS9RV1LtaTgu+YJaprP3EagVvz4RRetBsN/XRz9yuyagkSTQi9J0BEYV3CzSz4wBBd257GIZVk4GZ084PlDWPoVccgk/K+baO82Jz+TVtcpi8kRV6wk+s7ziyY9XV/B5hJdvsyATEgRdBc40NQiMhZNDaR+wQOInHza1N+tqNXjTAgJdukBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQKcJBNhiJTodKjU9C9aQAwNxViQ8TuAovqugznAhCI=;
 b=gFvFvwYg7euB0Z5eJlg8KFtMDNtjY2G7AST1wGXDa0LB4EukIFlaysKu4MGg2qHUyOWVYnfImdpyzrnPAC8uQQJLSAs9S+YjFcVwS/D7xcZ3g/OphICk1xduwG7VvS0mMPWyoxwenvwRjBuRS0Yn+dMXi4+PDeNbBOTGcVBkyBG3xYaSc5maBS/QeMrkn78kCtttaagOYkQ9c+tnh0kdrWEQZdz79tXrjwhd77R5UZuaXLDZfz8Myrozil8riJkMkeehJCoUHigJNMDXwoc0AaY5ax+tea0OfMMqX/sVANIsfIZqovZE8QgEL6G3rmcl2mQat/IR18goc1T+xFr+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Thu, 4 Apr
 2024 17:51:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 17:51:32 +0000
Date: Thu, 4 Apr 2024 17:52:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>, "Dafna
 Hirschfeld" <dhirschfeld@habana.ai>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <Zg7ozwBmrFAw88nS@DUT025-TGLU.fm.intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
 <20240403150732.102678-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240403150732.102678-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4860:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UErJoxq9tJboC0kNG9ebyFQMKJNGnu921UqKtZHFzu6n793xGuSrgCeHK8IiWBQmhsFt6r62USfxz2MTJ2B1XRY1j/Nx16QBI8d755wbG/t6iV5yDpFPWCiMHx5Ea2o8KE/qjNDz29pdLT0EAz82FM927mMTGBcSy7KWY357pTclMqT/FOU8Hx5Kf72uvLSRgAkrLmVkm/r0JmTgOTTnP/SwReRlWQDqNUX5k+N0lbfg+p0txP4e7+7H4Oj7rbZR3bdEOCQhVzyhoS6e0PAQXMDGlPmE22Zpl1F27CD+o/gQFmbJ3R3ET46plzDIHWOUZkNFGOnoWk6NJl/Xbj2dAQG8cuA9RJLPTtTvvvgF4BNWH0lZBwLdW1BMEkadKaHN4+mk4Me0F5s1PsmG7l4pyGrv+U63qqZ7zAtTCnEhG1k1HX/WxCOYng17J08It/TPTEmymZ/5oAMwvSKAsXfPStVUczSIIDZW01HdlnN/P+1JJnWhUeguG/4HcTqxzAa6loA5jvCsOwGaNM6Dw4NVpHsF/SGIOMz7sbLaziVDRGFWnck8S+rO+WsF73Kq6uA81RyyyrhwxXB00zrk6OBkPgeVEDJMjoVq4gVi+pmW2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dcn9HRY6d6Cx4zb/g2alIwNVKbtEVHNylTQ87tnbiucqBlCtO2P1PNCRkScx?=
 =?us-ascii?Q?S881Ick2fsW+HfgrFc3XEZiVoTQVPpf2Er003Q9veXWGMse7xzD70XS5y89l?=
 =?us-ascii?Q?IgAW0rIr4O4ND9UiJJRstIPXnkkzdVU9ljX2vU56viRDsORNQ+i17hTm5bzo?=
 =?us-ascii?Q?vyEuqrR9KVz8SyjvVsV29zyFo2KJTT5q9Iok6gRlBtFu8eBAXmRmenQd5QyO?=
 =?us-ascii?Q?5BE2KyhbAR6dEZKkfYZG+ukhwBtCq0NiKVJ3Z0j8hzgr08/nzuRfzjlNQ+EW?=
 =?us-ascii?Q?dMLlnpntK9LYCVS7a7KGgwDoThAumHWKiw08MGo7QP9Awjoq0h4dls09yQo9?=
 =?us-ascii?Q?dslZoKE6KedNOYaNHjSB69r594poCCWSlIO9bW4iSqCiEzc1nO8apud8vBzb?=
 =?us-ascii?Q?5l8qdCrgH9QMIK3bDXfi2/INg03PgYkwcZoWCQEp7dhIVe9RTyKzFcgQbb8W?=
 =?us-ascii?Q?IXxJ8gerEIVwdehGamAWgHm60jriwKjWKsuBqH+oqGVlyryMN/PYodRyv937?=
 =?us-ascii?Q?Orb7NBX0htd3iJVmYe+48DdMsVFPKQ5JUt9wHrEwQALYTRIZOD9r42tZWQFK?=
 =?us-ascii?Q?ght56B1xFEx3RgJOTKuPIi9zSod6YDgwkrZuoeuqK1j+oOGoOTErd1uocpEu?=
 =?us-ascii?Q?EYM1nDFZ/lQ62EuRNxHJGWoA7euWc26BpoU4sIlUkr0iXd7RpxNEK/gL6dpJ?=
 =?us-ascii?Q?tv+uYp6ha8LzrrweGvHpmSCBG+U+HbLpIV02azN7uPFM93hWk+xROitV7Xat?=
 =?us-ascii?Q?Lmxyyv59TR4ffULR0jC0M12s7NYfk7w4JHCRfHxytvsTvoyuaQUWSSG9LKA0?=
 =?us-ascii?Q?UZQyQ2dAJQuiMgwZCXZSnOvM8OGmyPVr6aFB71akJF+zxXXx3vnlgiLQa19B?=
 =?us-ascii?Q?hTtGG2GZ8SyBzglkMOM6yo0fHzqeBQEEszqcdSxFO2cvp4P2w2nHXjT5TE8p?=
 =?us-ascii?Q?rDx8s5/+mS9U8LYcwFLRIEu1+7n7H7VPdPhHi9j+h6cDUHEA1NlqSznS2fcx?=
 =?us-ascii?Q?MxlMO8/L0emMj9ZC+DqRQdsdrrAu+JVKS7oUwwCbujnL0QFntVwKVWxv5t8U?=
 =?us-ascii?Q?WPAz9N76SCvio+orDsFS8SFuJXiQJGeYfyAlb+3trHYFTUrc3vq2s2jG+CbG?=
 =?us-ascii?Q?whTrqvstCykAyWLy9uHFWEH9xuAqvuoKg49ZkO4k5cbds/cZkBXn1yao5I+v?=
 =?us-ascii?Q?b/I74nohmtwD+25w2QyU9OAbwxkK0pkgqfdWoe8XyytMWN6DsIgURJYqd0rl?=
 =?us-ascii?Q?qf3ffEtnoP+Pf6MGmRCMhn02cOoo1n12pvOy6JrYpKW+uIV+t7LWUMfnPAKo?=
 =?us-ascii?Q?C2KnYOfz8K70ZVAFFBehBlfKZJO3PIBep5PDljtQKRK9C0x0nO1WG8zolzBv?=
 =?us-ascii?Q?cUrUBsXnBNhg5HJQR/JU5UWaj5K8L8UmKOaca09XCiBCjsYCMphB6B0It4G7?=
 =?us-ascii?Q?RqGfGz5i/F5TOQ5xopj1z3qqJMYoZ5kEJhA2YMkJ3LRhCbDA1efW9t7UD+Eg?=
 =?us-ascii?Q?SeFYOMaGe5qujAAi4J78DxxxpoTlJ/d9CesFQkZtPGyDxUgJhr8gN7jpocex?=
 =?us-ascii?Q?8QH2Dpug/usoKeibcxFuO5bBqQSltukTKJSBPt4u9Jz7b9pFfF+nTdp/6i7b?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 659b68f7-bd68-42b8-e626-08dc54cfdcc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 17:51:32.0040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUZD2G8n79tjVIWVfzFSCAmPAfhRlEb9XZRFif8wHEruSNf9Bq4ZqRZzq8L/4IM/fy9FIZL8PLYOOtKPAEKtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
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

On Wed, Apr 03, 2024 at 11:07:31AM -0400, Rodrigo Vivi wrote:
> In many validation situations when debugging GPU Hangs,
> it is useful to preserve the GT situation from the moment
> that the timeout occurred.
> 
> This patch introduces a module parameter that could be used
> on situations like this.
> 
> If xe.wedged module parameter is set to 2, Xe will be declared
> wedged on every single execution timeout (a.k.a. GPU hang) right
> after devcoredump snapshot capture and without attempting any
> kind of GT reset and blocking entirely any kind of execution.
> 
> v2: Really block gt_reset from guc side. (Lucas)
>     s/wedged/busted (Lucas)
> 
> v3: - s/busted/wedged
>     - Really use global_flags (Dafna)
>     - More robust timeout handling when wedging it.
> 
> Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 32 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h     | 15 +---------
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  9 +++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c | 46 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_module.c     |  5 ++++
>  drivers/gpu/drm/xe/xe_module.h     |  1 +
>  6 files changed, 86 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7015ef9b00a0..8e380a404a26 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -776,3 +776,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  {
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with a module
> + * re-probe (unbind + bind).
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe_modparam.wedged_mode == 0)
> +		return;
> +
> +	if (!atomic_xchg(&xe->wedged, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as wedged.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c532209c5bbd..0fea5c18f76d 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  	return atomic_read(&xe->wedged);
>  }
>  
> -static inline void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> -			dev_name(xe->drm.dev));
> -	}
> -}
> +void xe_device_declare_wedged(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e025f3e10c9b..37f30c333c93 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -18,6 +18,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_platform_types.h"
>  
>  /* Slack of a few additional entries per engine */
> @@ -313,11 +314,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  
>  static void guc_policies_init(struct xe_guc_ads *ads)
>  {
> +	u32 global_flags = 0;
> +
>  	ads_blob_write(ads, policies.dpc_promote_time,
>  		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
> -	ads_blob_write(ads, policies.global_flags, 0);
> +
> +	if (xe_modparam.wedged_mode == 2)
> +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	ads_blob_write(ads, policies.global_flags, global_flags);
>  	ads_blob_write(ads, policies.is_valid, 1);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0a2a54f69f50..0eba01582f7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,6 +35,7 @@
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
> @@ -900,16 +901,44 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	xe_sched_submission_start(sched);
>  }
>  
> +static void guc_submit_signal_pending_jobs(struct xe_gpu_scheduler *sched,
> +					   int err)
> +{
> +	struct xe_sched_job *job;
> +	int i = 0;
> +
> +	/* Mark all outstanding jobs as bad, thus completing them */
> +	spin_lock(&sched->base.job_list_lock);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> +		xe_sched_job_set_error(job, !i++ ? err : -ECANCELED);
> +	spin_unlock(&sched->base.job_list_lock);
> +}
> +
> +static void guc_submit_device_wedged(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	xe_sched_submission_stop(sched);
> +	xe_guc_exec_queue_trigger_cleanup(q);
> +	guc_submit_signal_pending_jobs(sched, -ETIME);

This will not signal the job that timed out as the job that times out is
removed from the pending list. In the normal TDR path the pending job is
added in via xe_sched_add_pending_job call.

Also with the xe_sched_submission_stop() I don't think free_job() will
ever get called on the pending jobs. Is that the intent?

 
> +	xe_guc_submit_reset_prepare(guc);
> +	xe_guc_submit_stop(guc);

This also is going to stop all jobs, on all exec queues, from having
free_job being called.

I guess I am little confused what this function is trying accomplish.
Can you explain? It would help me review this.

> +}
> +
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> -	struct xe_sched_job *tmp_job;
>  	struct xe_exec_queue *q = job->q;
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>  	int err = -ETIME;
> -	int i = 0;
> +
> +	if (xe_device_wedged(xe)) {
> +		guc_submit_device_wedged(q);
> +		return DRM_GPU_SCHED_STAT_ENODEV;
> +	}
>  
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -933,6 +962,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  
>  	trace_xe_sched_job_timedout(job);
>  
> +	if (xe_modparam.wedged_mode == 2) {
> +		xe_device_declare_wedged(xe);
> +		guc_submit_device_wedged(q);
> +		return DRM_GPU_SCHED_STAT_ENODEV;
> +	}
> +
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
>  
> @@ -994,13 +1029,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 */
>  	xe_sched_add_pending_job(sched, job);
>  	xe_sched_submission_start(sched);
> +

Nit: Looks unrelated.

Matt

>  	xe_guc_exec_queue_trigger_cleanup(q);
>  
> -	/* Mark all outstanding jobs as bad, thus completing them */
> -	spin_lock(&sched->base.job_list_lock);
> -	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
> -		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
> -	spin_unlock(&sched->base.job_list_lock);
> +	guc_submit_signal_pending_jobs(sched, err);
>  
>  	/* Start fence signaling */
>  	xe_hw_fence_irq_start(q->fence_irq);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 110b69864656..5e023df0bea9 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
>  	.enable_display = true,
>  	.guc_log_level = 5,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> +	.wedged_mode = 1,
>  	/* the rest are 0 by default */
>  };
>  
> @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +MODULE_PARM_DESC(wedged_mode,
> +		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 88ef0e8b2bfd..bc6f370c9a8e 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,7 @@ struct xe_modparam {
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
>  	char *force_probe;
> +	int wedged_mode;
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.44.0
> 
