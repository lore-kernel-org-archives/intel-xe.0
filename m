Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7345EC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1F10E410;
	Wed, 17 Jul 2024 20:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDpz9H1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A83B10E410
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247497; x=1752783497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ObeAu5tD8V3s9vAnnUf5SDlQzHrt7kmgKab4cWkpGQY=;
 b=DDpz9H1f6iecaF0smVFOZFHF61kxtvdbW6DhbDDGTMzUkw0g9CxlAnLm
 7L+OY4I04atsex0ZqwbanuYUwW9eQvl5SmGyfYKipMii3J27925OPpYZ1
 7SA1kSA6FCO6hYX0InsYLV4MkJHpkaut5b54XUzSQ3m1UcgCi7plpKdXD
 o0JY1KXuMMgv8hPNXdkFSmLnbzSYOsZDYsDtF3AwIUi9j0GSCrcaqQL3t
 cb55jl/y/QQUGf/z545Jt6mybYyytxv9h67dV/5gKiqsEGk4C3keEzuoo
 Lxa4pnoPAkyyOavBLTDEYT+PxoRyeKjOuSkA6DJzT2vEqbtIOwiVUpM5B Q==;
X-CSE-ConnectionGUID: 6eVKFbX8TFaKQL/vSzKYYg==
X-CSE-MsgGUID: /sDr+mHARRC2A1azULwPHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18629936"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18629936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:18:17 -0700
X-CSE-ConnectionGUID: dvln5g1zQUSizdT+fwdi7A==
X-CSE-MsgGUID: HMerqx9+SIyfBkR51kV36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55033452"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:18:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:18:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:18:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:18:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shLXVSawvXhgP7IiFyolWk41hkfS71UnoXwkaezT6HdbdPtQvg9fds5Q7qhr+nwhzM2cI5MTyJjVNasHMEOfbxDW3ItwmjrPP3WqJ68xKsCJGW5a+sINAYinNmsPNxvNS1AKBrcpiYhaJysS98VGKpcr0SD4LbvB3h/PDiWAbgSPg4GjW7FAB+EeDeDLOfFUEJJX3zael8F+gS+/BZc8Wxj07bmcUHksWEHwrZ749rP+I1UHQylNU6il83gDwCMJmqEfDVUaw1ycEJHYVxbxaCPtBQfRZRjil3R6zqll1HjSHutXm54nSQOVnCWRI6RggcIcdikHOagRADcXKePafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pvNZtzNoZ2bA1d297TdqXFpG7LTtftgdpociH1YZOI=;
 b=StncUsc2ORWiEI2ZsX5MXWvB26hsYOlklQMUN0YztXQT/n06yc0ZZo6Qj6E+ToWhSltdlrdiPq4vXXV8NqzTw/G4xtzj14tIEuwUPuk5e7G7Y3cU4ENzRjvAQcS9Up+BJdgkgfqRQ/bhIosLeXok2JeHSObeNGpdosgpogP/NBNRrLawQKbWsUrG+pyc959XCYdKNAeGZfFtrBCerbr3uMYBQz2hWbMzdfHNAHLQca5pltwGBIXaIhykk4j1I8jTv+USyuzjt2zUnsVX13/9Dqc6Vma+FOiUVxTytfMcEyrzsxtnbVU+b44yVysgT5kDNtHZLDhP7utZWKkD2XAC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:18:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:18:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 6/7] drm/xe/tests: Convert xe_mocs live tests
Thread-Topic: [PATCH v2 6/7] drm/xe/tests: Convert xe_mocs live tests
Thread-Index: AQHa2ILjKNC1rbm7WkuND8XyQ1uaULH7W8fA
Date: Wed, 17 Jul 2024 20:18:11 +0000
Message-ID: <CH0PR11MB5444755BAC8A399E65234B26E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-7-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-7-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: 8d097262-b71f-4c5f-4ee0-08dca69d94ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DXMflyPFP+ytmdxxayg2D8XsiZmT7mtS9SGQaysf0Dbscv3PBxjgqUg2BNCP?=
 =?us-ascii?Q?NJxKZCxy0v13UZFviyWs+PA/MlYz7TvQEd1dqUDPz7lDNufLd2aETep+oDkk?=
 =?us-ascii?Q?Eyk4PeZVTv5mhjj4FobjC3v0Wc0oscs6aiux3vb2N9oNZTpEJXikYgGkl6KG?=
 =?us-ascii?Q?yVY/BpTc2atQGvRHzZnpOijHucsPzAZZVGDUVq2uMRSYFVdCt3v2iiX+ggAZ?=
 =?us-ascii?Q?6lbu/6phNN7/XPqkzimCd9V3u/Uyp19ZDIzoI6UVhNacUi7lRR2nYVySP/CC?=
 =?us-ascii?Q?pekDD4bcg9/D5YlYArxGUyFLeOB6nInJbgMUzySxzp3FfER6ZkJeJsSifON1?=
 =?us-ascii?Q?BiON4weFkF4dgobhN5iLFAZUzjxhei0Vid2UqqvesFCDX/JZXxsT0E1pljjN?=
 =?us-ascii?Q?HfdtNLRpj8YL8uDu32dvb2qXeXc1ZCY6aMcTWQBlyiyrIi1ukf/luQCSVllA?=
 =?us-ascii?Q?Om1MviMep4dqBwAHgU9G2/60v1S/Uv4uC3KEoFznbLI2DvEMPN4IJO1zZLUV?=
 =?us-ascii?Q?CoMA/EDnrAajNlk+PUvO6FG79FMKoALLJkNmwSzMOMbwn2dBN7XWFhKcQA/m?=
 =?us-ascii?Q?BUb7JxT3eHMopNKKne+RtcbKsbZLyXVBwHJqMaalxBwbSc9RTJ4UAwEK05i1?=
 =?us-ascii?Q?FaPpS8z+DWzSbkkY+8ubg55TK0x7TDr1HbkPH5M48dcpa37XmOIS03jKvHCh?=
 =?us-ascii?Q?RuUDMbB6czoH+Aoe2wFNxe8V5Xw9t3CQ8jshZxWaFgzLDacGEEQuyy/LMeOW?=
 =?us-ascii?Q?HQfGczm4+LKruaPTB63RaNi3zqK6hJoVAGYiPvOXGDQ7EZVMOpKRsX1fte+Q?=
 =?us-ascii?Q?czvyF8X7Pc1oX293/Xb1IAGJmQFvcQXQgdLFA5QSSMzLO7RLEby3C8RXVGzd?=
 =?us-ascii?Q?hJBnPf5jdezp9/D6CKBU9j46d6qwEOMYJjIGxXauwt4+EMCbwY3N+UzY0jRG?=
 =?us-ascii?Q?8/VP8r9nlExE7wSrnhdeTQ3/7p1WF/GEipm7v1ixRAFmKRbmIfP3vcix5Nws?=
 =?us-ascii?Q?ZrMKk81oMG+5MP/w7LmHSmZV4QLhxajZo80fza2JCXi3zsoOYjlKhKQGGMzO?=
 =?us-ascii?Q?lq2Pf7HiQo7doxJpdMN+eCZq3mBLCYOPO7y2IMpomFGxR5TpfnmSwWSMJTQg?=
 =?us-ascii?Q?JZRkZPVkhqmOtBeUfMMsj+2N5st4VjDoe+6WKiyRhGytCCGHqF7gULu34IKG?=
 =?us-ascii?Q?yjirbB4zHc3J9KsbUrYjGNBSEQf0BBHYTFFYyuxER2/K9LwtHoU993StTOTv?=
 =?us-ascii?Q?Oq/PIMXcFjGdUYyKRp5pEb8GHlDdQBwLRMBA7OnnMusutLW8nCb2oRGW0m/7?=
 =?us-ascii?Q?5/B7W/7Zl2r3U9CYoZtzKuN1WNruiOd8xjkb9TtkS1U8h2kjYqrfpiiEFDfZ?=
 =?us-ascii?Q?2jszAmKCO0spL2KBG3eQxfiXOhy1KOMoopiqh5NGS9RlTVQ0pA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7GsU8Yw0QzNuaPgJop4HtgE1wNzniTGFmkaE9lRmlET59EUzhr6gMKxIbifA?=
 =?us-ascii?Q?oNzr5CCmxu0jFCsmliUeL4d+ewvEBkbTtYYeYNXJvlpMgmlVab78Zs+YEz9j?=
 =?us-ascii?Q?/RpNXw7Y6MUKZi7jFfx3uJKmU47US/KnVrV92Nnw2H1T1FcoKla79OqqklBw?=
 =?us-ascii?Q?GBfggaOj2kjd9Uu2KXef9ogd103fcAd6hwz55YHH/9/twakmvod2ZDNMOE17?=
 =?us-ascii?Q?lPZaEEk8iaxhqM6o7Wxo6VdeG48nEeMYhfHTVZw5udXitvNe8NftYzEuAvsJ?=
 =?us-ascii?Q?qY7tF2QOFtfMaeLjb6b1FwI94Gpz1m/q/sRnRz+uFWlLaiHqoErtkSmTb+Pq?=
 =?us-ascii?Q?AvoV4jew+ZiUSpFYUqY5X7hlGp8WJNDKMi6Z2W76UcwT+R/p4ZYGUMuVhNGt?=
 =?us-ascii?Q?XmIe+3dua08MJNnhhKSJVbdGMVRvnPnrTU7fDQwl1bT81EG6Bs9g2HqDuK8+?=
 =?us-ascii?Q?gulbttfBOD3QHNBwkJSVJ7pSSYvc1m4HbvweqLmNLfwwKwjirS12hNvHIEvP?=
 =?us-ascii?Q?T9mkki+hS5BDCaIzmsS8js7FV8rX6dJXtxrd7CEa5q9oN9YUn8k1O/c+8J/e?=
 =?us-ascii?Q?l2YMzzB9azfNU6oDGQIGGj1pwWX2nqVLRi9RumVyR7ZwRsp0KHSgJfMZLacm?=
 =?us-ascii?Q?bLaIHbo9Fhg19r8eHtZ9GaP43ctI91xzx7/jxKS2oNWvedXtPpimDdJXP3L8?=
 =?us-ascii?Q?SZIbvL478JYhbNx6ObC0Pp/Xroye/O1BEKRYSAvKsfc0PFu6wp+f1vE80ObP?=
 =?us-ascii?Q?EwMdt86R0HMOoisqJTHY32n3RXFFN0/fJ17x9syfEI5Y8eZsEMyqKIEh7Zsp?=
 =?us-ascii?Q?Pmu5RRMLk+rePA2/2F5sfzloOlVwSPlg7JEuptvOCFCUZq49EBxtS2f1PKAY?=
 =?us-ascii?Q?UeaMa1+lTGoP+KosU4VCUWa+e9QUNdzvJuAUQu3+mi5fSlNPRVQ0Xp8EGaaB?=
 =?us-ascii?Q?rK1G7d00arzqnCWFz1thfiVp5AKQhAGeno447m1p9QWbgAqbJrOoXEbXSw5n?=
 =?us-ascii?Q?D/jaXwkryH5WdKJ7texksOkQmJ2I/0SC4jM8kkl7tkgL7cCfxS3mhZqzPMfR?=
 =?us-ascii?Q?c7cMMIlSE/41uv8qpLOZRcd0glZgGTj7yQ5UPNEFp8JWT5P3tWL6E70wA/O9?=
 =?us-ascii?Q?oV3u2H7xEzohTtmmEp0KXInWLqR2dvt9f2uDDX/gipYk5tIm8mZHu1hAxRi+?=
 =?us-ascii?Q?/ibtvHJJ+aJEzWUnOBxwtDe6C649+d+CPaZVcwStu7sTDY2IJ5Bno8WBktNw?=
 =?us-ascii?Q?hYiBoZJs1qXoqgsmYxI+frRcF4AQpkh+g7NUnfUCOjNOerCwWbX3jpJYUbiR?=
 =?us-ascii?Q?xWMrw9xCqHO8QCCged3Q7BPRdS69X27o00MoaQ3RrLph97INj4jp8YZ6T+R0?=
 =?us-ascii?Q?yq6eREzL3L951QkmEGQEfUQxFpZCR7FsSj6px1l2ulHQJOhq64EOKcJRrfeq?=
 =?us-ascii?Q?sStbWIHyRFTQSb8UzuIv4O2UJFOsRzF/qv6tTPra0i2Q232bbJd9+wApDB54?=
 =?us-ascii?Q?SoTdle4Y0YLLDqeVKR9voptrlxBf3Cpgy81jDA9d17UhvD35ErxsB+QCC73T?=
 =?us-ascii?Q?0DZxV4tN+e4FRygefzjyQ2HuYc66wCQN0shy+a64?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d097262-b71f-4c5f-4ee0-08dca69d94ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:18:11.3961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aowdmUWfdGwURoLzjE8/8zn4WcZuqLeinwZhw70hiATfrSIJs74LRT8F6DWQ66iMGKCe/NRS99mzo55bYUsIKz2B2ZKq+1mzVSFipvKaxfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 17, 2024 12:52 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 6/7] drm/xe/tests: Convert xe_mocs live tests
>=20
> Convert xe_mocs live tests to parameterized style.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Notes from patch 4 apply here as well.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/test=
s/xe_mocs.c
> index febc1d967850..19554019b255 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -6,6 +6,7 @@
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
> =20
> +#include "tests/xe_kunit_helpers.h"
>  #include "tests/xe_pci_test.h"
>  #include "tests/xe_test.h"
> =20
> @@ -135,7 +136,9 @@ static int mocs_kernel_test_run_device(struct xe_devi=
ce *xe)
> =20
>  static void xe_live_mocs_kernel_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(mocs_kernel_test_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	mocs_kernel_test_run_device(xe);
>  }
> =20
>  static int mocs_reset_test_run_device(struct xe_device *xe)
> @@ -175,12 +178,14 @@ static int mocs_reset_test_run_device(struct xe_dev=
ice *xe)
> =20
>  static void xe_live_mocs_reset_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(mocs_reset_test_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	mocs_reset_test_run_device(xe);
>  }
> =20
>  static struct kunit_case xe_mocs_tests[] =3D {
> -	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> -	KUNIT_CASE(xe_live_mocs_reset_kunit),
> +	KUNIT_CASE_PARAM(xe_live_mocs_kernel_kunit, xe_pci_live_device_gen_para=
m),
> +	KUNIT_CASE_PARAM(xe_live_mocs_reset_kunit, xe_pci_live_device_gen_param=
),
>  	{}
>  };
> =20
> @@ -188,5 +193,6 @@ VISIBLE_IF_KUNIT
>  struct kunit_suite xe_mocs_test_suite =3D {
>  	.name =3D "xe_mocs",
>  	.test_cases =3D xe_mocs_tests,
> +	.init =3D xe_kunit_helper_xe_device_live_test_init,
>  };
>  EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
> --=20
> 2.43.0
>=20
>=20
