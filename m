Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BC3C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 06:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E9A10E011;
	Tue, 24 Oct 2023 06:12:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285810E011
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 06:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698127958; x=1729663958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HSRbHf+fMtX2SEK5btiLZfSO5xIVqKV1zIZ8A94AyJk=;
 b=kLUcCdsdudeeH7yzArdro3SSjaIWASCLPuvexpQlE4oX/jjEplMPnDX3
 ob+1k5eIAPqHX0NE8XdUxEY8aQ5+2J1xzkVhObIJMdzmnnjHYN+Ifgti1
 /s5chP5qpfLNupHWD/uWDHy0TgwRJzin6VcKgAwFS12X6lSj8plKVALJG
 kqIQPsk6T1tPDho/XpOM+kKYrqOY2h/QBgnyOW32irOp7TT2f9HyG6Spy
 guCXAL3rOqIEEpW/zfQb8TNAXU8IuKLemBvepVtudzgpFn2Mpfd7vrQuL
 /Imx01qf7qptJSAluc8ctYUbwWbyHACvkixFsdHVqRzSfEonf7UtjthTA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367222322"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="367222322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 23:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793383807"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="793383807"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 23:12:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 23:12:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 23:12:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 23:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL0kmzaVDCtk7dcadUeJR1OtRmBh4hrtYPmpAmq4Kl39nuOcxM2eY1znMOe/qggiCI7JnUa8+g4apX1Cv5RuzoPaqcDrsDZve474UzE7rmbO6/Fu4TXgfrKDk0o1S61lsKarSFOTZcc4lFCuMhrMZwn+8fSp8/n6zvnOv/q8JQt3vwLNSxaAjlmtM074BAuDENyrYcOBHsOi1apw+0O2u8jmUURCpMRh3dl0O/9tYi6YveWl1Zl6k5zfwfvApLQ4cPD4THWWzdhsjqm5Av6wDiENWWMsJzFhI58nkg/YDdgHgkKfjg/iJj5BZchVi38Dr/yJNwnb+/98AmQjCo4qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iNRsxJ1TZqHEeiGC9OVy9g+FEBJyQG6bxGDa2ykDgA=;
 b=YjyVoL8IZSMRsy3qQNsM083UMTeOppp+rWruBC3ARMmexhJ+tn2Tw3jn2hh9YL0iL24vHXAWvIA3SGmeV6cR2NEDV6s580gZ2GPW/YDCowuQDwohskgxhBof+qLgLbjFMiEMfvEz1xEPGuP5xu6bA02xXOodSOnE4LSw58XsD3fWQnmX3TXZsmVkx5k+0Na3aIqIsgldJ4bI3yXxVdmbv9tyeL74ZKSQPjjrc4MO5Fj0mARdbxcH6mLlCb+baCxPH5fDWsVsIhLAqiH3OqruTUjICKqtD70gTUnd8vwDRjS+/v+V1LOECsABit+59P7HbV5y1biKpkHB4TOY4J/0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 06:12:34 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3%4]) with mapi id 15.20.6886.034; Tue, 24 Oct 2023
 06:12:34 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/1] fixup! drm/xe/gsc: add gsc device support
Thread-Index: AQHaBftmF3kk3g0adU+WbIHvC3QRz7BYdUyA
Date: Tue, 24 Oct 2023 06:12:34 +0000
Message-ID: <CY5PR11MB6366D62FF03A554CBC63E594EDDFA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
 <20231023215329.1796912-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231023215329.1796912-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MN0PR11MB6086:EE_
x-ms-office365-filtering-correlation-id: 3b48f799-ca29-4185-c91c-08dbd45836e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fTQ83pd+damcR1emkW+q5SfFqxEAOlbc4ZCNC+gRIDXPAbgFGwk+ByEuy4+Wcchn6ObXebjNBGKEC4FRe7WPex3WikMhIJk20dkBuDFSHFP9vjohOrJziLycXE5RWvzTbZskuRlrT5sZFrSeu6CQm2Z8WiNO3cIzWCZrGy4fJdjaf+ltP/+/ld65PQqSVZVQPRXjcJvkbXXsGs3JLs4yKQOP5nLFQGj9TFLcJR75mUB879r9K0x2WBvnWDKfNA4lhEudOQPmpLDvX4HWXUh7arn0/A2HxBvAKSzJL1V9AgJDKbyPIH5qSzKsN5goH7SI6z+hycYTT99GAVA0fHc8AJSLROho+yNLgpBHoS7yxYwmg4d9i5hLSxmJuVBDzot5pgYZURqOD6RDgOfPp8hVNJYc9ln2krbIZAUntu3wQGjMZQ5tXLcH4fuLAKCdDIDFtUtNPZUeLRBsnIAeoVnNJonGL8tdz4r7hdh7TbqFpkwc8k/XwRKSyLYHw8jWxHYoydC3BUS576nLd1CjgOF474SDVOePBGBzaGX8evSM8XE7mXoM8g2NmWCzMfbipXd5KMAPQVlIaQwaBlG29y8D+oq4DcuOf9nTgB3DScUx+BdiJrRPl+RRrLZSG0K6DnuM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8936002)(4326008)(8676002)(52536014)(41300700001)(38070700009)(2906002)(5660300002)(71200400001)(53546011)(122000001)(7696005)(82960400001)(6506007)(9686003)(110136005)(83380400001)(107886003)(38100700002)(86362001)(76116006)(66946007)(26005)(33656002)(66556008)(55016003)(66446008)(66476007)(54906003)(478600001)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ppM2998mISXAIZL3chw0vbgk9WN+ux1Ben4AWR7ADESQ6yO67jsSHm3Ftf3j?=
 =?us-ascii?Q?7ln+6kgjYhjIVbqCZTqmIYq3yPYYSO+j4QKBI4/guFY6eyELPfAL4LmNAOPM?=
 =?us-ascii?Q?yYvk57dcW13N4znkZxxKGuQrnEBf/+jHRjPuk4ITLsujY4B9FBWh76QbGN6I?=
 =?us-ascii?Q?6sJrL7oE19NitpVYfza+585g8qwzgBmuXalMyBPgisc1ERxrZoXt/14yKx2r?=
 =?us-ascii?Q?gMoj8sfA82ZEZ/iQyUluOy9XLG9HCMrx1GTe4a8RrXwQ8jvGG2hEX70KgL+u?=
 =?us-ascii?Q?5uwSFae2o85Pe0X0fuMH6F4vc7Tt2HfXfwaw2KvmVV7plZ0ylnHcjtz+/Wlg?=
 =?us-ascii?Q?lLDvp13sMiytU4YJ0wJWYVrI+gcyO8lHomGc9YzVqUwbTixu1m8Xk1HuRcm4?=
 =?us-ascii?Q?O+BL0QwgZ7byt0dmAS8rxbZXFySzZS38sVGHC3GPS1ABS3KPKmdRdpSe+Dw4?=
 =?us-ascii?Q?FsXi1m2uK0qYBzGAWTBz9NFJc5kjeYrjdktoHls9wdtgdhHBGp0WBXEHqJNl?=
 =?us-ascii?Q?IJ/GRrt/wpW+Z5ryBGuLhm8F+IOTdfTi10WFfy/NZBZezd49mDRl1Mc0PjQF?=
 =?us-ascii?Q?v6nbZ2lW0HNvwTBlZ45A72a1kNQrvYeRrodqZJHcuGnLHYfHnhk2zfqqCesV?=
 =?us-ascii?Q?f/h9TRSdpAyHHj+1Z17tNTvdQkU71v5SQhTuExbQGSvM1cJVF4UpzRdM2wDr?=
 =?us-ascii?Q?BHWDw/Y3WtExLtwwvNMJnbLh0iFp4LtWq1RfW75WMobIj/NUBnhFxACLexgL?=
 =?us-ascii?Q?aXm7uWsaYOFWri5ppHa/rEveUB0OsXIWlOEgxxio1RlriYZZLn6krgnKz12j?=
 =?us-ascii?Q?pYsG7jAxKc4oS1Fdbbo/IwTu9htAfX0S1F1oIpoKFNn2YrqG9Zj2NQ1IDCob?=
 =?us-ascii?Q?q32ok7Qwgz+wjrKNqJw0lXlAKhLAx5xMcQyTB4tEUV4ohyRmr65dVvwu81IW?=
 =?us-ascii?Q?ebmYJJZgrV3HU2/W7Zw49oqp1SW5KvD8lg1CYgOcalUy145oA79+E+PdTRE1?=
 =?us-ascii?Q?b1M+XF4bl2ISTEDjZ6MBPpnuoVfC7nukvxjAKiMV44gBj1isOejcswCVcrUm?=
 =?us-ascii?Q?xfs92R/VwIE2N1E4tucA/GXO4fNyUJ6c/r7JNVrhJxel20l+FFtTAPkDC9p/?=
 =?us-ascii?Q?YcxRmtXsZxOA3Ob9beXW43bJmACv2sUPMY6k4PrDxDmS1Wmjh00RPGMNfJsB?=
 =?us-ascii?Q?otQcO8ATn1dJ77Y+n0KiX5UzaxrpXNNpJOCyEoxC0YKbB3WVLjSImEjAuYGt?=
 =?us-ascii?Q?fwubQdTa8fvr2IQgIVzSnZPe+k2TkZHZhL7r+keocI+tY3lxuPQnWsRaonDI?=
 =?us-ascii?Q?R7qzv9Py/ZRB4O5GJUAO2pLSoqiuLW/2/bk1nA88ibfU39wnv/Ad88Pl6Icv?=
 =?us-ascii?Q?nEf2iUQl6rvqT4rDJtFjll9Zkh2rkhGavEW9cS95OWEyb9qxvy+vOEa/sH8U?=
 =?us-ascii?Q?ss8SrMFzUQpUPMMZL+oyjMR8w22NfnFulv1EyGYpvP7j1g7acQZd2KOcxtDo?=
 =?us-ascii?Q?6QjbZVygkQi1OCPRvZqCGpGHO8DDOWanUKMnbgppl64DobgZS9Br207K8GLa?=
 =?us-ascii?Q?X13boghokFVn6PLH2Ot36duTYNVN4Y6FEfgxVYHP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b48f799-ca29-4185-c91c-08dbd45836e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 06:12:34.5877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OGN0BnFB2OuQAtMPG8JHV5k2rEGskA8mZS/6uIlAERB/qBp3zYIYUVVXcQ8M+VVqsX/R6sgvkEalEcbQJqBZ89VhIOjgRYBEkoYfv5kSnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe/gsc: add gsc device support
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Sent: Tuesday, October 24, 2023 00:53
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Vivi, Rodr=
igo
> <rodrigo.vivi@intel.com>; Lubart, Vitaly <vitaly.lubart@intel.com>; Usysk=
in,
> Alexander <alexander.usyskin@intel.com>
> Subject: [PATCH 1/1] fixup! drm/xe/gsc: add gsc device support
>=20
> 2 fixes:
>=20
> 1) The gsc_mask variable is not set in all branches, but it is always
>    evaluated in an if condition, so we need to initialize it to a valid
>    value
>=20
> 2) On MTL+ the GSC interrupts come from the engine, so we can't
>    unconditionally call the handler for the GSCFI interface and we
>    instead need to check if we're on a platform that does have a GSCFI.
>=20
> While at it, move the GSCFI irq function call to where the other
> non-engine OTHER_CLASS interrupts are handled.
>=20

Reviewed-by: Alexander Usyskin <alexander.usyskin@intel.com>

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61..21d5273d7e61 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -142,7 +142,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	u32 ccs_mask, bcs_mask;
>  	u32 irqs, dmask, smask;
> -	u32 gsc_mask;
> +	u32 gsc_mask =3D 0;
>=20
>  	if (xe_device_uc_enabled(xe)) {
>  		irqs =3D GT_RENDER_USER_INTERRUPT |
> @@ -303,11 +303,6 @@ static void gt_irq_handler(struct xe_tile *tile,
>  			instance =3D INTR_ENGINE_INSTANCE(identity[bit]);
>  			intr_vec =3D INTR_ENGINE_INTR(identity[bit]);
>=20
> -			if (class =3D=3D XE_ENGINE_CLASS_OTHER && instance =3D=3D
> OTHER_GSC_INSTANCE) {
> -				xe_heci_gsc_irq_handler(xe, intr_vec);
> -				continue;
> -			}
> -
>  			engine_gt =3D pick_engine_gt(tile, class, instance);
>=20
>  			hwe =3D xe_gt_hw_engine(engine_gt, class, instance, false);
> @@ -317,7 +312,11 @@ static void gt_irq_handler(struct xe_tile *tile,
>  			}
>=20
>  			if (class =3D=3D XE_ENGINE_CLASS_OTHER) {
> -				gt_other_irq_handler(engine_gt, instance,
> intr_vec);
> +				/* HECI GSCFI interrupts come from outside of GT
> */
> +				if (HAS_HECI_GSCFI(xe) && instance =3D=3D
> OTHER_GSC_INSTANCE)
> +					xe_heci_gsc_irq_handler(xe, intr_vec);
> +				else
> +					gt_other_irq_handler(engine_gt, instance,
> intr_vec);
>  				continue;
>  			}
>  		}
> --
> 2.41.0

