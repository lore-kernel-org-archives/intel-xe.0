Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B164FC83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554F110E121;
	Mon, 30 Jun 2025 22:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkXJ/cu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6FD10E121
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751321325; x=1782857325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kuD3r2sJVHE4Vq+FSeKdoX95ouQPGZBQdieg+m1RT3U=;
 b=IkXJ/cu9+NRZgJRCqFySlfNgRyYPifON4NL+MylUapXIYpK9P8H0YWKP
 v4+5I/fClB97wmwgx2BdsqJ52clGHXoNQnVPPbscc4wVhbuglWqsbA992
 J/sGSTVpEmrkgYwg8O2BHu1XnxO6aZGR4qkc7Z4/jD6Qu5tZ4GCyB1ym2
 aGtCXnefTXmPyQK96yCibJDwwkib/RtMgEqxFjlWIJfX78pqL0ZLHHvIh
 1oOtR695kYlvATQXFANzDqCEHfqi0p798p6AlcOYzYyXu8GtS2fmHeUgq
 zdJBy1I/TKCYU5z7r8/DDjfI44LPhN6C75No/a9ofoXBv1cLF/W4yri0o A==;
X-CSE-ConnectionGUID: ntnAPnYjTVu8bkVLtRgS6g==
X-CSE-MsgGUID: 9DuZ8VDzRnWo2gbmATGOKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53706679"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53706679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:44 -0700
X-CSE-ConnectionGUID: RuxryAZjRX+aI0Z8RYEKtA==
X-CSE-MsgGUID: 2xT1fqojT2O/0mhdFcjkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="154108596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:08:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKzLeEQiJ33D4fCm3WvCbMCasW3NAeXUWCZsGq5sw1owX3rSl6hJk+gNfbhrgh9AybikDXBqcPHaXk/8U6z0s+hvac7O9wRReZB+L6mjPcdc2iCiBOqY6bulXnOZMZtZudHtElF/EQ8wW7o45gyMDral70nz41knZJ3vp1Iee6cncPaKlmXNNaIlrETjo4lTUKftEvScXuBAjG9hSFBjZS1BrJmnO1o4KMOtoKxQRThmV16NBn8kUQfjG3lfA4I49jEVVcjlL34lv95Ax1z9bLxp+5NekS3NByIAY6wl+SEkFrP7v8bnjeoYcWAJ5/z/sAnj5YsZ8l6B7peZ96lDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tum0RwVb4QLpGafZj9izC28S3TMFrAl57w2Cvte+PBU=;
 b=Vku4pF1tmaeL4yrJKo73FFbYWxHbgAQqVhLVYriSuK/+bbo9dgVAdf1L4Qjn+eivBpEEwJsZ/sh2UHHFytxTqwfqkDQ6/anG6/d7U2WGVCkBnyBmJuR2RLSD2lIsMRt1GuOlO4960kPPMOGm9fGSkAC2tJ6w17OTbil3U2TC4q5X3ZfOprt55OyfM3vDFhmN9YVDrJgR+3ktE5f2t0DYt4EO70OhYyhj467nPsO7zLj6WdEpNWZ2DJTLp12z/UdDJhkVBl6CNNaMeDQy2JAY03himmhzTcsrjObEkC06nOlgw6SmhKEvFVWbCHz40IdKKozJDtuQwVrkmmqTeBwxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 22:08:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 22:08:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 4/6] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
Thread-Topic: [PATCH v3 4/6] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
Thread-Index: AQHb6eVindU48xv3RkKUJn5PoYWMlrQcOHFQ
Date: Mon, 30 Jun 2025 22:08:22 +0000
Message-ID: <CH0PR11MB54442ADB44F892E4F34207E6E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-12-matthew.d.roper@intel.com>
In-Reply-To: <20250630173438.2342706-12-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH8PR11MB9457:EE_
x-ms-office365-filtering-correlation-id: 74dd5d97-eac1-4349-f3e4-08ddb822a0cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dKUzgfgYADinFWD5Kk8e9RzAJZm1AcAx5rZ6tbejz9UBgiu+otAszxKln9AZ?=
 =?us-ascii?Q?c0GgYsy4+SvW4C7fMtUOdCPSgj4jG/wPYOOXivmZUWFjLrd5A0yy4p0PXfLZ?=
 =?us-ascii?Q?4Ch3j4cGfkyCnXlgaMEe8aQlLNrBPBrCjnP5G9oiPnQ9i5Lf5B6X4uyHaAcs?=
 =?us-ascii?Q?fbbkMHoWwOruDE4QURVCuf/rurBk3B9i0atOfvchPsILfk2xdXr4QFFZFKBK?=
 =?us-ascii?Q?Ay5+KeszSwP9wbsDWzp8Fy/GaSpgvEfeGFLloBEs+hpUNdhhylx9OK1jv5Hf?=
 =?us-ascii?Q?u0y9Xu0bdxCGRqizyvWUknvFWgWe/8wF/eEK8O2faEI74cA9+G7y4GYjoLW+?=
 =?us-ascii?Q?xCkC4ilN5us0G+YV7TcWncRuE0dT+41Dt0KClPYogzvkbcLpGkBNPhT/G1lC?=
 =?us-ascii?Q?9LSwOOOhjh9XamsCnqLmpYsN2cfyp4y6Klrrq+YQ5qTnH86SKtwCWz9/R/dN?=
 =?us-ascii?Q?l9HPLjbaqZYIGMBDzaYIzEgUK7DzEcmV9fOPCi1Xn2siP5oSy9dfr0R3L81h?=
 =?us-ascii?Q?Oje07crlnXceyHbE3Oh0HetkKSfg4+GD0l5V1gD8gzqNTAkVVwIMUzBQYjZI?=
 =?us-ascii?Q?1rZABXuGub6wBJD4SnWfoojbRUL40b2KGEGg60FEtWC2w9Ot1tkMrrVJREiq?=
 =?us-ascii?Q?P8mTIWNvMEw81uogVVQEN0lUQZk/B0Lvj04M686CJvU+HlI31V/3P8dXeuvf?=
 =?us-ascii?Q?yOfUfr6mDbpGu/bS50GW4iTYxtivbVBNHxGxYTOdm1vBKPCLL5UwyS/XW4W5?=
 =?us-ascii?Q?YW6eTSUbWBy6N2FMHnUHc/DGyWRiX1OLHv37WjuWgs6mncdX1RWCXrdThl8t?=
 =?us-ascii?Q?AzbtZLREv1IfY4i0ekNuUaQIxOAyf2ABHuiABlpZhznxw7gbc9tWvZmMO/d/?=
 =?us-ascii?Q?EKKfn0LOSkp8xGgBp6xq1tOaGPmhFnJDrDvhhPdrUFPS3xpfXfVSXhiT9ExT?=
 =?us-ascii?Q?3W0CdKa6KPtYNf135njRtkN9EZaiNLAjLw1jGjxfMGjx8z7FlgOj36MQvTFQ?=
 =?us-ascii?Q?UPBKK9H7cHVejE+LoAKqYMLnGfgfKrBmN5r4aSIC57jNz0Z4Cg5TE5NooLvw?=
 =?us-ascii?Q?oaFwR4XCb8oYosPx1aMsQNW33U95QXxD6wZWCWKcKyUJ1nnVcfypu6aZFpds?=
 =?us-ascii?Q?KcjFBicXMz5/HAdKo2xdt7diKt6o4Ob8usTy6Vr+KTJtAuKWf86Cs7mv7F6S?=
 =?us-ascii?Q?0uA7pTROIVZhc56anOUIIIfToV19fEEYz9Tu8X3TU6G+AbTA9l42TR4U5sSU?=
 =?us-ascii?Q?uYHy/TmZEM/Rd+Pjte38d6ZOBcOJvM7lfuLD0WwVPo2qthfRE/bg++B9jTtx?=
 =?us-ascii?Q?S7PeLRMODgSCiJ3df5165x412W7Pqg/TYYYh6TiDRtNBchU/A+1l5ovvoCjP?=
 =?us-ascii?Q?I727Oc6uCuxCG2IfglsIXQW9B7I3iYN3AppKBQE4DFHVeMDCLPPTj7suWb3p?=
 =?us-ascii?Q?gjAabq5+VzACTbxSztnQYpgDTUo8zD63LJnwhzbiZDvBQGujvb7msw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?whevFNSpfATUxML52/EM/moC3mAATxbQu48KVtWqjAfIGG0V/mO9YIz+CIKt?=
 =?us-ascii?Q?b8pneA8o5vr0fQuvzSAWHOjSL4i7/EbzT/X6moEsfEifcYhvvVQzECWFDYyf?=
 =?us-ascii?Q?i41l/Obrxl1BBBADBbXfcUIx1hAAWQNZUht1Q65QLmzj4unZacmaF8fKC5eR?=
 =?us-ascii?Q?QWCCbhQ/3aYbOHWajl0oYPlro7sxtjdRSMz6gTHDgDrfcWknqAM8gGBVKqA9?=
 =?us-ascii?Q?yrUpWiFZCW0ggCk2dVqf9TLjSbEEVkJ5mFavMAvd1vA9LEETpCuX2NZoUmj8?=
 =?us-ascii?Q?kYt1Cq9W4kGP2nRgSpqgf/GP+46NSUO6fSuL2ipgVMZ61+WT8Yb4WzzhTBpq?=
 =?us-ascii?Q?tY9/jjAd+/LyBV2uv9H+nyKZip/YuB8wcOYL0parMwYZPBVJxHlNUJxYwAOw?=
 =?us-ascii?Q?ii+9AYlaCmyWnCZr5NkjDoyFa0mdE7fxXc2bqw3HlAvpSNpKiUJgvaqBtcgu?=
 =?us-ascii?Q?cHP+SC/t4h8NG+ClUbMNmTZQaJ8TlBDHbd9o8WpWilu2KW50cTfkibGGC8tg?=
 =?us-ascii?Q?yUkyOA8o8YDC7n2fyTL1hbO7zR1uJAvURJJeM2DfdJCKMMDUIoeSxqutpZgU?=
 =?us-ascii?Q?WgTA/phVdh65yvHxFpGn0Re4vNe5LKkKNwkczN4U/tigXRnoAGqclhPAp0/P?=
 =?us-ascii?Q?xQYaMDE/aLhg0iJugCq+aoVZT0JhdgPWsLosKrlLCOVcXSGdeOYrvN0cO5ft?=
 =?us-ascii?Q?GqJ6VA0H0VqLSntptsVTHAia7AhSN2STXywKJeNt+qJHLxBZ3Ivp2ZOHPB1V?=
 =?us-ascii?Q?t2mTFpyCIdVeBSkTI3mOvFhSHBz8xoiA7bFGDOYLiauy301zSbS2G8ErQ6J3?=
 =?us-ascii?Q?oN/QOggNso49+ImjL0CfvfMFEjieO9sXJQERxnyx1tr/HNOwRiLKkRnRyXP5?=
 =?us-ascii?Q?0QPSK7fN48vHLUZEJXC1R9InZWGgjRTgmC7xhFUzCKn1FnWNJwCDP5UWLvGJ?=
 =?us-ascii?Q?MjKRhsm2ZA4Uh57D+2KnnBeQV1R3DMqiQGZPoSIssEbe6WFwwH8N+zEyiF1Q?=
 =?us-ascii?Q?9FJSjhUNBHJkYgn4Pr7iyoHBRJug9jOMJoXDGvfaN072Jw4/gQmNvUFD2Ozg?=
 =?us-ascii?Q?efD/uuY/mM/l/ubIk9OJ6ea6PO/wArH3CxvNrEXk+xLWj9l56tfokerJIShJ?=
 =?us-ascii?Q?Dbdau+E7YJMeiA+lPFxMfT1rxCQFHDwXj+8mLaer1YmC8qqQF4+1j+38XPO/?=
 =?us-ascii?Q?vwzmpq1OWu+sC3wcqfKOWqspCTnQAAOag3gg45yKV3TEDYN+j37hpWcaJWD8?=
 =?us-ascii?Q?kLa5JOF34yQGP2iH5rmujhv/qW+OZntoB0311Gz9cmGdI4khKjvWdU74HZxv?=
 =?us-ascii?Q?FLtS0+AoW0pjFec4bs8RJDyjEQzHZqiFMzBLrW4PUUDZDGuvejhHwQZusDSF?=
 =?us-ascii?Q?Lat4Wcb6vIp3SdyI5tHW3GmGSz1u1Wzq+fGcMtkeKHtYARteC2srh94F/JTj?=
 =?us-ascii?Q?cWHujxUs8BBKr70yW9/3yABfba+/5hoPIRLrW0n/qB28Gva01bA3A70if3+7?=
 =?us-ascii?Q?QvhznwrFX1KAnqsH4dVm3sBlI8KHckXalvrFxwPEY8xoE0O2lEG5Iw7zAh00?=
 =?us-ascii?Q?bZb72kD0e3d/6BNBAYerJGqzJ1T/4s1afZX4vLZJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dd5d97-eac1-4349-f3e4-08ddb822a0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 22:08:22.2644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xstu9mUWLd+VKTAVuPFrlt5H2tBnhRyQwVxm78AdD4qh8FQJyzXJHASzS/wvQdELzdrXUkFuXs6pyebbFYm2fCO3RLoGfHRkg1DDdLmkY6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Monday, June 30, 2025 10:35 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH v3 4/6] drm/xe: Assign GT IDs properly on multi-tile + mult=
i-GT platforms
>=20
> Although "multi-tile" and "multiple GTs per tile" are mutually-exclusive
> characteristics on all of our platforms today, this may not always be
> true.  Assign GT IDs according to xe->info.max_gt_per_tile in a way that
> should work even if future platforms have different configurations.
>=20
> This patch should not change the behavior of current platforms; it only
> future-proofs for potential future designs.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_mmio.c |  8 --------
>  drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
>  2 files changed, 4 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..b65d888ee8e4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -82,14 +82,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe=
, size_t tile_mmio_size)
>  			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>  				 xe->info.tile_count, tile_count);
>  			xe->info.tile_count =3D tile_count;
> -
> -			/*
> -			 * FIXME: Needs some work for standalone media, but
> -			 * should be impossible with multi-tile for now:
> -			 * multi-tile platform with standalone media doesn't
> -			 * exist
> -			 */
> -			xe->info.gt_count =3D xe->info.tile_count;
>  		}
>  	}
> =20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 658bfbddf9a8..bccd81e19bb0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -694,10 +694,11 @@ static int xe_info_init(struct xe_device *xe,
>  	 */
>  	for_each_tile(tile, xe, id) {
>  		gt =3D tile->primary_gt;
> -		gt->info.id =3D xe->info.gt_count++;
>  		gt->info.type =3D XE_GT_TYPE_MAIN;
> +		gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>  		gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_ring_=
state;
>  		gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
> +		xe->info.gt_count++;
> =20
>  		if (MEDIA_VER(xe) < 13 && media_desc)
>  			gt->info.engine_mask |=3D media_desc->hw_engine_mask;
> @@ -715,17 +716,10 @@ static int xe_info_init(struct xe_device *xe,
> =20
>  		gt =3D tile->media_gt;
>  		gt->info.type =3D XE_GT_TYPE_MEDIA;
> +		gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>  		gt->info.has_indirect_ring_state =3D media_desc->has_indirect_ring_sta=
te;
>  		gt->info.engine_mask =3D media_desc->hw_engine_mask;
> -
> -		/*
> -		 * FIXME: At the moment multi-tile and standalone media are
> -		 * mutually exclusive on current platforms.  We'll need to
> -		 * come up with a better way to number GTs if we ever wind
> -		 * up with platforms that support both together.
> -		 */
> -		drm_WARN_ON(&xe->drm, id !=3D 0);
> -		gt->info.id =3D xe->info.gt_count++;
> +		xe->info.gt_count++;
>  	}
> =20
>  	return 0;
> --=20
> 2.49.0
>=20
>=20
