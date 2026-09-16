Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7185DC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1930710E995;
	Wed, 16 Sep 2026 09:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HY35VlCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DF210E803;
 Wed, 16 Sep 2026 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550840; x=1821086840;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cA/iF0svRADNkzdqGBeN0bGPanHAhtxS5SSe1otoslc=;
 b=HY35VlChokhL1u8IIrjb7/JRQW1cPvfKvk3uYVkuxB6QQcbZgQwHkbNc
 6phAEq/32xjmWzotX8GCPPQJTES4n/WHr9AamfO32rezZKc/kJ9vJjPmn
 utgu5DyC55YSo31J6V/U4R7V+9SnWuGjeuRKib6EXgUzg5mI9mAYYqYAJ
 TVAvYaQ4/ZuotyVtI0XnlZHulfRIrCArjwSQry8r0Ec1uqa4D3OqSeSbX
 vCiwg23Nt2rYdPpShs3BfvND8GzPJQxn57uoumDoDVIndPQE6iFJslkow
 muqYcP/o3IBh5MSZIL7IhQMLtf2gd1z8PkIs43vzFYVEhzCbHkhTv9bdK g==;
X-CSE-ConnectionGUID: C6Hjj4pLTy6ua5JLVeNsIQ==
X-CSE-MsgGUID: YAYBOH8JSK2Rh24E/cCR9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107292285"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107292285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:27:19 -0700
X-CSE-ConnectionGUID: DH54oPszTHe23fsWiuSZ9Q==
X-CSE-MsgGUID: LklOf7RQQA2mF5gRNAjhLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273826804"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:27:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:27:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:27:18 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF9VJrLQHsoT+klv1C1xa3CQVmmUG73/U37t/ZY4p6udqvHFfFVrJlUd5Akbs5jjSbg0qhzauuJe/2MJ0kbkEw77CBUZuuCNXNdGG5MdnkIM5U7zLjz/9Y2YTwNU0b2MLiq88HVo+uPBNqkWtHlA6qthSZYdnpeTJD+ptTdfKr/Vel7xzJ5vN4CHd7iGtjUXowFzMsMmMMVSqkRsd5PExnay3hqj0G7JOwlSXhtq2bKD8Su2KfdI8vNzAoLrVMRVXkmGaOao0MPnIwsw0wHhagmfCIDbzUCV2Q5IUQvweE1g5zLcPFnjm+x2DmAloDjx48f5lYX/FDXrMKzdTgWMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXdF2OmSDyyXzuV+xSZjkmzuDRQ8denrlMsZ/Kgrvtc=;
 b=W7AI2x+WezRiIZpqsKZF0mpw8HFYjoHejPaYvRMY3kMqfuHASCL1nepHpvpfgmTBKplU6zVrWX5bsd3lzBl1tnbvs/zHP1YJDfie6DvGm8D6bw+5HVIZkvaqOWIyWI8BRdGdIK/ORtd/S4ltlqN2gtvhLu2Mu7Nj5un3fZGWOTsid8FYF2OQ71cXJ0eKUxlO9Ig7ajQh3x0UOJ4Lk+O5YM3reeQ0iCzFntg70o3FtAs+XVd9oltFYn8jGzuN90Z22as3tHyvbwv4EiAXKvheaB6HdNbVf6Pm3l8vG6+zWe+L7oYA1+DUBumgIUiKWnKR+7IIn6K2WtmAh8Ye4uKMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF69AE895C5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2b) by CY8PR11MB7826.namprd11.prod.outlook.com
 (2603:10b6:930:76::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 09:27:15 +0000
Received: from DS4PPF69AE895C5.namprd11.prod.outlook.com
 ([fe80::515b:588c:c79a:a1fb]) by DS4PPF69AE895C5.namprd11.prod.outlook.com
 ([fe80::515b:588c:c79a:a1fb%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:27:15 +0000
Date: Wed, 16 Sep 2026 12:27:08 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit
 helpers
Message-ID: <aqpg7Ci9a12a14dr@ideak-desk.lan>
References: <20260915160620.779372-1-jani.nikula@intel.com>
 <aqmS6M-FARktEMow@ideak-desk.lan> <aqogWoTeD5hCQgXq@ideak-desk.lan>
 <96b06c0f2b846afde41582b5f291a2fd51680c44@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96b06c0f2b846afde41582b5f291a2fd51680c44@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVZP280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::11) To DS4PPF69AE895C5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF69AE895C5:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3babcb-9e9b-4f4e-e7ed-08df13d4b219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qQKYFbUiz9hg98GBYSG/6SUfs7Ix0ZR+yMEEjirGHRFnUKC3HenREyJgA9gsbh9Ey2UxEUk4GGUahea6v+3RPMHQ5ikeT7EArtm8NmXs/QWgFI+G/7RKPwYxEyzO5PDUg25SNU19PZgHhgwVMedN5LPInV+pIBXbNDxzTjhLVP62EKYoOGkpnEI2Y7bwQoNHI637HBMqXUUG54ZtfkFSPpTuq10IbiTmY3Tyzz0pEZSdpRApuImecNAcP01CCULcJUx+BsPkuh3+a6bb9v8V19i182jTKvRp2Yxl0jRh47FULu5EaVkfA90Agy2qVr/RblvfL6UcUHS8ng6mceX/piE01U59mScJwjVkIdZ1oRFoqDi9Tta7DmvthuWcybUiYLiDtf6MtLrZz305/5LFh/tsFMa/G2teIHZeD0aRR7DepqcNiKfqKqCfB3cyArv+eruLo9LW4op1AML5tdHNNgYWsPPaUg0rViQFMHnQ3yOgJOAjZ5WH6IFgIu9y3q/AdlRiTx2MNphibI/Ia54+jDHIN6K0nhQ2G+n3W059Hke1rLpU3/zX7zpvNNX4jwTHBu2tIBsguK9nZMwjL45zYYz1mXFfYEma0s7+IlYJBD1G3pOpO/f7bMzzB1lHI9sjVtPheVN8xFtFsGctyjnTuLNDhWwqkz9fy6s/Pz4XTxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69AE895C5.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HFtqrH6VS4QIavdYs/yZCGjlkuncfCD4EODhKhwtNaC+fOVgkWUVGEM5Gf?=
 =?iso-8859-1?Q?T8hrmKkmoBmDPESOJ1hMrggiqX5wFOJffU18uzQGA/6O3ziz4Qh92kORzX?=
 =?iso-8859-1?Q?DEOuneP6MXaSSdigudmGWV+BTnBmgIOU6Pk7zlHVsetd7mJxWvm00hO59W?=
 =?iso-8859-1?Q?dI+KZDTI++u0lwECXow/pcVV8p2ha9is6lpGoBdz7RJEYHalXj6WbkHhL4?=
 =?iso-8859-1?Q?nE+g5SMRGaJnlY7537vdYfTG8MH1C7FpSbh2cOEbRJQ20xlU1zhE8CUXla?=
 =?iso-8859-1?Q?ZrEAAFv61c5gLbulZGahW66NwRaolapuARegq/BocRoR9ojLDvIxMYMVwc?=
 =?iso-8859-1?Q?5eP7WASG4Z6jjq/cDIOUylEdJ1IELJgwwnTHmXZtEFNF81kku8YqMAFh8e?=
 =?iso-8859-1?Q?g3XYhloFP9v0/CNLAKVduI2g9seotW2tR9YcVeXUQ6jpo06IfEtC+HAPKu?=
 =?iso-8859-1?Q?v7zTqYrME63HOs/W8LuZEubNCfTzVfHCCscoABPi0KVrNtEEtKZ7OAwdub?=
 =?iso-8859-1?Q?wMA5a7nsz0e3BJFuqWDtDS3isGdGPaUO72s0mJ/FKLWCaotIz4P/qeV2t+?=
 =?iso-8859-1?Q?iMRhXqwCoBmjK7hp5EV4AN7dGd7yRDPuH1N2LSwSQ6W9DeSq4StQ+uBSvE?=
 =?iso-8859-1?Q?UFUoZa1jjX6jA5QZ9aB1K6KIELCBxBZg3wfRYVJoU7KaSi5dt54cBsD7Zm?=
 =?iso-8859-1?Q?NtiLoSlWuIgHgU+p99ORua3srYGfhGhl6S819uut9eZ3Dm83n1V92kKlLQ?=
 =?iso-8859-1?Q?q1MLcgSsKg084L0szUov9WWsvF36PtUvTSfe0BrYQ/6yukGm6G15AGxfoE?=
 =?iso-8859-1?Q?Okc43nI8OomuCMz0ByRP8N5fIFGXdX/6x1KqTzoZrLoLdOodCVcg8XSkq+?=
 =?iso-8859-1?Q?WkNCfQ00nyteGM520zCQJuF7faa1/zehKRgpFMgne9K6BQw1HDTQZEEaXJ?=
 =?iso-8859-1?Q?g4f25XbNtV5h4bFxa7BCyGZ2BVnWOtnHicfPJKaC09K4uKL0DCFUICn8h+?=
 =?iso-8859-1?Q?EUcUIdvOT6DwSzXiuJPb3MduVmHFrDMocSv5pbapUvbnAC12rDKkFnUKI7?=
 =?iso-8859-1?Q?uztj2F7xWpYX4W/3hneh5hVZrfJYBiRRdlhLMKmXWaEYPZ6FO9aTBPApA3?=
 =?iso-8859-1?Q?RKQNIfrVjfqMsY7UhEwqd+1jUezCsCHZJZu1ecM19482Cbkl/b27kVNtTt?=
 =?iso-8859-1?Q?u/AOyk+/VoqflnoYT9s8SpfLalJLehxRNf+C+dJCAuRy3irazIQMzbucKt?=
 =?iso-8859-1?Q?GlwHq/3cpJt5h2CJuaI5fh23LDS4ZAxCcbHev0/ijpcFfNNBKEb6JuNLgv?=
 =?iso-8859-1?Q?KoUDc7BIWFuvpK1KeqfJHQDqZ+LrVdrRHMQSLO4NoL/Fpg23txdqbob1Vc?=
 =?iso-8859-1?Q?RQVj12+6UyzZQhKC+8cWOxOYtizHIC99v+xwMumdV4N73Hc8+hkbGTTNTp?=
 =?iso-8859-1?Q?PDdAdcG9PH4h6a2WAwp/YCkM6uMf8du7KMvz1h4HlBsvbFAJAAhjbOeYpY?=
 =?iso-8859-1?Q?Sumay0K7fo/VfTJcIhXP04BL0oCpD73EVLNcGEYRFZ9CjosFDVAeF04Sdr?=
 =?iso-8859-1?Q?bg9+tRRaQkeZvNK32V5KosL5IYNGOL0ZiW7Vk+kYVuxRoRtN35Z0WyUh2f?=
 =?iso-8859-1?Q?QdvE0ElSN1dKlxLoORcGa1BbY5MuOoKZiZzsl3g/Qdk6XmanICQueCE5rC?=
 =?iso-8859-1?Q?eMlQzq+g+hi7cEVQJVJrkoSucrxnCljlu6JvfAN/Rwh74+59D/zqaieNdU?=
 =?iso-8859-1?Q?EkdznD2yX15foumzcrHmpbKmJ9Ksjx5qsyE+mUACLSTE8ZD5zvT0zefipR?=
 =?iso-8859-1?Q?4oEwYidi0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: K8i+dkTjXhuX5HXaTWj9U+QFd86qzAsc5WvP4DUTwEQIcZLVNeoDZXDeyBqGXAuO8tFIyU/BXLwfMxM/t6xBx/kOXNN+gZ7hdlA50OAV2nVPpvAZcbw6rk085H/1P4Jg+BffbTzzBjO2J1XawNyU1Xd78e0iHZek906XgBgnTNZcXndfwBma2etVatTSKfB7xxadBA9YGxSbee88WDsbIMjgemzJQVBiDHl+iIZ6nC2ugCC0+sJFTQise7Ceg7+glOhLNbteBiid2BJyBp8W3SYLl23Xtdsdbzrj2d8CPjc6AhDd36FMURAldgAbVVN6GdLT/h6EZ2xlVNP1ifntuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3babcb-9e9b-4f4e-e7ed-08df13d4b219
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69AE895C5.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:27:15.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1hdBTLZJpx3WzwAU4GIiPJUvyEKdsxhVv3V+6m028admJdAyso7xs/4GBwSZ3l/yfZBTJa+Dzb1V/Ye+ztHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2026 at 10:27:52AM +0300, Jani Nikula wrote:
> On Wed, 16 Sep 2026, Imre Deak <imre.deak@intel.com> wrote:
> > On Tue, Sep 15, 2026 at 09:48:14PM +0300, Imre Deak wrote:
> >> On Tue, Sep 15, 2026 at 07:06:20PM +0300, Jani Nikula wrote:
> >> > Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
> >> > export the symbols to the kunit namespace. Otherwise, the symbols get
> >> > exported for all the kernel to see, and the corresponding
> >> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
> >> > meaningless.
> >> 
> >> Yes, these symblols are only used by kunit, so no need to export them
> >> otherwise. Should've thought about it while typing the above
> >> MODULE_IMPORT_NS():
> >> 
> >> Reviewed-by: Imre Deak <imre.deak@intel.com>
> >
> > Actually, the symbols are defined and exported only if KUNIT is enabled
> > without this patch already, as both of these are in an
> > IS_ENABLED(CONFIG_KUNIT) block.
> 
> That only gates whether they're exported or not. The change is about
> exporting them to the kunit namespace when they're exported.

Right, so in a kunit build the visibility of symbols was still too
broad. The R-b still applies.

> 
> BR,
> Jani.
> 
> 
> 
> >
> >> > Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps funcs for testing")
> >> > Cc: Imre Deak <imre.deak@intel.com>
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_dp_link_caps.c     | 6 ++++--
> >> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
> >> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >> > 
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> >> > index 98657aa4d3d5..abec3e2519ca 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> >> > @@ -3,6 +3,8 @@
> >> >   * Copyright © 2026 Intel Corporation
> >> >   */
> >> >  
> >> > +#include <kunit/visibility.h>
> >> > +
> >> >  #include <linux/bitops.h>
> >> >  #include <linux/debugfs.h>
> >> >  #include <linux/log2.h>
> >> > @@ -1302,14 +1304,14 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
> >> >  const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops = {
> >> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> >> >  };
> >> > -EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
> >> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_caps_test_ops);
> >> >  
> >> >  #else
> >> >  
> >> >  const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops = {
> >> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> >> >  };
> >> > -EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
> >> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_caps_test_ops);
> >> >  
> >> >  #endif	/* I915 */
> >> >  
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> > index cb92cff90614..9a692f4fdfee 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> > @@ -2825,14 +2825,14 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
> >> >  const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops = {
> >> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> >> >  };
> >> > -EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
> >> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_training_test_ops);
> >> >  
> >> >  #else
> >> >  
> >> >  const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops = {
> >> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> >> >  };
> >> > -EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
> >> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_training_test_ops);
> >> >  
> >> >  #endif	/* I915 */
> >> >  
> >> > -- 
> >> > 2.47.3
> >> > 
> 
> -- 
> Jani Nikula, Intel
