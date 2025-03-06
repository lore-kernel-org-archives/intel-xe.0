Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA616C28B24
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 16:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4210E9E6;
	Thu,  6 Mar 2025 16:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeRz10og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A362210E9E6
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741277677; x=1772813677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wz5DT5DJtwS1/Nw+PX6q3FyocvAy+z6bz2XVZIjfOY8=;
 b=CeRz10ogN9W+RAAIOWcju1th4Wn4iINMWJmU0MsCDvtQgXs6wnq0Xyt8
 GtNyDVAncJ3mmDGVA1VB5QBP6dq1COV51PHbXkuzxAmOhncGHkUT764Zi
 9MGmhzP+OUcz8doqDkfYQzlrNeIYBIsxF9K9Ab5g+8sk5UadhAiVMub9x
 AnGN0lmm2TQIDDTFqH+0zbNW8daNkbxaH++fj1yLP4GDEE58jHBnyzOKQ
 WELlt8cKRyOaXVoCPoA+mCi6RVtz6hTyTzHPogkD/q6B8YpVyv/+Mzzoa
 LZvidm9++y6KX2GuwEMs8m8PDsOZ3JbKT9J7oUh30jcvRxMXM7uUP08xP w==;
X-CSE-ConnectionGUID: 0GapUFz2QuGxFpN+WlKaVA==
X-CSE-MsgGUID: flVWldo0RCC6c4CNPWXueA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42324119"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42324119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:13:58 -0800
X-CSE-ConnectionGUID: 85UctxLbQf2vi1NjgWUg8g==
X-CSE-MsgGUID: W2IwdrFdRQ6Yc/UGdKZ72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="123655945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:13:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 08:13:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 08:13:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 08:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F010aEG2wByZJ891KQrqzFL9quDKg9WDgP43K4Fua7U4WuJtLFOObkBN4VcGZbZXbGCyGMIHF3LAdX37DDzZJCj+TgOINEkRdBjkNo8DF6OpOMtm8H1nZ8+O5lrxJqE5f0jrPRM0vFbfLNjYTCkrzsNvT20l61Fxa/GFtctvV+eLGbYzsbBO8go15v2x3+5MqN3+acO0LL4Y5ZLw2kj48roNB7XrXx5fxknX5a2eTOrgnAOG6Z8f5aMZDPUwGmAPuKb1GSHTRdH+barEeALYuIaEVxI3kvYmEwZtbvQRzl82urq32rizamxpw2La5KrCG2l12eJ0xzIRhMR1pvlFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGSCbcMz3gHwc2UYt28JaPX80wb/5Zh7bjJxgCuPhbc=;
 b=Oh+P4aUTH8bwVmO6ptS6buK3BZHkyIyi6JxjWRSp3CRwhVQIjak1rNTD8RVF+tuNwhbV+X2WgCUHaOauE2RHyU9scrQo2xpi4qdOpTl8ads3bQpKRyi7nxIAc6o9YtHSTe08F9Z++aHWNHKvkrhpRr07cRi7UReF69t52vK/KLRvj8jNEmQhvaOxQUzMdA0kQ4x+g2PLd0vRyl8jKHDHNl2vXD+AvfPNMABYHO6zSiyDw30TBsTXENySP8J0Wlfy/8d+QMh2ReYK4xnaRAul+NkqWs29V9OicvmM3vKl0riHiTmn4aPzf234DpnzLEXCmt1pnNBIo01AYnchy990Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 16:13:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:13:53 +0000
Date: Thu, 6 Mar 2025 11:13:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <lucas.demarchi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
Message-ID: <Z8nJvdYSYfIafB37@intel.com>
References: <20250304061727.452100-1-raag.jadav@intel.com>
 <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
 <Z8ljepyswfhWhl05@black.fi.intel.com>
 <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
 <Z8l8haryZ2q2Cq0V@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z8l8haryZ2q2Cq0V@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6a4087-433a-4fd8-b87d-08dd5cc9e3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G2PeX8A0vnxmyQqlARfhYCeulWhk8sYgNH7ogCKgHc1p9O33594uQ5B+REX+?=
 =?us-ascii?Q?NmvnB6VyqYEpA3U20F6i4fKstrGAAO+txF+eKWQ0iCkl+UFhzUPbDsJoix//?=
 =?us-ascii?Q?OEo7zb8rUMkw66sTdXE7DArQL54vlgIPKy3S/VIl42jZLNZIz0LH116K4EBu?=
 =?us-ascii?Q?yGZIpgoqgdZ67x6i/GuKB4gRlBfszuxYaAMJ/eQURIoN3/f1txGeuIH29Ahy?=
 =?us-ascii?Q?QSqa9+iIMqecmwgD9kJnj7XKryra8/hBfoUbu9GWxZLYtxjiK3f7xJIOxZ9/?=
 =?us-ascii?Q?j+TDezmKWI2nf3FKpCL9fzNQ4FQJ4Sr/1SCVX450MsGzHXZSW6WOuXhBkNLD?=
 =?us-ascii?Q?JBo2yYJJRtqarpMN8fkwfpQ1B+zE87jAUyIYB1FDT+kTUIUZaBhVm472m8Xm?=
 =?us-ascii?Q?1Hm/bVreBzJ6k3VA7qnPScW1x9INzx7MwAVWG1I8ZVul6yzWQk2/f8sikHtG?=
 =?us-ascii?Q?60WcE3nvjx4te/0QcqGGv4lTpX0BTZJT/JfUAufYrnwc76BUik3qWu5LbfLN?=
 =?us-ascii?Q?4ab6/qv5jtXDTJ25WDRHEW+G00Qb7Dum2wKqU1njIquaoX6yCXblUeCVbW83?=
 =?us-ascii?Q?B4pwccF5p4x0qRZ4K5lbvwwxuWz3tv2H+OzSgoKaHGJp/qXrwoUAbK2InIYR?=
 =?us-ascii?Q?7/41pUVTY2twEjUdaTBocDih3nVHUX2jPJXXZAM7w4aL6cnrso/u766Tpmpy?=
 =?us-ascii?Q?PGCKuLKJvEOpRIG0liN6LNleH4pmuXLFcTaFYtzQ2cqPHlJdtr+AxUU4JRlf?=
 =?us-ascii?Q?KW1wHfmz9JHKG8LwrN4nuvbz5NNDaZyCuUt/APDZ1c7hBpPgfDKYsLMh7r3A?=
 =?us-ascii?Q?EpbFWILU+ErtxCAdNHlq63iyNbRXP6Z4a1ITtcnnvCZZ51nLqL+jLnWxzmX4?=
 =?us-ascii?Q?jaM2EVpVWjL6qLSMLQCPhcJo8pn1McDfGwpkHd47CNHCMIIoDOXX8rK3YlSn?=
 =?us-ascii?Q?6rwNcSFwWf0FVNzAHCmL77uOwKV2+VAPzpH3WjiTuGCdSniPlneW5137XHez?=
 =?us-ascii?Q?2ey5Vclc+8J524njISKi7FTP0W0nelizmiKEbpYa1MB5mwZ+OPwwbEsUL5GJ?=
 =?us-ascii?Q?MKVUcJ52byaItFP/tpYqE+aT5usR1lek5sDISmPdJbvz+izTHjdV0BbnY0go?=
 =?us-ascii?Q?F5QXnZd1N3AnVOkHf4Z0ASYPJBmibXIMUCSqIjJ5X5qBWxCn5w5wPCvC7YBA?=
 =?us-ascii?Q?Yocoe0VQM4LN3VJHMuoLknSXIU/7LLzawuabsgztjAZNmG1ur70YoNd1eZUy?=
 =?us-ascii?Q?uRhR4hlc9audnLwt+paX260OR0esPVIo8RrmkxjSnYBz22vMxpT7wE39lsWE?=
 =?us-ascii?Q?MI+QV6/Eyisxl5Z4OtExh3F6BqRc8kgLtYWlm1DfxDAkfHj2OBDX9hsLPXDC?=
 =?us-ascii?Q?bLk41H3sIVgnFV+lpfMP9vN1hn+i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyUgW3vwqd8yjYwfUxnXrjHHkLBKznc78HWqsZv228rsKgzsYGrPTm4VcYpD?=
 =?us-ascii?Q?rMdHIYaRPQE56uZdLCOuTviP4Bt6ylnC4HZ2LpzFk76Zx9u0QYUcn+xH+M8k?=
 =?us-ascii?Q?Qr8W8UQkZSlBXg9bb38IW7YggsIXWnAF6634sptbCtgB/+xAzqQ6vdWPEBIk?=
 =?us-ascii?Q?GVLRzvvpC+2NwzQfnFMXMyPLB2sc8bZnVuLoy5ZcjD+3wbMVGWO939PWml5q?=
 =?us-ascii?Q?9OfUUibD2VuDMVL8L1142sFmBJOvAYxA8zWb1AmEYfu7tLES1NK40tX4O5MI?=
 =?us-ascii?Q?0m/kRj2uFfdYME/K6qDGLQypkOwQNkY5GodmX8hDUqzqjChpuKaQ+HYtHXGu?=
 =?us-ascii?Q?LJSSV0MN6+9BSpve+bmZLtu3amz6JTAPWBxUXkGzZ1fpmNK1DZ+2l34ZZrFo?=
 =?us-ascii?Q?jpigLefEfzrjf+mguIJ3rOpsgA9/M3zTRGQTTa3N1S/A1uR7MEtLkJImL6CA?=
 =?us-ascii?Q?fIvEnRWSY7P6yYquhvUZGFxj5x2Ne7EX/YX8MhLrdq0OQ7jrIhuDUgtMY2h3?=
 =?us-ascii?Q?kTxqeA4US01CO7T8PO/WV49URmrMz7hHVnfLaRRijYHuI0TaQtnexCKRhNeZ?=
 =?us-ascii?Q?k6OR6tgflMeRg+4X2MQarT2ec2mNkajjbA734KrDSCBAL3+ItZA2KCxpZYQX?=
 =?us-ascii?Q?Ih+2TKnC1zbFbZqvtF5aGinYTA81MGYuHyRc42dooMr9Px3Gvpfp1zIsKhgU?=
 =?us-ascii?Q?gBbbL9BwGkNgb7YzR6AhNwNQ7qNHtfyKEGMCi3q+hQPI0/puTIC3ui/whK60?=
 =?us-ascii?Q?OnVM3DFKUCMWPIFCtFazPNqbhkNC8xbu66OnGfnrGFtEOZJbXwgsp04fDMSf?=
 =?us-ascii?Q?5VOvDdDIDvqaVskYbwVan5NmxO+s+zD5JWZ+HyKg7qaNFFjyS74bUbpdWd5K?=
 =?us-ascii?Q?FnBZLO524rpX748G7YRhDXC7AfFfM2DW70piDYbjxJfyDeTx/Ej5uCOMZ1TQ?=
 =?us-ascii?Q?+vq7lmNFZD5AfDqbYXCnRAkmhyL6a3REKuKZENDXy2tbtr2iwDA0+mh8NHDQ?=
 =?us-ascii?Q?FHio1i/HZyZZISxnUTjQxbEwxCcIh8EGBrU+FZluwMKQRO3JLUEKxDRyZj0A?=
 =?us-ascii?Q?826efsT8Qje1c1IzNt5SwuRsJu7bu/gfi3vbGhgQyMkDpg3KNTqpPsMGdAjP?=
 =?us-ascii?Q?TvdBK90QG6g39gxOK7WTo/aYjlpJQf7bgUFYmd7xeTfozbNAdPMEpN+V9tFL?=
 =?us-ascii?Q?iUWpAExkry9glKnaAZnkBQkBj/M65LJMdDK58Ny+BS2V8kt4QAjE9mQktCt2?=
 =?us-ascii?Q?UQ/xU5ZN/4a24YNVGSODmHhEFJIyj0UD/K39Y+yMZOKCCGRrDxzT4Sx6CcnG?=
 =?us-ascii?Q?znee01I3gJnqp0HCFbGnS+7QC3GBugg/PEgPvncSbm4iPlsPrgMy17kWe6y/?=
 =?us-ascii?Q?io0zoQxek9TifMzRjZRATN96KzYCFpmVoXNkl+AIIyfyCaZwH/F/hLjNiUHV?=
 =?us-ascii?Q?wzZHcBY67PjqLS9j3ZuORGDG5iOu0Vr+488BxowMjouO3ulPrCf9Uxqf+h5B?=
 =?us-ascii?Q?KWFq4mFQfgM3gpN6VvtL+ggK/YZQaKDHZHu2vQBfLM87LOP+q1wX06AAxT4N?=
 =?us-ascii?Q?uoK0gqsfTl/nrV2l4ujlbOUg9EY11hymuUdjDL38ZyvgQHZ5bq5/56MWtuz7?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6a4087-433a-4fd8-b87d-08dd5cc9e3c5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:13:53.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctB7UWnWsnBoV0IZ3ge3S041o5MqBFl+NW7cUiLnK+16hoS5o3zgEloy3cleiiMOhj0Et6WxZhGy96/y2ub2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
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

On Thu, Mar 06, 2025 at 12:44:21PM +0200, Raag Jadav wrote:
> On Thu, Mar 06, 2025 at 03:17:16PM +0530, Aravind Iddamsetty wrote:
> > On 06-03-2025 14:27, Raag Jadav wrote:
> > > On Thu, Mar 06, 2025 at 10:08:07AM +0530, Aravind Iddamsetty wrote:
> > >> Hi Raag,
> > >>
> > >> On 04-03-2025 11:47, Raag Jadav wrote:
> > >>> Since we're expecting many platform specific mailbox commands that
> > >>> might not be widely supported, stop logging them as errors. With this
> > >>> we can avoid unnecessary platform checks and use the return value of
> > >>> mailbox without enraging CI.
> > >> are you saying there are cases where we send a command that is not supported
> > >> on a particular platform?
> > > Yes. First instance on [1], which will be expanded with more commands.
> > >
> > > [1] https://lore.kernel.org/r/20250210100515.2205584-1-raag.jadav@intel.com/
> > 
> > But why should we expose the interface which is not supported on that HW.
> 
> It allows checking unsupported functionality through return code without
> making CI angry. So it's either this or we can limit each command (current
> and future) with explicit platform checks and keep revisiting them everytime
> we add a new platform or command for the foreseeable future, whichever makes
> more sense.

I believe what other folks tried to raise here is:
If the platform doesn't support it, please do not call it to start with.

> 
> Raag
> 
> > >>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > >>> ---
> > >>>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > >>> index 9333ce776a6e..280f69119ff1 100644
> > >>> --- a/drivers/gpu/drm/xe/xe_pcode.c
> > >>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > >>> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> > >>>  
> > >>>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> > >>>  	if (err) {
> > >>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> > >>> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> > >>>  			err_decode[err].str ?: "Unknown");
> > >>>  		return err_decode[err].errno ?: -EPROTO;
> > >>>  	}
