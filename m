Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C03C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 04:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9510E30F;
	Mon, 22 Jul 2024 04:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA/4NeMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1CF10E360
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 04:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721624019; x=1753160019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yREY4QI7Tpd+MayfnJ/164sqAhrxnjdW3bG4JINR10Q=;
 b=XA/4NeMbe7tv36FBZzJ5GYRjvNjBBVd3tCPskldGRfZVj8QB9EHJlpu3
 o2ynTNpJAKqTEKIHWJSYRb3H73UJQltXLuGqJ6boeWjC7ZfHI0714pNaH
 6/sxKuLm1sPd1xhRqeyPAhFR2yROToAi8x7l43bpoHvOwU7o2hXD+6CuL
 +q7zg+HZKFIcjPydGT3w5QgBqDuNWDXdsRWqQkHZ7sLH6ST1bZOmW3QGz
 oeVgAjlazSORQvmI64z1h3PHQGarhzJMfcq/AG0jNK1ZW+2gyApcTumtK
 LFE4HZV/8lDugP6RMMIRFC0FvbGIkUufSVAqKsqItV8hcSocBxXEpGwCF A==;
X-CSE-ConnectionGUID: yHy7aVS3QAyTwg6+ZKL60g==
X-CSE-MsgGUID: c9M3eoa9Soi7slunvTrnsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30327423"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="30327423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2024 21:53:38 -0700
X-CSE-ConnectionGUID: U4p5O02+QsyuDW7YdOQuNA==
X-CSE-MsgGUID: eJ9M8j7jT2WGxB2d2I4Csg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56309410"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jul 2024 21:53:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 21:53:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 21:53:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 21:53:35 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 21:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z28OMrDcnwP+Lmf3vpRJ8CQp1gLuA8KQzCMSSfOPPY/BM86Ym4vYrsTCyO+B+j22RznMXyiNVO+zLplas5ilN5hOncTL5Afq7n21CDkfhudR6bfLTRL8B+MCjYs27MIXmnFxboIg/h++dKNHoOAuFvFoETNbFUCkm1lecfSvABsnI1qr+vDYoaKA1DQTw/vTWrrpTYLChuH3ebSYZFW3y8JxS1wUfKrsh+qd8ySxMxKQhy9MfJQ2Ttajcr7V3AnylDmxQqFHnPOa+gF5CiK5bgBEuXy0add3A7Xunt78GZ6ifdUkdePxshxlcDMdP2RXBkRJ3H6aUeQVzAMYoJk4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGkL77rTb6oE4z6DOYdgaiJ3K9as8k70+VFTh3dGPpw=;
 b=Bk0TVp4/G79o5izBtCa7sKlp5/yzBGDpNUfgNgCyjbQ8a94WfylJRuPQd5EYZ7H8WSiGZzmVS6X/2RwxZdWqBCAOML9DCSJT6YlvjzXIeErAgvNcJuZ5DoTGL3fyRDmF1rTQVzKcIkFqMzEWoyg1cIo8yL2XcNFgMjxKeWTf7eGh6uKebciyVg+kOnfQnt8oZro5J4RpcWC1UC0tjTsU7FqIwtoq+yNVKJM30pRSQs5clzlNr+Fq5qF5UoRvd4N9r1xNmTVDSZbN9uKuO+lJcouTTKEYDfIy1WSXddkxkCe8a/ShqLw1QvftjRHsxjs4ymLGY45JFQsHy+GaUh6S9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 04:53:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 04:53:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
Thread-Topic: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
Thread-Index: AQHa1qM8pJs8O3Zq5kaxCbq24jm6wLICOEVg
Date: Mon, 22 Jul 2024 04:53:33 +0000
Message-ID: <SJ1PR11MB620416EAAE7A6BAE9368159881A82@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240715105555.2220444-2-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: lucas.demarchi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM6PR11MB4545:EE_
x-ms-office365-filtering-correlation-id: 89296ba9-e523-4ec8-25a9-08dcaa0a3d38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yC40L0Xc8uHIPWvgs+toV0h5JwohO+sIdqoN+6zoUedQkYcdAjl/Sg0clS5f?=
 =?us-ascii?Q?1tU9Nl330T/kgRTOLsTfs/8Ju7gNyVskjLzd9h+mVjoE6IOZsL4xM+j/b+kP?=
 =?us-ascii?Q?7zqxPylawVdO6BaSBf0yYZ3JlcAFQLn153dnSy9pZNuJzFBPYZd3Vp1ViP/y?=
 =?us-ascii?Q?PVTF2wOEHm3LTCh9rehXUytqRvl/ymlD3rU41ff2cXm/cLj3fWCXEVJc2Zsk?=
 =?us-ascii?Q?qHOL1dhBN3WmvOXq+1dCypQRqQafBiSDqWsIEit4bkeqhXJ94/o4Y4PsnT8a?=
 =?us-ascii?Q?pG4vsnCeebXM5Rm49FbEmMwn8gFMR9c3QZNIK8T+p4VU9BcpCj8/ORPKjtOv?=
 =?us-ascii?Q?EboEcq0or6UMmllZxx2jjF7246+TYoHqT46KtdAmVcdj9izCtjgnEOGzKgoF?=
 =?us-ascii?Q?Ygq65ZxL/Okg79lZcFx+RVcMRi2LtH+O976siqiIllvIJICuNQVO5iBZkQt5?=
 =?us-ascii?Q?t/0Q86tZMFQi3otmLkmXWHDUSWfRW1rGswtCkwkCjklusAhMb0G3gNI8HAbK?=
 =?us-ascii?Q?wxWuAgzsGVINs74EmpEm1I5PCB/1gdvvTrSIBjD14b68rRBdDLe3C67O9NCn?=
 =?us-ascii?Q?VncK8hRAANyr/crAF81DTTYwjiOzVRekpO9lhapVEVyg63HTZdtL7vUi7Xf4?=
 =?us-ascii?Q?XDv97uzMP/6Vw7abfhGq7P+0Bfqzt7BAXnehL5C7gfWdBNVQaSrHEiAtJ1MH?=
 =?us-ascii?Q?yvmvbgQ5NSFtLIx+xI+JA3vL9Qf5TFh+QrfsicEjq1zbLXjBvXh5kDJxhzDG?=
 =?us-ascii?Q?XhjhkKtpDIUs8sKaeZ27r6ROJkBL/fp7Ilgw5Ai0lXxE/dXtH+UTTS6a8ZGB?=
 =?us-ascii?Q?SCuea8ycFbLw+YOSMjb67p5iasjHLDQ004h9VyjsJd1p0OCDR23FbyAEIJRn?=
 =?us-ascii?Q?AlaWz/FOHBG0OxjtkPGh2zkjGVjAnjUyg7l5SQepU+cPuMgMcmZ6borLOLcR?=
 =?us-ascii?Q?W1saEBCncmmRxWPBusJUTeBMPuPhsBVrtEOoEDawn2xJXXB3MeTGztHhVK1n?=
 =?us-ascii?Q?S7S5oNPMTrkSCSNDQrBpJGqlb9QRQJrBjm2dnbZZkSz09laPvY8kdgfglRu1?=
 =?us-ascii?Q?vhBbMuJPFKj8/Hp2h7qSGv3PK1ZhgXTCXyaQz698mnez5C03m451ukFbGfJs?=
 =?us-ascii?Q?qCubJ1bRerEpDw7rnj17rXmn00C2ITXXCgu6tuhvlkcsigIU4UUOTdfZ4aV3?=
 =?us-ascii?Q?6DxqRBk7gQ6cVJSPKMjxjeSw28ZxteozqjvFgY0jExhzkVFQ5KQuwZv+S9y8?=
 =?us-ascii?Q?iMkKJc6nQO/BO2TDwseiigMLQr9vGs+kgv7uZGm8+0AaxUbWdkv8Z1p+byd/?=
 =?us-ascii?Q?LejEdCeRpzOTp/iQRpqjgkr9V3zw61OHiR4AQdJLt80Du3265f52UNYIzy8S?=
 =?us-ascii?Q?2twrAmQ6ky7lmwcAQOr0XAW3RxgS9dWtbwUFPfyp0VvqQQPSlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5khMSCfhCpFZkYY0QqKKJbCMkQPIfe1BdkkQ9977rnNAmSsih4yYklgCIJAj?=
 =?us-ascii?Q?1G2se9/Go/KfprrHilJ/KIheMApmUOE4p2+hvfLJitDyUBI5cyie5VObiblR?=
 =?us-ascii?Q?CjQ1VIjoVnzLQWSKobwIbYVKwgfsalR0vA4+2ae+CO01KfGSxJ/8USav8547?=
 =?us-ascii?Q?Xwr0xxWKyVOCuZnocOHRHkxaSvSoCjWOqvZqeSUnPHeL4ptpYNDn0vuRpCkW?=
 =?us-ascii?Q?NdrXES7KDepV5xA/gTHvmtezglSuSKnSvegvIPu0awWb5dfhEcEzTvPRjeF5?=
 =?us-ascii?Q?C7DUhtY4v0TLZe1q/fMDBFTzGn8Djxc4i1qdciIGCwJRxYKqN7581Z9z42PJ?=
 =?us-ascii?Q?CY7o/HMLjbHfA/QPFD1okl+pnP/MEYc33xaRRa5QdR0ByA5jr4NZa8HFZuQl?=
 =?us-ascii?Q?ZC4R4vLMKOfpYrR90jmLKn8xSFgACmCVCtEcwe3AxLlfVa64QaXt36M7s4Eg?=
 =?us-ascii?Q?AVLveijwkiMLI0jXkF3v4KuJVXCOMmpqski5AVavCaX+4OdCqQ68qS5LSnwf?=
 =?us-ascii?Q?hMl5OQt0dpjMDHkU520AQn9fB0CpDwakV3SfJly63eU1e1gr4nuV/kD1DwnN?=
 =?us-ascii?Q?slNtTRQVWYG3ljN8rvWbgwY6skrLlkdbFdR2aMjp68ThKLezaqK0n2YJJhqK?=
 =?us-ascii?Q?Gxtwq1A0rgZRBp7KXwb6bDogZTWDHLDdcz45B5H8Jd3hQM0z3xP0Bx7RZoN+?=
 =?us-ascii?Q?58RWk+TNPbuqhsi0rqzI4aAnDvMcr9LfvHKTt9m+E8/8Z+XVQuINQW4pvy8K?=
 =?us-ascii?Q?EjUnLlZV8jMmZUkUUrPpPFe9ngzbf/VdvRTDB3Rg3w21MgVrWX7SJRYg/tdv?=
 =?us-ascii?Q?+y74dFHzgYZX4fuMd/jwAqfVFyERqb5dStpG7/QUDhAmamPngiQrjH71alH4?=
 =?us-ascii?Q?HATS+3jbCIZnytXctEWCMW8YMyzignfiTqhqsl9pgdvLV++WuqBoWncvTrWj?=
 =?us-ascii?Q?Cz1NBJwk/kxwAtKW6S1Xxava91Q9PqAhOKtQRNm5yLDOc79HRqEnc3MU9Zt1?=
 =?us-ascii?Q?W3j/JiWl+YXAz+3XLPM0IMhEluoanb0ZvbtsYsyad6OyosYGIjO1u/cgLiDz?=
 =?us-ascii?Q?CpjiP2cmE+cZQ0Pd15tT48k7VuWrZAcAsaqo3LuXmlh25lfd9KSRXg4mHKKO?=
 =?us-ascii?Q?ggrSfCsvHkSnSQhHkFw44g5oT0epop2sfUtYlzmlHbbHT/zGmXqPI+CBPkOd?=
 =?us-ascii?Q?rjP/SGr7ZLuNwWDTsf1J1xaJtd8HXPahzvpGZQt3NAHpzyjnBgm0n3KVPPRp?=
 =?us-ascii?Q?gGcLiQKF6BMsAyhzGgNxYAC+Gx0+juXIRJ15QBgF+1JEhBvPsN4fYi82AY04?=
 =?us-ascii?Q?JKXWY1vWp5Bo0mlCc7/WTjdhZvq31JgM2Ln5EvLhWdr7InQATwkX5jLu8rVG?=
 =?us-ascii?Q?CAIc+7NxiJX4+Vo+RX8/NTliDb/kXBbV+AwO6Onffbs/tS7BxfMRprKyBg+I?=
 =?us-ascii?Q?35TzX6YJp7eCYxgKqHk+VUFgtBlDqUai1t/p66qgsYaOl8dPsEElVpyAPUGo?=
 =?us-ascii?Q?0t5tjXr0IjRSMN79v6WU6CRw7yHU6lVxExYINgUfXvAPAyIE2uERFC0Paf60?=
 =?us-ascii?Q?5UQFArtc4dTNPUOUrd1C2S9/6HFTWz6xFj/UPSg/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89296ba9-e523-4ec8-25a9-08dcaa0a3d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 04:53:33.3041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htcHhOo1KR1OOglfkMljFKWhZDmHdIsNj0ZcCtYpfJdr1IbNnkMsGVFveoIm+nfzzKEkvgGJIpaD+xw/tm0CBi4cRdwmA9cO5Lf+uwSj7jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Hima=
l
> Prasad Ghimiray
> Sent: Monday, July 15, 2024 4:26 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
>=20
> Register SOFTWARE_FLAGS_SPR33 is unused; therefore, delete it.
>=20
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 55bf47c99016..dfa869f0dddd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -15,8 +15,6 @@
>  #define GU_MISC_IRQ_OFFSET			0x444f0
>  #define   GU_MISC_GSE				REG_BIT(27)
>=20
> -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)

@De Marchi, Lucas I see you added specifically this register in below commi=
t, was there any purpose ? To me it looks fine to remove.

commit 8cb49012ac171698b1253dea45e56c284e997d38
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sat Feb 25 12:10:39 2023 -0800

    drm/xe: Do not spread i915_reg_defs.h include

    Reduce the use of i915_reg_defs.h so it can be encapsulated in a single
    place.

If no concerns from Lucas, then=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Thanks,
Tejas
> -
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>=20
> --
> 2.34.1

