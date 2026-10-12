Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5374CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76E10E592;
	Mon, 12 Oct 2026 14:05:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1510E592
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791813945; x=1823349945;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rJ0lzUfzwPsChzTS3Hj4NZXoDA9v4O1ITtnSKqXSZ/Y=;
 b=IpAJdUZAhJq0TOieAHcpzwtY+pKC6nsUIa+PZsN3yKu2uygiVapkZLIy
 Zh5xm8SKhB0diqsQB2W61fyFCcpfjd2TlmKg3p/p7nZDMemeu/3VDWvVN
 c/R5Ln7PZxhSEysW+KL1cA4AEWsUj6KMetKw23LQhKFnUA5BIi+On7Ia9
 1h04fbu6nsbnDprKokwDx8oIhGiNq2Vw1N1xLvIYdAe2IpW4YTLu7CIit
 EvyLpSbrNstOP2Z4e0h4LqWnNMwrpAyDMbOk3CiZIG2W5F/pueJuZhA4z
 1R8NJXQfO685Q695v/bzsDCWOgrYEVexrDEQHU5jt2ayD2mPMMUwTTLgs Q==;
X-CSE-ConnectionGUID: dUKjC2OGR+aYckireeWZog==
X-CSE-MsgGUID: qVaMr7d+QcCjimEmqe2PUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="545585"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="545585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:05:45 -0700
X-CSE-ConnectionGUID: jAKoAGEYQE2QxZirVvXMaw==
X-CSE-MsgGUID: YBzgPaUcSQie358s8Uih5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="915392"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:05:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:05:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:05:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJMysR5zgeI4pXONzUSB4LcyOh9spzl2vmzlVjWT8saQPw95cn7g2YhXg0P/B4SQBAvJicQ2NMvcMbGeLUyF+bRWO3yvHxL+hbBYByVTNhyIri+RWGAZN5IiRtzuqz62ZX1z1daTPQmqQlW1kz2M4+W77SmK066JXp9Vb9xxcdcZp+2cAcI+d7ctBrsnxEZtcZkohgSzCFNhaTWvjX9ymgBXy0hQVyhpBj4UvZ/SYUWsJMswoGMU0E8f0pLva32toEV2gdDyygfzSVg8tr0P7DNy9TE7PTbnDCHnSYEVeCJh6pGOetdiZk6Kha/Yny4255nxnTvDn6FIWiRXnMgdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOraHP2+ZPFsqdJGYG0FwXHSAucO+HlaUgnHxCOoVJM=;
 b=vnGgHpHnXB0blTod0tHrO41Ba93x4rOw8Lu8vWev66kyzqM7DHMQuHPvW52tFcAoZAjXFqp9eJ476jWZZAV7+0XpyYtLO7t79rgHW2yPXR8gERf+mCpSzN+maCPQ473wFB6CXz6rkyreDPQH2vvg+GvGIqBGNge5/RRM1IILNEce19JpneyF1TnbiLeu4R6AerW0v2ifzul/sGZfIqMOJjxSPFXTK39c8oo6pGWezYjYlWLLbOFu0xRC9THOFcCy/dk38g2wwzvpyHxDaUXKyRFDGqP9o4ShpSqFMh91ye4MvECRW/yiO3k8YHkyhObFblyRUYalfP7l99h0x2WtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SAWPR11MB9572.namprd11.prod.outlook.com (2603:10b6:806:4e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 14:05:39 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:05:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
Thread-Topic: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
Thread-Index: AQHdWHnxyw511W4kZ0SZDVy5mM4q77b59F4w
Date: Mon, 12 Oct 2026 14:05:39 +0000
Message-ID: <DS0PR11MB87183BD13715E4AAF20D9E8A819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
 <20261010054041.1327217-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20261010054041.1327217-5-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SAWPR11MB9572:EE_
x-ms-office365-filtering-correlation-id: 04efd7e9-368a-4a09-5efe-08df2869e534
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|56012099006|11063799006|5023799004|4143699003|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: blDrQQ6T8lDF3RnIJAnf/5h0fMRuj8DUV52hTmyGhrCZtHHWKoFvHIZ1il5bXHNXrj8Y/fH48aVEsa5d4Te4H1j2niULZYONqnjXGvkguiaKwF02R+0hrcbPr8aY/zn66+mWpjd5LpK060gOmy7l0bOqhHu9bpBSP+aiCum6VekkWuGE/V9M/oB+sJsd/RdnkK6E5Y7RTYGO7qOdRoDfCX1hdAPIOSQOrAKR0IywYlxMfOHCeHZ7lGYEVbOtCoRqpnQNDhtS6nOLjhv13DTWMGuLYWTruRABB194f/o2DjIhqshzbh83PU7N8Ni74cZQ5dy2frPaewGCckZ/7ENfsDbrW6JJgHDOiaMoqd8iUbdaiPz6u/Sn41BSgZ5SUsPk78wUAArIt9xcsY2cn8az3C5XTLIeyIun91JLC0jAXkLSv3jX+TTRLsylxTWRYxr2tiTg9JMN2NRFHKiEbhM8NkGOGVKO048eliToltevqBADEFAB1fFV0QJCn8/IWmaoBgeb+vivz0E1R75/f+CVsPa54yXDMwtj6zn5x+iyJ7wS8d49/vpUz1I2gNQE+HsquTkGl27pNumIGEjTo0CYB5KQdRMGpyqiqlDgi+B5GQarGsbY6aS+xwoMwJQZN6tzEqVJTTyyO5IUmnkk7Td6F9z18Jn1b1HU+6Lx45Sn7UgLThP2djeihro3cVfrG6ApE8KSIYN+FxVG8+iJ/HRMQfYFdLc26BOt9hsatJZYK58=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1K9OlHMU76+ZF0Huh0tWAefWSbZcNhe6yPS2dU4dSZbXelLEiJ5t511y4xUl?=
 =?us-ascii?Q?YiNs+zE7NcjJ7147eNvW4uhFxa6y1hPKCGKPOeIBYlX2TX2gxv7JyHiVEQzp?=
 =?us-ascii?Q?MJlDs65s8+cVTMPu8/6YcNHduDNLeMZR95knckEJo84vSFf/tFoTqsAgpFS9?=
 =?us-ascii?Q?d6Dr5oVZvBVgZ59SiVuU4T5jLPJLjEwZIN3yRtpEeGteb4sHHNm5zwpjtDTS?=
 =?us-ascii?Q?AxbWeUjseP2ctf2dejuBdS31z5+Waw5vBM5YLi2WP7/gKR97cdrABp1kLMkV?=
 =?us-ascii?Q?CIoitMDQxbPPQ3IdU4Ya4VW9xF7RpMgYwqZO5iy5/Xlu0TJPZCd8Z/+UUnI/?=
 =?us-ascii?Q?cua5QRqfxIig6RVDCvkcIWePb6HEbmd68/XmjHFAWsyXhTrzqGD53KIVMpOt?=
 =?us-ascii?Q?9sM2G2ZMxjX7V7p1YE4LVDzfA0fbqiR5nudkoVr7YzIvBM6ibpkfXBdaMCCC?=
 =?us-ascii?Q?/nJ8XOFsGWByjcN6mOQhsbPY+Z6Ia83AASr4D0cy9lXiAHUcRYnRXmQtqPJ1?=
 =?us-ascii?Q?9fMQhZu54mbHs4wVJOjpp6g6kCRc0FJ9fRsZg/KVJcaB1sQPytzNcAfhE3pp?=
 =?us-ascii?Q?gLg5Vk+h5BVvcsCBwZGXBL6YsiHF+lsddBTZn0tjp0iYIB5qx/uYi+i12oiQ?=
 =?us-ascii?Q?+IhCvDhR3BOaGy6Oukevy1LaJlxmRcpty7DwSCLDI5jaY6P65DZXqHCz5K0A?=
 =?us-ascii?Q?zzTRWP9EltHWAWCBJkvK36I6TTL/DFQoOEgPl/iVSercBacfn2GHgHpUdzLA?=
 =?us-ascii?Q?Ll+Ps2zsrOL4a16yGTRq56Nn1sPzm48AqDFbWm8HeddD/wTBi1EeHeyKLxQC?=
 =?us-ascii?Q?EAsTD/Wx5BUh/HUuAeK40Y1yGDwEj/uZn6u8YB4LgESmVI2Sfa1qebQC5lir?=
 =?us-ascii?Q?bVZaTTXo8/SpFcYtc35R13FdXopR4jqfQtJQu5uqEWxt5mhHt46cGr+l/Gqm?=
 =?us-ascii?Q?dP3EY+EZkb6OpswCxMfqlfpIu5TPKVWV40MYxixvTFgy9+wv1aeMgFO8wZXv?=
 =?us-ascii?Q?BdtnrGOtdHe0uo1QlMdw+dvhJ/e+ThITbhtfTC4tnBl0Cp2ujFs98WNIHp//?=
 =?us-ascii?Q?d6+4ORrSisAwdJlvqP/1DDSioEs9Fm80EMCJR6OrPVExIpBAVpc2WRsU6SEy?=
 =?us-ascii?Q?DZ0YFnPZiAn9PuiMFkW/mZT0e+ATuos+W+vdmfu1apwtLJABS3Z+G9rHPjgg?=
 =?us-ascii?Q?r7JwsJO19Bg02K8vINdZTT0JojXKdMT6Z13Otp2Lp9EvbQMcGjRtH6MwuTa8?=
 =?us-ascii?Q?A9hvXvhZKneAulf3lYpyHZ69z2vIO5wPPnbm+nSr9GkxxsgeHxFxQ9/Wrfvi?=
 =?us-ascii?Q?KpSxdVCyf3grHYwE2OhUT8TB7U00Wk5i9wXDyjAAEisPKI0z0hXjivQ2pczU?=
 =?us-ascii?Q?36iceYbIjtWnlxJ05d97qgedbloqDL5qMOkBI/z2KZcpOCDSoYLYjtVJ8wxS?=
 =?us-ascii?Q?MRLGwlwU2/KlFg4PNOCxMjWcsbVf/nziwxpInMEtboE10V+nZQCaNNQvBNUX?=
 =?us-ascii?Q?zAkJ/LzzsjOqyzx7uy3K6GjJgNap3M21J/Jcy6fIrasWX0twSKhQXATcjsOV?=
 =?us-ascii?Q?bWDQVbMl5Vdy2TwVvbkUZJPIPMUjPTY+9IfNZvUs5gX4gJqmR90kG88AZQlm?=
 =?us-ascii?Q?O8Urc+3jo1oDNlsj7CxIGhvk4TgWlrjWX99NpbzcFYtwmZxxLv1blDKeRrRI?=
 =?us-ascii?Q?yAzsRGRnaCVhXmUw11pmqaGLOQ8Lb9b9w5BtCdrvZvuH7fLp3JX1ZiOQud02?=
 =?us-ascii?Q?P4GwAYiqag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2uEUV8G7CDgY2jgYDDcDbZ8MC6Jvn69rSn+gJHZt1OVBbNOIRjr53O9u/DqklmUArRVlJM+BY8ZsYorXEuRONwiXLGA9QEQzKx0V2ReVHdI4P3XSJ0l0L8RuLYJB28DchabSy+IW05SZ5ub9QR+EcQyfJ01Zrf+a2kJUPpImN6M70QDr4PDWwiYhExPh990oZkr3pAkLDC29ekJu4MwtuP6BqS8bR9oJuOBxmxSIrJ6jOJ1Pp3borHxvxTEG6werm04/uFrYKqM5Q29beBouU3aV9KtvaRSXocFwjv3nhB0KUn6rQDi46PcO28fclV231oP4A6IKT2ToTJuuQFvvoQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04efd7e9-368a-4a09-5efe-08df2869e534
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 14:05:39.1327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFF0TMyTwCOrR0+tqQWeCbm6AX8QPG9PKWWNZwXegCa7mBbFyMYxUCFL8Mh5Fne1aP9TXjfF7kyohx2de5Q2fQQjYPnJm6V3bRT+C2mesEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9572
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 10 October 2026 11:11
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
>=20
> xe_evict_flags() switches on tbo->resource->mem_type to choose an evictio=
n
> placement. An xe BO can reach eviction with no ttm.resource, e.g. an impo=
rted
> dma-buf BO whose resource was freed during teardown while its attachment
> is still live: the exporter then invalidates it via
> xe_dma_buf_move_notify() -> xe_bo_evict(), and the switch dereferences a
> NULL resource and faults.
>=20
> A BO with no resource has nothing placed or mapped, so there is nothing t=
o
> evict. Return an empty placement (num_placement =3D 0), mirroring the
> handling already used for non-xe scatter-gather BOs just above;
> ttm_bo_validate() then takes the pipeline-gutting path and returns 0.
>=20
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x
> cc78283b702c..12e523c61c1f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -340,6 +340,12 @@ static void xe_evict_flags(struct ttm_buffer_object
> *tbo,
>  		return;
>  	}
>=20
> +	/* No resource: nothing is placed/mapped, so there is nothing to evict.
> */
> +	if (!tbo->resource) {
> +		placement->num_placement =3D 0;
> +		return;
> +	}
> +

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	bo =3D ttm_to_xe_bo(tbo);
>  	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
>  		*placement =3D sys_placement;
> --
> 2.43.0

