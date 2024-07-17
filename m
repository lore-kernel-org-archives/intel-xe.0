Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98ABC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4B10E0F7;
	Wed, 17 Jul 2024 20:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr/SjLkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE7510E0F7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721246865; x=1752782865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uA8JxHDZTX45LQMNkPgyxGipSEJE4e4B32j1zfZQ7+o=;
 b=fr/SjLkEwBKz6uE8UbpWgtgfUvIsAGcrdK1M5nXvOlLa983SjaFd8O+U
 /wsA2CO/xyuZ7BNdlW1fb+10cDLnW/1jTzAMe+6HKSb2yUY6CUhD4t/Bt
 gCbvHKnPIEJQlx5+XFATT0OC/jPi2zsJ5z3LyNd7iGzkY6pNXx9KXlSi9
 5b63Ply4jR9qiwRsDfekgelitVz23WPezPntooPi/YkF7lY1Z1Bgzxk28
 zqxEKu8WrU+Gs/HtjPHCPrHgEGoj2Z5TiBV05rUe/4GQhy5fY5jsrErmW
 DUE1DxybS8cSQhusuiGE2PmhDevPArogCn3xaAYfuXU/NtM5WSAAITa5w g==;
X-CSE-ConnectionGUID: ImwSAttGSE+7Sm0tZpXYFQ==
X-CSE-MsgGUID: kwhBp1cXTG2btCMDKnZLSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18914613"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18914613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:07:45 -0700
X-CSE-ConnectionGUID: Dkl91aGHQgaMCNo+TDTo1Q==
X-CSE-MsgGUID: shALGPLzQ/OBxBX7yNAu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51233954"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:07:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:07:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:07:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:07:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed+5mNYdTXdp869ipfjcrq+w9uATkw+kp8C297EAusVXvSSU+roi1YPzzV0MayfqeJKbGvxddMPC1rgxket5//W8FGgv88CD1ah19ZtXJCpv0T/Y4ZhlwDDvKkoqDuFNpqJdaLZS7zrWAoNoGl3jCpjl8A0EooXwr8Z9s1PDLeenxPresAlx3+uq1Aq2dTY1l7fma37GvRoQ1wB9fsljbZfOHLxBgboJ1/7wkM7Z57QHlYYtvT/6TiNzQXXEF1cX+Y0WayPptJoU5quYEB+MUukQWkLPltvze/akoYa34cFdtqgC1MtWWMf9myFHxgF0FW/QIVXCU5SD2bv5pLdalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4fIS1ilGj9a3ai3eYqK73SDEQYWqktZLAHpYhlGjKs=;
 b=mmaBIM124FwP/OI4uFLckjBAFmEY5EPSDf8Ft806+5Qo5jDKX7SU19KLqbEX1//PtMpLjYDRjg4XRtG+y073DPwP/d6rGyvLsd3Encsw3pJ9YXPskp3Y7kq+Jz1x9Yk5Ih3PYm9fTVlaN4OzjG5eAAFKp/bFBFjNDSjelIjC31WtNRqo0+DxKm6yT/T6tr//az8W0E6mrFz0Bz13IfUYxHhuhuvOg4V1/dKnnmrXTHQojRJHCFjxVK6aJ5yF2ZAPTD+3G1fhImxHNKRwoxs1ADdNDfhi22edr/ogOr2X32qU8rIVniSLfF5jn2GkQ6yPignfjNWBikBm2tA35963WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 17 Jul
 2024 20:07:42 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:07:42 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 1/7] drm/xe: Introduce const cast helper
Thread-Topic: [PATCH v2 1/7] drm/xe: Introduce const cast helper
Thread-Index: AQHa2ILfKLxdLTOaYU2w94UfGDad7rH7VXdA
Date: Wed, 17 Jul 2024 20:07:42 +0000
Message-ID: <CH0PR11MB5444E1B66CFF7EDFAA997B68E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-2-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH0PR11MB5283:EE_
x-ms-office365-filtering-correlation-id: 78e73b7e-c3db-4131-6c1c-08dca69c1d9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kZSOsjA/z8vyq3TEfNR9iAxgnRODwyW7KPDJ9Dp/VFUyGgbJaEPxWJ1L2eKY?=
 =?us-ascii?Q?CiO21iMgEwagAKfwnQ5NfvfuECsKlYYdiKWBpnwxxwny3gHZIb6BT95lDjib?=
 =?us-ascii?Q?aO23DtCr/z6+5YDNZKFjCLlrcEeyH0Gg7AfHne3eaWq7Rg3z423PmCiS58xp?=
 =?us-ascii?Q?ZnDFBPcqxRLCCWVPTPEFf1K4UWL1iGdoKcQxoErUhLeu4IPVjSxb/fBvptUV?=
 =?us-ascii?Q?oqVxR0ZW047w9clajz4AWIn/lQYHLr5wAJg7yltijM5hCR0xmKwTQ7jlgdPN?=
 =?us-ascii?Q?QLbB3bA9R6TOCAeirgSy3ZYlG0vaTc2MEQqfnPIkADPcUs3qZjutWVTpyTOH?=
 =?us-ascii?Q?7GWOmygb876FLDehUwTQJBR+tVMPCV2q9VdcnmrncEk1Lq/OtgihKjSlwoFE?=
 =?us-ascii?Q?cxq+ZYm/KAUm00Zt2muaySkuzqy0YUsAAdHdOhmlvxGRndD9EUQ8ldStVf/v?=
 =?us-ascii?Q?Stg0jaNZT0M0OIKB3kxrCsPl9n6V/foIkVJ8xsQrS8qYZj85ITxU/TJ118Jh?=
 =?us-ascii?Q?X/tO3FaV84Uvg9GWT69E7zrizbmZtYfmPppQ3x/49sSaQe7uBwdi5x4QEXk4?=
 =?us-ascii?Q?ovsOdxu+CPvUODI3EKET+vR+aeWsOY8iY9SiRbvYTIBEYshHne1QMqhy7qqZ?=
 =?us-ascii?Q?vrx8s0nho8FLLpuG66EyIQZfIkozsM6BbwrdlOIogLupi8fzckjxJ5GxmcqC?=
 =?us-ascii?Q?rnsWLl+PgC7kAPnHgA/89ZxgBmRGGEb5zHzrtKEV/wdEESESByWOu+Xn5ZVM?=
 =?us-ascii?Q?FH7X7FLIWJXq9+dxaT2B5CoXkrHoKw8USWVHHdUZ2KDIgSME32Lt0sNz5L/j?=
 =?us-ascii?Q?zNnUxwQcXd2FrNe44L6ReLKii1bXl+ljD3QDm2/ixQ9PJ9cq+tfpk54RIdub?=
 =?us-ascii?Q?qexJOUplBH1LsnSp5ToEBJ9gmR1JA2tFflyLKZIVQeYCO4wc0TTy9DROtX/K?=
 =?us-ascii?Q?IRcG2ImyUtsvOqRDtSZUQGsVNQQb0tmO8G/emNLDKPe0qJf7dP2i842U7eoa?=
 =?us-ascii?Q?aMOWTiVoRvpJTgZS4dVkGcYpZbZJ0+jTvcFSY1jtJr9DZjGrSgvZZ5bHHUez?=
 =?us-ascii?Q?LZrhrFn8EywpuyleNJ+4LL0wDPLGJAMwLbPWMNpZkRYs1yxMwFeIb4O3GsdI?=
 =?us-ascii?Q?lw3oQOfNBndinwMA5zZMZ5Xg9BlOSuDDdp8XVhbeoK4inBJCgf4YB8IyuU/s?=
 =?us-ascii?Q?Cty0/w9IOZ3raCTcNizUgtGPhBJleKDVCZym3aFHP9D2hpuXwQKDoYRPH16W?=
 =?us-ascii?Q?E/vzBJ/ufxtq5oOpLosYsAB30VfBv7zYcUyvprFYUJ7NfIyVYEXQZmvgYq41?=
 =?us-ascii?Q?gcwsneEYQXlRftT5Dnr3D4jgqcxgb7Uk29FQduUTC83VTDvTg4LY2MHV6Sqp?=
 =?us-ascii?Q?qvSqV0k2ICeIf29FjF0IvKGRdewJdse4hEM6noRCI0Lr37R6DQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TkuaHHHLYuhnMVKQoKA/EhmzelVXDqkQxEP98KuiGGakPJtFhZgQNj1/GEvN?=
 =?us-ascii?Q?JV8D8GKmJS2gQc9V4Hf9NAikvj8dukr6X+GYzpm64bW2YuXmQM6AA4IZpdH2?=
 =?us-ascii?Q?9MIfPJPSTLHwh3LTUqS6Fge12HOmEh0pg9GQb9SW6ItxBe/93TubLEWle4Ij?=
 =?us-ascii?Q?BnEivRf0bGycRn39qoTTwPz6lwmOy0FgLzdIk5rSpOEdQVp0LDwcKTwz5Jkc?=
 =?us-ascii?Q?npV64wMkROCF6cNDVWaAkXfh9q6xkJq0goZdpG4BaJIxEjz4VNP+0tn6B0PM?=
 =?us-ascii?Q?KkQ7DPxAKgSQhl6s/N5RM4PxjG07SkNi+UZlpoAiCfkWc5EMfS+2YrrKaVfw?=
 =?us-ascii?Q?XPgpFRtLPgGVcOxG79nxcOSFz4/MRajlntWgRJ41VS0LOvzd0jLmWX9Iimqn?=
 =?us-ascii?Q?O+7fg/3ksy57Gstdoyj+I5Umaqt6a0Z1I/VDUUo/oHHfnqDqAfc6hYNAaUQA?=
 =?us-ascii?Q?Dhq7dsw73ssR9oUeb2rxhAowN9XASeFVhTueUm8zL3jvmxfZLlTjEUZ55GBW?=
 =?us-ascii?Q?TgOWruQRUPu9hu1fShO3We5H+QJHZuQWe7r/+F2pIhAu93U47vJV1iBUP+8T?=
 =?us-ascii?Q?LqsW54jueOHWNEIIWGbx4AO9RIQVqe9uRg8hGonkyoiiGtq/mV1Mkmk0DiVq?=
 =?us-ascii?Q?KIIQm23APEVc5WRgM964Yi7Ai5fGtJUeoUS9XkRSUrqSIleUVLPyhf/ZIV4k?=
 =?us-ascii?Q?mHsCJ5Zzu3ERiW2bSLKBU5Cwqz+X+3MMevgwIx3NWxyrYnJGKSz/So3jgD6p?=
 =?us-ascii?Q?21lnbIV1UwrWa3Z9HX4gsSkKOCOvePXRjn1KuUQizNoG8RDjHQLiNvcaNZPi?=
 =?us-ascii?Q?kPDkJ7xh5B1yvCMxiBQ3Vqo6INn2oC7xAMKevBN8THsMgHwvr9gsl4uONfbx?=
 =?us-ascii?Q?c3KbYNN6ZzyE4f+QtXC8xjHvHF9zanaS2gT0esAu2/C/4upAp2BYG5lvRxSu?=
 =?us-ascii?Q?xXIOA29YdgKsLJMXFvO4MTOH3zDl3MfSZXg2+Q/pjiRoQmD71ppmit/I9jqT?=
 =?us-ascii?Q?YElzSK/Of0ev9YlIg8B8f9RVlaFHeKSMEK85fhHZvdoO9QwP6yWOXI4/Vl96?=
 =?us-ascii?Q?zoon7T/jUVMHmC8E/dDcogvQvgn3N4HcKrHjwn4O/E1uQEbSoRe1JKVCGlyy?=
 =?us-ascii?Q?lkz/j7goHywDfamXVZYkDdYe3MApZdEduKUU8I9llg6dTT4OM0xVe7vWCkql?=
 =?us-ascii?Q?W1IxLopKtZfoJrKHm+CkEQJjvy4dUaSjFWsNCyx9VJ7cGFnmeSKr3cfsceLP?=
 =?us-ascii?Q?2hhpzy89SP1QmPBxuBfdwuowMYJM7U49RbzGRPGLh1K/UXExZNz5UcjyV66k?=
 =?us-ascii?Q?9e3Ch4cDn94PvRWYxtlHPd+jr+00EQzFCKiiyNjUXhotFJVreyA5B/n6fQfR?=
 =?us-ascii?Q?BESafT2Y5CEItZQ1WORORINNM9tTnlWLdkqqlQ9ub35Q1Z7T3LgFW0WvRfR0?=
 =?us-ascii?Q?ZZ/oKk2QtgLNOiMcJBzJ2+XrckZ/vfH5NjFa/m2OPzNs8jfepfjXtkevaJq0?=
 =?us-ascii?Q?TffeOpK6dzqfe+K3b2pGv9BfWtwKSFFAw/3fZthMRl31CsrfIzzZ5AbTVpoV?=
 =?us-ascii?Q?X0ABU7fgAQZZy0pIX+NZ7hk+JRv+doo36PzrOm1Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e73b7e-c3db-4131-6c1c-08dca69c1d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:07:42.1132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zeANBRO1mydPbMSYHolv06vCnflRJOJpF2jLXpzLd3W9Fds2/vhSNfgd4aBJ2fofgGaTcblNqEm06JD5jt4hK0QHQMscEtmdJcCQSunTVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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
Subject: [PATCH v2 1/7] drm/xe: Introduce const cast helper
>=20
> Typically we want to preserve pointer constness when converting
> from one xe pointer to another, but in some rare cases, like kunit
> parameter conversions, we might want to discard this constness.
> Add a helper that we will use to clearly indicate our intention.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index 0a2a3e7fd402..c2b1f9f066bd 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -20,6 +20,11 @@ static inline struct xe_device *pdev_to_xe_device(stru=
ct pci_dev *pdev)
>  	return pci_get_drvdata(pdev);
>  }
> =20
> +static inline struct xe_device *xe_device_const_cast(const struct xe_dev=
ice *xe)
> +{
> +	return pdev_to_xe_device(to_pci_dev(xe->drm.dev));
> +}

This function is used in the next patch and no others.  It may or may not b=
e
better to have this patch and the next squashed together, since that's wher=
e
this function is used, but I can see the argument go either way.

Just something to consider.  Not blocking.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  {
>  	return container_of(ttm, struct xe_device, ttm);
> --=20
> 2.43.0
>=20
>=20
