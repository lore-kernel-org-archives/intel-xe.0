Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C15C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 16:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05CE10E2E3;
	Thu,  9 May 2024 16:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hE4sy+I9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBDB10E2BA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715270471; x=1746806471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z12jRFC+yZ6cIL7vtSlWX4YMW/ici9iVH5HczsoOns0=;
 b=hE4sy+I9XB5EskYlVqzcv8yZArC9OxlQ4zGW5sgrwEjaNvW7sLgjCz65
 QRIqMZgAo+czahn5lP/FdbdMGt2bnlULRmgwHMJ8IVCJbW47XZEYu9kPX
 JUYTZ2k1pxJDygRwsb2xO3EDEF8Zw37cs2iYZHaiLyD+His5biMgBJ/cW
 hyLQx+96C2XsC1CZ1Vji7jr5Xt92Ipus5++jluYe6YB72p0EIQ/0Sql50
 OUNrcTi/c8NVH6Ca0DmCEjUKJfGGP0qsWt8mJUmixBph7DPimczmiKWV6
 xvKYcOEEi8257CzSOQyMbP6hYd9SHMFwmkHiJHJiOMd35XM17TdFtf+9L Q==;
X-CSE-ConnectionGUID: VtjupyU1TzqiLaBnIFgMoA==
X-CSE-MsgGUID: XC6/7AORSNmF3sjwBHOeKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21873914"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="21873914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:01:11 -0700
X-CSE-ConnectionGUID: dBZXSmEETLG1MPc6gFSW8Q==
X-CSE-MsgGUID: uOWo4Ku5Tz2nwP3fTOtXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29160094"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 09:01:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 09:01:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 09:01:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 09:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRnfE/Be8H5YLQkBY+5Q0WapGYWA0cdV9loKAvWts9OxMTlBaMokJPT0mwjS5yP4UIuqWtk6L3wSQgIWMeIS8rD4FIN4gQyT6+F9JvsD13yJaIdjy0OKqFmEmB+uBEGq4ugmIh1oKqYpTbsbHxLr1LXip3E7ve8rfMVLw1CZtih7amLdSNFz4cR80Tk9A2RZ5NpeJlvFodD0iCz2N9g27K7hoI7JlUPSoapY79QC8OX+PsHHFl6ByykFNn6QPoRO5EMZyfOKrRT2QXjhmW/aaL5XEmtXaPrZ/tN/+XyvJtjTtt+pHduqxFlML5GrtlPqKI2TfrospeSfXPtJUHhzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrzAe4DkG1rSxNPZLK3wsd0xvU3Nm0v4eFFUgLXFiKc=;
 b=eSsodFbuPdVCUvkAf6GFjyqpnUQ6H2SS5I2TBWYDwoiM7ND99sS/OvGYovnspbzvw7F3hj0PrSuyqmrpbKS6RwZ9bOl4N8CwcgfGXzqTVpZIlopNU09RbP+2+zsA9obLYVT10ZupA/T5oXC3gNqYL9RiLni+9FUsonzxdo+tcsvcW1tT/j/ozToLxb+iB8l60np6Ynz8ukOz9Pb91j1MxzxbZaKl14mtPrsefgbLhivRxa2PEzIw/c1VGbnotbVL7bKis9Cya2QIMmXLkQTm9Xkqw0KpsN41RzHwXqq2pVNNQ0iRbFrS6hTO5+0NdkobgfkHe+iwN5h1gdz+tnvjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 16:01:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 16:01:05 +0000
Date: Thu, 9 May 2024 16:00:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Message-ID: <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
 <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 41155f7a-62e8-40f6-59d1-08dc70413ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rjcGHyZuUohvQrFqj/FG+3NTgRznBuXGlz1A0G/gdXSAoBAI3LdJJIGB5Ivv?=
 =?us-ascii?Q?P/u4GRVoBtxb+MWpGQnQbJg6us/WKjnD4tkHNZ0fV4teMijMBVj4BaN08Zvl?=
 =?us-ascii?Q?qKWUW1H0gR4RpimZf/uTskIjy+aYIbLZcqFFXGmv7wxEkVMVh6XhDneSNOk1?=
 =?us-ascii?Q?axE1n1/4k0lidUSZywjxCwSG6PTfjdaeqMORC+zp+xx01q6HhiRmWlMGHc2V?=
 =?us-ascii?Q?Rr6CgcaOlKKTDqatan65SGecYAZQZK/sMNlvyB6oav/hlqHcngKgsnXo0a1f?=
 =?us-ascii?Q?Q3w9RABIsRWxEJUXgjQq9Nx5M5yTB9K9oKMsKjeqh91XjxXftaPA9TUfql5V?=
 =?us-ascii?Q?IR33SvKvEZGsHuZkX9yeU015g0vqF9BVTCu/2qdJC0QpV9ajQvARoN2+G2TJ?=
 =?us-ascii?Q?adZSPEyLD8IULvAxL3ZWgDJbHrpTW4VSRIxghlzSz2QaH/dynoJuKwo9lMxK?=
 =?us-ascii?Q?6iXQ37RqvRlJtWAmFYYG7/nDxvyGcMNsZLEp/EgFeNh+2GeEGnQA8kBD6Nyg?=
 =?us-ascii?Q?SSE9Vgh3f9y3JTIY8pqKQceILoFX9ih60cLbpJzC1Cev4PUzho6M9cpjUOSP?=
 =?us-ascii?Q?MEqTnO6sP0TOhkVyI2CuNHugH+635zUBv3H9kQW6BaVGi29dUhvl18xBF1Eb?=
 =?us-ascii?Q?Km9HcUi7efdPoimuYkVYbUmY7xcZdI+XreuII8ym9U/+vENrzGvreZdSeh8d?=
 =?us-ascii?Q?9xk/Uqw8gFR/VMDSAOQXAk1X6dm4eetuvKDhZ0F4I781d4qibG7sxz94T6OU?=
 =?us-ascii?Q?fIWze/2tm45UAh3rNBlFMTJXoFg7XKvKJN8Yjzx8wPyhtgvlMXrOY3Sx4a0F?=
 =?us-ascii?Q?YsmjxWgRAvffPQ9DqzhU2bdKwJ5MIvnli+6qaeonprlmrdoHV0ysbSNYmm9f?=
 =?us-ascii?Q?hzwcDeDX+zr7AuFZXhvvRh3lGsKfVKQQH9dW4zo9/IYRDjdP7LvqKJLr3yUy?=
 =?us-ascii?Q?DGiEGN3nu19NZVGbkyZTMc+wK0U2XKNiIby5taLh8+w3HlYf1ZX2owq53qR6?=
 =?us-ascii?Q?RdNyueUkKH3xP44kgZJB0VbByV/L6vqHXgf3K1sToK6YXMJ2vID6+oz3XN1U?=
 =?us-ascii?Q?cTiJwsmpeP6KAIQRc9rDlkTROM+zeKn6bIo/KMv7iM+Tt+jcDRjE+4gEwDZw?=
 =?us-ascii?Q?BwdBV2xSxFs8g98+6PrbP3DhXd/iaLUd4XgLmkDTLi13s7vZkRwRCKUdwE04?=
 =?us-ascii?Q?F5agtyuw0qj1e+znVn2gzPmPJvhefpj5kKcUhTSQDVtQEdwKrcMPsgojW2NR?=
 =?us-ascii?Q?jmZNrf8svg9pjsQVAi9IHuq7qqMNl/BjkrmTiDoVbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5RGP+++qVHSxZ9Vq5VHRCWGQxkGouNwhpfR3aQ5sVbl+MDCcmjaIAoDJexd4?=
 =?us-ascii?Q?bD4wuDwY7WJYpvAGX1ZbFmWyUd9i2sWzGLNw1/P/t+bNz9ZaEWyWLNxutqP0?=
 =?us-ascii?Q?6DapTyDXwfpncWcM4FayZQ/kFzbQE21tVXLQVkODqSWqpx/uyECwPpkxUtkG?=
 =?us-ascii?Q?I4xUFuP1mjw9B62swao+CXwjZNFVrujPRuEWug83Qbgh+cp4nZsIwtkyUncY?=
 =?us-ascii?Q?g9exJ/B4gqb+SiKoBvrGFIakPVvCehiJ1sWdVCKqdIQZgLhidwsUJL+/PFQ/?=
 =?us-ascii?Q?3WAJjxuWbG1l/r7yqpB9robA1LvQ/lwyJG7xR9cF5AU7yYlsoPDm2oj3vWk/?=
 =?us-ascii?Q?iF9EG6TSUZCykHXHzINYfVZQu8znbgomhq9diOOIhFKi3Jf7zuZ92WNpZVLZ?=
 =?us-ascii?Q?WDMfUJD9R84fi850X5yb0ZRt1T50r+ZIKNXOXQx0Fqk9cl/2rQFIk/OV1PYn?=
 =?us-ascii?Q?J2o0E8+34br48j/ChimD5nCs4DcU0/RnS4N5ehnC9/yeUrw+eTK410u6/r0o?=
 =?us-ascii?Q?LczvyO+bEpz96g8FClqqkCF6cBUTOY8IkCTS6xwTNRr4vjE/4jcWW4K3HEPQ?=
 =?us-ascii?Q?OOfTuWGvKstRyIEt5ZKycb3umqGBrl8HG3PbGQ73WZZaDrw8sF0ZQ/Hvdtjq?=
 =?us-ascii?Q?6y8li0lTOb5iEVaON919xVerwJG/B7bjvaD+8V/5PagKqyVRIuJlnI+qIdJG?=
 =?us-ascii?Q?u4vjZvxmLHfMwED8NxOqHTFEoAzAJJd2YsVlY3wtByJvDN49hB7ECfYcWq50?=
 =?us-ascii?Q?c95Nikf7gZqeKD0Hd4xnnv5268jal+w0Cqex/Qcp5xsUsw+EnR/tyEn+Z+vU?=
 =?us-ascii?Q?47zSoOjLmU7OvV0bNt7g3V4xl9Rp5Pziu00Men1qxj0z26ZoX6lItfjEEMto?=
 =?us-ascii?Q?onBXAVJoifGfSZjGwcT5ReahFJZ+JhvGGgpEGA40pxpBvtImDqe0epW7qLUc?=
 =?us-ascii?Q?aJNXWu9W9GzdxtDyVIraYe/u5w23dpRSAC2kNDq1BSsTXY8Y//6Eq9IIfgJv?=
 =?us-ascii?Q?Zuj2GfTbiXu9tDPRakbBBlnH4u0sC1kFIAtXYXxo2lqEO/e/rgKiAXbwxrHO?=
 =?us-ascii?Q?ne8mTaZsJtyNVFH3Pj3ABR1j2Rijiwf3oQLknevB0wRyfR7MgsHwlLaa1xtO?=
 =?us-ascii?Q?ZUbZLtjHF4/NAgdyh1G6vUgmT6Xwvlu3j9MllvnUWTJj0eaSMXKH2f+pWWQ+?=
 =?us-ascii?Q?j52x0PRRKTAbR8qF2ntvJJSX27rSIQIiRXYFJ/ligiaHugQ+V0h7QpAtsPoL?=
 =?us-ascii?Q?+ZDtP8LG3qjV/5qu2xbwsLtWylcKnHFxSryM/vG2EoE+Gm9xmZmrz1x8XK17?=
 =?us-ascii?Q?p6o6YsyzbHqha3+ggCFqt1sSbEVbSgWmsTYUb7eXMd15ecjESuonSHMBNCBB?=
 =?us-ascii?Q?ztXeFZYVjBSVYguGpfTjErgtbCDad7JfiPIx4KdBSZcW8I8leEftTCjtdmIy?=
 =?us-ascii?Q?nB3nbpHbAY5EDtBQ0HNYdPddcC5q+MmHW6gnEZ5AQ2bFAPtWFPQZUqXRXfJb?=
 =?us-ascii?Q?N6aw3/0LvifqcEcA6QhCsXiPtyYdC4mI8ZWdWY+nbprpeHXWwmAlyGosYEZl?=
 =?us-ascii?Q?ZhdDLqL0Zy3cdmT7nF0/ewHoRAot6VTotEtei8fsnNfxL5igS2h3B496rZ5E?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41155f7a-62e8-40f6-59d1-08dc70413ba5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 16:01:05.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sDo8tQCViEOq6TBIgBTd4uo/M94z8vTsIjhBjIjj3kqEt6RB7LrCJvHTJ0UMoWRtuq6rdSARiWh4UnVpv5kyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:
> On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
> > Remove the min/max configs and change minimum values of preemption and
> > timeslice to 0. The sysman teams must deactivate preemption and
> > timeslice to assess exclusivity mode. They depend on configuring
> > timeslice_duration_us and preempt_timeout_us to 0, ensuring these
> > values are set at their minimum.
> 
> nack for now, based on this explanation. See below.
> 
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> > drivers/gpu/drm/xe/Kconfig.profile | 38 ------------------------------
> > drivers/gpu/drm/xe/xe_hw_engine.h  | 28 ++--------------------
> > 2 files changed, 2 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> > index ba17a25e8db3..9bf7adb45eea 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.profile
> > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > @@ -1,27 +1,3 @@
> > -config DRM_XE_JOB_TIMEOUT_MAX
> > -	int "Default max job timeout (ms)"
> > -	default 10000 # milliseconds
> > -	help
> > -	  Configures the default max job timeout after which job will
> > -	  be forcefully taken away from scheduler.
> > -config DRM_XE_JOB_TIMEOUT_MIN
> > -	int "Default min job timeout (ms)"
> > -	default 1 # milliseconds
> > -	help
> > -	  Configures the default min job timeout after which job will
> > -	  be forcefully taken away from scheduler.
> > -config DRM_XE_TIMESLICE_MAX
> > -	int "Default max timeslice duration (us)"
> > -	default 10000000 # microseconds
> > -	help
> > -	  Configures the default max timeslice duration between multiple
> > -	  contexts by guc scheduling.
> > -config DRM_XE_TIMESLICE_MIN
> > -	int "Default min timeslice duration (us)"
> > -	default 1 # microseconds
> > -	help
> > -	  Configures the default min timeslice duration between multiple
> > -	  contexts by guc scheduling.
> > config DRM_XE_PREEMPT_TIMEOUT
> > 	int "Preempt timeout (us, jiffy granularity)"
> > 	default 640000 # microseconds
> > @@ -30,20 +6,6 @@ config DRM_XE_PREEMPT_TIMEOUT
> > 	  when submitting a new context. If the current context does not hit
> > 	  an arbitration point and yield to HW before the timer expires, the
> > 	  HW will be reset to allow the more important context to execute.
> > -config DRM_XE_PREEMPT_TIMEOUT_MAX
> > -	int "Default max preempt timeout (us)"
> > -	default 10000000 # microseconds
> > -	help
> > -	  Configures the default max preempt timeout after which context
> > -	  will be forcefully taken away and higher priority context will
> > -	  run.
> > -config DRM_XE_PREEMPT_TIMEOUT_MIN
> > -	int "Default min preempt timeout (us)"
> > -	default 1 # microseconds
> > -	help
> > -	  Configures the default min preempt timeout after which context
> > -	  will be forcefully taken away and higher priority context will
> > -	  run.
> > config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > 	bool "Default configuration of limitation on scheduler timeout"
> > 	default y
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index 71968ee2f600..803555c601ec 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -10,41 +10,17 @@
> > 
> > struct drm_printer;
> > 
> > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > -#else
> > #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > -#endif
> > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > -#else
> > #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> 
> previously one could configure a kernel with a different max.
> And now it's hardcoded. How is this better and related to the
> motivation in the commit message?
> 
> is this commit doing 2 different things?
> 
> 1) Removing the _MAX from config since nobody is or should change that
> 2) Modify the min value to 0... That seems weird as basically there is
>    no minimum.

This is true.

> 
> I'd like to hear Matt Brost's opinion on that.

I chatted with Lucas and second his nack. The requirements for this
change are coming from sysman and are unclear. If sysman needs to set
this to 0 (akin to no maximum), why can't sysman build the kernel with a
Kconfig to allow this? This use case appears to be an HPC/AI data center
scenario in which the kernel is probably built with a non-standard
Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs to
be addressed clearly and publicly.

Matt
 
> 
> Lucas De Marchi
> 
> > -#endif
> > -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > -#else
> > -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > -#endif
> > -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > -#else
> > +#define XE_HW_ENGINE_TIMESLICE_MIN 0
> > #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > -#endif
> > #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > #else
> > #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> > #endif
> > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > -#else
> > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > -#endif
> > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > -#else
> > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> > #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > -#endif
> > 
> > int xe_hw_engines_init_early(struct xe_gt *gt);
> > int xe_hw_engines_init(struct xe_gt *gt);
> > -- 
> > 2.25.1
> > 
