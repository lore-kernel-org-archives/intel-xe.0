Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8850C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31010E714;
	Tue, 28 Jan 2025 23:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqFJgbKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7010E714
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738105514; x=1769641514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1JF9YZmtekStJVEhgT3jw8bDDxeZ5Tr2iB4eESaCclA=;
 b=aqFJgbKa1H7z1pptKD+nPgUzGLYg95cM4gJMZjT1Gbxl3gsWpzOHbzGX
 NYKof/owaETLcBcmLya+oj2Vw6b+1Rwgk4GSvOLHdOOdqpPgQa1x8Ri3A
 /nmedjmrkKkS4Ap8mlYlMA1KWPGUg1ZjStLd6txv7A0RCX15uDZB9IBWr
 r0G1pl6/2q1ITFxAbYauTdzqhd574rXgp1R7sdTF6FhwJAeqyr21C1uaC
 MJNvD/9NLNya75RU8fgy7g8QzBUikqvYsJvdBaTEZI3Vgf977Hzs/eilG
 QGomqwiaLyUiOXVmUF/uxl59d45BRdOgANo/8+GbHvx6+Ap9V9tfYMi/7 g==;
X-CSE-ConnectionGUID: H5UUSwPsSIOVtTZGx4Ir8w==
X-CSE-MsgGUID: zn8UOlxmSFO6Z6WR+pokYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38640714"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38640714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:05:13 -0800
X-CSE-ConnectionGUID: MMEeOGhgQjG2LugeTs8C5g==
X-CSE-MsgGUID: Ul3CYcVCTgmP/7Xob9Yd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113488937"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:05:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:05:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:05:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:05:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWN5zFM6TcyA4lQfAHAaqXFCZwuXLvGRJm8bN8Fg5JhRuXkpcdbtHZJGWzkAQsLNjYv3VeVrFLVgolncBGtjW3Gl/hFdB6PEPmm5RGv1eY7jJzNkBUTB4uwwWVz3bMgKrFBdE0Nrbsc8Dzed2KgOzztKoZ2VUgYVAj4TewTp+xgNlROuOvbD/fjX6fkBv6qWL14ACeAaeE/g6ZlOHD0bcd4534h+6zQk8lJPkqzVxPXf1C/AXg4bhGCYKvPpl/ZZkakOJp5gLKdq0TdZwGaz0pkLGdXLq36E81ggpMjpfZooaKIgGQQRTNexwwOYD//p1RklZMtcQ2BcTPjWpFn4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyAHTKr2yuWsB+jPnuvU/BcMhn2Mdb1tcIi/Ufu8Lnc=;
 b=m1+ZXFtB6lCKzEnxDoRpT/X6CW+eCHByvTHyhynrVdT0ND+yCKt9P7gIH/2l0FmrtVYRv2F3arZUkOCUD2CyhnBDx/tgddjFsSxIFGxKMJXFRjX49rGlEEKp4wFtZBTZjD0RoP43wv13tMGjL9TwbQ6U2/afvGZshfRiSvs693AXSq61V4z+cD8JCIbJJKj8QT8sEFH6gPw7aIU8V4Eb8zNsA/QSKCuLYfpT+wzT1ZNCd/q0wQCA2Dm4Cl0L1/BKtxMJ6b3wqSfw+mrSp9xCVVuY8Xd7j6emrs6hDT0cgMd07FdSzm9p1/ew7S6HjFFcxMkwkn0N2vl6YZ/0o9UMCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 23:05:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:05:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Topic: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Index: AQHbcdDvqYrfnrTvy0ydT/eaJCNIarMsyrwg
Date: Tue, 28 Jan 2025 23:05:07 +0000
Message-ID: <CH0PR11MB54444A1F483FA6DCD1D8C476E5EF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
In-Reply-To: <20250128222145.3849874-2-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 33036f30-5b8e-487b-7e46-08dd3ff03585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K5rQBBVbhUGYzoFBWMQF/K6/2kcr8sH7OLDjiewYZbXWPYQYJi3Ttndxoqx1?=
 =?us-ascii?Q?NmW6dGniFRIB8Wq/L/XzjGIGpc48sgl9DNQR2MAZtGK4hD2pIQfYiuZdLp3K?=
 =?us-ascii?Q?0zYO+dUQ17ZaF7mFRXivK36gxal7IDvuuZzibSBGS1sqzcYHESGMj1LwhaCM?=
 =?us-ascii?Q?tuTYfWfEdEFVRhW3BWXn/B2u6lTbj1Js6PU/ViVrn4EKRlFsSS44aR5+0VsE?=
 =?us-ascii?Q?vg76Yv1DBcFJDnugG9GF2dOwh0TG8grEWwiM4duu7quouUBTJSABsbftG0gU?=
 =?us-ascii?Q?wTjTHI66tmY1YiRhm3ClgM1GQjoHeDLm03QPJMy04Zws5WFPGiVTFRac2hEP?=
 =?us-ascii?Q?BE+GSlnjs3F041UmVxANMXc4gauhPmXuOXRrjVGx+bsFPzV9mkvwedNd6q9a?=
 =?us-ascii?Q?F8V2QV5llBj3b3FQUrz9Xl6KB3WgE0OjftR+czR6Pbse2MyOY4F+6qkxoUN+?=
 =?us-ascii?Q?5K+nQGfvdJLlCyBHteGBWq0ocFmt5h7IMrunRc3fioM10lDEo4ddGGd+8WhC?=
 =?us-ascii?Q?cWtGLb7VbbBcR8sKi2DGj/pmvNRmRwk2zuXfsuTYLKMhNg0giFV4z4sasLvx?=
 =?us-ascii?Q?sP8JOLp1e49O/jlJcusAI6HzQ0N7cLjbjcxUpAN8MUy70jr0CjX2K5zkl3Fh?=
 =?us-ascii?Q?7rld6axHbudlCye22AzNxXBSL2KzpyeJgjRPrcqWpxdtqfdOLanA5xMeyotk?=
 =?us-ascii?Q?eYZFjJLNennNJbp1NSJXgS282yjtW8qGWO/PHMwZAk1DizbW72QKYSTQ0OBI?=
 =?us-ascii?Q?sRJdnOhW1rsyosJk1vXDSMUPUXaj2p9FfGzPaPzE481dj9sLgua78z57kVX+?=
 =?us-ascii?Q?bEUOSVV1e1nID6ckih2T6EcDcg69DQG9Qe42KbUBDuMlGRe/dKJitmGgvCpp?=
 =?us-ascii?Q?4wD0Ueg5YioJpwD2qyXiuqneItKxug+ujE6nwv2K+HWKmGWfaZVzo4NVGzaE?=
 =?us-ascii?Q?k2ExLt/7nAglNpnm+WgLdPlOsCmKJee4IleV71OqJIAJlMjANk/pub5eRK5e?=
 =?us-ascii?Q?QybEwO9p2hOwOWvbA+gMs83aSbJ8Eu0HBfq0tDyZdry+xHalmR6gWmbMjzZH?=
 =?us-ascii?Q?ASjCAmWUaSZryaeVpVwB2ty3mjXS+fncoxQWIo1CuAYzvnIelopWqMe181p0?=
 =?us-ascii?Q?nnf+nkvFL032iOCGupyzD+InPEc7YgwlN9p1g4dpKWiqsjiXL742Zpd0UqMR?=
 =?us-ascii?Q?YRgI6zAHehJzY+7Yj8kDtiZ6cvf7l0GH1VqUJE6cueIFhUsOD3+GSUHLLFEk?=
 =?us-ascii?Q?TM2RXznerOulebMNuHC9lMfgeS8468Gg3hG/9cNJzONRIS24q95z60jPdNk6?=
 =?us-ascii?Q?RJlwEFBqWVG0r4fQq0dGg+ByyTH71z+eE1ORJyVCxtL/vHK4IcFzSGit3qQ3?=
 =?us-ascii?Q?WHuvGTS7YRJ9jMSzTLIb1vmq5RQC68Bgob8y+yNqZTP139IdvAhYYnDQy9sP?=
 =?us-ascii?Q?/n6FsPOoEklV00TMezheZMFT1xvsFOJh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rpIGCBVlfyBTyf5CfEK+Z123FVmVJ9uoIyuXUGbEhuEL1h6Y6iT4BrjWWM9U?=
 =?us-ascii?Q?df05pyZm8RCfiFGDeBliBMQ4F4VtEZai1NN2JNbU+jOa+VFR94XsMpuWWJ6Q?=
 =?us-ascii?Q?qWP4haDfWMOanYCYT+5aNaXuh5V8c8TiaUDKV1iVoUxNBcEZCJfJQshviUWa?=
 =?us-ascii?Q?YPbykfqS5VwFSRkLni2KIaf1217AeswxYz0juCYnxKJp4tqfyEp0gSIr5m1t?=
 =?us-ascii?Q?VgQU2BRP57H+1tel/2IoSSyWoh27ZB5JmoLtsTh5lQIfRhWFpgyIArKnM+No?=
 =?us-ascii?Q?AC5RByFfVLMyXEEfNsXHeGx+dNzXVO/BRPRZ+yS74vdjHgbyiZDQvkDvKV17?=
 =?us-ascii?Q?IgByVAsbujkul3KpijgO+lQAXpNcptCwcwcaS5STcOQLIEIH2y11UQxgbch7?=
 =?us-ascii?Q?C4Ph10JFOTYDIQB+/GlT7k+2JRnNAQy8FoLKY5HAcHI/d36soArMwcfyiYTL?=
 =?us-ascii?Q?vScMWyAJIgyUkQvsQ3yXsOYAw87QOh4koJrYqJGW+DTr4XhN/i4tV7b/XwDl?=
 =?us-ascii?Q?Svc7ALaWjR2xsLQd6B6is7NYRRunyaWHltY7BuN/61RCm7bW47oQXmOZzDyq?=
 =?us-ascii?Q?Wg+QVCFoH1v1LKDINKvDCAqW063YyXxtfLqmTrHPTBsOPABrTAdILVGmUk24?=
 =?us-ascii?Q?Agq7jVytGW3rzejaeHHWCRnXbsAk7t2j5GL+rrVHZvlfwFGw2kfNBFDDcDIB?=
 =?us-ascii?Q?aI2XmWNHRD+0kAqauGQKNlYzsLwAgmdHWgUzgp211KolrXguHezM805ANgxA?=
 =?us-ascii?Q?08fasE5thIlWKqhfSfiIDm0jxFQr7X8xWwUfSb1F869m1ROefi2aiM+zcHCJ?=
 =?us-ascii?Q?eL/zdQMUTNz7ePlpQZyWj6U12YmvQeANhy13sApUA7f82ZyhNVRg1C99Q+mC?=
 =?us-ascii?Q?OyO1ChthH927kDArOVZnShq6EG+UEufEXdTFxTVoIQKTiVY01IzM0jbY+4t5?=
 =?us-ascii?Q?4nprIND+FyVro1DKjy2wJWwLymZTBTp4rQxnL4CYgTN8YuBroDwYIRX8I0Ma?=
 =?us-ascii?Q?aOf51FSdBh52SDWuwjcIPWRSUxCMyfJjhdqzfMs+lAUkNCKM3V37dS6SukbK?=
 =?us-ascii?Q?NZaF81puFM+wi9hhL1pK/hWraqZA4IIAyCiD6nvQCuez1kWDX0D8JtwzNVWl?=
 =?us-ascii?Q?iMnvMs9P8Ju5ErLHEh+hEz7SB+yOFtzLQzIsp/o75njkryp//Gt5XOGSL5S+?=
 =?us-ascii?Q?xNyuwfJFGOnY0jUx1600+XWfNmAtBoGH4FSoXgd2nEYbLZ1MyFVXJebS1/32?=
 =?us-ascii?Q?uEUvDH+Lwh8x/zcGbZ0BpoXAgH/sR53L96l2c+2FUPDFxBGuQjW46sRC8I6F?=
 =?us-ascii?Q?KkIa6RJ5yP4BHg6Ovbnu2AauX9QU0Y+om0tufSB0KFgQQqYB5fZAx9Q/cC/J?=
 =?us-ascii?Q?chvbjRZ4wJxuMiPIm+5qwO/gGbcNeEUhf/v874TUELBxDf0K4tuG5FqbBWb3?=
 =?us-ascii?Q?YAxz2qlS1nh7a5nNPO970GmSSze+9HqJIXw0qCclRro5e7hoBSKD3YfTQTtD?=
 =?us-ascii?Q?3GzVockaoTjEKkzboNLPjXmpF2rXSi94ADWdziiKBhz7Whp6ercZGTN6kRQG?=
 =?us-ascii?Q?Fw3zier3Ug26wcZ/e5aCWAeyQaYmHppqbuKFOQjx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33036f30-5b8e-487b-7e46-08dd3ff03585
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 23:05:07.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdCNyZHJHyaDfeyFIP+YfBZ835j5xYjDmu1axvPSEzSaOS6QMbey75lCAjwPCHniqjiY3ld53bTrH4c/NWOEFl/2t6uWEfNZRP9PDwINPO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Oak Ze=
ng
Sent: Tuesday, January 28, 2025 2:22 PM
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com; Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
>=20
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping before vm_bind for the vm_bind
> address range. Under fault mode, we depend on recoverable page fault
> to establish mapping in page table. If scratch page is not cleared,
> GPU access of address won't cause page fault because it always hits
> the existing scratch page mapping.
>=20
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
>=20
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 690330352d4c..196d347c6ac0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
> +#include "i915_drv.h"
> =20
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -2917,6 +2918,34 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_=
device *xe, struct xe_bo *bo,
>  	return 0;
>  }
> =20
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device *xe,
> +					      struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe)))

We should probably break this platform check out into its own function or m=
acro, especially
since it's being mirrored in the next patch during xe_vm_create_ioctl.  It'=
d also be easier to
extend that way if future platforms also need this functionality.

But other than that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		return false;
> +
> +	return true;
> +}
> +
> +static void __xe_vm_clear_scratch_pages(struct xe_device *xe, struct xe_=
vm *vm,
> +					u64 start, u64 end)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_pt_zap_range(tile, vm, start, end);
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file=
 *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *=
data, struct drm_file *file)
>  		u32 prefetch_region =3D bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index =3D bind_ops[i].pat_index;
> =20
> +		if (__xe_vm_needs_clear_scratch_pages(xe, vm, flags))
> +			__xe_vm_clear_scratch_pages(xe, vm, addr, addr + range);
> +
>  		ops[i] =3D vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
> --=20
> 2.26.3
>=20
>=20
