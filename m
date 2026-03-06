Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D310F513ED
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 00:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65C10EC9B;
	Fri,  6 Mar 2026 00:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kS+znNi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED4D10EC97
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 00:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772758157; x=1804294157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EWoxQmdTaHETHl+2qnvNbn98Efp6qagFDCrinzmjlXw=;
 b=kS+znNi4Au9Hic1HgRSPlXb5h2yep1MM6LqxxCEp+siL5kKMLj1Le9ay
 ch6IlwOeCzrDBf10VKKYaf9WktOlNZGa0p9CFcSq0HuqpzJdYkLXSqMaP
 2cHe7TlK8BpTKNxldSZWfMod2PoNto4QdPDvlqj++no107nG7obosgIRe
 pWiOoMdBjRseWbF23bcKDwjP9vozEyy5pNa1jAR089g5A2SN0p1ASwJYV
 s4IX/GcHO7g4JvvBTL2Oi93uF2DuZ+lrDiFCbE/Hn9V1ef17CM8XISEVK
 xNUFwE3arS7fX9Kw5B/F6fRq9LuO69KliKonB4nqW9aqlBqu8G4U4UfKs g==;
X-CSE-ConnectionGUID: urItvENOR9+n33jhjR4/Ug==
X-CSE-MsgGUID: wTiwEg5aSZOaJ03aI4va7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73777585"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73777585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:49:16 -0800
X-CSE-ConnectionGUID: 3ypyajORR+Sugk5TGdOVKg==
X-CSE-MsgGUID: DsNJif2MRAm7fRqXxhlipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="215588351"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:49:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 16:49:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA1CRbD66zeW4L+nQk1IbVlAjHt2JnVWiesJXM6GGW7wlRmDuNOBjhnQvjBQ9PavSFSqaJXvLJdVlXl0nOuq5u8ucj/cgW/m3x00eszNsi3eF3mYnmnqkeGDs6Uw+sJXnLnyrHEPYY0Q84z/702nA2L9VErM6ld4zQLCbksfe5DobCeHMu0QdwYZiZ3Uso2WPgh6Te+4j4rwxRBzBDXQ3x+9Nru2EoYaTErBEZluKJfaDKGBU44RVeePZMm/98ksOGJPaYy7yOWPHW1kBJON5kRVvoByf2kNIhFzviQLyMU+9SfUG2Aclex53KsHaGQUeElUFLxB7hRzS/vi/ciQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpUze2b6YBvlCE9Uu/vaj/XBaXCaAu4a/5yxCOXpKMg=;
 b=ACJUigZPDD7GRFv4uses3i8s59zBr0qDH/mfS7xgMC0xtxjoWPNfP3nLJIy7xfBh0sIv6ZtZ3PAeDo0v+3c5EncEZrgbQ6ciF3ki0xR/F4l7ePkRm7FGbPU6882KLdXY4+2P9DkyVDXhIqfkhrLRQ6OnxrNt9zbamBi96veEJp1zqXBnK22PIzmp2qi25QVf4QG2bn+GgHsCv/OqJg3daSX7l9md5cYHyIJ2KcXLqQMXHE/0fNjWNjxKyn8lNrO5+HQ4biBZR0gXkDSakHXVwxQ1ygOGYBtWiUZxNX0nAl0jiYOK/kl3sqeTXjYECMczW/DqX7YYoN2z6e25cGQwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 00:49:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:49:13 +0000
Date: Thu, 5 Mar 2026 19:49:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Farah Kassabri
 <farah.kassabri@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add for_each_gt_with_type() iterator
Message-ID: <aaokhZKjmILjakBh@intel.com>
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
 <20260305-gt-type-loops-v1-1-aa42e9fc3f06@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-gt-type-loops-v1-1-aa42e9fc3f06@intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e438f0-1c4c-4271-dc34-08de7b1a2fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: Q3FljLn9G7ClbMSHwBFT3PFMBsnxbAsIV6toRSZaIfSiAxt8i6XfU4GWEf12rfjycA1mfs35uJNflk8pV1tJXSwcRTVNqVcQ7UF0UYtOyjO98kcE4EURXgZwoq7n+Zk4XMJFU6zl0+14wk4nJrPJ8b10dHiW5ZDP1fCkpvImqSlxkUyepfzZk9fp2qPW+aD63iAu3++mLHJ60q7DsiH+ndriOsZ3IhklgXwMkQEGUWM8vYm14Fum5Ki3TX6rpJDb6kJ6fSMiwJ+HjvSDrBWpOFlYKaS/dkwFI22/zguzFz6D5wqCuUo4vck7bcR+5VJp44+nT0D1cVBtsP7oxkrGbPIGkIJ1vY4Tu3CvxZDH1UoSnWeXtzMMpXLE78HxmdlLhgZGG36wagO/aypF6k+4g2hV6jmejy5sI/EapUO5wTSVFVLxJkS/OwMWP/g2JO/HWJzonc0Iaz5kQPs9VcT16Idb8EZxVQUT+jHOU4Zp4Yj7yP0Hg2AUUk3xGPaj42q0M3CAnBs04B4n/h9ZhtB7sbX8IJyAZYudPZ2OeYgyqbPqMEzvm/HfVwIiNC0+ZwNhjRblrlYl5MaX47IoMI5S8mvkxkr9wsvD1ufs+KKeaP9puKlI3WaZ9Spefb1TLTziOZPN9/nubN3/UgpVLUgB0T16tKE8OHzC6fQ+g7Y8f6/opcJVry80X2uWmw/uiqt83sqU0O/kLuEpNxK7tty8+neBw5aSWyX4VNSUPpjpnWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qcp/KTPQvazVYTBQEfODe1DZKhUxADC/2aP7Xg9WFybcZxwb4SumihT7Fqt+?=
 =?us-ascii?Q?FrRBo6PJrhPyRwwbo2yDP8cTAlqgUVlk3qqrsj0ZWDaE9YpMYRSi8ynJXXx1?=
 =?us-ascii?Q?j/EXV5bh/4ndOwbt1vbi1JQyWBLy3lGtNk00W/T1cVPgFRoi108G6FyeMWTa?=
 =?us-ascii?Q?KavSZq/OiuShY5wJ4FLIHckS6UBpI1jn0HmphcvnzGNLtGisITERGF8Sdiwa?=
 =?us-ascii?Q?3GosEzn39tfRYb0Qo/JD931szxN11Bf0KK2MlD49/0VdBbEj5TqYu0/dCIvL?=
 =?us-ascii?Q?hc+yeho/CFUTte8bS0Cz0dAg0y73RufESuQRaUgkaWFuvAYo8uqzIsd8vkcN?=
 =?us-ascii?Q?V/e6OjK3W9CyeizIqxS4SzOVJ+YwGBUTq791D8LH2IUbDdamaolvSWv52VeJ?=
 =?us-ascii?Q?SBhb79W717PvrxowVOTF+SGt7cwGAOjfxAZzs8CShtA5Juh+YrZ+IJLNY0WZ?=
 =?us-ascii?Q?WVtv0955GruiZfNQeZSsdgsbu4itdPHtIcA8iGZ4LgjLSQEL0SWI54Q72LnZ?=
 =?us-ascii?Q?juPaE0MFJRwLz+OCzkx8o3D5UyBJO58IzYzptsjHS3QmDiA/ksLKSQUjhnO/?=
 =?us-ascii?Q?IoDrRJ9udE3+/vlCveJ3UEte/wKAz/O/B3opmBt69BlJwWpOH3YtABwqg/tA?=
 =?us-ascii?Q?sZ0dyLq6RgxcKlvH0l+wQkvzI9pAFCBJeFpAfCYUhVykxGd3cK/Nf7B+3aDK?=
 =?us-ascii?Q?bnlMVofgPKNsmcY/wR3KR8frfHBpSKG8GdnKtZJm/uGx/3FyP4Ky9rgwJwjA?=
 =?us-ascii?Q?ZFre9B9IK0JVzJVLYZypIwanzE+1GHti9EqswdeeDNh6Jhi8eLoh8KytgsfU?=
 =?us-ascii?Q?uq5G9ZCosbPuDrxwMrD0tDTkAO1SoFKX+tLCUDAkt7z8V+rux4T5ut6wLa7p?=
 =?us-ascii?Q?esYqWSIePEXp5U7ojnDHDvoZ5Rk8Z3kvGzNHcAWmVkE2/rYcii03e43Nq5rc?=
 =?us-ascii?Q?jjXcyeuW3384LqaBCrWWUp0Uih9yyAH2e9+hwupF2jQ5Cu0RcAL0JKBmP88f?=
 =?us-ascii?Q?KfCyqWGFrqXQcJxsVZbT5MJDuxBRdah6q7wejI956ArNqwMpthQQLIsdvEo5?=
 =?us-ascii?Q?lt8UUBa4IBtpDMkC4mYsWKsi31WFYa/FLS5Wim4Z8Ew9mpYeAGMMPU2q0sZK?=
 =?us-ascii?Q?0t3/2gp7CHylAqWYdOQCm01XuvsOOCOYrl4KY7pfAbmzqB59gS29iq9zSirz?=
 =?us-ascii?Q?tU89S9UJLC8UwhGKw/9Z4wRriidPq8Cjqh1s80dVCyaeRMHUbPjaEWpEOQt7?=
 =?us-ascii?Q?d/cGzXk8pw7WV9Z3NacztjRs+XCPOqIYYPLOuJYb2guYFxbVP4R2sVNndKxi?=
 =?us-ascii?Q?Xi6y74cP/KVIsvfWowmgGaLQRVXYHBWCpdX/DY250mEMNbYMEUOmGV8UsOrk?=
 =?us-ascii?Q?OtpFc/+6/3r+iLUyryq0GCL93RlZGnC7L9hN05H0pWrLABAlyCyGB9RqcnO1?=
 =?us-ascii?Q?F5nubUpEZvLE3RElKaCWf3eSfOHuuSIxJK1WZX220nJHHUMbFu+HO5GP8R66?=
 =?us-ascii?Q?wNpnaKeU7szWuzUHAmCYnTCvjnAtQ/z4ccLsSvqhBPnet+zSklV+cQDUR90Z?=
 =?us-ascii?Q?yotVO4ZMPQ5kEjGaxYJu97ZlLs2iiK9RXjBYRIs80tMLuF95oPN5svTMtRg/?=
 =?us-ascii?Q?GQy1Z4DvmFAACiOQdNKzILi9tE9iB6+BV73ZhLlOy6sYhwAIAmMLxt1hDMhz?=
 =?us-ascii?Q?EiII5x6DElX2WP4kSLsX1isbgkV4gTOJvvBAARoeUfZaU2OX2E9nT8AkuD/y?=
 =?us-ascii?Q?e6oPQMCrLg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e438f0-1c4c-4271-dc34-08de7b1a2fa7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:49:13.4309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6z8zt3+E8Ol2n3RDz5WM8OIUgqFjH1CZHUn5KPfjdothbmyE6EHrcILpi35IB7wloTpkZfj+nRX9SFnmTO9dvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Thu, Mar 05, 2026 at 02:59:27PM -0800, Matt Roper wrote:
> There are a couple places in the driver today that have GT loops that
> only need to operate on a specific type of GT.  E.g.,
> 
>         for_each_gt(...) {
>                 if (xe_gt_is_media_type(gt))
>                         continue;
>                 ...
>         }
> 
> Some upcoming development is expected to utilize this pattern a bit more
> widely, so add a dedicated iterator that allows looping over specific GT
> type(s).
> 
> Note that this iterator uses a mask for the "type" parameter rather than
> a direct value match.  That's probably a bit overkill for now given that
> there are only two possible types of GTs, but if additional types of GTs
> ever show up in the future, this approach will fit more naturally and
> allow cases where we might want to loop over a subset of the possible
> types, or specifically mask off one single type.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 39464650533b5fd9aa7d9fc3dd432710303311b5..c4d26700266115f91330cff0a115a716e6899c50 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -131,6 +131,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
>  		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
>  
> +#define for_each_gt_with_type(gt__, xe__, id__, typemask__) \

perhaps we could leave it as:

for_each_gt_with(gt, xe, id, something)

where something for now is the gt_type, but it could later
be extended to some capability bitmask.

But nothing that cannot be done later/on-top.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if((typemask__) & BIT((gt__)->info.type))
> +
>  #define for_each_gt_on_tile(gt__, tile__, id__) \
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile == (tile__))
> 
> -- 
> 2.53.0
> 
