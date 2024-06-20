Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584EDC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0963810E136;
	Thu, 20 Jun 2024 22:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1yFylVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7078910E136
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718921888; x=1750457888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eFtZwPjx00t262cSGdU1s1WFQFZyb7PVOom7C4OAEl4=;
 b=d1yFylVlmqEq+evkKNps/yVZDyuFLla0cYCbI1F9jImpCdr/oO50UORq
 44zi2KjLegEBIz+p3RzZlp3gSRM5eo/BoaWk8Xp9iW5KmIsjWSAbmPP1d
 qskbDAwfOC/5zWMSnYL0CJbTmvgzVuQ5l2hjyj0BLMgga8OLj9DHIOehN
 DPN1GLOA9neLQdpPqpVBlA1fnbdZGsw5Rh4DNgliPbveHfdEmTL41tAok
 4H7QT8NytuKiP0GvkKmHwZK42s8WJBVarXvHDcBquoRxFJ8Mdlnan35Iu
 lSDvwR58eGXhP8W6iy3q0PJiYGvaEXKlOMYUxAnn82cBgCA1p7A6zmAAM w==;
X-CSE-ConnectionGUID: xhey26JcTQKMpKH02jrMCQ==
X-CSE-MsgGUID: l6pvsg99SZKpl80N3yqyLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15694406"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15694406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:18:07 -0700
X-CSE-ConnectionGUID: yStYaD1ESUmTiVCNhyagRQ==
X-CSE-MsgGUID: Ey2FlQA1S62OKqiF5V4IJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47331747"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 15:18:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 15:18:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 15:18:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 15:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjBN5mu/HOS6oZUQ9mOlYXET8md2yjPNZ8dlwTPZHv+Z1meD+gq35yfaJLxm6ZeqWETKLqJHNfLyF0C7M4iHv4w4ypA+YCn46F9AieEDtHFEteWhQ97hfC1SxLy/ZsGdKiqKxZ34MLmJnqwxAuuzNOFGi7YqxlxfgdQkRYZuN765g7RAPqkQG+aiES2H+L70ITAedyBdATbb9zGElFsE4zX0wZIHhNOa63qmk/bQPM5DmbBnpT8iWMYldakWfdxBpnWuF0sKQ3/XduArURx9m7AswYNLrr17QLeFo74xZrwekpNMlZgpt+70T3g8HtU4nL6Zdun5vZq9oIoir6qfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/loP7Y7OgLqTsAMOxlXEZxiJaU4HA+HvWD0fWLnhAs0=;
 b=dBILPXvYB3/kL+lkn57UEqAXirVnRwlFKW1bZodgUfhY9gL4DTDCZXmligdhplDYAd//EuM4gkPdsGb7N1tTg3OJCedeY9uOji4pUCl1QVc8df4u0cnxrze0E8ECa4oyg7oZiLB6URghp5CmGpv8PwRprjXR+1a9r0wuvLiunjBuOatb4V88mQ1WHiQG5fw7vD2Cv4Y+V4W018vAFWX/4L6qnEk7tmXGfOr5UYdF018kGKb8cxBwg4unB38QX7M4hlxgMcfMsflRtkzy30vtlHsuiOBsZdGXuwNyRLo11NSriOscLtmC2pvaB7t66TZ69heq6Cx+2xhFoyzOkgvlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 20 Jun
 2024 22:18:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7698.019; Thu, 20 Jun 2024
 22:18:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Govindapillai, Vinod"
 <vinod.govindapillai@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/bmg: implement Wa_16023588340
Thread-Topic: [PATCH 1/2] drm/xe/bmg: implement Wa_16023588340
Thread-Index: AQHawlV/gVpUiFG3DUab/t8n6Qp5iLHRN+qw
Date: Thu, 20 Jun 2024 22:18:02 +0000
Message-ID: <CH0PR11MB54443359360C0FCAB61D8350E5C82@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240619143127.110045-3-matthew.auld@intel.com>
In-Reply-To: <20240619143127.110045-3-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7108:EE_
x-ms-office365-filtering-correlation-id: bfe3ad53-f4c7-4cf8-3fea-08dc9176da0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?L6nlhs8lJnhcY4nDixR5fosHbA6pusivyIXnCKq2BMB+DLpPNr3M7V/DAGr5?=
 =?us-ascii?Q?d784fucNpWjNTsGCGe/vMMg37/3VWwJVID6J5GHhFxYZe6l1zw7bFny1uxhp?=
 =?us-ascii?Q?2sFuPB5lRI9nQqNxz4p+9YCWhsq/9kxdNeYOWMISBZYnaeWPvwhCg5vwLECL?=
 =?us-ascii?Q?w2Tojb5MI5ffn45IlHEYucDQSZsyBzzZ6YFWGMHJVz20Bd8/lEhbumIGygKc?=
 =?us-ascii?Q?5+m4vfpJn3Xy9ml5U4KiCdf/nRoTrwER0Xz+xSWVVdiu6ohuMj92f9SrrfIk?=
 =?us-ascii?Q?pjo8N4yEi3+D4agrIv4DscIK0mseW8vSFEKMR9U0j6ODHchoTdbcsaQ2vJ0j?=
 =?us-ascii?Q?qgWIom+jX8BKmONtVHoOXTVpxndUCEujcyCKUivrP1i1TbyxzncWjkFSgdPf?=
 =?us-ascii?Q?SOvmA5Wt6sbQo7xvIBF9MMl6fahx6gCJDCQnI/hwgx9TKBaQZmmG2c/KSq8o?=
 =?us-ascii?Q?1Oo3V7CcT+nj2adW0/doQuXj77JAcnelzjgHixD8qNCTNASd0quTZRxtE7dl?=
 =?us-ascii?Q?sLtJVI9N9PeSp8SxB5GUqR+RbbEPBJVO9eqB5z743JGDVxI6fWD+N6WyQ4D/?=
 =?us-ascii?Q?9G6OqD7uvbQ63yioY3dumlr0+7Rirk3ebw3AwM88RyWiFzwYbmDkL3edpw32?=
 =?us-ascii?Q?e6OMjr1mnpds3DwBLi0fLcBHPcA4G8QkdVsXDCfZJm07x0C9jsZz6iA50hhI?=
 =?us-ascii?Q?vtqMUy4Jyr13XFzFxQjBosaZ7bxqGjy+PzrkQaHz46PnJVsByR21cd02waGB?=
 =?us-ascii?Q?MC/bW0GC546wwEKSSsgUwDrol2pZgFY3tNM3CtYE+WDDjGBQh8G+71gS97UA?=
 =?us-ascii?Q?kNbQsrlkbTUI92gBTNPlML3ZoATABpzyqMe2pC8MDVQqAf2dW4EySuktChxF?=
 =?us-ascii?Q?V5BM0G18kyIU1aRutEpWu3OqNc9T8y+haEnM6Bw21WgDB0GBQwnf7OxGdQUu?=
 =?us-ascii?Q?ufXr2tNZXgjv4xVtmO1Tev13Clf7+CzyTN1dX3g/ofo9DD1jbZaVt9WBiPoF?=
 =?us-ascii?Q?gnCd0DgexgHXsEp8rQaXzasOqKQ21RceylMh9ZB6DODn7dNrB/UX9JKOGjTf?=
 =?us-ascii?Q?QMnJdF9n27ewmglcCj5pgW3icMv/wYXkdpF8EydVpzF/wErUWk7zh2H++eTZ?=
 =?us-ascii?Q?E50r3fVYuXGVJH2ypB9Ey5qw1uX30Az8pvnRR2CjRINe+1kWxVr4vm2BjPUH?=
 =?us-ascii?Q?WCzR86XnlKnIS9w4nOm0Zgkg/aDJAMI3P+wH7QOhiZ3Rivhi+1H3UrovbCw+?=
 =?us-ascii?Q?I5i5uzUE8Lq+BuT/KegMUaV2Rk8yYILq/rJAqYF0AjxTaM+dsMX++h3XY2gh?=
 =?us-ascii?Q?R3+EX8w+ELE2eGhOTES2E/zIG8vF70YbJlDcCnbUkNvoq3gc2H89aiuqhSMr?=
 =?us-ascii?Q?7ZPjAZQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KlimkiCfNwT5TA+V/5FZy6QxyQ7MuU1JPraBMrD5zChqTob6iZ2jX6ekbchz?=
 =?us-ascii?Q?2Ikf7h2onJmq2Trzrs5ugyRP4kx38bdnQEyhqnjZEU17gBOp9AnwoHjWKhNn?=
 =?us-ascii?Q?d8s9R4A0NPmiJQfGKGNNNDVrUtYa7vf7tadmyi9hqG+ZPXULXQ5ignvfpbdV?=
 =?us-ascii?Q?5c4SXFrLJ9nB2lzPjf4/Xk25TvGOnorChlgC/kiccoqb9t9eEegykscsZuyN?=
 =?us-ascii?Q?clkvM+kL46UzV1lAjlVk0Dg+Jvv4uNbGbgj/kjaHdYUOKWAtRToE8+jpcZNk?=
 =?us-ascii?Q?amxgWF3LcQrUyOzOZofxfx0A47qFTAikeXvKiO9c59OJCYIHlLGeIU8bHkTi?=
 =?us-ascii?Q?6IIwq8j4WW993Oe1Eh+/DK85i/Uc5RaqhzOJ+ntCk7vfd9eB3cnH/wILR18e?=
 =?us-ascii?Q?ZhCCYij4jQoPXvTi+NiWBUk9HZC7zAOH3UtTzYAvfTBeCPdR5v5Umukmg68R?=
 =?us-ascii?Q?Knpg7WotuER5LkLAeiwXkF7FqqStHC1z2BivGpwr/CZf5NPcDIwPae+I/aXP?=
 =?us-ascii?Q?lJj2kB5Os9/nRMu+4Ghq9f1u8EhafK/+SdiAjBY6+Sc3w59r3U3alDDTIzm4?=
 =?us-ascii?Q?NR4aCQRNyFCS5jKOxRCiiFCAmzgbtxtJqYO2Ey3V9OtTEOVm5UkpswWNZFui?=
 =?us-ascii?Q?RuUnrONCRwznOls5Zl89/psCdc9AgpQTr+KAExG2yoc2qRWYKOI6qAzMoQjD?=
 =?us-ascii?Q?B91kq6wP48htIkBSpV4kM/lEZCZ22k87hRxHE04nXF8NMMiCxMSGhKbU+E5f?=
 =?us-ascii?Q?wWiH3QYYXLfNv1kZCrbX+0DFY0jTOQl1Eddxoq12TCniiA3+Egiu4Xm7SjZl?=
 =?us-ascii?Q?5htFrunrUhYmAFCUmtMyWz9F6zRyCebou/z0Cp+alP69BkjPuSst0dBOFqHn?=
 =?us-ascii?Q?CRZWowhywVlj8Y7xAjqNX1kTx2ajZUpbOCBrYCjI5rk/vgcTUm+uaAxgLmzJ?=
 =?us-ascii?Q?lyQKzRcbMsRmIStxa/Gio+6Hmd3n4vey8JEvPChdqxDwNc9eE6yQsOrRkIA9?=
 =?us-ascii?Q?yRINGJ/BAPnST8i4EkpuMw6Jqr+kmaqfgsUxBMfG+0N5gFqZ8xQON5RMExKt?=
 =?us-ascii?Q?3aaYWO8cKsJ/wqZEMJ773KCGgRXX1hFIqsageegdzl4nf5fJailqu0LN7Xdp?=
 =?us-ascii?Q?7BFoGHU/Fs2rVtrKrsnOjKDvn7KYF6YzDl14R9sI4/mmu9tkVnFHuQkHICB7?=
 =?us-ascii?Q?KGcoT3Ra7ykSe6IqAykIY8nn2f6rjC3962NcGdR+hhISSqVhB6OQryghb9gG?=
 =?us-ascii?Q?CIcVlU79HGtX1nd3ugtgF0pn9Fyptj6cBD60Qokx9h9onVaXGxHSkZ9pmIBC?=
 =?us-ascii?Q?rGODKb8vSdZbcEbiDD/DHvsqI95gTBP8szQ7jOVqElbq1hmn3Gk4NveHzaGm?=
 =?us-ascii?Q?eTc1LfgjLFzp2RIwI2c5JR34SsDgrTzTEr7PpLirj2EnhNgl9gf5s+T8xMUG?=
 =?us-ascii?Q?wZEXEyoeUgKXW7UXrD++SI40foN7WO5mHmjcC4UC01xNvgw38fXceEfxr37O?=
 =?us-ascii?Q?LjwlZ5oy6+RYUYS9rxzedzj5p3c7KRZyPdK5VM+fKTiVPUns4R9ajgWZDEqn?=
 =?us-ascii?Q?xzZO41ZhzW4xFlcci8RVk73Zoouko8u2D/oDVnh/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe3ad53-f4c7-4cf8-3fea-08dc9176da0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 22:18:02.9558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYA8gikE/yD/TsRk3fg7P2mA2rTfXP/dAb/97hZYQ2pqaUp7wEO/xfTNQtxFUOHMLiwPQDxM2KdyFM8nmJRX4Aw1sZpM9yu57JR1/+nybMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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
From: Auld, Matthew <matthew.auld@intel.com>=20
Sent: Wednesday, June 19, 2024 7:31 AM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Roper, Matthew D <matthew=
.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Govindapi=
llai, Vinod <vinod.govindapillai@intel.com>
Subject: [PATCH 1/2] drm/xe/bmg: implement Wa_16023588340
>=20
> This involves enabling l2 caching of host side memory access to VRAM
> through the CPU BAR. The main fallout here is with display since VRAM
> writes from CPU can now be cached in GPU l2, and display is never
> coherent with caches, so needs various manual flushing.  In the case of
> fbc we disable it due to complications in getting this to work
> correctly (in a later patch).
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                |  3 ++
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c |  8 ++++
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     |  3 ++
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h       |  8 ++++
>  drivers/gpu/drm/xe/xe_device.c             | 30 ++++++++++++
>  drivers/gpu/drm/xe/xe_device.h             |  1 +
>  drivers/gpu/drm/xe/xe_gt.c                 | 54 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.c                | 11 ++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules         |  1 +
>  9 files changed, 118 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 20dc9759bb3c..0e16e5029081 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,10 +24,13 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob=
.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
> =20
>  uses_generated_oob :=3D \
> +	$(obj)/xe_device.o \
>  	$(obj)/xe_gsc.o \
> +	$(obj)/xe_gt.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
>  	$(obj)/xe_migrate.o \
> +	$(obj)/xe_pat.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
>  	$(obj)/xe_wa.o \
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm=
/xe/display/xe_dsb_buffer.c
> index 9e860c61f4b3..ccd0d87d438a 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -7,6 +7,8 @@
>  #include "intel_display_types.h"
>  #include "intel_dsb_buffer.h"
>  #include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_device_types.h"
>  #include "xe_gt.h"
> =20
>  u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
> @@ -16,7 +18,10 @@ u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buff=
er *dsb_buf)
> =20
>  void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u=
32 val)
>  {
> +	struct xe_device *xe =3D dsb_buf->vma->bo->tile->xe;
> +
>  	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
> +	xe_device_l2_flush(xe);
>  }
> =20
>  u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
> @@ -26,9 +31,12 @@ u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb=
_buf, u32 idx)
> =20
>  void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx, =
u32 val, size_t size)
>  {
> +	struct xe_device *xe =3D dsb_buf->vma->bo->tile->xe;
> +
>  	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
> =20
>  	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size);
> +	xe_device_l2_flush(xe);
>  }
> =20
>  bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_b=
uffer *dsb_buf, size_t size)
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index a2f417209124..240b59561fe7 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -10,6 +10,7 @@
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
>  #include "xe_bo.h"
> +#include "xe_device.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_pm.h"
> @@ -304,6 +305,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct =
intel_framebuffer *fb,
>  	if (ret)
>  		goto err_unpin;
> =20
> +	/* Ensure DPT writes are flushed */
> +	xe_device_l2_flush(xe);
>  	return vma;
> =20
>  err_unpin:
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index d44564bad009..fd9d94174efb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,6 +80,9 @@
>  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>  #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, v=
alue)
> =20
> +#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> +#define   CG_DIS_CNTLBUS			REG_BIT(6)
> +
>  #define CCS_AUX_INV				XE_REG(0x4208)
> =20
>  #define VD0_AUX_INV				XE_REG(0x4218)
> @@ -372,6 +375,11 @@
> =20
>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
> =20
> +#define XE2_GLOBAL_INVAL			XE_REG(0xb404)
> +
> +#define SCRATCH1LPFC				XE_REG(0xb474)
> +#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
> +
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
> =20
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 75d4c8ae9234..4d3fed0163ea 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -54,6 +54,9 @@
>  #include "xe_vm.h"
>  #include "xe_vram.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_wa.h"
> +
> +#include <generated/xe_wa_oob.h>
> =20
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -767,6 +770,11 @@ void xe_device_td_flush(struct xe_device *xe)
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>  		return;
> =20
> +	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
> +		xe_device_l2_flush(xe);
> +		return;
> +	}
> +
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
>  			continue;
> @@ -790,6 +798,28 @@ void xe_device_td_flush(struct xe_device *xe)
>  	}
>  }
> =20
> +void xe_device_l2_flush(struct xe_device *xe)

Maybe place this function above xe_device_td_flush,
since xe_device_td_flush uses this function as a separate
execution path if the workaround is applied.  Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +{
> +	struct xe_gt *gt;
> +	int err;
> +
> +	gt =3D xe_root_mmio_gt(xe);
> +
> +	if (!XE_WA(gt, 16023588340))
> +		return;
> +
> +	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return;
> +
> +	xe_mmio_write32(gt, XE2_GLOBAL_INVAL, 0x1);
> +
> +	if (xe_mmio_wait32(gt, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
> +		xe_gt_err_once(gt, "Global invalidation timeout\n");
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  {
>  	return xe_device_has_flat_ccs(xe) ?
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index bb07f5669dbb..0a2a3e7fd402 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -162,6 +162,7 @@ u64 xe_device_canonicalize_addr(struct xe_device *xe,=
 u64 address);
>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> =20
>  void xe_device_td_flush(struct xe_device *xe);
> +void xe_device_l2_flush(struct xe_device *xe);
> =20
>  static inline bool xe_device_wedged(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..32268f13b82e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -10,6 +10,8 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> =20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_gt_regs.h"
> @@ -93,6 +95,51 @@ void xe_gt_sanitize(struct xe_gt *gt)
>  	gt->uc.guc.submission_state.enabled =3D false;
>  }
> =20
> +static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> +{
> +	u32 reg;
> +	int err;
> +
> +	if (!XE_WA(gt, 16023588340))
> +		return;
> +
> +	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (WARN_ON(err))
> +		return;
> +
> +	if (!xe_gt_is_media_type(gt)) {
> +		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
> +		reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +		reg |=3D CG_DIS_CNTLBUS;
> +		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +	}
> +
> +	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
> +static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> +{
> +	u32 reg;
> +	int err;
> +
> +	if (!XE_WA(gt, 16023588340))
> +		return;
> +
> +	if (xe_gt_is_media_type(gt))
> +		return;
> +
> +	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (WARN_ON(err))
> +		return;
> +
> +	reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +	reg &=3D ~CG_DIS_CNTLBUS;
> +	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
>  /**
>   * xe_gt_remove() - Clean up the GT structures before driver removal
>   * @gt: the GT object
> @@ -109,6 +156,8 @@ void xe_gt_remove(struct xe_gt *gt)
> =20
>  	for (i =3D 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> +
> +	xe_gt_disable_host_l2_vram(gt);
>  }
> =20
>  static void gt_reset_worker(struct work_struct *w);
> @@ -506,6 +555,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> =20
>  	xe_gt_mcr_init_early(gt);
>  	xe_pat_init(gt);
> +	xe_gt_enable_host_l2_vram(gt);
> =20
>  	err =3D xe_uc_init(&gt->uc);
>  	if (err)
> @@ -641,6 +691,8 @@ static int do_gt_restart(struct xe_gt *gt)
> =20
>  	xe_pat_init(gt);
> =20
> +	xe_gt_enable_host_l2_vram(gt);
> +
>  	xe_gt_mcr_set_implicit_defaults(gt);
>  	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> =20
> @@ -788,6 +840,8 @@ int xe_gt_suspend(struct xe_gt *gt)
> =20
>  	xe_gt_idle_disable_pg(gt);
> =20
> +	xe_gt_disable_host_l2_vram(gt);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_gt_dbg(gt, "suspended\n");
> =20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 4ee32ee1cc88..722278cc23fc 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -7,6 +7,8 @@
> =20
>  #include <drm/xe_drm.h>
> =20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_reg_defs.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -15,6 +17,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
> =20
>  #define _PAT_ATS				0x47fc
>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
> @@ -382,7 +385,13 @@ void xe_pat_init_early(struct xe_device *xe)
>  	if (GRAPHICS_VER(xe) =3D=3D 20) {
>  		xe->pat.ops =3D &xe2_pat_ops;
>  		xe->pat.table =3D xe2_pat_table;
> -		xe->pat.n_entries =3D ARRAY_SIZE(xe2_pat_table);
> +
> +		/* Wa_16023588340. XXX: Should use XE_WA */
> +		if (GRAPHICS_VERx100(xe) =3D=3D 2001)
> +			xe->pat.n_entries =3D 28; /* Disable CLOS3 */
> +		else
> +			xe->pat.n_entries =3D ARRAY_SIZE(xe2_pat_table);
> +
>  		xe->pat.idx[XE_CACHE_NONE] =3D 3;
>  		xe->pat.idx[XE_CACHE_WT] =3D 15;
>  		xe->pat.idx[XE_CACHE_WB] =3D 2;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index 12fe88796a49..3152d869018d 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +16023588340	GRAPHICS_VERSION(2001)
> --=20
> 2.45.1
>=20
>=20
