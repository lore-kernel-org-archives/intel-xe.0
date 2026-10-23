Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF7E606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1uRMBOL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C587710E563;
	Fri, 23 Oct 2026 04:12:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3C10E4B5;
 Fri, 23 Oct 2026 04:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792728737; x=1824264737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bjcUOFmZ1dxvBgoikd5UHgcukLf9dzJaI024zM2tNx0=;
 b=J1uRMBOLX5hP1Ab5jjm8AIwmW3YGB3itzebJ/uXkpnkMsZuTMlCAbKkZ
 ke+LgzCI3zLCus4jdmxP43ERMKZjQ+W2hAtnDxpJa1RMK9iph5w1LIMEl
 cF+w005eyuVdm0yRWQb0ttNG1OpTBG2HJqPhhFJo2sRe1ajWR0Ua3Axtw
 AjzhIgrBy8bzUPDMA4GpQxAFDlSFiiongcf6AQpxUC0InCx5GwsQYs8ki
 KHpowCVPoEyIL1HoI2RxPcLvv3yzmSS+2UzPQqSERCz41dBzk7mmpMapE
 fjLfoEcoecDt3vgMB+xQGXstenqRjyQo6/3hcTRRLqQYkU2jcZGlVUfW0 w==;
X-CSE-ConnectionGUID: 0+gofrdPTCWja5taVyF0jg==
X-CSE-MsgGUID: YDOo6LFaSgC5ieot6baNTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1368288"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1368288"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:12:16 -0700
X-CSE-ConnectionGUID: U5L6qYcQQSuMVPPDJhdodQ==
X-CSE-MsgGUID: WkdwwQyQR+Cj2Eq/mPv0mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="4013265"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:12:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 21:12:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 21:12:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 21:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBhO8CopISB+LqnlKgrOyz0OGGhRgidgoDvqp7Qq4yBOnzWbxA/ahCwv5mQWy/3p1GHRh5My2igDFgzhveEgYB039mnvRHd5Hx3OhyAhHz8Vj9tBx6p5HC8v6lVZpHBmjbuGyAhnm6ZtCani0r/Zs/Z8gt5j7AEv5/GS95AIk+Sw/4DnSBHlBfQjjMYVkBzMUo6xsc65JIEQJjGmvgOeo+cOTide47G2mEMgrEt09NbPgHw2GJM1NXzDU8OMJCZH0B5GVd5N7qbgy3wN6ujbXVSCp4Wt8pZKwJKQGyM1oyuWzb2a2WsHKSazXSYFazxWf8m8ISsNBil64Ahd1iwbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG2NbQoPwuc4gHDIQjzgdSkQrDzC/DCVz4OZa66fbLc=;
 b=uRSx6tvxnlxYGCnCUlAB/kzJAHJjmrKp8cXrJCHTlnt8VRzrXDiypQ0LpjnHjHPDjz6Ec9Dcs486DP7zQueXiEciHZdy26DqpatSAXAJZdMWLGr27i7Jh1CDrYMwa6AynPQUmZAuolAlzJ4+YKuLTy0YD2QJTSh7t43E/0o6F4KZOxI0n9ser+rHz3xdWl4KjomEPBFer+jCN3tO8FwGcnjLGNqE6SDb1I40vNW80eml7By1jDHDunx7e297XGEXJCoyu+nxnl8/zlfATQrkr1VTx+AhWI5cA4dlQMwvfAV+SEarkuZqDdwMqSbCP+4exEBXPxenrbGO9sUj9c5L9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by LV1PR11MB747157.namprd11.prod.outlook.com (2603:10b6:408:50d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 04:12:09 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 04:12:09 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH] drm/i915/dp_mst: Drop dead ret check in
 mst_stream_compute_link_for_joined_pipes()
Thread-Topic: [PATCH] drm/i915/dp_mst: Drop dead ret check in
 mst_stream_compute_link_for_joined_pipes()
Thread-Index: AQHdYe0duVRkazaJkkuyNvHidbKShLcKhNHQ
Date: Fri, 23 Oct 2026 04:12:09 +0000
Message-ID: <MW4PR11MB68874C006226A68DCB176D9FE3642@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20261022061736.1721600-1-suraj.kandpal@intel.com>
In-Reply-To: <20261022061736.1721600-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|LV1PR11MB747157:EE_
x-ms-office365-filtering-correlation-id: f957f430-f8c8-48fe-3726-08df30bbcebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|38070700021|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261022075727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: i+KS9zGRFPGiZhKE6ZfYdaOXdIzn6VvR2o4rupBP7vlklmblsxbn620WFJq71XyQaNvWHAH7hg4jTbo9E0g6qbaPa34o2kqUbEmeQQAY1uxcJbDYhhBekZ2fGKmmzM1q0ITe9dN+7Z660leciIISi4yn9vWNYQAUBDY4eLuZyAEECs/+sIksjglNc7OjneucJMExtvzvySss8K79h0cot1h1s8Kj7E9It2gP0RCeHOy48vPFdSAUX3Uk5vzrs43YjNqdrC4PHJ0S1MIPZ1eomXpKxUhgVgHzlvc6QUR4fz4lmQpQ7RjLQ5YVNoxNHt/bQF7IuOFllIAuK5WIzIuvEXvLWDvhdwxljVfosPqGP2DnGnO9sBW8M/KH+6YJluVUtG8+3D85tiTtuw2isxcTRYrhiCcC65OkKwNWvHIjlJZ2LUzlmyAr9XSl+rqUPF6NBQXNdqf61lBFeN4oz+A9oeGc7HtaU5BmZmh+uzdmcY8oBxGQxMiIk8ieVwUWckI8Mx5IxKRoP3sAjkLvCRcKHFTSIX5Km3R3PobVsacq4YcsIbUQ8Huep0/Xtt3KToXW/dwKfy76oXi8shC0BypSBYSqhxatf10f8nYve2k5UY0Re2q5cDdOrPKXjVuBOEhPGOxxwVrtA7Q4yGZg8aAwVR19u3E50iAU38OdOpSQaB6Ip7mIC7vO7R+1WNKqhg/dQBKsy9f27kTy+WJetAy0yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(38070700021)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yvAT3QTr1x9BCWAGJiurRS7ZuIlEMANoRWBBQ5HFNlhVFyJjUQ5lYJjTIIp0?=
 =?us-ascii?Q?nOZZKLVTTmhdaIUmd9DI/3/0Mzd/d5BuX16Hw2DDUeyTbBVG0u63yI7jlIvo?=
 =?us-ascii?Q?/7aVXQsuTF7OV2/VsDustGb3m6zk0PJxBOxvK88E6Zg/tZr60A0+2OTSoveT?=
 =?us-ascii?Q?wqqgUiBOI9Ixu77i0CHCLVnewECQBoubtpIN6/GCRUtV5bDm49k+un+/U8gD?=
 =?us-ascii?Q?HTLNjaSTne+P+8jR9ql4y2O1NXZvAZ3BOMEzSmmNob77jjItuWoOOniweOMr?=
 =?us-ascii?Q?3Fi0mWXk7f1A+Ly+3/RREjL96T2SvHQZ+Q6EGiSgg2oCP/nuJs0UBNoa5SX1?=
 =?us-ascii?Q?EYFQu60/JZg1JuaIG+f4ZLNeg988d8BVHUcXeNDYNVNPThZ+4Tua/hnqf+4u?=
 =?us-ascii?Q?yVzZxe52E2IEQfPTxATskR1x4d+KILTUHb63yoD74/X513p5E+AcZwmkNix/?=
 =?us-ascii?Q?2dROoqJE6485uKGLe7GdA18YEr1rVpwMrLujxroKptd+ZJTE0eWnYRFz8Aep?=
 =?us-ascii?Q?dfBWRZX6cIEfmbbKVC3bvjo2JRb5eFz0ifHQrGJjamIWtj8L9ctZZW+ovUQB?=
 =?us-ascii?Q?t5U34tBunoNIpOGGIfpSJpPJ/x+weSXuLJFqChPZEZruwaoBpAG9kNolaEAw?=
 =?us-ascii?Q?tiJ2ojnwifm7JV4mqmAvfVRZaeH9e0uBuWg7gfSTWE5woeHDWtW+nBIKKRTU?=
 =?us-ascii?Q?TXpXQlgEzuxRPamjjxvm/KAuhLrRG552zb4TxiN4DDmI0lW2jl0ZV/69znQs?=
 =?us-ascii?Q?5mPZLon+wseA/VhnykNuwqRx9LeVMVOHgq3FoYgIq3K/5j2D3LPU+ALHYZDa?=
 =?us-ascii?Q?YdAa3cilVMcRIUnqunXE942dUIptPhHPg5O4N8iGTUTg53tqeOYy3QxCMcle?=
 =?us-ascii?Q?GP7zIJ5SlVC26it0ZzdH/OMQmf+f3Gr5LM4PsaSVBMeV/tynI0Z86FGTJ4n9?=
 =?us-ascii?Q?orNl5NG+UysqW8qGkLvRCqQD9d6Jskqug2K9vJJuqXaNX5XrM9lf+uds0fZ7?=
 =?us-ascii?Q?RCY1FY+ToKC4pyC0SFaBdC8EDJyMnltbjefYSmSiY5oY/WAW6XfyiP24d0Tb?=
 =?us-ascii?Q?2uUxH0fq+wqq57bUp8p0Ny67l3FZTmMZb2S5LdNM3y6jyYjTX6J9lBmoivUH?=
 =?us-ascii?Q?mJY0tUd87+ZpM/CR3w+3BYCpMvFtb8yAJmpazyrywSBvRStiraYGXsZmfm1u?=
 =?us-ascii?Q?CD+U8wO1L3rwFYJnuPIkko5hk15OanmtyI9ab54z35D8WeLdOSVwDhN98p8s?=
 =?us-ascii?Q?BilDQ4pF9pupaKYKHE6AdWMPYyO6wPaJlxZYFVdoovor4cllzrzm+YmkKPym?=
 =?us-ascii?Q?6nABNxp1QLdv0MD515Un58G+5zvrmNmgKFUVwKsItY/FR0iKFJWok5Q6ckDC?=
 =?us-ascii?Q?9boH/ug+q+HiAC9gRBGRwESdOm6p7PpChiwi3fLcckZXqPCICABjNk/soP6C?=
 =?us-ascii?Q?uLC/LLWZ2o2rZtvguezNEzRwo4nHvctinCzkLQ/He9544mPSts99Dzy8gLhj?=
 =?us-ascii?Q?Fo1/gg8oZuSXdYllnZ3gLkMP6qvH+KomAiLwERPaF/zs6K1V1mqBvGe69nTf?=
 =?us-ascii?Q?iHuPkOBspG+tmw6VL92Lw9NoPwXGqOhJ2aUiVcX/lEAvidhui4cH8mZl1jp9?=
 =?us-ascii?Q?nzU2b5HA98J/mu+QxUaD3qDKSltvVPg7jXMdiqAQQWBQYLcgNGcpDlChRUD5?=
 =?us-ascii?Q?VgGBEfLDQ0Bt4vCHCIo36svAi3YO7FTzR4d5Ncqe5jdLQSAU4q1LzcmUiT7v?=
 =?us-ascii?Q?8SD3fRVtdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ystDTHL6UX9vvhuvpUk4JYPGAJLskY2KDKdBTO4pZxP+HhZ0asVkT1hreBFyVL0jOf8wPaInauFOjQm1iRxqknQ3mAGNM8OJ9wh+US5fD0AwXj0gPU0/Gp+GuDdYh4dlZk7omgRef54Dho1rheJt9d9s24FHScE4gzm5m2tdbcq1DDGEKeoO9MGN84F8VmQPiYSIoQooGDm4H0kmzxpUihaATiYSF0f96oLe7xokbFoyfEAtcxBAdXnWETe233e3DhZ/flESKs2G59T30SU4sggi3dw1mgey39+jU/4eFs6jxV3ni0DsFkZ2LInFQoiC97jhyraId1gBc1liISf2Ig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f957f430-f8c8-48fe-3726-08df30bbcebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 04:12:09.4517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ql1U+P7NpaCtZT/M89d1ifazHpBLftz3Gw3XKAwFh4ORODIH352BZ3WtsTsWSTzVDGszIlxddORKf2S7NoJHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB747157
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Thursday, October 22, 2026 11:48 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH] drm/i915/dp_mst: Drop dead ret check in
> mst_stream_compute_link_for_joined_pipes()
>=20
> When the DSC path is taken, both helpers that set ret return early on err=
or,
> and the non-DSC path only falls through with ret =3D=3D 0, so ret is alwa=
ys 0 after
> the DSC block.
> Drop the dead return.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7023619aaaba..0424557eb151 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -726,9 +726,6 @@ static int
> mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
>  			return -EINVAL;
>  	}
>=20
> -	if (ret)
> -		return ret;
> -
>  	ret =3D intel_dp_compute_min_hblank(pipe_config, conn_state);
>  	if (ret)
>  		return ret;
> --
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> 2.34.1

