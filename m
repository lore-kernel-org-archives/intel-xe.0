Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63708C982FF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 12:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC9710E3B9;
	Tue, 22 Sep 2026 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhR9bjwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A17010E3B9;
 Tue, 22 Sep 2026 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790078636; x=1821614636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KpXlNIIeafIm9MxrlaLkwwMm+zh+dnKlslH2IeWsRvU=;
 b=mhR9bjwtHAEuBpo8Jts7Qf8FPi3oXlLtjlMfvy0bSnxV+oLBhtLLIJfA
 DozwS/UckEwOrgCrqscbhr9ge3TsDk19YwVxeTjSgS06jBavHwBfm8aDZ
 f5WaFqe+dS5LPLWrunXfjtafrTXGO47nyGLq0wdhWT3fknm0F9uAMsT42
 QBPSgMr1Z6cq0r6eG1mCN8/lDe/2YpQb66Bkp6Pmh0F9JLPxReWNEJbW6
 DXc4GEkWtfR4d2k384v7uSPBK25FAqD2E5ztFtTh1O7EsJmiyRyySSknM
 rltqdHRay65TAMAzMdLVnmN7Bd5PnLZSINTVTIyREw2G0TZp/Pz9gpesz g==;
X-CSE-ConnectionGUID: oRabzLdFSBm+tADLKgf9/A==
X-CSE-MsgGUID: 7zYuMxqMTim4oBIgGOd7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90791074"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90791074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:03:56 -0700
X-CSE-ConnectionGUID: xqOjl8wsQbiR81IG3hSDFQ==
X-CSE-MsgGUID: G4Mhcp/jQp6E5vVJJywBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="269618482"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:03:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:03:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 05:03:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7SOrz+G/fY2AfjjSiyT74jWj4ySVy7dYiFC3RMwwODmKL9pX01tt54TVxae7K3GzjNsEZw9fb8k8MtMmj22HVkez2fK8pN031eUsnRhL2RSXJD+gUq6rPpJF8YZN0vWbfyC6OGdWn/yt6gby8BZbZdPxyZIai/b+z9IBji8iFbwEF+JDPg9V3ScGSs170h7sCh3Z6v4KFX+OmNoDu/cO2adjggWz8ArOIrYLylLa8ELsCRIEW2gNQyzlwrAbiWAAqAkAt4D2UHC/85k8EYM0R4/cTeQlAO4onNl5+Kx6cJsG2+erwsJ1NwLRFk6MYL0BKDwFnsC/LymgMkICsaQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6IIOoe4bgasZp3mGAmKBTDg49QlgAw9hI81JhE2qHo=;
 b=tT9iwWvLecbo+xA6IlDH60PQNM/jb+yyS3Ow0D66qVsgN00VOMQE7rEb2AQylZkLxXqiU3g4U8MaZWGAuYb1OUFvUA+uAdPu20yx8VYwuFgLkn0Zk3OdbqHnuWljr5t7gp2/c0yBLKy0aZabGeAwMQuDqFhnxeM3RHYr6D3OElRezMMvr3xxq5AsH2za/Qkfh26tlnXzFwjAWyArj/WOKpo6/cWCrWO6vvLMYkgw7qTVY1LoziaJZwDaEzuLqsgM6jLpYVdbxZTNBoqLHnP6K5+nFX4agUMnJSn8K8rRGOyq7SdvCpNhRHx3zUOErOvs/Y49miiLFCMZT/axwUF7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA4PR11MB9229.namprd11.prod.outlook.com
 (2603:10b6:208:563::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 12:03:45 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 12:03:45 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Topic: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Index: AQHdSYtK8OiKqE0O402I+aqal7UP/LbaS9KAgAA1z6A=
Date: Tue, 22 Sep 2026 12:03:45 +0000
Message-ID: <DS4PPFE901A304F6D748BB6248A7445C618E3832@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-2-suraj.kandpal@intel.com>
 <MW4PR11MB688749142C46E4F6396AA9FFE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB688749142C46E4F6396AA9FFE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA4PR11MB9229:EE_
x-ms-office365-filtering-correlation-id: 2c37f6f2-47f5-4bfc-fa05-08df18a18d97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10070799003|38070700021|5023799004|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: kFX9f/VP5XBtP9AolAJ0MtYRwZ2o7utApMhzBijddn1TTKGBZO3DgI1MnPGFF0qcpHyLZkPA+CdP8Sk/YJU+3SeD19mqOkI4CJ70wWr2nF1pBD6spF4I3zXWHM5M3qYzwnSEdofqL63mrTJ7YhkkiyIH6BDQLMdN580pIcjCDj2I7WWm47aWxmnnEMMgJy0uwxuJ+C3PPNWO9cbDJ9meVw2ZZHl4Z4mrQS4BzUaKpuXxrC3s6grmf9W1JnlIkvmcm5nWDUPbbEU5ryxDfMfmaKLD9GGB06Lf+BDdm7PdtN7QUXMPRuZKluRJr7GRAFzvuDVUAYmL10w1BZ+zcfnqp50TZnTHAKtUmMptNbCzxo8/B+Wx/qTpcqX7J8an8hBnq9zH9y9wYmhspl/xgKxc1ZQV9VJou/tAYEWRlU3wyC0Pq10kIJ9SE/pwg0n+mpcS/t6C9lh8kn4+BDpe4YqnA6ElZu2UFvK+NQkkujjE/946RguDcLf2FLgU3Vo6UVKNujIELEb4P/mL2bHuFJPA37wwsgJdgcSB1aLsel4HTAKTwOe8rJLSbrEMhXMJWjhbXk3H43Ia2jPvGWcni7/AOHXh0/oWFxzPkj34+AQx4W+jw/sSqiv0IbpWSPpbCJ3FdA1dqiSdGm859l++//wc5nKTWzq5TGn7Yx4gqwHVKt6+wu5hVL/rbavp4mx6VJh3FmrOGCTX/OWwita0PRCSYLKYciTOzDhUpN1SLh8FhPE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(38070700021)(5023799004)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m1XlSnhNO33otsXCRZ3DwuNHhRfwehWDhfaNYeGCmC82jQWU5K+zK+hiiW5v?=
 =?us-ascii?Q?8ykFW5ys+VCVi2YOxjv3QqdDZlm0f2dhkmzDN5AEQagh6IHyt8hj84YzSeVf?=
 =?us-ascii?Q?pNre6i8Hj/9qaqvxtDUW0+pFDGvt92lZMOfzidvZ+Qf9D8g4D6iaoRsyHa8Z?=
 =?us-ascii?Q?HJnVOWBFSmX5bQmEqqOQSYWFLyyFmnRQYrxFFyS5MKKzdm2b3eAniUf8HV60?=
 =?us-ascii?Q?w7EL9u0mQglfp10qPv1+IuciaEiOEVIugIpyH9ILbacGVZvIwaFMt+ISgk6q?=
 =?us-ascii?Q?VpuIiNYkeP8GwHyGNu6Z+FrcJLTho+oFlY0qqGernoH+lJzveZE8knYi731e?=
 =?us-ascii?Q?CNyzi7KN6AdtestBtHOZbleXUAqM+dbaM+e6EiXwlkTLPtDbdYyYwzAoZKMj?=
 =?us-ascii?Q?ksz6MHQlCwIo/CZ5IAU/nfDwpHLhNxQ1SuYfqO7/K/D9ZXItJVze1l2fpgdX?=
 =?us-ascii?Q?ltyKDtBRgrD16YrUkLtUtUiqI6a8Zl997zFi+wqeh+I8xYTlkFcizWCEs5Bu?=
 =?us-ascii?Q?6A1BSGUY2sInUmADSLXkAOjRrSmzMwB/iA3qBJYkVzKAtf17NxHzZHndO6de?=
 =?us-ascii?Q?X43DOj2x7TGwhCUUt0ksB34B7U3O7GI6Pqtl7sXH01ZTr4YOt4ZpbNYG80Z7?=
 =?us-ascii?Q?rlEVe2wMbaKzwRg3D4HLW3+Fl3NqY9/Lb6fzf1pZ8K/Tta2eXABvjHQcVpzN?=
 =?us-ascii?Q?WI5Xigg+OW2YY4QuGehCbQepMnINiv/YSeB0phVZH6NhHAjlddMTZeDw81S7?=
 =?us-ascii?Q?9J67c2u+KAswcz1M47+XOU8sCN0nZe32eeH8KOIQ4NSjrCrgk1Kbey43lU5H?=
 =?us-ascii?Q?ROExQ8ShXZA29PGMjPBaGbFQLcfqbsDNVxgePp7JlA3q/EDlYJx+G8L8Au1Y?=
 =?us-ascii?Q?0Ab5XnpY4aIjGnLyJHgr5k1SEWC0usAVwX/gJZnCYFDSwiX4z/vtIBHMjXMl?=
 =?us-ascii?Q?Iyj4ooZ+bL20p38/Pfe6P9vc6LjmhtMgogoU3ZSHU08V0y1lJK1OSflC/3Nc?=
 =?us-ascii?Q?pwweldPdfSd3bgJeCwFNDClKrDesw6XwzmZXEwppox7cgd1msXaFmWvuPYB8?=
 =?us-ascii?Q?ucMrNXg+JyVbmXOwtyEZSrItz/6DVY8EN2cvQ5wXBzEeWckDM0pvZGZVIiwq?=
 =?us-ascii?Q?QgFXo+8QT1OYYX7EFYBJed6sS4exLYqYCVVKCm0/xY4TtLGB6GR+/HQQmA+b?=
 =?us-ascii?Q?WYm+Wssd81ckmtOayLDf85bWxBgI5zyX2atZNPoaQhtbgMraeFpHJDlrFffs?=
 =?us-ascii?Q?DboPlx6SSoHPx4L1+ZkQTML5lYBrntamAg0lUFVt08Q+c7wG03JnmZ8lm2oZ?=
 =?us-ascii?Q?Nm4eZciIO6X4KJEMX2iASPsNOo37qpMBLh8drpybUDHBoKKXRFYrXZMAe1f3?=
 =?us-ascii?Q?x57ffvtyuk3yeXMWeDUGuN59WPOXj3z4zsYUUnoShHS3GmsxgxQn5lmRLJoE?=
 =?us-ascii?Q?oIOlEllvpkUzDpl8nv7+UN29gZXMGKtPTsSK2s4/ZG8cu3gqeLZyg5peFiYc?=
 =?us-ascii?Q?Dr3oY/MQ6Y/Sv7fxENPvluTkgFTCglpGjZlQ3fio01xi7Vmedu7oBKIr0ka6?=
 =?us-ascii?Q?O+BV/m0oUByjAER6sySwImYcxZqs3J+W6juH9BvFpCThjNcMxqHCiTfQTloZ?=
 =?us-ascii?Q?y7bbplwmd8uOQm9LsZWuBfQcxgza74DQkQe1ALqIetlPvZ8es/pQwCQKXipE?=
 =?us-ascii?Q?cKBMdVUkqK3mup0EmEY3Jpsh7MMa/M1HWGqO4drPwKpfvWlPQz3v5OjmfmNY?=
 =?us-ascii?Q?gUCO3XC0ppmTbPkX5m3LyIxrFbzDci7avAxt3uTNsq75Wi6jl9MzKtiyBybq?=
x-ms-exchange-antispam-messagedata-1: +fozECxIFoew9A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hFP6yWflqdJP6hRZqLcnCe3PlFFapIQWl18oRyIh0KF/3JZq10sM1a50/61cx9X6aOo3kNwLmyAyEd/0gFlzJAkzEsJbZQqLwQhQVGRtmkVKEaa87GtfjJsX4/iR2kML6Sk2sNF0IrPI8swS5p2tY9p+oPGVnnLodojwDiz/sMYyo0CF+xnvuuBB+QwGhMVN7TuKisF4fduIODLc0iwCQMGkeCmQ7Y88jAP+RJr+jQ/vp5xdaPxeU48H6Wy4Ile1Tlax7urlMvXAJfeStys1k6AzvVQIpS9fiJUhZZbF0BlwrI4u4jcwQEkNTPNtmsA40XK7bNrVZ0V8wOfn+muW0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c37f6f2-47f5-4bfc-fa05-08df18a18d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 12:03:45.3921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hejtuRh5KkIUr0hQcseZ/Wkt1d2lEBPeEHtiv1lke2AAcSz+miUKlwRjIXOCYcNO/m/Ebj8F+kmsecsvZNZlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9229
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
> From: Garg, Nemesa <nemesa.garg@intel.com>
> Sent: 22 September 2026 14:21
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: RE: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Monday, September 21, 2026 11:07 AM
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
> >
> > Now that the DPCD accessors return a proper error code, include it in
> > the error messages using %pe and ERR_PTR(), instead of just stating
> > that the access failed.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_lspcon.c | 34
> > +++++++++++++--------
> >  1 file changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > index 07b5a9d010ff..82b40033728f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > @@ -139,7 +139,8 @@ bool intel_lspcon_detect_hdr_capability(struct
> > intel_digital_port *dig_port)
> >
> >  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> > get_hdr_status_reg(lspcon), &hdr_caps);
> >  	if (ret < 0) {
> > -		drm_dbg_kms(display->drm, "HDR capability detection
> > failed\n");
> > +		drm_dbg_kms(display->drm, "HDR capability detection failed
> > (%pe)\n",
> > +			    ERR_PTR(ret));
> >  		lspcon->hdr_supported =3D false;
> >  	} else if (hdr_caps & 0x1) {
> >  		drm_dbg_kms(display->drm, "LSPCON capable of HDR\n"); @@ -
> 247,7
> > +248,7 @@ static bool lspcon_wake_native_aux_ch(struct intel_lspcon
> > *lspcon)
> >
> >  	ret =3D drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux,
> > DP_DPCD_REV, &rev);
> >  	if (ret < 0) {
> > -		drm_dbg_kms(display->drm, "Native AUX CH down\n");
> > +		drm_dbg_kms(display->drm, "Native AUX CH down (%pe)\n",
> > +ERR_PTR(ret));
> >  		return false;
> >  	}
> >
> > @@ -339,7 +340,8 @@ static bool lspcon_parade_fw_ready(struct
> > drm_dp_aux *aux)
> >
> >  		ret =3D drm_dp_dpcd_read_byte(aux,
> > LSPCON_PARADE_AVI_IF_CTRL, &avi_if_ctrl);
> >  		if (ret < 0) {
> > -			drm_err(aux->drm_dev, "Failed to read AVI IF
> > control\n");
> > +			drm_err(aux->drm_dev, "Failed to read AVI IF control
> > (%pe)\n",
> > +				ERR_PTR(ret));
> >  			return false;
> >  		}
> >
> > @@ -371,8 +373,8 @@ static bool
> > _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
> >  		data =3D avi_buf + block_count * 8;
> >  		ret =3D drm_dp_dpcd_write_data(aux, reg, data, 8);
> >  		if (ret < 0) {
> > -			drm_err(aux->drm_dev, "Failed to write AVI IF block
> > %d\n",
> > -				block_count);
> > +			drm_err(aux->drm_dev, "Failed to write AVI IF block
> > %d (%pe)\n",
> > +				block_count, ERR_PTR(ret));
> >  			return false;
> >  		}
> >
> > @@ -386,8 +388,8 @@ static bool
> > _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
> >  		avi_if_ctrl =3D LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
> >  		ret =3D drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
> >  		if (ret < 0) {
> > -			drm_err(aux->drm_dev, "Failed to update (0x%x),
> > block %d\n",
> > -				reg, block_count);
> > +			drm_err(aux->drm_dev, "Failed to update (0x%x),
> > block %d (%pe)\n",
> > +				reg, block_count, ERR_PTR(ret));
> >  			return false;
> >  		}
> >
> > @@ -450,7 +452,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> > drm_dp_aux *aux,
> >  				mdelay(50);
> >  				continue;
> >  			} else {
> > -				drm_err(aux->drm_dev, "DPCD write failed
> > at:0x%x\n", reg);
> > +				drm_err(aux->drm_dev, "DPCD write failed
> > at:0x%x (%pe)\n",
> > +					reg, ERR_PTR(ret));
> >  				return false;
> >  			}
> >  		}
> > @@ -462,7 +465,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> > drm_dp_aux *aux,
> >  	reg =3D LSPCON_MCA_AVI_IF_CTRL;
> >  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >  	if (ret < 0) {
> > -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> > reg);
> > +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> > (%pe)\n",
> > +			reg, ERR_PTR(ret));
> >  		return false;
> >  	}
> >
> > @@ -472,13 +476,15 @@ static bool
> > _lspcon_write_avi_infoframe_mca(struct
> > drm_dp_aux *aux,
> >
> >  	ret =3D drm_dp_dpcd_write_byte(aux, reg, val);
> >  	if (ret < 0) {
> > -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> > reg);
> > +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> > (%pe)\n",
> > +			reg, ERR_PTR(ret));
>=20
> Instead of , "DPCD read failed " it can be "DPCD write failed at".

Sure will fix

Regards,
Suraj Kandpal

>=20
> Thanks,
> Nemesa
> >  		return false;
> >  	}
> >
> >  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >  	if (ret < 0) {
> > -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> > reg);
> > +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> > (%pe)\n",
> > +			reg, ERR_PTR(ret));
> >  		return false;
> >  	}
> >
> > @@ -615,7 +621,8 @@ static bool
> > _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
> >
> >  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >  	if (ret < 0) {
> > -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> > reg);
> > +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> > (%pe)\n",
> > +			reg, ERR_PTR(ret));
> >  		return false;
> >  	}
> >
> > @@ -630,7 +637,8 @@ static bool
> > _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
> >
> >  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >  	if (ret < 0) {
> > -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> > reg);
> > +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> > (%pe)\n",
> > +			reg, ERR_PTR(ret));
> >  		return false;
> >  	}
> >
> > --
> > 2.34.1

