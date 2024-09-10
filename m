Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC3EEDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDBB10E8D9;
	Tue, 10 Sep 2024 18:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOwMbRgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165710E8D9
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725992110; x=1757528110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CXHrZLZ2E7x0rndenk2oZywcgpVtR9GVYF19NpzzuYo=;
 b=TOwMbRgfcrdXN6jLU63sHR2wPisku7w8VPu97vbjO1JmbbuqJLvkEMx/
 F/htPOhWb26+U94phahgxMRUF/wQFZgn8WzvASB1yl4fbNqb1DjhHRrSV
 bqsCuiuGKqx/cmI0SxumTFYu0wLiBV4BQ+hDt0qCYh1Nz5z+dJZSbC07+
 Is8G4L26Cvp6lKGJpxXMtQaqZcNEDpeuTeOQzEyff3mlKEggWwC1C/9Wc
 zO/GZawbdlv1m0JzB69AdyWZlXk++0UOMrPmP2vdhxVQQLnfJmChhpm1T
 /adNJbjIeD1HiBXUWZI7puKDAab5TRM/TWurRUeinigTJhPuv/a5buRWe w==;
X-CSE-ConnectionGUID: YH54AyKtTdCvS3BgFdEvgg==
X-CSE-MsgGUID: eYtW4/RyQVqWX6rD0YS9LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42237619"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42237619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:15:09 -0700
X-CSE-ConnectionGUID: X52OgBStSNyHygXmm85oaA==
X-CSE-MsgGUID: tWAdaFdvTm6aTJjtqaYSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90388718"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:15:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:15:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:15:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:15:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olQlOrVfyN8m0qSicCOgXOtx7avt1sO8cUrQ608t7k4udFVpEclzSi+Oc3qWKqJoWJc5d42DEn55YcC00QJPLXp3gInC4D2zADWLvk+Q+fky8NdLxhPGzbxYqC/bocWc4UV6jH3MESfqPWA8Amy8NMxCEEAKcZ3Nq6Ao5pjm4PQny6YCbmrNA8X3dSxNsuqMgcqaqlX9NgDojo35X0EV4c3cUUyq4SlSLNM2B0jOsxMUU0WvlE/VOlya2m+qcI6Lfg332eITnyOmrigt/O8N9IUEjTt0EsT0LMdmLimf7CuObI2aXHeQ+IdOqDDF6Gpz7DJzJyJ6sqfWVH90vjvy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXO2YS2fC4ChjYgQXCWpHS74JqKxY1jGOVqF6GFH8pA=;
 b=rFf937Ru432isKGOVnw61KfR7h2mKRxtON9oN3bPtMDtBt4cmXamCWoJQ6obcq08RSrGEtXUTxHuDOlkpWXrZhsJuADFPzXBPGvCh/7tjS5/lC9fFXz6LHbww9tsNk6QdPIc/Fl1acLgVWcXthpcQ2K2fEIUbQygP0Ktm+uAId3Wka0cYqag9405iKVU/WVmkfrnyAWf3DKSMtXtS+vZ4bKMfHA62nBZZM3slCnTGMf++7wliWhL1s+ZsP8p02ieC7CuPsiUgeh0XxgBFJiQkfn+MKBXPqALpOinwgzMfdksa5RNoUoYpqZmin+Sgtu2tWP6bj9cwO6JzoYzyUgPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:15:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:15:04 +0000
Date: Tue, 10 Sep 2024 14:15:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 14/43] drm/xe/compat-i915: Convert register access to
 use xe_mmio
Message-ID: <ZuCMpVBPijMx2WrE@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-59-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-59-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d439135-b4f1-47de-79ff-08dcd1c47e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MQC28ELtnTBJeuA8JfbPDFLs2GVYCeDNNfX8v4KZ7IfnxF1ckacX2X2ldlfJ?=
 =?us-ascii?Q?dczKrlgVY3EtnfTA6kHODUo2F0nqe4GLePjM1tlaoo42LMSycvNKcbizHN61?=
 =?us-ascii?Q?a40UDLy6AY9WilyX7gbAcKGXZLiibqzr0WZnzwjYef4OgFd148bJGaSJhUDf?=
 =?us-ascii?Q?OicIzgOmcIXwgaLuzVSvBpT2Elgk7r9nglFqttV0yr46p3X73T+fE6j2GoU2?=
 =?us-ascii?Q?Bs3htZRZ/O47DRDW3WhmqqBNNeDoTyGvEaiSxlY+pJydLA49nqfVJds194wY?=
 =?us-ascii?Q?/tVZiV+FwAqGPqYrktut5/Fw0o4jr9OaeqMm9vRlq+xaVw0O/+I2t6PHoG7M?=
 =?us-ascii?Q?fo1rSFaRgnCx3lCtbrDb+NKs+67RWZrtq8uF09f33KCxNvS6fpVwRVM2Nrqd?=
 =?us-ascii?Q?2jCquEAlS+UaSQrQ7RCjb27hHiW37Yi/ow2TEMPGGfK2/tl8qZuPF19lA71m?=
 =?us-ascii?Q?MDejDVBsra76icleEbd8QIJ5rsF2GVAtJfgd2XwdFOYsnR2aoMLCcjbM9IYs?=
 =?us-ascii?Q?ErgJN5W3ydyukNKLyVhiELqcXTd2drclZJWcEdLTVruKD/OQ7UCmqM2XxGTR?=
 =?us-ascii?Q?1f4NLYwOjjO6jKweeheHCLUTwIsADKAAYFx+Xb5tMac5l87nK32duPVKjWXf?=
 =?us-ascii?Q?Ytcb2fZHbrNCeBgtIhjy6Mh2NXSKa9ApWpbiDZI0LYr1Oa8KNMMhut+3EWW7?=
 =?us-ascii?Q?pSUnTCTCjlPdLlaYA0H9lvSlBb7Fzd2LcEcaprKDOiCqFmoWzgZdb2uFklh9?=
 =?us-ascii?Q?+kXl8O9yQeg+3vEZOd2jedLvzn4djCSN8EO7a+/6Ek8I1pijYOu3ExvPaWEi?=
 =?us-ascii?Q?uZ4r2JFB5yw+3pJ7YA07qmM/N3uxfk932RAtVB91zgakTQ2PQbar4Me8I+6o?=
 =?us-ascii?Q?9dA0fug5NoW/gO1dnmSXiWgXk47Q1oqsXODtSTZcC+oTEvw22NexgPc7WAYC?=
 =?us-ascii?Q?5TA18ciM5KiQZTH/cQnh2pdAdjsSi64gEpxjLQ7Io5U8ZywayS63OEsq9m6b?=
 =?us-ascii?Q?V+1mPYF9DIYaF52KpMCpzD3YG8xvehK1pPwmtNlB7kmzc/tb62/Xc6p8+EGK?=
 =?us-ascii?Q?QLYysH03KMm/V2KeaCSZDYow9J00Gt3tAj7TChc7TijQ6+SY4F3HyXIwdvDy?=
 =?us-ascii?Q?TdT5QupaQ6ix8tOWkVw4hfNW+m4ysYbPF1Sf8/ttcxOv1gruBwTAacBgVcug?=
 =?us-ascii?Q?supzcLLh8kRpnPDijkQoTtHu84/qq4WQt+9LixqAVvxDuwdQLsLEXUpp8A2l?=
 =?us-ascii?Q?c+7uLKjxyYhIsJFb99KJIGy/zB6D687Jqd+kPgj5eaoK6PcRUc+Q0tTmy30+?=
 =?us-ascii?Q?5kr0rBe4l6s3h5i2Hj30nPUWAEWmnsaJpVg3W/EMlIMnqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?khFgCe+ZpWdn8eMQG+/NOLaA4lWUMMNsH55oDrXAbJ6Nm0lKJkQx6vIfyPdG?=
 =?us-ascii?Q?KO5Y6n5uPMQ3Zds9JjXbSP7Va+8EVIyq75wQZ9N0jzhw3hHPOqiLA0yMpHY9?=
 =?us-ascii?Q?9f7+cvhWzJf5vfqCxUG/k0oqaxsPQPILZTNn6LjxjQX2gs9y1g9OjT+b8Cxc?=
 =?us-ascii?Q?slKX3rxzplyKqMRRvKEUJcJrcLESFF5bhtQOCmmrgSFIcOSw9882awkvhggg?=
 =?us-ascii?Q?ukRDCGd57i13T8jeJcbQPYIGTYOOM0wyJaoBlPBEHYQ/mq80UlSiQR4gwug6?=
 =?us-ascii?Q?VVx4kHyaxbsupc6IE/4wPfB9BIAafYTzvfZiqQMeIehsPdCwaU34SGI79Z7x?=
 =?us-ascii?Q?5ZYYIOeL437KHNOSDt2hdefiInHW07GPY3QtvpSzjNTrJr47us0LvEZcc43e?=
 =?us-ascii?Q?aBKNiF67gsIFqjXIQ3+rwdgKNgHqTEo+AudtQeV5Q5Y464xvrlnQ4/b6TYgV?=
 =?us-ascii?Q?3xvjuqDwkB1QqiMOg/ivg49o1J0WtLgmYqrFOakWIZBBExB7etMtzDlHY3Wr?=
 =?us-ascii?Q?NFl5J8Dedsw3JHFoWfmtG7xTRMJ+SwqkAECrPuAv0u3UYm+sLvPM1XSDIZ8/?=
 =?us-ascii?Q?4jAj9j6CignttmQTnap5ZSZyn/depPvZj4imYG2gct4ZOYgGrlVYzCiS6uQr?=
 =?us-ascii?Q?ffHD8b70MkrGogutxGdwf9iAjrANcHEVRUBUJgaVUFesH9orxUWuzV9lftv4?=
 =?us-ascii?Q?aOIXYyt6m0pCp/P1HuztqA8o2P0E0CAHo8rsnjx7iC035w1Qfv05854vL0x/?=
 =?us-ascii?Q?VLgA8gfaLSolX5/f7iy4dpuPX2C2zxWMzMSgNjmw1WqzE/wq28NrVe6yF6ma?=
 =?us-ascii?Q?74pPXQwg7wbtMBe5+V9cvc9c2WGl+CMaBsQjSQitcSnpvR8NTvl+3+T1++Kj?=
 =?us-ascii?Q?9ZxWUO6Xq4/7XW3wH4UfYGRHGrHNe6I7GeKZNTWqkbWcG5KqtTAkyKBsaFoz?=
 =?us-ascii?Q?Gk0nycKdEIF+1WjUErRyV9qgxhJmjjBtd35h5Sbh5SWvtsQopwkln/lA+VlQ?=
 =?us-ascii?Q?p8EIF2fvJ8G8L+1znTC6O1ADGi4dxerqr5En+IaC5jyUauMi1ncWIFRLQv08?=
 =?us-ascii?Q?/wX5hsdyM55wt0smWc3uk8lLR4QZufbFSjfydNT5aDERw/IKUOh5e7GJXKis?=
 =?us-ascii?Q?7qc91bd4+FzO7HVGVHW0T0n06DOnREhJQuAXp6UtowAfQH9tsbhJXqPZ1FRQ?=
 =?us-ascii?Q?7WyLgoVgYz2gTnqVP2jwtyrsAs0316YNqO5QKAqXrY3koSKVS4bw6rMmc1A0?=
 =?us-ascii?Q?FcW+Gm5T9MRRssE+dEkfcQmVw8D05fMGTUjtvhBCPLKJrWFiEuyKmC+kbmqL?=
 =?us-ascii?Q?qRPxFEkokc7sm+P3/lskCcPMM5R9qoB8hKlssNK/yZIK+JOq+9BeUi3jG387?=
 =?us-ascii?Q?rAecBc31zaw17uK4dszcUPQ9OOMf+IpyzkZPhnGVoKEijbnorv7X9S7xn+yf?=
 =?us-ascii?Q?vNmT3aiJE1iJECJovGSINda6WxDh98U9fgMvywoWsI8v6FTGvUevQzxOdHxT?=
 =?us-ascii?Q?Yfe+2wVfFTVPA2ZzxKvjX7ddsVJQZrRydiXHbPnkRxMc52UiEVxgmSlz2avH?=
 =?us-ascii?Q?YJRWgc+6R6x0fDGgS85C1RPq8X+yvbJGGXr4EHMQ1U77zhvzerhRYa6aSpMV?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d439135-b4f1-47de-79ff-08dcd1c47e4b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:15:04.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmSHJP4oY0MQHqMaMHWUKuhSNzlo9J+nLeTODG0minREKTXv6tTiZTcLx4ZPRS5V4Xf3pY518whBcy+e3Gt0Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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

On Fri, Sep 06, 2024 at 05:08:03PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Since display (via compat-i915) was the only part of the driver doing
> 8-bit and 16-bit register reads, this also allows us to drop the
> _Generic wrapper macro on these two functions.

I was wondering if this should be a separate patch, but probably not...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
>  drivers/gpu/drm/xe/xe_mmio.c                  |  4 +--
>  drivers/gpu/drm/xe/xe_mmio.h                  |  7 ++--
>  3 files changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index eb5b5f0e4bd9..ee3469d4ae73 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -10,11 +10,11 @@
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
>  
> -static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
> +static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
>  {
>  	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>  
> -	return xe_root_mmio_gt(xe);
> +	return xe_root_tile_mmio(xe);
>  }
>  
>  static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
> @@ -29,7 +29,7 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
> @@ -37,7 +37,7 @@ static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
> @@ -45,7 +45,7 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline u64
> @@ -57,11 +57,11 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
>  	u32 upper, lower, old_upper;
>  	int loop = 0;
>  
> -	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> +	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>  	do {
>  		old_upper = upper;
> -		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
> -		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> +		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
> +		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>  	} while (upper != old_upper && loop++ < 2);
>  
>  	return (u64)upper << 32 | lower;
> @@ -72,7 +72,7 @@ static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write(struct intel_uncore *uncore,
> @@ -80,7 +80,7 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
> @@ -88,7 +88,7 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
> +	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
>  }
>  
>  static inline int intel_wait_for_register(struct intel_uncore *uncore,
> @@ -97,7 +97,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -107,7 +107,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -118,7 +118,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>  			      out_value, false);
>  }
> @@ -128,7 +128,7 @@ static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
> @@ -136,7 +136,7 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
> @@ -144,7 +144,7 @@ static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>  }
>  
>  static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
> @@ -152,7 +152,7 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
>  static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 9ea0973337ed..29f4e3759106 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -200,7 +200,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
> @@ -214,7 +214,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  	return val;
>  }
>  
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u16 val;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ac6846447c52..99e3b58c9bb2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -27,11 +27,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe);
>  		 const struct xe_mmio *: (ptr), \
>  		 struct xe_mmio *: (ptr))
>  
> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> -
> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> -#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>  
>  void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
>  #define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
> -- 
> 2.45.2
> 
