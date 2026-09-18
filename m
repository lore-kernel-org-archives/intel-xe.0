Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82AC982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586E910F14D;
	Fri, 18 Sep 2026 03:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdVXV3/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F1710F149;
 Fri, 18 Sep 2026 03:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789700706; x=1821236706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FsZuDA74HadYyL6oGRTKK+rI19p0CnD0gThw1tlph1Y=;
 b=SdVXV3/ML51qx2YNNXn75FDiNezAoMD//P4FedQel1LGarBPhmkvGtl2
 EKHxWt38sK7MgGhN8VGr1ukBhkIgIYGsVotgcuhyx4ds1rAMLbHzoW/jv
 P/UWtI7ErJ5Cl5RRugN6/I+TuJk9XF5VQ5WsIxLppM8UJKxz4ha1KGwDP
 CMIcgulrIngY9ZnV+JYb1TckqUdIGu6R5e5jzEuQFO9Op7hz6U6z8FQiV
 xiWvi6w9k8Zbt5pO1qWoyYKtaffFC9YR54ZsdI8g3Ge05kfjXgvxrFOvb
 N63zUPnZHBhPKcIpC4yAhJHxkmAsV6GKJ+EbCfuOgn4EiTfJNkuTcvFjK w==;
X-CSE-ConnectionGUID: xN5c07ogTzWiwr1qIe/1AA==
X-CSE-MsgGUID: M7sUNYIkTiKclSLJPGgDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92690814"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92690814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:05:04 -0700
X-CSE-ConnectionGUID: y2+bLFnWSCaIjPwiVVfbog==
X-CSE-MsgGUID: dvF06+9QQy2bRDJUGpDl+Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:05:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:05:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:05:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMfWIEkSkgM5+dxDXv/AJnCDtEX41GSzu+4oMdHKi/CQnyW8larElXABzTy1BcHzPz55zQGct4UHbQqaq3cR7Fej8wV+8YtTWNEeOytBe2nvhLVvGCG5po/vZlzHbIp/e+ImuohaEPbVSJ6e2GTylYOCzhN612LhGvsZP3e4US6QsbRdxU/+8Eh3Os9/dtYiul19awXd2HykNvCLzTtyLCGmdmhOaBngTOAgGoCCuUBtEJaqvzwITK4mTiDlxvd2AIcEGgwe6jrdc/VER7y2yLYubNwcQlSBTBcN/8DcpCmebuNEN62V7QbnvlH2v9nI8+73t96xiy4HbNkcR744IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auG4xUeoOZVe1kAOIDWBH/2Lvs22yxCmIiK6t8Ua7bo=;
 b=vYC6pZpa/dTY881uwDaJFApDlkq8F6JbwYppU6jAX1mJuE2o24NN5dur9Me3+Z3yhXeGO2UUtCGYc8z63UhIOJAftp9hhk1Y49tq77ysIY2G9isII5Xhc53yq0PQQ5pk48k8jDgzUpQKYNoB4LyAInMbnDi4MHazUiKoilW8T0ZEGX3/ci1yLkKlXrYAXJhqU86e0TUqI4TXbDK01nLnWS6thbbkFy2x3wA/XK1AYSEQ2NWRIbONp62XBRTXgkJagc0+vMlMoyNZQb252nzzQo8KxRiH+/dEqZEZjaRnlbFniuMP4LZwAgE19qebqj7dXzTkhrXkXO9Gn0z+a+ViWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 (2603:10b6:518:1::d58) by CY5PR11MB6140.namprd11.prod.outlook.com
 (2603:10b6:930:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 03:04:59 +0000
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b]) by PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:04:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
 write_byte}
Thread-Topic: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
 write_byte}
Thread-Index: AQHdRbWe1jDrIWwAQUu6fA1p7H5td7bQ7LQQgAK8oWA=
Date: Fri, 18 Sep 2026 03:04:59 +0000
Message-ID: <PH3PPFE26A71A1EB8C04D1791F276FDE6AAE3872@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <67868fd8a8c8e057ba82c4b142fabae2d0fa52d6.1789547331.git.jani.nikula@intel.com>
 <DS4PPFE901A304F56B4951E9213E3714AD7E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F56B4951E9213E3714AD7E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE26A71A1E:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: 0efd87bb-3f57-4124-36cb-08df1531a047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info: EIoBOBWjaeiVySrLN30Fi3G7nIXpaR7HFRE9ko2ccIAn3f5KqcmaWg+k+EVp0ZRCMP8lGc3K25P5TLYf9i0RbBSf95SxJ6b9QLC0/kDFIsM8e2emyW5G4QzN2ba5ZfeUqGAm1no0/zG/HWjGXhx4zJz2JdpEwrPSPwYSbWuQuUGqTtHNhQaBXmSbxEmW9Vr0BnYeQFl53jasFZDmB7jTo4FGMn2WN+pEbXKstSZ1r7mRW9B+M1Z4q/IhT5c/gxbwc1efu4yjjizzH+tjm90ObaBsjTXyP5CRE+TDr5mpT+EoFfEsSjKG6XJ+DT0locDqhtReYjl1ag+2M1d5Kni1rEPmdqorCCLKLak9WYKDOiGfOZiB7P3UZO7RRlQlh93NLehghwjh5PUGezCaF/7qZldIjhJgz7Ew2CqI4E1P+vtGxcAa3BZkYiZVBa7AmX0xISsakayFbi7AMexHD89VCf1bfLJiVhN9ASfHozl57tjUkZ1KZN0GpGCHPMO7ZuBceuXG4jWep/OwlmwulNaWzk2HlJ/Zoq8nRZtM0dyqqbmqO36UCSU7fZXGpHZX9snoDhz4bQ5EKcPM5jDaIEC1l4j3KbiQklU6tyB4sdBoO85MbayR7uDS2IXLMZ03mzfpccArvMV4j+UAfcrbLVDjbxMg+fEQGboS/p3+FGMWl7Zv07SndvHuTYTdZhQuj6F+EON/oco8qnIYnYqr3RLs8u/cjN/8HLmXrpSZP6dL5wM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFE26A71A1E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uRdY8430q3wE5Sik2DVYQFZ+SQktshoJpsSoEo7bkhdYoeNaqGFPqzPr44GW?=
 =?us-ascii?Q?W+bbuDqIe6QYG+1GDYTKD60gvTAAtc1cUdZMOdcA186YuLC9DvdQVkn68haT?=
 =?us-ascii?Q?II6shb6e00JKor9wWYuruv0L+iyE3VYZZohvJ9RNuv0Py1H2gKDCQSjYmZOW?=
 =?us-ascii?Q?xY88Z+5ECU3s3cCyKsKZthoko6zjwkfuh1+agPT+xS9rWOf/48/XolcBBufx?=
 =?us-ascii?Q?IQEgDdsheH4eRIEAtl9KwfSHrbE0Gi915f7tZOPGyXh1P05HZZ4NGzGtNy5N?=
 =?us-ascii?Q?AMk40evWGCS6YaiRNrkjSetzD5UWWf5HTYuRBLphxO7gRcRstWSGauprO0Js?=
 =?us-ascii?Q?Fb+Ld71RgOi1HGOrGiTHOE9XQ7XIJF3QO89idMTwmBUbPgYFk3pAAxdrZ2jE?=
 =?us-ascii?Q?QGn2K8LOWDInLljv+ha7/m/khZUS5AXZyJx+j6ES1tRxWmEIwDYVnjjwxCA3?=
 =?us-ascii?Q?Ow7e4SpT1tPWxXe/EYXMKsJxFtINv7qHcbqNZRyqGk1zKZ+XRG5mq8xw02zM?=
 =?us-ascii?Q?hWzI8atSA0KyhjiQbNaMNbcEdmiZoQQ2zIozlRKk3twcuC793QLi5xtLff4o?=
 =?us-ascii?Q?rlnQSDs/3nf8Zp6L3cpF4kqdXWBzJc3xCB1qMAJOq67YHGNWX2186kRR2z/r?=
 =?us-ascii?Q?z70/2UCldIO79yUu31DbSKUwNOELZgzxvsQxqSFRNAqwkYXWWYVHKY+5tu7r?=
 =?us-ascii?Q?EaK3+6TYbO/mlDtR2MQTlgk3vZjm82BAqpNQexdZgEHaSmcWkKxTarZ89/U+?=
 =?us-ascii?Q?bc0rUim/YJ7QcugktGs9HrblWiaLsOyC8/tFlPP+6drCp2oXP0ckl9vN6Bv+?=
 =?us-ascii?Q?51Njfhj+hzIr8zL0QLym/TAMH5I/18TGk9u+U38bSDfsvXg5IsnOEIUZFb8g?=
 =?us-ascii?Q?O5bcCVe5CPfTlSF9q5aLMFnMqW5cEuzK22+BlQjcR3NKOj0/ZARUx2XU2Jgf?=
 =?us-ascii?Q?dX3GQKqpas6dCuu5YUh1A2ZP8YcS5T7h/64WtZrZShM+L7Jbap4dA6W/tiT2?=
 =?us-ascii?Q?1lNOC+5fmlZAK1nkYPj0OhbxwRknRtVNZVU0OK2OMgshCIwNZF+zYF4GnDRp?=
 =?us-ascii?Q?5jFsNwf2PnYpbjLEDUT46uekdLgDTOxTCZgSgYsKIkEOr+k6AoMYemKY/gmI?=
 =?us-ascii?Q?7gS8Aol3dRmPv7D2lWkclHNjVrQ+5ChnoSm8ffP1PMU6kA9/su7qDDtg0JDe?=
 =?us-ascii?Q?6LXDFam5GNaEjhefn9UaoA6F/uuSyTndHMZPJboczJDdKq52jISAS3ezkxqc?=
 =?us-ascii?Q?lj5dSV0EQFzODIbQy2n10qGwqURQCzMhW7YFtRRZz7OqhxFcoKY/p9151rIH?=
 =?us-ascii?Q?NjO9eTOb2Wc9XMvTz8/fO3ZTzKrBR3M76jq3vO4+K8KrSth2SOAV1PfjBrds?=
 =?us-ascii?Q?iRUOtpdnidui1R/nVYigTppGW1kkzoZcTxj2m3NAhFGs4GF40pn56Xaj/ItB?=
 =?us-ascii?Q?jq+c/RkGosKFSaTfRgV/7wiKKZXroXkWwaX7CzKY6N4So6Qft8oQBR8CSFYr?=
 =?us-ascii?Q?YjJ53MQsUtioS3D8RwW9ybgPJw0rtqoanZ1MUR/UccQCby64voHgYrJDknRY?=
 =?us-ascii?Q?COKAche3O9IIUBzlFHusYvyPo33v5u4FsbDCy4lDFbZsS9X7p+zn9305uJ0B?=
 =?us-ascii?Q?2UibYLNEr1bUbEWKEnp28JqK51jttsb3uDBtI5JQfBZEvGG8tIHDJk9wIaPU?=
 =?us-ascii?Q?WfJuAv4NafKDbUqnjeUTIMHYmGU3wfYv/cjSWbN+ZSlyV4qd3Xi5PK8REsGF?=
 =?us-ascii?Q?3/AofWcUlA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MoZE7pCezcPZ0k6wG8PMXDYT8sfkhoRHHuK9C8qqMCta3ESrhMcukXVyqll1QbPtlSF/4g+C/KfLJMjCgspOhLJiby+/OVzJfifMaccfuUJWByxB/qnKU1W3Qo+e16g6nBIKj7jYkyF8tyB5Dzw2KMywVpfywcOJiBX92sxvwdKSfzz1nfvMxNkoQFy9b/G8VzWReD3pH3cuMnja82FPOgylLljSL5T9ocSLIwwq7ZohDRzEkVQiDqPI8muWVwUoixG6lYi3qAtlzxKNhvA/+YhZ4STTDgLTr62ZLk1MxFZsi6NXLe+AIVigILkiibzYjKRva9RqCFizTF5Xt1Qk3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE26A71A1E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efd87bb-3f57-4124-36cb-08df1531a047
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:04:59.6163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBeRTmTjcFGiyzcLvnuwyn88azn7jTw8pcxTo6yFGuWOjQES4QKRC7qS8YT8aEbZ02R4F4RkPQ7P3mMTOq8M9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

> Subject: RE: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byt=
e,
> write_byte}
>=20
> > Subject: [PATCH 03/11] drm/i915/alpm: switch to
> > drm_dp_dpcd_{read_byte, write_byte}
> >
> > Switch to the modern DPCD access functions that return negative error
> > codes on errors, -EIO for incomplete access, and 0 on success.
> >
> > Rename an int r to ret while at it for clarity.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_alpm.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> > b/drivers/gpu/drm/i915/display/intel_alpm.c
> > index 10943539bc7c..9ef9d0e45258 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> > @@ -628,7 +628,7 @@ void intel_alpm_enable_sink(struct intel_dp
> > *intel_dp,
> >
> > intel_alpm_aux_less_wake_supported(intel_dp)))
> >  		val |=3D DP_ALPM_MODE_AUX_LESS;
> >
> > -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG,
> > val);
> > +	drm_dp_dpcd_write_byte(&intel_dp->aux,
> > DP_RECEIVER_ALPM_CONFIG, val);
> >  }
> >
> >  void intel_alpm_lobf_enable(const struct intel_crtc_state
> > *new_crtc_state) @@ -751,11 +751,11 @@ bool
> > intel_alpm_get_error(struct intel_dp *intel_dp) {
> >  	struct intel_display *display =3D to_intel_display(intel_dp);
> >  	struct drm_dp_aux *aux =3D &intel_dp->aux;
> > +	int ret;
> >  	u8 val;
> > -	int r;
> >
> > -	r =3D drm_dp_dpcd_readb(aux, DP_RECEIVER_ALPM_STATUS, &val);
> > -	if (r !=3D 1) {
> > +	ret =3D drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS,
> > &val);
> > +	if (ret < 0) {
> >  		drm_err(display->drm, "Error reading ALPM status\n");
>=20
> Should we maybe use ERR_PTR to document error when reading DPCD
>=20
> Regards,
> Suraj Kandpal

Based on the reply sent on patch 2

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> >  		return true;
> >  	}
> > @@ -764,7 +764,7 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp=
)
> >  		drm_dbg_kms(display->drm, "ALPM lock timeout error\n");
> >
> >  		/* Clearing error */
> > -		drm_dp_dpcd_writeb(aux, DP_RECEIVER_ALPM_STATUS, val);
> > +		drm_dp_dpcd_write_byte(aux, DP_RECEIVER_ALPM_STATUS,
> > val);
> >  		return true;
> >  	}
> >
> > --
> > 2.47.3

