Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A0C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022FB10E101;
	Wed, 17 Jul 2024 20:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ag+iksOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278F10E101
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247330; x=1752783330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9mH9yTG8KqIe/1ddVtonvplGxf/w3euq9NShh9cfEcM=;
 b=ag+iksOl6fHiCMJ9DNZT7U+I0bznXO0rkLZwjvLIZ8KBgfl2hdrA/deE
 /kT5LISGu1scxB95hn0vAAXrYKGYsg6xz95NPiQW8o3qHdoX1F3rXm3+E
 zHC2qrG0qSynzPQcWHTzU7gVS+WxMhxQ2tfkKStuwgBY0UA5UfQNqcLm1
 XTlt32VOt6GnM8qsYrxIQgvjsUXJD/V9/3G6hWhCSvnEfS4mspQHUCaxs
 Suxa9lkCcj3pQF4iihWwGEBMFPzyUldz7tR0ZY1pd9kYqkD0ZdTw8t0gx
 S98Fm4XcL2QyumtlRap7EI0L6ldarlze+V0JhcyEzsU1Y72rJ2sT8FxXh w==;
X-CSE-ConnectionGUID: 9hcdrI7gTSuqLTaAnuudgg==
X-CSE-MsgGUID: jXAwTMKdTh6NgP4xM7QeaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18915893"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18915893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:15:30 -0700
X-CSE-ConnectionGUID: rVeez4eCRFya6WNEn+7X2Q==
X-CSE-MsgGUID: U4i2qnOjTUSv1RfB015QXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50380682"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:15:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:15:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:15:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFqXDBnv1eHLjsLtrJVv/2hyDizeR2lBzFXcVB/aYk/gSGSEC+X8f6ot4yH1rkYyzyJoJuk02CkjRDffHVfvw9VyoGYi5iQ0VxyvX/mCCX5+MHFR0ORzpoe8bGA9iYpacnxjCRWaTgtxds+/ENlaugThslYfKxSu6/unLZU7WoiwhIA3yhX9/BB5YMelUyB44YibeDuwxSEcvb49zRDEEFTqREx5wxsBHI/WRqnmytyB1LETZ7RyS5O8n9VzEM9hs1Q6tR6H2dfcBGfBjZxVz4D0iuI+HqfQilFLNsmzagSXUdpJLh4oH0gmx43cpoCPVyWpR4fPHqBHx/wdyM/kSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYxRJmDy0BWR7VNft2pX7WQ2Pau4Id5yiAK9lTr+590=;
 b=Yxu42oKZLt4aSajTM56w9NFWS3rhOcn5p7s6RQbU4QLbPJJ0goPg+KPy01KbLdO1LsTXO3kXz/BhlFlpMjcjYTb+ZJGy+9XlVm8cOgbJREyAD7ipajvP9A1zNjaPPugABYe3H27lKkVx47JdBfXD3KzaxEtXDgtpfTFGduiL6s2y/voG6i3x2XzlJeK+FW1KIwyl+6UsqeLCrDAO03AgnK8lEG+5VGJpiWzTYk5FATAbVdFMs715/JmubuM57PYp8+RA9e4O4MTAsHOo/3nguVH3aBjZVV7nOCnUY4fEB7IQBU1bepH1faxGrSheRyIFLECvQvnqG0unO2dTLfuhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:15:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:15:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 3/7] drm/xe/tests: Convert xe_bo live tests
Thread-Topic: [PATCH v2 3/7] drm/xe/tests: Convert xe_bo live tests
Thread-Index: AQHa2ILxHHcoW34gNkmzC22pR4uN+LH7Wt2A
Date: Wed, 17 Jul 2024 20:15:26 +0000
Message-ID: <CH0PR11MB5444503DCE3737433E81DAD5E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-4-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: 3f67681d-9403-4cfa-2e0c-08dca69d32ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oRrytggBMnXPrQ38d/5xKm14J1wO/e5SLmA5oXuHIyHg9rcG1bTV+5jQ3b2z?=
 =?us-ascii?Q?uxc0MQZ2DqGlYtYnWD5XgG/sYdxpnHFbD5vMZjBdTNXxfj/GldpsxpWNHKJr?=
 =?us-ascii?Q?Go6SSdNQ7O2A9drAyNMoP80XmmJVJ4rxIKjAH+EEnYoz5qaiougP+2wEgy9H?=
 =?us-ascii?Q?iT0cd42+0UD/R+UAgbXTcdH38SO2HhRqqE4ncWqWuLQvmVzl4Zqu9tKfHCRl?=
 =?us-ascii?Q?VOEuhKBAj4/99CfwBzskRwoHAldD1VR9TWzQQBLYfypT4EGKP+fi+i300tRN?=
 =?us-ascii?Q?CYnD8qSWZwpGkDifR0Hxh9hoY1OERfyGwWPbcgo0gX8JI57O9Bb4RN9fNn4i?=
 =?us-ascii?Q?i13MzQ6U3kBNT0hqKrkRv4/8iUfi2GeG3h62748P934aZEasXm9vUQHJTln9?=
 =?us-ascii?Q?8eWrvNSS4HGPECDD8mXqAg185oO100cScmG6SpKrN5gE38CFD3fGeb/JV2Yo?=
 =?us-ascii?Q?SFVtzofcszUXf028X9clBqYn+Qu9v1kS/M7gQFUySx/AgLo7sWuSAQVYUA51?=
 =?us-ascii?Q?OdfPZc+wO1fWkPX2ut9hyTR/Gp4YnL1J9Wa7FNZk6DDxq2Wk5hY2RlW59MEY?=
 =?us-ascii?Q?02GywrO1EwZQtlcGeB3LXhSBw0jFggqqhIbU/cLCdyBUmPJ18iXFD6hXfySq?=
 =?us-ascii?Q?0WCZPAiqKf3sP0RoAIEZglqx6420MudTHLiH++N6LKJZgVrp7sRZHgM+XNM8?=
 =?us-ascii?Q?TrgbMWcX7RwDijNd9tSa0KxfR7VqVdGw43CA5aSI1IHr82tJ5iAOwei2Clwv?=
 =?us-ascii?Q?dzwfgXRfDSdXIi6GwGtDnyfH9UoPYOs842jCXHom7vRDabc2HtGvc8/yiSZG?=
 =?us-ascii?Q?QLWZeIrLx6X/SNI2Ut1OR6K2rTys86DXn6WdybnDv+fsiDQgUE5KeOoRcxdv?=
 =?us-ascii?Q?/Az0Wl0NDRK3wVvWsuyfnt/NWVzNktyZgrPJTXQd6l+H7Hg//tZMR1KKLZh4?=
 =?us-ascii?Q?+ikNSM4L/McN3gQKKG9gI8ruCTO1yuc4Bz0SczWeBla3PgSH31ZYEw1cLgGH?=
 =?us-ascii?Q?Kncql2MpdmpilMjB1KMFJ35uW9PsyziR71+XTtPjUF+AqppNOn/twnwhA0NK?=
 =?us-ascii?Q?uFLviAGXhbZQHLArgWdIq5tORZmcACeN2cs8f53LjoTEgGzWuwLMM1r4SwwA?=
 =?us-ascii?Q?PzPvVv1rxR+8Gev5aIBUkwmp6Tz516kNnopU8fFi6xnEc+XfXaVi7xJzwqno?=
 =?us-ascii?Q?wXjG4N3GAXAHLSwkL6RGfc46QQD7b2CwP8VurxjUclOj1YppTMW6tmjUOkcS?=
 =?us-ascii?Q?lMtU1+EvY03d6agb4RkYy0xTucYqaoZWW3vCm8aR2KOMRLd3XKAS+fvo96MO?=
 =?us-ascii?Q?OnackxhidFYhXBZku9m9sJ3Fv4Yg7vP33l8gPZ82rdPYT25aLjizRC+kiK6c?=
 =?us-ascii?Q?/dJJ+BbbeiMJfFpbwKppYVh8xT2H23ooKwoUPvJWbSbAyl3V8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?swvBPn/4sE+yKPB4NPCi5FyfPxgZ164q+8ZYnbSEmWaJSZ9z+4ZXqK8dBWwf?=
 =?us-ascii?Q?ztOhybdMP0M2rOwp4HNsR5Sv48WFKdvdI50IB/uwPr39LePCcxNHDoDMUjw3?=
 =?us-ascii?Q?SqfEKGdZzE6ml5nK+R/25US+WhS/1yVdL0pM5GeFKkHfOixVieu+pewcijK+?=
 =?us-ascii?Q?zOUuxwsqv/Z15wLAV62zVk6AdbTPh5RGylz6Byfo7/IDcvVgzYhwkDVShhcU?=
 =?us-ascii?Q?87fshBy+WZ0Vmsise+ereG1zOFxATZQXJVNQqLHyt7yAAUSKE/XmCiPmETXb?=
 =?us-ascii?Q?hLdrgjBwaU9tvM8NLonofFuVDOwbjU+KJ/LWeUHMm6xfgEpiQWHbcG5Fah4o?=
 =?us-ascii?Q?oh/1HDFnGG0Il/JTsb5lp0/y1NjnFuFqwAtlBh0V26F3I95mboOZp2TCPbuc?=
 =?us-ascii?Q?JlGDc1fwlPVyH/Q9Wd2UpPP4f+kaG52pU3jIGKN19QTCfEQwN2ZIpHcsqQEc?=
 =?us-ascii?Q?6lZZ7vGlRvc9aeAgcUOY6oy7ji/bz8RZHTxfQLrvw3jinRbb13DmVO6xGeqY?=
 =?us-ascii?Q?3hP43jQHkP+z08NFwFL1e1sboazCCVcZT72fvOhyWXNUB3uYyBkdoJ96ov3G?=
 =?us-ascii?Q?wl5Gt65nBHlKwbkA1hYYn261Ckv7uxfbrCJ22oKtocU8dPMbxqUnnDZb849m?=
 =?us-ascii?Q?SsjFkyGeRLEPJTbE62M0A0y09RDkfvhepS9777zADyBTDPfBC74pMqBA5v4h?=
 =?us-ascii?Q?G12+9Gbvw2DOzY+UxiiHBKxkfYPRKHMsA7qmvZNgO8J8Dpr5GsHFTeym33jw?=
 =?us-ascii?Q?VLLT85KP1NUFnvivB6bFxHxWRqZ4vxpcqI16zLzKJDHuiMgR4TDPVFZB9PZg?=
 =?us-ascii?Q?ZPibSgJNaJyyoE4/Sf1PVVGIRx4gNoxaWfzVfHL1CKMFZe1TBa0mqhZ/azy+?=
 =?us-ascii?Q?cN6yj020X8WtNRiBj4yoIUUYo13DNz3RYlIQm/m+KlxpbCDXI/MtBsp5188I?=
 =?us-ascii?Q?93JyCRbOny7ip5A5qwOoR13yYycyMaX4RSnlEFKD9GMmSkMk+NF5RnHOQmif?=
 =?us-ascii?Q?CMKPXGDGwt5u2BDZ1+fQUD5xx4u7+Je/wqUNzmkNM2yvn1kCjxargUgKP792?=
 =?us-ascii?Q?sVGYBC1ZDrXnRzvxjZr7XDeYn6NeHam3nEfBwyGbf9YQeIGFpk4Ms3PAv3ey?=
 =?us-ascii?Q?2o7i4FBcurFRNX+kqEqs7QstoN1bS7l16epI6+ljiBzEEBThUMBjULnjPms5?=
 =?us-ascii?Q?AabM1GyKUM7iWiIopP943ob4ZgS1HlW8B558y5YeQRMZSISr557OHtf0WAQ5?=
 =?us-ascii?Q?w6iU3ZNqn1QnBpPvCVxgA8Yace/ms6kKriRoyPU1JwuPIQjuhtd4zP1SOgpl?=
 =?us-ascii?Q?75niQwPQxi+3FT1QXwFy56yEBa3rXWZ57HsOk74Iu4t3yV2lpsvCj9Bvwu+u?=
 =?us-ascii?Q?DXXRJfKdWFMSkvK6gLs6MRLjraevuf85aIJJV9Ixb6lFWEZVbZ/NeGkiUJau?=
 =?us-ascii?Q?E9JKhNbQ5pSErB1crG/H+unfkLsc8cNKb1hUkqouYGDfIW9RkMrq6bke9oQf?=
 =?us-ascii?Q?fhagDAGKwZVYwQn2MmUUh2TlgKL7WbMIULycgpCaw/z6V1aGp/AT46V1YGV8?=
 =?us-ascii?Q?ECyBpC9tVkjxlNyjN2Zt0XM6HXLuapsHTkLFLhR+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f67681d-9403-4cfa-2e0c-08dca69d32ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:15:26.9806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2+9MDkXyk3hretfondSGAA38kZIqatIZisW/2ZtvdCftkYMAm8NVs1fAlRHk0CvjCY1AiPX27hi98LLI7J3mE29zMKTMt14+1SG3r6q/YM=
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
Subject: [PATCH v2 3/7] drm/xe/tests: Convert xe_bo live tests
>=20
> Convert xe_bo live tests to parameterized style.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/=
xe_bo.c
> index 692e1b46b9cf..9620408f227f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -6,6 +6,7 @@
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
> =20
> +#include "tests/xe_kunit_helpers.h"
>  #include "tests/xe_pci_test.h"
>  #include "tests/xe_test.h"
> =20
> @@ -158,7 +159,7 @@ static int ccs_test_run_device(struct xe_device *xe)
>  	int id;
> =20
>  	if (!xe_device_has_flat_ccs(xe)) {
> -		kunit_info(test, "Skipping non-flat-ccs device.\n");
> +		kunit_skip(test, "Skipping non-flat-ccs device.\n");
>  		return 0;
>  	}
> =20
> @@ -178,7 +179,9 @@ static int ccs_test_run_device(struct xe_device *xe)
> =20
>  static void xe_ccs_migrate_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(ccs_test_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	ccs_test_run_device(xe);
>  }
> =20
>  static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *til=
e, struct kunit *test)
> @@ -328,7 +331,7 @@ static int evict_test_run_device(struct xe_device *xe=
)
>  	int id;
> =20
>  	if (!IS_DGFX(xe)) {
> -		kunit_info(test, "Skipping non-discrete device %s.\n",
> +		kunit_skip(test, "Skipping non-discrete device %s.\n",
>  			   dev_name(xe->drm.dev));
>  		return 0;
>  	}
> @@ -345,12 +348,14 @@ static int evict_test_run_device(struct xe_device *=
xe)
> =20
>  static void xe_bo_evict_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(evict_test_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	evict_test_run_device(xe);
>  }
> =20
>  static struct kunit_case xe_bo_tests[] =3D {
> -	KUNIT_CASE(xe_ccs_migrate_kunit),
> -	KUNIT_CASE(xe_bo_evict_kunit),
> +	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
> +	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
>  	{}
>  };
> =20
> @@ -358,5 +363,6 @@ VISIBLE_IF_KUNIT
>  struct kunit_suite xe_bo_test_suite =3D {
>  	.name =3D "xe_bo",
>  	.test_cases =3D xe_bo_tests,
> +	.init =3D xe_kunit_helper_xe_device_live_test_init,
>  };
>  EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
> --=20
> 2.43.0
>=20
>=20
