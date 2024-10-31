Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D6FE68940
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 00:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1210E131;
	Thu, 31 Oct 2024 00:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHPDT+ZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1D710E131
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730335772; x=1761871772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XE435Qx/fljqLlN0zLFXzDdDQdU0AsELRcA0SiHF12M=;
 b=BHPDT+ZUStPma77VPb3s1NYJV3y6lu+3oU76AkBmz/HAE0t+Neq+V1N9
 c1EKje/PrUYn9AuzSyXg/KI/dFNY7ox5TxorCZOwHnZFL0VW7AjMIKfxe
 kKP4FQnRhgQhv7W3iOZaTuIrRXDmlPh9ZW+PqXHpXF+003UTzeczUkUHs
 PSwvkrV9GjuNO4idEWDlADe3C2fc5D/xtqBqZ125oNjEZFbJYEfeQujyb
 0Oi+mxXCcJha/LyESdlNSSXBW81M0HTB96A/XNKXDfcHCAeP3sXEhq15a
 sLka9i5x7RLjh8MF93SyxE+EtC4k2QSZcbKyu+pW5c0w1t93oENj1fd+n A==;
X-CSE-ConnectionGUID: 1qMQdq/mQ1mj7JUpQ2jx4w==
X-CSE-MsgGUID: A2a/Rt6VSwmsjTFpBlbczQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33987512"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="33987512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 17:49:31 -0700
X-CSE-ConnectionGUID: mnsP5yOPSNS0BdVcnx+L9w==
X-CSE-MsgGUID: Qf2coFgsQO+hFYKMypECmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87621919"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 17:49:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 17:49:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 17:49:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 17:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdZhjlnwqiB6OBDmNDL6I6GL2hkEQ+EVQaoo08GOLEo+uFojqYZZwV/fK76VAl3/0sZqBO90bSi5Cd9EIHVJDcHTgpe8+02TKNYqZ1HiJq+w8wc6fOQN4bInDfjMR3H6iCIeEIvXOvjIKhTd0azWvAFpYSZpu2K3suzoo75J1E5+Sg20ugGKZGesxQP6jsDeo3tGgUm8RhVVpjrPuN0aWe4pimkLQHH/7uT8WUPwGpLOlusmYYJxwWxf+xYwpynjc54XD/WQzwOWNEXd6RorN9ETJB9OVqYndmIw9ht2ZT6A/XXn0xGjRffljBHWEbTNTCDDfRjuKkVQkQlpPcHN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mp8aLJ4yR3nOkYooUbj2ceRcThh7b8MHQkNRjp/nJI=;
 b=XjwTA5Fo05x7NbHLiE0evfXROV3GUBLBHD91VTrVbEdlmNIMpttjmEqlBPpRdgurKP39mge2/dDYVstPjAiKue/ebauMim30tk9KhDOIy9xY24GdcxNUkTq5FApWNh6RAVJdoLIyrTYv2giUVHMd5AB3Qg3AZK0s6iX5mktekmit7fbr2UuXcweQYWL2bPjQ/thNkBdyFvAFHAUDfWsBkyKS4oinc7S+3320oOkBCogR1t3ZazJnz3Pzsc5XWoZl1BGz9mYY3Jk0oHtD2XF1BOr0VzIP+wRih59Pk0YJUh0cFN+KDWZ+12QxFIWl4H91LTW6mh9ISm1cfYlrNBuobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 00:49:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 00:49:27 +0000
Date: Wed, 30 Oct 2024 17:49:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
Message-ID: <ZyLUNenVjKrujwVr@lstrano-desk.jf.intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-3-matthew.brost@intel.com>
 <326aaf08-60ef-4eb8-8565-093488b4c9d3@intel.com>
 <ZyD346NUGiL76Hbq@DUT025-TGLU.fm.intel.com>
 <ffeddfe8-6912-4d38-983b-951909c1a614@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffeddfe8-6912-4d38-983b-951909c1a614@intel.com>
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 621a98b4-669e-4ee3-6326-08dcf945df35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xaJZCKOuD5YTbAj7Fx7y5D2TdOW2OrqZvDAN8nKio2iQ/8uPFBIn3ZUbOE6Q?=
 =?us-ascii?Q?WSX7nJiaQRC7Zb3tzX/3WDV1HT7cagxussUSXDXnp1v7EnxNgug8aQ1dhHpr?=
 =?us-ascii?Q?ZBE7b9ZaylqImaAoS3RbrZQ0HunNLtWuoMyjtJR7IQp1WLge6VDTa5EOw5Fj?=
 =?us-ascii?Q?COZLx1hYEbVDjqSDzUmrVae7tqaXrSQp0eCg3zL82tSIRFO5HqEm4Mb4Ntyz?=
 =?us-ascii?Q?UV2xOJnYZFsmEotBt8j5n9utW8Yy9XBT1U/QuH8HJfMYWQcxE8puDnEsXcz8?=
 =?us-ascii?Q?ENQwjpo7K6qQ27xj+Mc2li4eMfBO2rune7djrr6OnozywShddvCQ77OB3VPr?=
 =?us-ascii?Q?Ptg5H8MTbIUoUCEcHneXpaHlIgwgYwQyIttx5WDa5mBam6ojAnj8XlcFDpI0?=
 =?us-ascii?Q?oXuJsRV39WvMR1vlUVNqWN9KHX7FdEMICzFmJKjYV8bml3qZ2oVUcBULsX36?=
 =?us-ascii?Q?c2lG/awwZIE4OZBXUf62dA83T9jnW0nleybhT8pCDHLiGhBZxXvqP64VsPjg?=
 =?us-ascii?Q?iiRjwibcpJ6N5fhNm1Dm0GkCghqAFi/WCjeJysGOgeLNeCDaEBJp4UBORX9J?=
 =?us-ascii?Q?IpoWyEm2HqNuMULWnHYRrRQ0O8+A36E1acLdZa42qA4nRx8hh6o+NR+Yaf+T?=
 =?us-ascii?Q?pR+YBTVdab7F9hn4kxD2+yXJAW2HyPKrJWmwkqMOzoAsnBovVm0aHFxVdYb0?=
 =?us-ascii?Q?6cf5GifncZ67W6+hhKCdzNAqkK3SD5IGhimdpuJf0XHgXaYahosYzP3Ho6Rx?=
 =?us-ascii?Q?nAUzFGOnyORYjfsEtJYMOja3dExKc6bSv1G/tXdMxlFlIw6MwQux/uSlBNGc?=
 =?us-ascii?Q?yd1oehxsvvUIK8ZI4EdDCGG+PuYeCPS35+yYPJEH2Lr6u3Mku+q6OcAMUf/D?=
 =?us-ascii?Q?uhtPdkXoal0EiYtsuOxs7mWqXd+Q/DsSEHSgOiBlSLoRKupZ+vVFTlc0VR17?=
 =?us-ascii?Q?gfndV3itaiWy3BZg9/qiWejpl4vfg1SkDyl3itGf26ZFzNUArCRl2F4tzxvu?=
 =?us-ascii?Q?B4qsT0X4I5CgsXkxgrZ6XLshrzXy2KiIGVd1KKV3XK426VS8PpPdmlGD2ouS?=
 =?us-ascii?Q?uktlqSKv+PYD7RxMY5D0jXLJuHJt08Nad61TEJKlh3ABtnKQwoJ6qnE9MLY3?=
 =?us-ascii?Q?U/KqLS4UKlNtWbqfKIh/p/MVxc+ROcYOHJyMNb9AbiPKiFUmbrpoJjj2vyiA?=
 =?us-ascii?Q?nG8QRE3Nk+dZASvFhVR5E11cI9gjjf/SgYWbVwp4lk1FMCEKFO04+TgA0isg?=
 =?us-ascii?Q?crGV4pHPlSAMAXwruo5c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QhVQm3XgqRd5kovnR6AiWKl3Fi/6Aj6lOrscjjr+Xkvuk8A6FVeZQyscw6wn?=
 =?us-ascii?Q?3ZyKQ/vUtxM2k4JBP7pq/06HdIGdrb4BZ2WY1j6zsc7455VaTwIwDSxZyR+v?=
 =?us-ascii?Q?HG5XHwWlwfETv2Sq1cyww+JATzC+atpsSW5ow9P+m1JgsuQEqoKxrDrmAUON?=
 =?us-ascii?Q?M4+K3DouY/l6gHP+H0mPkKS+63rsKxAo0XK36e5h1WWHajeVIRFnacU0C4uz?=
 =?us-ascii?Q?j4b/7sd3uh+S/tT4Sjcnf2AI/LkQNIKwzpu+0zbg41YvatgLtlQ1PFA7Ppj4?=
 =?us-ascii?Q?r/xSEmCtBzKtd4Dtl42lkURSdtYP7QwfxsWZGdhh3gMwY0Vx/LJRDSzugOlr?=
 =?us-ascii?Q?MrNQwllHZe11QBcqY8jXS3OQTvJaiHE6hFSnGTgwKiuqdujv6mHSQ8GM3l/T?=
 =?us-ascii?Q?D9mpHDlV/4oTlFbHBSee0sfPZpJ8LjayNVK7a7GOeb1ZuwOcyppzXNJMlPLo?=
 =?us-ascii?Q?yEC2xX2/7R5laCnfJ6NU2C7gKvGsv1aCCQH4p3cWf0qz1qMapvk2XFj2ZWwO?=
 =?us-ascii?Q?0NdHi0gUYC5ybVwffeiqeJ7sF0Ijt0VEyIuDh4MTGbf5jQdQO3OlfemPTLxa?=
 =?us-ascii?Q?TZGRkY7rrcxpJx+iZBV8G8cvMu3t6YZwJUwIZ3xliwIzrFxfWHuPFyYd/dyb?=
 =?us-ascii?Q?lAmq1WmJxO2N08kRsQ/DvtY2rhuP1dGOMTuoqxNbiFAp/edeW0cQTm97vy9N?=
 =?us-ascii?Q?taow2oPkGgBIRpAYEjUbP/E+Lkro/4XAp+5ynkUFo94JGZ5EeZtUkGA5EuDp?=
 =?us-ascii?Q?qgz7ohQ5yt7nu9fT3cc0LJNA4aumvQkJgyHWis0sOptniYQvAimaBMPcGuNd?=
 =?us-ascii?Q?qEEjUd66fqetdnsrvrXxO5VEdORlLSM57BlbiMUka+NbGeJfe2fshUF8Ih22?=
 =?us-ascii?Q?zu8DBZ/yJb5bOHUlqdhjsZKLDCiH7oBMOEOSdzsiHgvDVY3B848ukdcuTJWD?=
 =?us-ascii?Q?Ufc7mc7mBdnL8yT11X13mDGxOVOBsbEhG2Gpg0Ue6eviAtgXOV/NghYApUci?=
 =?us-ascii?Q?el9sWBLV4krEZhSx8f3I5tVI+Phy9qRqxBhMNj1zPQEKRjrY5FrZqYBbeDC7?=
 =?us-ascii?Q?K5fF0OSSuaNAXg4A32MhZU1+3Q72CcoXQ0xXayKL6BCtQRoiAhBoX8H1pPGQ?=
 =?us-ascii?Q?VP8H3y3TFdd0OyT0E0yXhTt/FV8x1zl86iIN2oROs5ufjyIp0ypjZsaCxdmG?=
 =?us-ascii?Q?DnONchPKgOhCPMRh0e+0jJwvd1WtCmwb/2rfQ/Uutf3biPAXqnI0kL/VEjyW?=
 =?us-ascii?Q?OhGnlG8ISDexQVKUu2NgNFcCPtJsDg+dgU0ZRKa8NkszC2LSXgbWrwWzRo+s?=
 =?us-ascii?Q?2IT67Jb5kRfK17xlfvqUUSjo8ypOTy+D9A7JmLXj4gC7DO4qHsGGfCGnfOj1?=
 =?us-ascii?Q?01aN7Jnh1MxbighWFXl1tPb8Qq0/sV1Xdac0kySe3oAVtzTuo6sP9s4sYqkw?=
 =?us-ascii?Q?+GtGULBbgy1+5mAln/AJyuVqF6uEjmf4YdTHsIP6KBLELv3wgRLrOyb5vJ73?=
 =?us-ascii?Q?EaCorgZUOsUUWjQtSfPM2MfHPG/nzjFtbRCle1wGrUk9jL9TQUoMTcrI/P/Z?=
 =?us-ascii?Q?yS4qUpHErA+915/yZYzeo1hvYFV5H9A1m/Z9PE5Fs3e/MhCbb0aAiYIFI0b1?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 621a98b4-669e-4ee3-6326-08dcf945df35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 00:49:27.4396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APXTsiArA1ODpYepnv2ENXFURo2eQHfaR/VEFwfTEyt0RLtVrb1EyEYrxsnQt8XyM9cqoE72kLM5VXGmV7UXNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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

On Wed, Oct 30, 2024 at 11:53:09AM +0000, Matthew Auld wrote:
> On 29/10/2024 14:57, Matthew Brost wrote:
> > On Tue, Oct 29, 2024 at 09:44:32AM +0000, Matthew Auld wrote:
> > > On 29/10/2024 00:32, Matthew Brost wrote:
> > > > GGTT mappings reside on the device and this state is lost during suspend
> > > > / d3cold thus this state must be restored resume regardless if the BO is
> > > > in system memory or VRAM.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > I think this needs fixes?
> > > 
> > 
> > I don't think we have a user of SYSTEM pinned BOs upstream on DGFX
> > platforms yet. But let me double check... If we do, then yea fixes tags
> > would be good.
> > 
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
> > > >    drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
> > > >    2 files changed, 11 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index bd747e53eb9b..6c8fd5ced2a2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -890,8 +890,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > > >    	if (WARN_ON(!xe_bo_is_pinned(bo)))
> > > >    		return -EINVAL;
> > > > -	if (WARN_ON(!xe_bo_is_vram(bo)))
> > > > -		return -EINVAL;
> > > > +	if (!xe_bo_is_vram(bo))
> > > > +		return 0;
> > > 
> > > In the suspend flow in xe_bo_evict_all() there is:
> > > 
> > > 	if (!IS_DGFX(xe))
> > > 		return 0;
> > > 
> > > But seems like we now need this flow for igpu, so need to also drop that
> > > check?
> > > 
> > 
> > I don't think so. AFIAK GGTT mappings are not blown away on iGPU
> > platforms so this isn't needed.
> 
> It sounded like GGTT lives inside stolen memory on igpu, which is not
> treated like normal RAM pages. IIRC the way this used to work was that core
> kernel reads some special registers during early boot to get the stolen
> memory range, which is then marked as reserved in e820 memory map. It then
> also sets up intel_graphics_stolen_res, which KMD can later access to get
> the stolen range. There won't be any struct page's for this range AFAIK. And
> I think this range will also then be marked as "nosave" which will then be
> ignored by core-kernel for stuff like hibernation. Also historically trying
> to access stolen directly from the CPU like normal RAM was not really always
> reliable so you had to resort to stuff like GGTT mappable aperture, which
> core-kernel wouldn't know so I think makes sense for it to leave well alone.
> See xe_ttm_stolen_cpu_access_needs_ggtt() for example. On MTL+ igpu the
> stolen handling is quite different where it looks more like VRAM and you
> access it through LMEMBAR and there is no intel_graphics_stolen_res, so not
> completely sure what else is different there...
> 
> Anyway, I guess can park for now and circle back around later once we land
> this, once we can confirm we need something for igpu case. I was just hoping
> this would also help with:

If we need to restore the GGTT, this is a larger rework. Doable but out
of scope for this patch. Will keep an eye on this.

> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3275
>

Hmm, yea a still unsure what is going on with that gitlab but initial
refaction is this is a different issue. I guess forcing a restore of all
GGTTs might be worth a try...

Any chance I can get a RB here? Getting this in 6.13 us probably a good
idea.

Matt

> > 
> > Matt
> > 
> > > >    	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> > > >    		ttm_bo_move_null(&bo->ttm, NULL);
> > > > @@ -946,6 +946,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> > > >    		.interruptible = false,
> > > >    	};
> > > >    	struct ttm_resource *new_mem;
> > > > +	struct ttm_place *place = &(bo->placements[0]);
> > > >    	int ret;
> > > >    	xe_bo_assert_held(bo);
> > > > @@ -961,6 +962,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> > > >    			return -EINVAL;
> > > >    	}
> > > > +	if (!mem_type_is_vram(place->mem_type))
> > > > +		return 0;
> > > > +
> > > >    	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
> > > >    	if (ret)
> > > >    		return ret;
> > > > @@ -1814,7 +1818,10 @@ int xe_bo_pin(struct xe_bo *bo)
> > > >    			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
> > > >    				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
> > > >    			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
> > > > +		}
> > > > +		if (mem_type_is_vram(place->mem_type) ||
> > > > +		    bo->flags & XE_BO_FLAG_GGTT) {
> > > >    			spin_lock(&xe->pinned.lock);
> > > >    			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
> > > >    			spin_unlock(&xe->pinned.lock);
> > > > @@ -1875,7 +1882,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> > > >    	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
> > > >    		struct ttm_place *place = &(bo->placements[0]);
> > > > -		if (mem_type_is_vram(place->mem_type)) {
> > > > +		if (mem_type_is_vram(place->mem_type) ||
> > > > +		    bo->flags & XE_BO_FLAG_GGTT) {
> > > >    			spin_lock(&xe->pinned.lock);
> > > >    			xe_assert(xe, !list_empty(&bo->pinned_link));
> > > >    			list_del_init(&bo->pinned_link);
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > index 541b49007d73..32043e1e5a86 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > @@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> > > >    		 * should setup the iosys map.
> > > >    		 */
> > > >    		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> > > > -		xe_assert(xe, xe_bo_is_vram(bo));
> > > >    		xe_bo_put(bo);
