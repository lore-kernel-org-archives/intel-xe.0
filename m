Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6CFD7879C
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4510F03A;
	Fri, 19 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGg5WgR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBD110F03A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766161966; x=1797697966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WRsoRG1XdIC6N7sqJUOntYxp8qHhhI/A6I66EugvmkY=;
 b=JGg5WgR1JI+rGtlk0qWzcgLlGDmuCzm5KR6oaKB+wUW9ieE8x66JlyMV
 rAZ+D2PXSdQEXWbeyQxWQ+e3ZluEmzipyJhGaNJ+TUOmKJba8hueEOQE7
 UMkSJXVtw24xGc3AxKBVyn6x1hB01OjPOBcdVh56cNknwxiGQMhbiwYEg
 VRCS+fEhQBkcYrQPdDwlixQdD4tk2hAV+xVCzNE70JRHsz/84gwwpIley
 hPUu+PlBA0Uskm2xDG2iSPflkuyXCcgBrTnikUCaQe4iYy/jOQX+QzEK/
 DCjEJwSG6buIXfmzpmN38z4vQyTkC5aJtKEPwNXUx2ALR6fVM8OV7mK6J A==;
X-CSE-ConnectionGUID: dOWKBni7RMW3UWcmc8ebXg==
X-CSE-MsgGUID: cUVtq9TZTzW6d9xFbI1FHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79493044"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79493044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:32:46 -0800
X-CSE-ConnectionGUID: FFqkZUNwQIG834KIdX6eEw==
X-CSE-MsgGUID: MIeyi/4LTISTLj96WRRMFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198658269"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:32:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:32:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:32:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:32:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL+JqZDDllg84dYwY0EAou/fSpkUgEddWXrWS3BOz48MC3795F0qOVAgl9Ad0I2qzKTQZQPvV6oO+6SNRpz5ARxD6k82EULfSCsbvP14tYaWsUHNYbiI1bAjTOZfFrZOR4bYuZPsjQrU/NFBxRxV8OwCh5RSZKmrgAKsXEekxfuCF+4LH05fLYHgeQklE3DQfF1BxWq9irOCKgtMuyFOWgkFXwAXxhH0H3swqP+CaTtTCw5tkUUe5y/E2taLCHo6ABiZFLHYXSz5Kf0meTiaTnX/TQHxE8C2FDvOl8J1+PC1I2Y9Y2j/iYk/bjlGU2AJ6gNtlxFTEpLbfIi1IHxmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4diUS8Xw/EY4Rhjw1ZAqZklJr0iQWd5X3404eD5NVB0=;
 b=D++of/d0RDI51Pg+0te4Hejldt0OpAscqO/gFRWhllcaemRAIMCefAHB8qVmrvRC5YL7heosb1GHcy2XFpjuKtYL1ZK4mFSBURizJMcubIPwci+AzAo/moOM+UDKmUlzA6lIy8SLZjdfpLHTuGAMFHkY/e296/PdwvRWyMymRXddMBOyZg14SgwEGv3hGcgKqlNqsbCh/UskUXt7Hs5B0U520WnpFyDi6DG31UVP6YVBEjht4gcpCoOwhsER3xVmJiM188ZEqnhwz8AK4TEFUaebeIuYiQfhEoqXYTs8e3nYrdewGHCjb4lI3L5wbfUVELM2DLpQzs3XolovTKX7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 16:32:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:32:40 +0000
Date: Fri, 19 Dec 2025 08:32:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
Message-ID: <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUV3dk3wUpf7U6tP@intel.com>
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7686b8-aa79-4a8f-857c-08de3f1c3a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6BoJfBtRWQFW8yAV9KKNhXKrcxsCrqkYkiMh2DYLrg0nO+Vs9M6rTmRRRkHs?=
 =?us-ascii?Q?lVGQ3zNDLWQSKC5vBNl+rcEnogTl4rdF9nZtifzUMgGFHmgBbooT2wvUKuMN?=
 =?us-ascii?Q?mKacXgK0jkhhuKzqV+3w3tbs33LzGl87vPuy2rQHMn8krmDpnBYIKVJwvXb9?=
 =?us-ascii?Q?wckaperXAQmoBKDFV9GmWI3OL1l+C4KhuaxEyNQlPbgHlJfy7BpkpBCUGSDI?=
 =?us-ascii?Q?MfwELI3Z1w1xtTtbFFVPAYH1fqLBKuvDPVnlf7gSoToNILGvcC8pTGCcNYrr?=
 =?us-ascii?Q?cqzKOQVsVXFYpKlQ13K2PuAXTicyq3mmXREssDA3IQbg7IX+zfOXV199/hMf?=
 =?us-ascii?Q?wH/swedjQx7qH4gkWDWysRfzgtg3Z3NU367AfAVDPlTmHwx8ZabxvxAz7/4x?=
 =?us-ascii?Q?jeR3fofTuHij4SzGebxQhvtFEJCbKvoVLDSwSjBn99PwEXIRJPC3jhDcPxEo?=
 =?us-ascii?Q?C91hLmgsgJzzda8ADnrFAhoNQHcQLnekQihwKWcFGyVvFKl150tXaaVawhCM?=
 =?us-ascii?Q?bw3cby9gsiympS3oB4OSo92UIn7Pjv7n0Ri81IvgvsZr7m8BDfxDSSEiN/Zw?=
 =?us-ascii?Q?QVniZiWGPZZ3HWNNRAmxNDVMer8rc6LU842wKm3oxp5lFl886voDFmNI1cjA?=
 =?us-ascii?Q?ROAVsynl/dOyZPrjFhHpQ0Eq1mXj/3r8UhSQu4m+NRqZFjhiw8AgT7CVl8W1?=
 =?us-ascii?Q?xf7zwWAT/e8Pzoa8ptMl2qbfPl6tsLCpIrYgM6cB3YFj/gi3V23lqvk7C7VI?=
 =?us-ascii?Q?mjna5QvpAnOtgblXG+cXhA8lqR8dLIhbsyGsYGk3dbiaprVH8eSD9Kui+YA0?=
 =?us-ascii?Q?Cp4/BLXZldR/bfZOBwbDawlK7BbBt5AWCecJwV5ZtmFckxj9E8zE/T1m63Xu?=
 =?us-ascii?Q?xfHKWZ6MModENHfcfj7gte8v5kVl1o1KInDnFGAzFsR6AqF6CXxOCiJXqIpt?=
 =?us-ascii?Q?dgM8+hq4qfK3bO8GaKRKC72LotZ3wdtcrI6WB/SFieYynl0fjZOoAYseDBd6?=
 =?us-ascii?Q?XpoU4OeR0kHNgK8zkXiwe0diZsOE9QTsPPwhYg3eemcOMIFqw9ocQq2VL/uE?=
 =?us-ascii?Q?gUQbR66/pEqI5wvZPmH0VJAAhL27jmZxa12mLzkHclcrO0Ctyy7X3VbRXD+/?=
 =?us-ascii?Q?Jf7oFoxMR7RFjx930Gb9BzKc21pKIE0eObHdWo+haScMsuzXQUHUXXuLaj7P?=
 =?us-ascii?Q?zeclUvS/LuXzAJ6N5hf4fhovqpDUh5418WwGBgYLpAGwns60mAL5RJhD5uCI?=
 =?us-ascii?Q?g3udFlhRbLA1XE96rjrm+x5NXw+0nbw3suhcJRnC7Txx7dTo0ySlGv1N64KV?=
 =?us-ascii?Q?pINe/xwQv+lKcrC+qFNXj69jcHsz13lQL1myFP7ZKPfb49bXZ8P1055GWDZ+?=
 =?us-ascii?Q?/VhOSilUfJ1sJCOeNZopxpYs0hKicC4ll4BDfbB/CjbvbCtopa5RpBO/6zo7?=
 =?us-ascii?Q?otPatcfqwbdo+uc8o0YmRbO9hYZOnyc7VZIArRZCTtjJQwN1y3bPXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xpQUtQrR7P/JCH2DouKqrbLa566zroRbhfRWNZRAuEzghvNnMjG/QNb8v3P9?=
 =?us-ascii?Q?y2QLeYfJ9qZ94I+hA/RZ7WyCwPyiFfIkHPjy93P8AShAOrOQrlamDkhZ/E5h?=
 =?us-ascii?Q?clpD8hb94nMzTvYR8NKyRiS+vtKKA+748LKsnpAFpY+6MXB2k46Z6yeB6pT3?=
 =?us-ascii?Q?Z4cKaqJTARfUPLeZ9ewFAUvKpxFs81OwkVylEbO5Q9+5eRlEX8cVICFmI7t4?=
 =?us-ascii?Q?yC+FGHyLAhUElGs7UzKPQ6Oht+fTUp8GembQO/OIqBhPqNVuTwafhX3TkNuE?=
 =?us-ascii?Q?LILRD0PLzNpA/kwCLCrXgE+alFzgv8X7J5KwNH3WEqOXLss+hvaC3QiKwUxe?=
 =?us-ascii?Q?8O7JHd6lRLKznmD+Ga2fplw4Arkl4DbZcTwwat8ejKy8Am1NRUQe6YI2Zoqf?=
 =?us-ascii?Q?OovsB/1mpuDYcgQIMAxddOQ+zaimwnFV24Z07X38hwRaAhg37kuLatUJNFpg?=
 =?us-ascii?Q?NDFcincZOhVbVSQRK/+UnV6ljx7TGCjDx7p3ruh4FLs4CX/MwnGTVtwPL9Ni?=
 =?us-ascii?Q?Xs9NGmvGiTb23yGwDuaiZUi8/ln63UO/IiIDjasyJl6+Ep6ag576oUcYxNXQ?=
 =?us-ascii?Q?cvEn38+jsoXhAu0tDHL1moK+2dHhN14cTqfrJNeuSEFLIzrkEQ6jZLUdxQX4?=
 =?us-ascii?Q?aTPaXSD2ab6XgDHCc0LEWMporuPc3siSU1KcWu0wR9dSfPOuOCoAccWenbIu?=
 =?us-ascii?Q?ewRxXjRJ4Gxay+UFDm/Qi9VudZcAb4J6nUdJemm1/9AAXG9lIzupsBwOISXF?=
 =?us-ascii?Q?QWx1rfhrMzEsENEvrUlIg0f3vWFtxedin2Wi013T7m/6LohldEBKCxudDpnX?=
 =?us-ascii?Q?dgh94S4xqaYrGy70TuPXxucFPI0rTthMZbA4tKGCSFu33LJGVZOJgDfiWQ2P?=
 =?us-ascii?Q?4Sw/VitbrlSSVkMmL0wdopI3djTaLSsjqgN0VVyZNGehWhghzt360mhMDVcY?=
 =?us-ascii?Q?6Xh8Cx2EdNs8TMJUUjOj1FIVfen9XtCWNxhbcgEvffQa9Kz9QgWQYe0QnBQl?=
 =?us-ascii?Q?7WayPJcPCXel3sj5S/Didttsel8fUUfSnrF2/pcdnGNGAZbue1geWtsD3/ne?=
 =?us-ascii?Q?PJ0rXsK4mKLvjcICoWIxvt1eK7gPZPPJIlrQTxH8WaDSfJdfedhUjQlAwFxm?=
 =?us-ascii?Q?S+M5MfIWVZnnwg1cmlWJBS/JzbxiHb4Up3gWqrqcvzQRIw2wwdlPg9XKx+v2?=
 =?us-ascii?Q?/SYqOQ2l5Lz6kOKh2mwsxLmmEv/sgoifAr+oTgbEP1RizpyQYK7qdu1bAQ++?=
 =?us-ascii?Q?JeQnjs8o/ETB7/XyccxxKaK0RGx2jg5TWaU4cys1kbqjl1msncLhlLRBA5RK?=
 =?us-ascii?Q?P86Vs9HvcMUVDlE3OYWohv+5e1L3JGDUSlKrq2oygHJ9cmCT+dQJBspFm9rL?=
 =?us-ascii?Q?5a9YOsOAz1M43bR3ORWgky3VMgKZ1fR8gGGIhyu9rcyrnJVGz0nSnvuiRVq6?=
 =?us-ascii?Q?nBkjP+DKZs42UAXMlvDmXR2DQTZOmifi5KiqYx+n7HTVGoMcMdPGIKYTr0sQ?=
 =?us-ascii?Q?F8bKGy/wgLtc836OS3qZs2g4pTlFrkxOgq+NpV4gl2jPUK/FqwbrJ2emRTTb?=
 =?us-ascii?Q?GZTmaufO07q5pzR3ImFpo/vcmBfovhd1ScjyWFUiNAFuvEwoMKXLM0NBGEip?=
 =?us-ascii?Q?9fFb59jDmzWMT2heSBRqH8wnSqpVk/pZ2NBLmNJif+ghyKm9WHRHU2NKeCAl?=
 =?us-ascii?Q?QcEihhxdDlTJOntk6mtJqV/vuQa3T0ZuhMszCyIrTUH8gzPPUwO+uwhyCTSa?=
 =?us-ascii?Q?1bj1xJe6DogdSiJ/gl4YS4cVFM/c2/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7686b8-aa79-4a8f-857c-08de3f1c3a56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:32:40.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIBjCY5UUg6njzjtVkUA01vI2htgv03NvcSnM/WB7sATa9ChfBskZHB9kmuWC64MNzyGaZWNPkIpugFGywGaaXavsv17fUUOYutHgTaV9Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

On Fri, Dec 19, 2025 at 11:04:06AM -0500, Rodrigo Vivi wrote:
> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
> > Xe driver uses configfs functions to expose configuration to userspace.
> > If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
> > undefined reference errors occur.
> 
> Perhaps we don't need  this middle phrase. Only the first and the last.
> But anyway, we need the patch in. I just pushed it.
> 
> Thanks,
> Rodrigo.
> 
> > Add select CONFIGFS_FS to ensure configfs is built at minimum required
> > level.

If we make this change, shouldn't we also remove all of the #ifdef logic
we have to support running without configfs?


Matt

> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
> > Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
> > Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> > Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 4b288eb3f5b0..1094c5fc5bdf 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -46,6 +46,7 @@ config DRM_XE
> >  	select WANT_DEV_COREDUMP
> >  	select AUXILIARY_BUS
> >  	select REGMAP if I2C
> > +	select CONFIGFS_FS
> >  	help
> >  	  Driver for Intel Xe2 series GPUs and later. Experimental support
> >  	  for Xe series is also available.
> > -- 
> > 2.47.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
