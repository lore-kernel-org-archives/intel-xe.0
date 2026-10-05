Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC940CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 11:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D64A10E264;
	Mon,  5 Oct 2026 11:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjxkAAAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156B810E264
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791199933; x=1822735933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Wxgbit82aiZaWl1sp1Pge1tljlyeAxNq0YzqkDvFEA=;
 b=kjxkAAAydNdby3HAGKbYbf76/YJFCyg/fLlWAmR2ac2e2wLcqZXFxslr
 F8lTxOCIdXypiBN5adL3U5wPfoFRxL5fx4dOIMx1Qre1cjdKlF8W/jsrR
 Np80f/bxh/u+NHHmrJ2BD0w7CsBToow07jzoBq38xqqhAHa8Qde5vLkpN
 wp3nhMREgGNAPE5bkKYxRbXiVte0idMZsZ01LfhKwHQOwhLxclYqEOA7R
 775t89cmloxXTNvT9MIwz5aiRW7TgA9Ls4ffX45op1WlGqZnjIE1j+ga3
 W2vPXN5Sd1kh4JgoZQnltcttVk4l4AE1C/bTiP+mSQC5fnPRK6Qk05yjZ g==;
X-CSE-ConnectionGUID: 5GYwzGCyTfal4Uadxpnm5w==
X-CSE-MsgGUID: hoQkQ7gpSyS03aXWMgdutA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="113645372"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="113645372"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:32:12 -0700
X-CSE-ConnectionGUID: 2syy1vuNStqnD7fyCMIzUA==
X-CSE-MsgGUID: Q9Rb5+lIQS+zFYzvSjoCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="273192909"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:32:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:32:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 04:32:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLdEy2HQ2j2mKD60y8wEoyPWzPWJv7WTf5SktiKJ0p/3y8RNeoVrhOOFwz4CiJLaYuUBeBKJHl8sPuqgvdI3vOqMjiGmW4wEexYfbxjf67NFU27RRwSA05RRGkZAJhhrp0VEJiJqeQs+EJ6yhGOQytVtGW+LBZuscS7v+mRFIGHVZbcgH7DQ4Q7TeXvvScngm1fM9ih0Osj6zd+jauK4Yv2e8DuJ3I58Dp33/CeweTrODK6UrPXc0Sq+YydBlMExPD79P0uMLoFryPJ4CLi/pUJ8VwWV8OokvU8NBcWcjGK/fmZ12unA8092RfD0G1/yfWNXZ5x5zpEoo24rpvYZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/uQskKr1TaN3/+1impjyCyrxtb6PzS42NN23D42nNI=;
 b=LY8rwq2D14u7fDjdW1QAC4kmm4zE4ck+LEPCSNbtPcmKrzF5u0adGq6X2P4dezMQhz8G3XjokPt8RPoxERFy1NfPkkOI5x+mHqAkCUoUyGAxKqHxI2XKokShi6cBS/iBka92YisIunJrSTzaWiRadXTkwEMFf7iqC8vwd4k2PBvv10nRwbUhGkU4iFOSBMypKrYqFJactkO6/Adr3HSG6CLECijTaHQSFysJf5Z3ptO7x23ctT2SbSAnQz89B29jv1/oSlaNI9vw9LkDAUjwgMpL2AuMM/i3WWAbedWQyX0/FgQqmEEe0lYyaabdkaF+W5HzG8yywc4PikjyLwvt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CH3PR11MB089109.namprd11.prod.outlook.com (2603:10b6:610:361::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 11:32:10 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 11:32:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Thread-Topic: [PATCH v4 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Thread-Index: AQHdVKhLRCsav0WueUSuRjhayZJBgbbu0Oig
Date: Mon, 5 Oct 2026 11:32:10 +0000
Message-ID: <DS0PR11MB8718841CEF7DE5B183347DBA81962@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-12-riana.tauro@intel.com>
In-Reply-To: <20261005090156.1233748-12-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CH3PR11MB089109:EE_
x-ms-office365-filtering-correlation-id: ec47d20e-cfdb-45b7-d415-08df22d44b3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: +b/L7KCn5wfXPoTyS02KiXDCHxQIuM/5+249ENYtuip/QSG+fBZlTBaIHMbL5JCqeHi+MkKMcmvP4g4GU0UNUmW9GkeOShuLB48h4F/ma1v6GAs23VkyOeEDB7MHhuRNGvkvtuLsDHoC2o1JthICnpyBUTWeCjzQ1oIXRmL6ynz/fmc0dsmWBfjGW/zPWx1OdaezWy5MUvilv8+6hFsILte9+x+SGKlP1SVdoNU07OOU+2V5sHzQKYmfv7dH62q06KZ7g80wRV6AMItAHJQ1egsiEvjnYoHI1Jo5TExa3V2KIW9izobT6JFpzCGCXqdvoT9Np2fSee/rfBjrvCmBlhDK/+3HyiLMZ4LtkuRmtuc8CdzbEqoaQqWB5D+wjJnUAsDoFKQKn01JEVm1bNSNymlMLglicPayv871sVMtHHMahT6P9Y4kA1TFAY42MTZH1H6F/AJUJKuF8CWrMRcWhS2xtbL+orv0/0BHXxTu0Bwuoq0SgKgQuUFCi4taQU3oKy8tCUNuU0CIoDvSml2U1WduCLaBU3tD3lKVizTTU1cN24AMvC2MErFLEvvhZjR/qiQZtgbjSAhAq+VTf4WXIQw7tBjOHg4vpvxW0EsoCp1rEhe0U07+1HVsOyJdAtyKFVIs5RC/w2Cac4ae4uHi/biVFTLktwYEBGagIyZWWfidLJDDr4pxx3E0GQv8na/854QN34QUh0TKQlhwNtHSicPjzKNlOWru49M9KDtidaE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UFcOsenZpzi6CoYs3T+zFEt+Kv9yvOGpg0G+hMP64aVmPi8iNtHEKIrhln84?=
 =?us-ascii?Q?eLzwZkVDKYkC0LV+dLa+Xh7nxZLB+gqSvLDsB9Oj46A+vXwrW6N3VBCGF2yY?=
 =?us-ascii?Q?sFD0fnl5JqAeRokiM8S7f8Ghkio+qr4XbaeuMwjsKD0inop6wNCZoqfIAv6w?=
 =?us-ascii?Q?JCnci+kAjG97s4m0HwoZptz0DHWj4YDGW4sTehWcHlILsTn+AcPRNKkPCTwE?=
 =?us-ascii?Q?XIYQ4pPDHIpHcFU6UB/xqPsbXmAItWc98/cjtHbIHsJcUIVGwFSqmbn9UiBN?=
 =?us-ascii?Q?UA9cqvtg4XfJv5pn8FuIOOPCNu+fiaLbGnrqVHfK+Byb2wdn8+wltqYXTfW7?=
 =?us-ascii?Q?+G7dg3ZJKBuVuXRaI2hrN/Mj8CwqJ1S2l3wUrn13ErUWExiErLwp90ofAWVX?=
 =?us-ascii?Q?hze5J2FN7N9dd+0o6xdF5psj9/HixGSSh5nz7YwhTqdWYVbm7JEbwgNKTbMh?=
 =?us-ascii?Q?2JNM2TNb7B6LZlMen8yVFK58b+osROVnOT53chHvZ/CU++U8RXd4kvcQIDSM?=
 =?us-ascii?Q?fdVKWJSzVFMEB7k4qTHn78XgnSebBElMAO0z4DZ/7pY8t16Q7LQaIOety3+v?=
 =?us-ascii?Q?bw6GILKq2TRl6/+y10xNbGPtD2PgXGy10JExPgVrF6GWuEhg9xLLJhVYC1zy?=
 =?us-ascii?Q?DnSiQrdxOdS1lM1entYHRuLPofoyNcBh4TjXvDhBU99PXFQyF8WcqIj6zBBL?=
 =?us-ascii?Q?fuhyBFwkqIrlv3FPj4YPIhFJdn4FRhb3Jc4rZQAXj12ChuSpUVMHfMlfhokQ?=
 =?us-ascii?Q?cvH3APfmjKqyfjCAJtaklKbLvOBP4CBXycP3tpFYz46ns+p5NiCw1XHG7FJ1?=
 =?us-ascii?Q?BceWjs1pkvuSJ6YEi1iySCo30+Af3I57zBH4C8QhQNzcSs892fVw/iI5J09e?=
 =?us-ascii?Q?+Lh4L0FS97/uZT0NSn+vSLTPc3p8qLbpcLSgc0ns0JIRpYd+tZQr7ht+s5aw?=
 =?us-ascii?Q?ossj5GcaE635POml1eoRdEnac9bhirQpoqSJqLb59maTKuNuYuSvwgt4qdJg?=
 =?us-ascii?Q?mGfes2dOFEw5UmrwFJuLW+8wUObmTwazaNaMNpk0+TyNHudkE7BJii2eq24P?=
 =?us-ascii?Q?QlWXo8UhdrTxNh45VqsAbYGSDYBap4zbXgEhdgwHvIcgmdpfz64nDrfki0K5?=
 =?us-ascii?Q?NSW4BVAExSnKWDqTaf7ioni1YH+z5ihEZIv4B+WXl4ej3ufPaef6yepGbxI5?=
 =?us-ascii?Q?0wjcfSDPOws8vOvRx/KWq7UmWSqnZ3SDHU7rDlfBLDHjdFkPR/GXYwIvdnHI?=
 =?us-ascii?Q?9VN9M0Ptd/o6dfz3Ed8LpOhyn3Vs5MqLUmoNL6KfrjOwSpOx3M6rIGebRn5r?=
 =?us-ascii?Q?i/Lsq9fll2frvKp6HB6b8U4mbbgL+TmF8HNTINBPraerrKQT6kWoNdxDYGj0?=
 =?us-ascii?Q?dfz5NQ+3WXJdE9QcPpsq231yDpE/SVAKs3vfwTads5TOwXfGJzOaCzDNp0h7?=
 =?us-ascii?Q?bc4pVcBYr+LhZ94pbtMRD9VzqZ6YUiihjt9xMm5mwjSjy2Z7TZitGQCJms8Y?=
 =?us-ascii?Q?TXt5LY+wnJSmzn8fswBbgSxitPntIXWLrB2OeKwICERXym5/o0bhA4ra1pCP?=
 =?us-ascii?Q?RLnRi6AZqGP7Opvcltq8RUzCBosS8R5zl+8HaKRM+7CbCo+q3ROk4vfVT578?=
 =?us-ascii?Q?wR8DN+sp8LCnxpSNtd7HKJIu49FAvVsuN4AhXJkIXsIAjZxLGMsO0IPi97vM?=
 =?us-ascii?Q?DeGi5VZnGPGluF7CLSR4LPb2NzRXNR5DSXWZzbfpBzBlF4PQQcOLzQu4wfkl?=
 =?us-ascii?Q?9qN3icmcEA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GpIsho1cHVd7c1M858hvPY9ABuaGnBZIVg5QTvzl68prjchz17vBMAXoW7RdNpHUQfxBdftwnz5r9wPaNlbDtWzN5UT1wuc3vggO4ixrCAKvesGfLjSq5VhJcg9sBft+l0p+iYRUTt5VXChcRT1BAwV5v7050zt9xsBRjck9U7fpeg8U5jgg0nHlFxRDJ2q7LNLEu4lOLutdyEJmqwvji0yeIa6XlzYS89ouEaJo1ER/uubBKu2f7/H8BntWtq4Rr0HMz18f4jiMb+bjCXdCy2hsvs/LJoMj8IKf6vGTr32dHCheVhFNvnbMCAspUfyN/110N0OdZPt4KGhNYAtYow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec47d20e-cfdb-45b7-d415-08df22d44b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:32:10.0415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMU08CDQfT+wFPliJZ45nNW+rr5C1NN3Io7RyyGBMybSjyGVeRS73koXh1qR+e7IOz1pMH9lV0C2rwGtA4NNgCtYeFiJxVy/YwFJs9dHhYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB089109
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
> Sent: 05 October 2026 14:32
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 4/6] drm/xe/xe_ras: Add function to get maximum pages
> firmware can store
>=20
> Add function to get maximum number of pages that firmware can store for
> offline tracking. This will be used to report max pages to userspace.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: fix commit message (Himal)
>=20
> v3: set max entries in loop (Sashiko, Tejas)


LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h       |  1 +
>  drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>  3 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 443a4beb1d3f..a792ec1f0faf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -352,6 +352,7 @@ static void process_offline_pages(struct xe_device
> *xe, u32 cmd, void *req, size  {
>  	struct xe_sysctrl_mailbox_command command =3D {0};
>  	struct xe_ras_offline_list_request *list_req;
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	u32 total_pages =3D 0, count =3D 0;
>  	size_t rlen;
>  	int ret, i;
> @@ -381,6 +382,11 @@ static void process_offline_pages(struct xe_device
> *xe, u32 cmd, void *req, size
>  			return;
>  		}
>=20
> +		/* Populate the maximum number of pages from offline list */
> +		if (list_req && !state->max_pages)
> +			state->max_pages =3D
> +				((struct xe_ras_offline_list_response *)resp)-
> >max_entries;
> +
>  		for (i =3D 0; i < common->pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
>  			handle_page_offline(xe, common->page_addresses[i],
> notify_fw);
>=20
> @@ -1124,6 +1130,17 @@ bool xe_ras_get_disable_page_offline(struct
> xe_device *xe)
>  	return xe->ras.state.disable_page_offline;
>  }
>=20
> +/**
> + * xe_ras_get_max_pages - Get the maximum number of pages
> + * @xe: xe device instance
> + *
> + * Return: Maximum number of pages stored by the firmware in flash  */
> +u32 xe_ras_get_max_pages(struct xe_device *xe) {
> +	return xe->ras.state.max_pages;
> +}
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> ac1253d6ead9..561c656e2ad3 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -22,5 +22,6 @@ int xe_ras_set_threshold(struct xe_device *xe, u8
> severity, u8 component, u32 th  void xe_ras_init(struct xe_device *xe);  =
enum
> xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);  bool
> xe_ras_get_disable_page_offline(struct xe_device *xe);
> +u32 xe_ras_get_max_pages(struct xe_device *xe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 40224db38906..e09b50a6f77b 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -415,5 +415,7 @@ struct xe_ras_set_health_response {  struct
> xe_ras_state {
>  	/** @disable_page_offline: cached configfs policy, immutable after init
> */
>  	bool disable_page_offline;
> +	/** @max_pages: Total number of pages that can be stored by
> firmware */
> +	u32 max_pages;
>  };
>  #endif
> --
> 2.47.1

