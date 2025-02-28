Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C80C282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7CD10E33E;
	Fri, 28 Feb 2025 19:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/UVbpv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619510E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740770848; x=1772306848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y7I3UwwPNeNigEQOZ/uMzugdtBhum9uYgTYWjyS+Q2Q=;
 b=i/UVbpv0USdoCZ200weRKD/UB7ZzcQz+oUKxBsGq/Y6NcW0fSk0YSj6B
 MViU3SB7sJkykWTDK9iF2ZeIuN6ONnt896YsvWNLDTLQXOQbbPxynO8tB
 KADNy5O+DS2Qq3d6AmjQt91uusis6JhsJaq8icRfom3iDNh7CFIMWjvYX
 hbIS104tYwclDkn0hHKXiNUIC0qhjnA5J4qdMscywQzoXc+eS1IPNKFbj
 /U6YSf2Uilw2GKzh86n2/9vAoJgfb6ioK3I2mJYY8JQ8FIm0JMDugucxg
 1wH3JDGIfXVJYrTbXtUNJATZV+JLWJAUNsX4a8j8f/AwAGROXwawX2qKx A==;
X-CSE-ConnectionGUID: gaRraYyrTxeIPYvZ3jS3Tg==
X-CSE-MsgGUID: 7uFXMfB1QEidF3VnEYH1RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64172235"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="64172235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:27:27 -0800
X-CSE-ConnectionGUID: SRRL8JwIQU6ONcFOmulaZA==
X-CSE-MsgGUID: Mz13ZMWCTLyp2Dl15QsgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="117917847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:27:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 11:27:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 11:27:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXlDhN6VEtx04zaa6/m3acVZ8cPZUAQTGIpSFf+XncQJmprp3/VSeIeifYtfdjWeIPCg4ueoW2l8jE06/FiM5zFtrFO16cZyFSSMLF75DlhW61/VS7bDYuDv9Qt0t1lN1y+E7GkaKQ0wUXqBLx6Xp/m6Gf2JzUC8gkLGbF24qziAx1atqT/QoUHAWOlmLak6n5l0rl4djoFG5lZyXpPoq2/CFfLjGwfeRanJ34YtajtArCsTF1r/IHBGoZbOtfO77eInaZlc+TM+pOO+/GGULnJEU7XbejXHASIJdNxQNQGSU5oWVZ09/i7I3IRiA9y6BydRHPHooIXpfLWJCNiahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h9NzHzihda7o2wq9dCzl4TrMmh/KAonsEJEPyD7T6E=;
 b=I5AST+YEUt9rLXr+UYksKhPdJ/ER/jc9E/1CCsx2lC/jKDV/rtaI65B2O25GnKx28xGF6SWcoqjhh7T2T8N1d29v0asLk5anCz2o4vEnJWW+D13iIfPQDD+it8kBBd9wedIBqDQ3est8NZhohmckr1Y9sKQ+/Tp3mI+2yfRmp5lkY7NLh7ubZw5+UaI/Ib0spkHHs2KDz+hQFviMeJkUjsll7N2wYaHYDdVNjSkNC4Q13JdliONPVpPXdTEkTP9pSmpo3+mp/pTwVfTG0CnYl875bv2Zi/XvFrq8cKMdGgQuN4j0WuezlzX+nSe0z7TYvYPajWmYwMxrdOudK2Gl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 19:27:22 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:27:22 +0000
Date: Fri, 28 Feb 2025 14:27:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 08/12] drm/xe: Flush GGTT writes after populating DPT
Message-ID: <Z8IOFqUyFba9YENc@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-9-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221101736.78986-9-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: fb24dc10-a64e-416e-0da0-08dd582dec36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TYTG7u4ngAP+G+Tesspuj/XVBVQkdPJpH6mtr+u7gCXAMm742+bjw57TT8?=
 =?iso-8859-1?Q?vaAPFIVv5GkcG759C9kbWAKWVFQV/orFkc3WYkhFmfgX+lrn/fiLfl5DWg?=
 =?iso-8859-1?Q?FR0PFJNfSX0FxehNwNLCgAnHzikCMb1qcAEbaO7yAX7r1I994ph/awVlYl?=
 =?iso-8859-1?Q?ySIHPdFc8jyg8KkNGxuVHYlvDGWkH2c0X1fYfL+CW2ZUYZ9lRHBquzevTF?=
 =?iso-8859-1?Q?5k7tmeRxDyg5+zHEFnlkrHj+j21Z5V6O5rA/EQ6+odP4gBg9/ydZ+rtx1k?=
 =?iso-8859-1?Q?pHphMk2bHvwa34C5mbqpf1BCIyK8HleW4KrvHa5cBjfZBFG67oAzuxtzbQ?=
 =?iso-8859-1?Q?ZxK4+Y6DDmjaKB1kyyIv4j5YgFY+Cw2qdd5Qrh91UNo/yb37TBBsgzCKeS?=
 =?iso-8859-1?Q?z88MlXqcnc4Lx8FZ0bmiiShaNPR1HhtzWkA6xGwLFt0YusZqVi5TkiXMOr?=
 =?iso-8859-1?Q?zwmSA+mc0xNvt2G6aOAouUjYFd6PBptY74o9muzqhICgxaNltTo+1Nx0YE?=
 =?iso-8859-1?Q?5Ygf7l87Top2OY0nuqXKX3xgHF3ag1eXkvzYNrjGBFufVw5pKkxLUhqUXs?=
 =?iso-8859-1?Q?cNeeE7sDarK/aL4BWRxo/Xkqk/vHviPtZshH7omdBXfrXCCSqRp0GBwz4I?=
 =?iso-8859-1?Q?ADYkd50C4QBqmPBVsujaj/oVGHvwSG92MCSi+drY4Vr9O8CIfV6ABbGDBd?=
 =?iso-8859-1?Q?PvgsfXMv6wbQNwZJMCnM5+Fo3pPZo2DqAtbgDGcmQVp22dkrwQEBePzFqu?=
 =?iso-8859-1?Q?rWPPx47ZA2785vuVGV4iDF/LoKKONcKL/sB/kC8OfTAlW9c0od8GE3plob?=
 =?iso-8859-1?Q?MFfq1wPlZTnpS0mDy1ccyj6OR/yYLx5MD0751QElNgQTfqsgFpzCwTFN/B?=
 =?iso-8859-1?Q?Z/Srqda4G5qxMzSTeU8mba/6jx9xZUxT6FJSHEMA/8dv6v9OSB2CNV5KIF?=
 =?iso-8859-1?Q?bRRAR1lqyjjRfYs1tBgkpfYtJaGDfPrsqDZKSjAsQslpdVT9zT0HsHncJk?=
 =?iso-8859-1?Q?RiZRHlIxhoIfYuYVVLtveKDVQu31jGBNDLRq78TJ6LRj9iF9lJvI8B6usB?=
 =?iso-8859-1?Q?OR2WwTXMuMqyBcF/4dbE53jxPlbEyAE9nEANDpAWBzKvfkqaGSdxSIdnfo?=
 =?iso-8859-1?Q?o6SIUVC6HnMgEuR75uJfErZ3lMfYEytOyKVucwQIwsLGAiSwxu5ZgVhQPo?=
 =?iso-8859-1?Q?6ArHGLajIlYIBjNvU+C4wTvYBvvEVnLflPTy9lJq39NxO3b64v5SysPSK/?=
 =?iso-8859-1?Q?X21jbzr4Pam6Z4OahJs3+oy+dqc46KX3T/3/+5MIdZjEk6gy5jdTfull3s?=
 =?iso-8859-1?Q?5T7B2HzXkGoeDoHhAWtA+90uqG2Qoal7IZACENYD+oGAXSlQnWvuGd+YQB?=
 =?iso-8859-1?Q?SXZS+IQjlOvFZx1/9+Zmruulzi8bcWrbP/MMITj2oCpQq4+WZGmwoJ7TRY?=
 =?iso-8859-1?Q?MlW+OOJVt2PTI53a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FMyfTouvvX90E00UzjGxpu3OkY7fDWbpDCkEXVqnCsVB31LVOQEkSs3uWV?=
 =?iso-8859-1?Q?7/8lzITlhLehhgLsd2uYWwTCgy1f0V13KwbV3eKv0nM+KmC7R4mHNbgvud?=
 =?iso-8859-1?Q?IN4uZj+ODpY1lrw7BX6YPhF4/sn2VM9Dv0lcvhiy3iLIqIh2j9dMMk3eRG?=
 =?iso-8859-1?Q?KoqvbBLHXZemLykpyPlwc/eGgLq7FNTjWRaj4kXCVnP9WP4sUXUwmPDphB?=
 =?iso-8859-1?Q?rR/DCBeB/mcgsYblZn/0mc0q70nns1l5yvVyCSXlbbBWhJSKyoUMd86Sva?=
 =?iso-8859-1?Q?EIsUv3ba5eomzRJcf+Z2v3u3WXilmWccJM7FN31Nl1wXAVErJScWLvNmVf?=
 =?iso-8859-1?Q?P9lsaPkuT+Hg2zgeXR9J9XWUSdY77ZBbW/9URZLb6KmfEQ98a3CnCm7h0x?=
 =?iso-8859-1?Q?zwURvkot235fsS55sywvbkxuB/9UXq73tnUWJHCYWPmhmei9uR5IGKiMc4?=
 =?iso-8859-1?Q?WwnRZ2IVpuZIc1PNDElZcNSdirf+l6aJ0SXxPv4iCML4h3UMuZVGvFFYss?=
 =?iso-8859-1?Q?GoTbQdJ7ip62SaN5dWKbEqvrVk/1rM5FraQhpJvFuowZBYcNqXlLGZDI7+?=
 =?iso-8859-1?Q?D6NZMQYOEJoQY4lmS3bTXyCdPwtJI01sxkNKKumLWTg7Owmnvj6tS53rCi?=
 =?iso-8859-1?Q?kXGJ08Y+xkOXTRNKto/F/ouJfRPwDTmAWFmKruDa9hdu6ShsmlziHfoADD?=
 =?iso-8859-1?Q?ewZFGzRXAnu0wB1s4WtOnvf6s1AjiDV4pAlIc2QZ7KdiF5APY91NqBDjck?=
 =?iso-8859-1?Q?a75k4tJpd3MBT7YF/oy8wL3EiXAW07/nKhoOYYkyQY1Ixn5bb01pYqT+GY?=
 =?iso-8859-1?Q?NS4pEzByUcATFV5uC4w7fvjlQdtxpfOwuakqrzXsPoO0lWfOD1+35C6H0c?=
 =?iso-8859-1?Q?qdCvkuA6KDOwl7URpY46eMYEvYCZ/NFuGNv1FUfUEI1P+Gcgr1L25/FMfK?=
 =?iso-8859-1?Q?NAsT/uhxVy8Dy7LmCAY/dL45QF/XNnS6AQUCkAdxkzWqiGBtSclF5lwyhv?=
 =?iso-8859-1?Q?4gHC6iWKEFQlxGmHoITDg3ytB5yl1iesKTAJh9K9P4ADQKP6PwQtwjyuc/?=
 =?iso-8859-1?Q?ILaeQfNQSVcAUFoh7I5FbfLbmxVDR3qYAPdJqhqNqVbet8pMWipmPlyi0M?=
 =?iso-8859-1?Q?taQFyfFj6882a1C2W8PejCSwbaYQfot0wvOA7Vpmmhu96y/hNPd7UQ7T5N?=
 =?iso-8859-1?Q?SPayDcZzj+kVff0tzYUzQGyrlc0h3T47HGMim7k5mPuVO/66wavaWzhxkt?=
 =?iso-8859-1?Q?TBu9qOXFUDJN2gN/TAeT+H05BgiGfpD2txxxEYEPVP4ayEsEg8bz9aRw6I?=
 =?iso-8859-1?Q?xgV3WIiW9Uqb7UFrzR1/33GlLGx9kt8ZT4ypKjXE4Tb/rrvne0Kg6e7aiF?=
 =?iso-8859-1?Q?9g9BJsbcKb2G/jQao/n9bDf+/obDytBRC164Ln/RZdsmdILrcoZl+cAAJc?=
 =?iso-8859-1?Q?E7dVgM+IP3rwwRBj/DfOVtxw1FC2KSUHYX6K/Z+7oHWtNjG18hsPgYBqTe?=
 =?iso-8859-1?Q?RWOhprStG84p6HM0RRfFszh8dbEO9F/Z3RqYW6H3GQW45N6vDQP3z6lAEM?=
 =?iso-8859-1?Q?um5UveQIxgZoh1vCNkXIuugAn+omMc5EenvqOuf9rgbjGoWoGfww0g/Fjk?=
 =?iso-8859-1?Q?b+oH+LO3ZbTiHFUsbrm0pQoxeWo4FMHApWhNMdKsxGOBfiKm9yvjZNCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb24dc10-a64e-416e-0da0-08dd582dec36
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:27:22.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrPXBsRGGom9B6RAFbmcaV8e8NosVXokztJ5ZN8Wl9o532Sa8gkFcqLmsAsS0mZ9beBttWyT3IVIfanBx7czmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
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

On Fri, Feb 21, 2025 at 10:17:27AM +0000, Tvrtko Ursulin wrote:
> When DPT is placed in stolen it is populated using ioremap_wc() via GGTT.
> 
> I915 has established that on modern platforms a small flush and delay is
> required for those writes to reliably land so lets add the same logic
> (simplified by removing impossible platforms) to xe as well.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

on this as well...

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 45 ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 6c85e03dfd79..8f559b19e8ab 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -10,9 +10,11 @@
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
>  #include "intel_fbdev.h"
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  
>  static void
> @@ -78,6 +80,46 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>  }
>  
> +static void gt_flush_ggtt_writes(struct xe_gt *gt)
> +{
> +	if (!gt)
> +		return;
> +
> +	xe_mmio_read32(&gt->mmio, RING_TAIL(RENDER_RING_BASE));
> +}
> +
> +static void ggtt_flush_writes(struct xe_ggtt *ggtt)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	/*
> +	 * No actual flushing is required for the GTT write domain for reads
> +	 * from the GTT domain. Writes to it "immediately" go to main memory
> +	 * as far as we know, so there's no chipset flush. It also doesn't
> +	 * land in the GPU render cache.
> +	 *
> +	 * However, we do have to enforce the order so that all writes through
> +	 * the GTT land before any writes to the device, such as updates to
> +	 * the GATT itself.
> +	 *
> +	 * We also have to wait a bit for the writes to land from the GTT.
> +	 * An uncached read (i.e. mmio) seems to be ideal for the round-trip
> +	 * timing. This issue has only been observed when switching quickly
> +	 * between GTT writes and CPU reads from inside the kernel on recent hw,
> +	 * and it appears to only affect discrete GTT blocks (i.e. on LLC
> +	 * system agents we cannot reproduce this behaviour, until Cannonlake
> +	 * that was!).
> +	 */
> +
> +	wmb();
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		gt_flush_ggtt_writes(ggtt->tile->primary_gt);
> +		gt_flush_ggtt_writes(ggtt->tile->media_gt);
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  			       const struct i915_gtt_view *view,
>  			       struct i915_vma *vma,
> @@ -161,6 +203,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  					  rot_info->plane[i].dst_stride);
>  	}
>  
> +	if (dpt->vmap.is_iomem)
> +		ggtt_flush_writes(tile0->mem.ggtt);
> +
>  	vma->dpt = dpt;
>  	vma->node = dpt->ggtt_node[tile0->id];
>  	return 0;
> -- 
> 2.48.0
> 
