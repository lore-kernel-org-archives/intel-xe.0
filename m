Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C1C10F15
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 10:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9810FBC6;
	Fri, 26 Apr 2024 10:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRJnsCvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9602910FCBC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714126196; x=1745662196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k7WWP6HkkojUJ/X7uhCJY3kl4BBDkxma9Lf/6T3BrfM=;
 b=ZRJnsCvvhcVYe4cDkIHptHXdFp3nK18zaT+jnYiNSsJgvWiu2VLS4xhh
 zN5OM1hJ3gxe6UlexE6WJYcowL8sQf9zGztC5o8lZblgEG5mE3BLd9sx+
 I/W/rId5IEhODp5IzR6aBLCdTn4kmQoMnphv88EwmYZQxkQeV99WAbTTd
 PCqU2Oc5yqVrtgfmGs1eKhPOLbbld9+vOD3OLm/V4f6HOVew88hcj7Pux
 LphyPfQKwuTu34/Og5hYosbCo+wVx7mrg7ZqmQpgkVyO4gOodHIRasZOk
 pVl2KkTmmmJbz3S4MVzDDmhzVBh2cqPca9h8qF0TaFJVjkIt0QK5dKxNJ w==;
X-CSE-ConnectionGUID: rL4gaDR+ScGqax0JMXILpw==
X-CSE-MsgGUID: 8FZjh34VQz24j2A6IDGiyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9690001"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9690001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 03:09:56 -0700
X-CSE-ConnectionGUID: k9e4/bS+T6ezUF213U3a5A==
X-CSE-MsgGUID: KfWodC3NQq2NzIhVsPzaNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30192067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 03:09:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 03:09:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 03:09:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 03:09:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 03:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYgZ+/oxycbCadPU7hRJwHnXCXuEmjkZmaHnb31DPUU96IXG0u8OxaYQ0pZ+O1m7I6nN3nVfqnUu04DWcp+Uao0RfpIRZsZXryGwei5Jxrj4Vht3o3HUc+c5T/k8mS8uQmOXEqNInxZ3T/Ufe0FW2uTYWW1bygJB6VWoOO/gFHKI7pAFkW23e6R4tdryQYe5O3aZ+DffqRg0jWyoCphVQSw3dm47DABMatXDhT+Z6pTs2rInu5lDgHLAEq9y3NSEgnHWU6rWxAdT+2ML7Tv27fJQ+OVcSqq9If5vDG48ce2KrtPWsQRpzmFnr7xw0ArxHRXCxaPqkcXoSzEC86aYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx3Z/BZZ2i78zWByMh8Zzlckig/rwNg+SEaSFEO24fg=;
 b=f89WMR3FfSK00ijS+8MLMejLvW9niHrGuaooDTg2P1kvkWjIc/7mX+reOsKsoyILvScIMgfH8UVaQA/QF35moOgbonxFncYDk2ZGWREpTw2QtXStOUrqU+kySWJWH359wC6tmCDXorrf8q6rKaAE2v5fJ8N4T1U/EOkuPdPQ/fKL10Iq4kUa/+YQ/co0PDkBFYbJBYFwKOZRyaA2rgTK12y/GH+ZuwotWHgFBELIvlglz+vnusQhh5xYG3p0LyW4hgNomVbO5CtJsnR+qqcOvxKlsidkkE9C3Gv7UeRHU8H0Vau7sKQuWrqkKSKYxogbUaEPkcZ56pH17uLm1J0H7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 10:09:52 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 10:09:51 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Topic: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Index: AQHal70zoG4tHe8S80uqM0TvifJAs7F6U4Fw
Date: Fri, 26 Apr 2024 10:09:51 +0000
Message-ID: <MW4PR11MB70568A68757432E82F25933DB3162@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
 <20240426094947.2039436-3-tejas.upadhyay@intel.com>
In-Reply-To: <20240426094947.2039436-3-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SN7PR11MB8283:EE_
x-ms-office365-filtering-correlation-id: b3e4d60f-2804-4d46-85c7-08dc65d90330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?EUqC461FfvXsDXHrRhujbi4lvmG75NwERPqxUdgDZzK3D18UQSaHtQcQUOwB?=
 =?us-ascii?Q?WGl/e3vfjoLVtdBXJugnlUbYxavqg04voQaJ4LE+XPVfVaAVwudczV9q+Ai1?=
 =?us-ascii?Q?ZVnm2yxTYgHG2+vZmF9mPOSskZmDGN/5hQ9b55Qt7bPi1tJTj2fOHCbZWOgy?=
 =?us-ascii?Q?Oocsayb8sUlUOLKEY7DQvuu1RbOJVqVUPyPjKFmkcCCsGUqj5Max8flxDUKH?=
 =?us-ascii?Q?dveWULx/NSVWsTLCKEc3+I/Ipl3VAS9I/OFTAO8abF+iWS0nKnd21ltX1XIq?=
 =?us-ascii?Q?Jpp6+3UwwAoFoNqBueTCwHlH7tHTpe9PApfwxGhA3+ezH9BoRfWcErtaPKVQ?=
 =?us-ascii?Q?STzvbUujbj0hohxhsKKA4bfblk87UlRTY9i72sd8jhTaFKK3PY2WqWIho1wZ?=
 =?us-ascii?Q?jC7oaVpe1DBao707u3QAYJvZ9YJSb5WlKVkq4KO2/zZww0Nv9nR0HQSw+nUL?=
 =?us-ascii?Q?4eSaCiY3YLe5vHMzIqyGiHxbIiFBCHMmjnV7WpDxrPm7/ZLfAyqUqwHs/3vt?=
 =?us-ascii?Q?DVwsXiuwtj/gJsPIGI2Qhv7zXaIIz6A7g6G9j7Z64gSMdsntH6c79ttjbcSz?=
 =?us-ascii?Q?A7oKF1Td8BrQd2PUhBPsZI5GMei8Sx9sFIBTlsI3ReedCiPnbPVAj2P8bHSJ?=
 =?us-ascii?Q?eEnUFMVtfuTNtnzhIhtUboa6P0F4rE+uXhQMz0IYAbE9IGxRs3BChjH+cpJ7?=
 =?us-ascii?Q?4kFYyQ8YbGdD/NkkQnB51MnlQ0qqWAXLgFkILTXu+T+ME5b2Edaz/ua6TJiZ?=
 =?us-ascii?Q?Yb4ErAGxfoyUiPro7HlviFwDGLN8R3lHQVTJIJI/d00rAg8YtbU2u5N5Vgau?=
 =?us-ascii?Q?S2KdU8egPTj86JobtR0cuRNMflxNlqZWMSeVW7BcH4+fWaLAA3HG3LlPfYZS?=
 =?us-ascii?Q?lzXd88/1EUneTtD9u+5qrs35P7EjsKMzsXu5jmTGk3V/HiWhC6JjJUqpEHD/?=
 =?us-ascii?Q?+p+8AY8PHXDdcSg9GlLeRiXzMnKMcW1v3wosgB61HM96CQyF9i++6NWwc4TE?=
 =?us-ascii?Q?ONjL4zFvHqj53dKs8TPsARjF7piUbS0lrQV9/rniGphLNSA7sf91D5bP7dGE?=
 =?us-ascii?Q?VLx3srBmt7ZCGkFPq1GshFWYihBQ5HV+dek7PM8MVhXjSSbZt70q+VLj+jaY?=
 =?us-ascii?Q?KVI5XChJrSGxBkDRtj3snMkYuSxdojVxMKABFhE+dOx0rCt0a2WwSm/tLWgc?=
 =?us-ascii?Q?t0zHGAR6Np3GsBoQ9+RBNUFIbsy+NgTMvoj0It9jnnaOVMbtQ5t0QGDOz2hy?=
 =?us-ascii?Q?2Grk8j1OjuKPmLCwiNTAv//Y3TRfIIdmk+B2FH+qeSE1OTbM9muiMai3I9V5?=
 =?us-ascii?Q?XGiJpknKwY525gKM8MA4V12oHEEgF5nXeloymBysxmohoQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HNMoHNUQrgoGrti5ralqEuev/dCu2KWvTf/RblKXV0s+gGtPfndc5KRjA+rN?=
 =?us-ascii?Q?IVSe5+wdKk0kkeL68AIqdq7m3QuILQwl5aL2ZUcp2J+O2jFwC6wtBCa5OP0Y?=
 =?us-ascii?Q?WksNGdgDtNNeV0X7YhMh9Kw8Mbu42bf/mkZvvQzi2asiIylhbUsDpvrRMZr/?=
 =?us-ascii?Q?LgttZa7nfN1AzsW+aqtl4EN9oqwWx+EGiVED+oKwaxV/Mkyi2VFjlV7wwV82?=
 =?us-ascii?Q?A47WGUuYwJlOAaOnDK4tg7uBwiJ9qWEBWMsTb5mewiXGH6y+/k5/WF+UeLSQ?=
 =?us-ascii?Q?tg3uyYX5KEcb6QJT/zQqqLvSdwDqUKA702fqZJ9+4QEzZnDz2J0BM7wRo/Du?=
 =?us-ascii?Q?+Yip9Y6ZD2giMgeGyA5vfulPjaoiNJTd+AXbHG4FGh9zcHFfFt9YMgMpgRQV?=
 =?us-ascii?Q?ecYswUUqwL+0eCz1MeFHaSxuaNVXXaNUE8WDm+/39VAhra52u3I3Hn9cK0Dt?=
 =?us-ascii?Q?EPgYCofIG2jBWMZVGxA34RPE618A3RFi9+nyPy6+1WYSe7Msyi3FbzEo4toF?=
 =?us-ascii?Q?iqtTDDIlNAJstIoiaPXcOkDev6H7RtggK464F8mRh1D+RWt6k0GXLEDM2CFn?=
 =?us-ascii?Q?5/Y/CYcnGRyVjPe/R3XgRFCzpYLlBNJCl88BQjuuIG5g2Vg4vspWlm/S3TWN?=
 =?us-ascii?Q?NSDX+SoVPcbFMag0xnxRli56jZDq+01SH0yXqXnlZpMmlErvhKVDIibMtXMG?=
 =?us-ascii?Q?TxQV3iK+Y66qk64WDklZQFxhwIjSXxbBeMcdptmHUZJRMdMwI7PMSO1wl4sD?=
 =?us-ascii?Q?ML+mJ9kgXJ2kgPoC0eJNFkum6HplY7SlV3ecN9DcGVM6dIodY5XI8jH9tfZT?=
 =?us-ascii?Q?RvkL2cbY0vj+tHnZIrRSe3smS/zm9UEz00PdQYbmCKSM+iTW7q8IHi8I3Pdn?=
 =?us-ascii?Q?9riP7Ix/0Wc0CLEv6RIn2jKJpgPqlXJ7NsoCy3dsbwQtRK48lUK8YXbfNGNj?=
 =?us-ascii?Q?SNREe+o83COGRWGdqFvOEtFnsJ4PSBtM6+M7sX+hQ+poekLru+ZkWM53b4G1?=
 =?us-ascii?Q?ynWaOGqS3nNrp2xm8Xl4EOgxtdrjfHuZCDA+HmLkt300vFIn0uNIpdSamVsk?=
 =?us-ascii?Q?2EdztadlbNjd5ZSEFPTB2BiCKbIAVQL87oH7Zn8JGK7O8N66Psmfsi7qiof0?=
 =?us-ascii?Q?B6Xa5HDJygAeMJnHbcsI4EgGW+aGTfl1bgFSMlghaLcBzjqA9ySYE6Kc7w5A?=
 =?us-ascii?Q?pWob/fqlD3n2nmnbdO2HaUmuQsvvqOwh1NnIeX70Lw6UdlkMzyqJemP4zj6i?=
 =?us-ascii?Q?ZRpB+8DTr32y5jog2cFJ66nJ5kw4IeNe9PKb3kvVDIk3qF2dydvGpNT5+U21?=
 =?us-ascii?Q?95YNIKrA6wIUtC8YPCfWB3ghhdG2H4hHvUVMEPjmqLsHBO37NGNyRq1ecoxg?=
 =?us-ascii?Q?dlhgzB/Ie/KmZZ6eq40aQWOD0l021kWd4qdyCxPp/9bmldKUk1icPptl20/u?=
 =?us-ascii?Q?SVd2t6jVU/nboy78jcHQbalsbcq3gRBlGvsxcJouhfTi5ccGnzslvJGbjAbP?=
 =?us-ascii?Q?1A5LYAwiRL0W0YmoNAJ9FALCx0XQ/YBe9Gc1T4tMHa8WIwAJdIL65hI8eDz8?=
 =?us-ascii?Q?Lv3CTCP6F2mhQrVxNRbtba6rea9RMyDhI+4i+aejDKnkJfDagYPTYhvZyRi3?=
 =?us-ascii?Q?Rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e4d60f-2804-4d46-85c7-08dc65d90330
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 10:09:51.5187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb1+UHmeKr6qI8Btk46R7/BZi+No26fQrfAHWgIQgFDMl7YMPYxPaES2MZcrFY36NJcX4N79kVsrkEXF8owqRltgPsBcVMiBm/AS6aCOVsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 26 April 2024 15:20
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
>=20
> For xe2_lpm Wa_14020756599 is applied to all steppings.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c75946e70d84..d692eb69f231 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -697,6 +697,12 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> HIZ_PLANE_COMPRESSION_DIS))
>  	},
>=20
> +	/* Xe2_LPM */
> +	{ XE_RTP_NAME("14020756599"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2000),


It should be MEDIA_VERSION not GRAPHICS_VERSIONS.


> ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> HIZ_PLANE_COMPRESSION_DIS))
> +	},
> +
>  	{}
>  };
>=20
> --
> 2.25.1

