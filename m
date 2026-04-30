Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56B7CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 11:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C29C10E14B;
	Thu, 30 Apr 2026 11:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROd+fc9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2010E14B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777547710; x=1809083710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P02QwHbDm8MLs/vrR57cJKBsThqbMUC0NJoGs0NKAFw=;
 b=ROd+fc9k7flRW6bmNdFGWsXeRTK3Cvc6tV0PjZ/mvklvHAbO+T0AJks0
 Wci6wSfLmEcOmZjGj4Qzrbx48ZDA4D5F3IlVR8hsiVAv2AX8C30pPbb7f
 3YpjrIugeobC5w27wK4zNnzcqDO2WIzlBVz4sqakxX7tQcTWmDmBbtLZ4
 asehk8M9coC2czoJD7LXmhqZedgXw/dHlC0kb48ruWkvw4sNFuJS7EB3w
 Kw0D/4S8J34R6jjCeYTwiRwOjNZPqTf2F/KJH0peyIaXMhC/fiCg7NeSP
 HmtV8TWmuLn6rWQNKZ4b+w8LKDmiwK9cuynvTfOLJqwLG53O2HgHdwd06 Q==;
X-CSE-ConnectionGUID: HUeZ3oWWQ6uf3F3u5zrB7Q==
X-CSE-MsgGUID: 94QJkt9yR+CH/8j5/ePtoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96061224"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="96061224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 04:15:09 -0700
X-CSE-ConnectionGUID: 0K8a/yNVRz62BmfYXx2Flw==
X-CSE-MsgGUID: RkwREtPFTB+y8fpQuruc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234828096"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 04:15:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 04:15:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 04:15:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 04:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiO+iVTkSbGBSuD4/1gpExhlQsgybuI8K5ToxPCSQ8Si89PUFI5C00cv5SHFgfNVsLwIXTPJumL5Bf2fxCK54K+VnairUO4saYswKvDVkmzI62Icnf0FeOO2OXMRq5bSXe4skp5ld5xKkeAiGiJp/juW66Qu/AkAk13gLZX1zUNjX9x7yVEJj1JbCcBqfY6mi2VrIwOpVgXDKWUhhytQqXVZWTqfJz0kHuvCr0TRMB4IxCdkhjPBOsaJhghY/tMmOY9S+OuUR5DdlD5aDS/BktStMsQ7E1CpC4ozeLF87ixZLweAImGtN/CjYIm+4mCk4Wm+48cc8CLayqZvtkbF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ebILi/pmPDnQZmwCtbwQnh0qXGW2mxMQhXEm+qs2lA=;
 b=NJVUj5PPX7XKSdBXHJD9nQtJT182VmVOD+vJR2niZqMRXOuxrH0BCiDg1XDOvE/8CqX6uTnERQEdzJa/oniNP+cBGZTW1K+KzexLv05xOcp8vKJTiajxGu2qYP7aX1L/MU/67zsVnRbm+fjqexV74FHcNPsXKoY9cUl8Wca2hLPbVgIdXn7dtSIF50S+3VEzFyFsdaraPFjxyaCFMMpYRyGKRnBr0LXvkGOzS1dnQRSMKhSDskJTlZgYYGjX9kfEaxRvX4NE7t1UaxuPbR6W1Qtp/hWKsnik+8jL+GvrsERMBqEz9GXnwHUF4d1mbKK/8Oasx8HWUA7XOlPDmMAHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:15:05 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 11:15:05 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
Thread-Topic: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
Thread-Index: AQHczkPoPKVrOLv7WUe55nnIDRQyzbX3iAGg
Date: Thu, 30 Apr 2026 11:15:05 +0000
Message-ID: <BN9PR11MB5242107CE3AA04F2B27AC75895352@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-28-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-28-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|SA0PR11MB4638:EE_
x-ms-office365-filtering-correlation-id: 15467946-bac8-4226-70ea-08dea6a9bb56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: sS+8kHfg0zO8/jZkypq7iSxf8FMiYIt/2mi6rKkWfHO2AaO/v6PLZujNeY/GAFwHCZueSGVMDR4Eu45m7qavxxLeG1t8wgORbuMhyalto954LRO0w9fFKNgv1zlV6JtdBUHkxPL7jP+w2cLAcFRjwCfY1bsda2V2/pz86NnLMk1giqzje2QG6p5w8y3xLPu3BIGTsV+oqdIZy5N9MCMNe30PdgnIkOG65dDebCKjHwz3D3gqu5SJJDnGFuDj6TWzXVH56K68vhJSsXVFQ//TwgXiEdOdg2VPUN5jnyUJqz5uwdb6uenHsulg00H1TUzTRP6hjQeKKz7shbKwJMVGUJn9s0iiJUwf7XJuN1wkHWG0J3rmZIGWe4cA+LwaJ30XqK6Z/yFO7VGal1u4yt/IdyRV8uVgmvbVS7wPJWtZBaEPHJR8IHknXU+TcW/wslNeNiqHok1N8dW+mIahMDJL4wVPexkkWb0nbpAebRrBvzUb8SeEdQAUHhsACVINleyb9g4/wC2p+ydc2IztTXm/zJy4cEbDaX2zLObNjlvdDdee+MKssenj+i/cIYCqRPpgMpcnmwECQhbf5iFtktUj2lQolgE3+HbvL34nC4U4hGXi2Yk/ms1hF4XCG355VI/JLs+pOwv84DEYDm/TAsMF+/pJH8JCPQl8D2fVGGdtDUQZIr5U23hshqDZL5umd6kr+re2cBl235+GZ97DmqO4lE/qVnnXgaUs7UdYjzDTtXfZkNsiQYOrRG7tpb09Nxrl0Zlvo/ShfuWjoLErOCkVDt/UOs++aAnCIBgA3+FG9cU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BwyKZGd+e04tAyA/zSavGwTvx7YjBR0D+PWu3awWKx9APk2KYKzf4RYNJDpP?=
 =?us-ascii?Q?h9gF0NZQ1R3joWCKimfI3ut/xV4KiZq4tSIr5+2v7Ti4QhGwPvIuhR78DUZn?=
 =?us-ascii?Q?CTFvQ+DlY41+6nKAbxDR46Ae/ptmu771wCMFlUDP4hVyyfCKEEdRvdTYcft0?=
 =?us-ascii?Q?Qq7YsopVKamW/xjnGcIWh/LZC3mbrq8jrtKyjdOBMxKIzhtbzoDsEQO/ZJEd?=
 =?us-ascii?Q?NT/kzQHWj0RbarFTJGPxI6zvb3OnCOhzY/nb+RTWQMp6/yX8nKpjOvpfs9JZ?=
 =?us-ascii?Q?DU7AFmR/lx+jH2Lto/QekYk8IhjQh22ren64l/NrUxJiFJecdl0I7bfBl79r?=
 =?us-ascii?Q?fYYMAzuXniQxBNhQBw9ekGyo8Qe4JZgrohO/bFVDws9Rqd0pClZDPGXyAUIk?=
 =?us-ascii?Q?2+5nIFYWxqpSSFgl/Y3S7rhxMmTl6ae9K1SvU8r7h7BwOdcJ+6RHcNmi6zq8?=
 =?us-ascii?Q?R5/JshiymwlXBaU3FuPyAQaOPQ4/l6+ltHUwDw4Li/qEzhq4clsRs+tHaRkF?=
 =?us-ascii?Q?VKRhle5OlRf8luGawONOWimhSMvQ/kA9zv5Gj6pR870ZfoZygkQczVvOwrXr?=
 =?us-ascii?Q?CaGvpt4PSou19slcAsgeKv202f5hzPdX889Sk8ti5895XHC5VaD8UAPikix1?=
 =?us-ascii?Q?I/e7z5nEM3k5NmDc23nkd4ckXTTeKWcPMjQ86vG01u+K5ySTwAAZf6o1dlvT?=
 =?us-ascii?Q?Li3B79hZ6YEpE9YnuZ9qpq5zru9K0fn+fP44PVgvK36swmY2K1ElepUhJNJN?=
 =?us-ascii?Q?axRIiP4F4VqZ8tptD6jo7aVULt3A/Ltr9+kNTX9474frlF4dgUsve7DoWmfV?=
 =?us-ascii?Q?YYY9mqJzdH2NWWg0Q+9EdufKGVxPoxGxgCsR4XHcCQ/L5ubTTWGAPC4mNNGW?=
 =?us-ascii?Q?xKigCX8csgadOJjPzOPQ1uSdFBi8+8ae9+kCUJ3c3DZoAxux+yfPbLEcUAs6?=
 =?us-ascii?Q?3y9gTC57Obo3ACj8C3PNuX9p8KemVJ890bxKdVxRYnavuXIBapi23whPQg0p?=
 =?us-ascii?Q?VOWDEgfBQNWDfCTFRV5ohaEVgE3KExdpn1V1LSUnzryw0JTDzY4fVxOUNGeB?=
 =?us-ascii?Q?ZgzrXfaRzjukt1qrzSqS4uGg3fkuhYFMVdTEQa2AXKTglLufRnLoNqrinzZo?=
 =?us-ascii?Q?sGD/xxO5QZrBVltoaFf1J/pweU5245yUWawhISMn4kqDoRwV3x67iMJEAgqn?=
 =?us-ascii?Q?8CtFNjOSysQNrdf+bXZKb4XXWUe1w+YOFfXuhbmZv7uMUFxgxKWa9EeNCL7U?=
 =?us-ascii?Q?UclCOpOD4BF74c8yVnv7Hkgg50Pex6BzsHUfRii8vdGEiCaUVOWaMTZ1J+Zh?=
 =?us-ascii?Q?GDE477SoPtv8emnXqoLpTPzXkg++heuAPHTuVzCVkPvZzmIokVgr8/kTNvQL?=
 =?us-ascii?Q?qHIFqI5zcuT10QveT/T9nkLNH+jyy9tvARDttNL20W/WkTohsSsQHps5q9e0?=
 =?us-ascii?Q?ZmfDuZChCIav4P70NTEB8DeFMVBT0vnASmFL+YcQza5zl24KgIB+JQen+H+q?=
 =?us-ascii?Q?h0JQzpMRD4rQ4HAVf3zfHOtkYni7+1GjgGFQI0Ot12PFVSCU3FZAj9Xi7Ga4?=
 =?us-ascii?Q?fGJvp9Fo1F69qIRD9RwUIDc2j1p71m4SDhnL6QagS4dxT1uWAnZfvAY4zXr6?=
 =?us-ascii?Q?jjUXmqdjiwocVP9jQbvg4vIk7ysQ7NaUiqyFFreGmschnARUZvJEV3MnEYIc?=
 =?us-ascii?Q?r5qytRt8oilpJ7Jdv/PhIxdTNd9bByuzW3GpZJ+ozsTprNwDKzV6dHg10WcV?=
 =?us-ascii?Q?kEXUz3yWcld2ltf2gT9Yk77lmi9ke+BDL5LdIFEBgvTT9sje7OZXt9uJEKpZ?=
x-ms-exchange-antispam-messagedata-1: N0pjgx/WZmwqhg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Zt3Wp0HRK6BnIdXv2Bw7tzJub/6fik+nRxJD/3L+VuLyd7ij5lMtbTbnxGmBGSfYcAr6sQrcnJWQZpW4BQWLJBfUchgkJ7rkijUgNhKR4ih7XYPg90KBdYBNj55syA+X5fGZSduTSRprkhGhoCEg1g2etuy5fcHYERwEHVc/fA5h7TxJlZ+1+KCU88IooRHhMZN9068gQtoPVOLwDNfHDpnUpUEPWQ2KROqFWCC9mAMRxQAgRbXzy1wXh+cXONt0DwohE+5OO+kxtwo3To3FJs5YSugvRUoGp1oDnGkB7YuwRxu6uFHfuwnAgAlYK/AEe/azn5tKLsnVieRPR5lH7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15467946-bac8-4226-70ea-08dea6a9bb56
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 11:15:05.5470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGg96OfS7IRxj8+yNbOU19mLAHhxktOXvHB/pfobVM2kDmSKztugwAKD/Qa8iPOCFV/4QfCf5V8vSGwYSjOI+Z39JO4sDDBJr/XsDPsbzHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, April 17, 2026 2:28 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>
> Subject: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
> mmio_enabled
>=20
> Query system controller when any non fatal error occurs to check the type=
 of
> the error, contain and recover.
>=20
> The system controller is queried in the mmio_enabled callback.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use ras recovery enum (Raag)
>=20
> v3: add comment for mapping
>     use const (Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_pci_error.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c
> b/drivers/gpu/drm/xe/xe_pci_error.c
> index 7d80bc2a6954..b7acf6778603 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -9,6 +9,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_pci.h"
> +#include "xe_ras.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_uc.h"
>=20
> @@ -34,6 +35,13 @@ static void xe_pci_error_handling(struct pci_dev
> *pdev)
>  	pci_disable_device(pdev);
>  }
>=20
> +/* Mapping of RAS recovery action to PCI error result */ static const
> +pci_ers_result_t ras_recovery_action_to_pci_result[] =3D {
> +	[XE_RAS_RECOVERY_ACTION_RECOVERED] =3D
> PCI_ERS_RESULT_RECOVERED,
> +	[XE_RAS_RECOVERY_ACTION_RESET] =3D
> PCI_ERS_RESULT_NEED_RESET,
> +	[XE_RAS_RECOVERY_ACTION_DISCONNECT] =3D
> PCI_ERS_RESULT_DISCONNECT, };
> +
>  static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev,
> pci_channel_state_t state)  {
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev); @@ -59,9 +67,13
> @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev,
> pci_channel_
>=20
>  static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev) =
 {
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	enum xe_ras_recovery_action action;
> +
>  	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> +	action =3D xe_ras_process_errors(xe);
>=20
> -	return PCI_ERS_RESULT_NEED_RESET;
> +	return ras_recovery_action_to_pci_result[action];
Don't we need the array bound check for action ?
Above review comment assisted by AI Tools.
Thanks,
Anshuman
>  }
>=20
>  static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> --
> 2.47.1

