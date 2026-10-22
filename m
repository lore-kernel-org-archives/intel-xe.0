Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B84606A320
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PDOpmpAK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EE0112690;
	Thu, 22 Oct 2026 14:08:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27B711268F;
 Thu, 22 Oct 2026 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792678126; x=1824214126;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jDQq7Ty7Eahn9mXXFHBDCOSrGGhMEAUrrSkuEdGiwjc=;
 b=PDOpmpAKWbMsSrteN3rNVeDIobNGfiFwyMNqMRWzI6aGFU6qpuFIySp4
 72Ny4fvUMtZzEiBsVFnF0nbmis1araO3BrMG5KmjBCpiWke9hx7u096Op
 i9h0fRzl13JrlD9qGFEvd4DVA2fsbKPv3fB2mGOFuVLd97W/IwLuzf4s0
 y70E7uBd4kQZx0YLU3xx/RZQBEByj3NsaTosYbiO5naU9MsesXZK1b0hF
 61JBYE0FgM3n1O/UNTh5vMwrVOU7sRJFoeNddmx5x7zOX2sNwrcP5i/Qn
 +4NKgjhV9Jn7iQ5pbglefUNbZKsPVmxTjl/qwVH/sQBxf8hPgNe2Q5m7C g==;
X-CSE-ConnectionGUID: X36/orwjQ0S5vjCd4PtmXg==
X-CSE-MsgGUID: gs4CJo32TFmpyfQ5bsTKMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1300466"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1300466"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 07:08:46 -0700
X-CSE-ConnectionGUID: GlYyZW3WQ8ufVjz5riqZRQ==
X-CSE-MsgGUID: Cobzg/WQSkid5cLxviWosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3448988"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 07:08:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 07:08:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 07:08:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 07:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piCNR9g+rwSgjxUdrdRGw2MwPcAJ2xdgKMHELKFqFGdBFt3EN1M1p8hjiP7tiNvoHz4yHfZzSVxe2oGQ6AVKjbrOWRGsBnlFRfDkYtxRmBQf7VNewCDkeXTIpNF5Rde66K1LojIOs+dyVxIrNfepwGYE8XGx0eE2qgRE41KE0danwlHvtn0yp/Uf7C+EY+mWXnDoFm+OHK/0GbT3XiM9CKfvnx8ALzAH95BELFXbMyE88ttEvSAU0X90XCh2G1Op0sYnBnTwS9XTKzElnfvjm5tfqymfTlwJFTZpihjiAHYBwRZPgc0OuSPIJCdId6nbn98ADttFLqJSeUc1ihOgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkaXCCKWRQBgZ2u2C5AAR+1s4skazfWYO8HyZEbApMU=;
 b=ITPvli2VOYt5j6Kz+ydi8c3M9Z4avcOPbAW6XH9yIxBfGf/MJ/rwgi26tsPttkOpCgaSkhCo1wOYZIr5nPqlNRtgYVpsMJ+6S5dcvhgUeOGCD3TSspfAvUUzrkLTGZ0RUNNchHgv7+o9bgMM7X6PVVH3vHy6GJcGf2SRYpwN/lcow9Xhs+JzwbT7IzlQ/9ihmi5gGmuGZA198Hom+embkHhR4iLmEWQrY8jUe9pT52fhhKZANBPa9vtoX5jpogqwC7YfNwI5NqjjzmB0/2lsRMY4E83CFQb9hdE1ntqKYaSRl2+CnFXG8IaDg6eoyeRL57szLosqu5RniZ+HfYGXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 14:08:35 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 14:08:35 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 13/13] drm/i915/dp: Bump the max Link M/N ratio to 22
 for DISPLAY_VER >= 35
Thread-Topic: [PATCH v7 13/13] drm/i915/dp: Bump the max Link M/N ratio to 22
 for DISPLAY_VER >= 35
Thread-Index: AQHdYdS0uL3/XbZZX0G48xC5wruw+rcJmdGw
Date: Thu, 22 Oct 2026 14:08:35 +0000
Message-ID: <BYAPR11MB37830B4DF5A8315CBAF351CEB2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-14-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-14-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: cd97b5fe-f0b0-4399-0807-08df3045f658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|10067099003|22082099003|18002099003|261021121427099003|261009223027099003|4143699003|11063799006|56012099006|260925022911599003|38070700021|260925021911599003|260925021311599003;
x-microsoft-antispam-message-info: T1jd64gdrXMi7kxOcQ10dzMnXWtoO6OgNQ7oFAkCwjM7c2LFeyWe6/lBvgWWhJt9tQ7hu7xzLw/CJk3JKeMYtUC+2rFaQvOWrcbfYc6AhT8wbnA7WqVMudGAoPEreqTH5He2L0+I9hLHKMUStWOokKEe/mGKFYOBEm27TnppxUvL4u4pM9u3Kph8jur7dnqczQy5QYv6jZB6FBb4JkSmKejgpxftxpkLQPxHzeBxctz3bfhetxq2rtzhgC7QSq/3Lj+/vekLB6FKgNllysKS6/U9cI2qEy6doegyCO9Umlg9irTPuR6w6hG8HDb9tLdMmJ2TjEk5XBs2o2Bh8x0oyOLdGC6bSOgEIkRGs/1R2E6TYbuEEc8IbOMY/vgPg8WDXALdg1ecYMczxRTsaT/QL7/dYY08ForR1ShQQNGk3sehimnGKKOSqwUQydoYS92koEtYrMNgN3D15Bi+fev/ls0SEfON2usQ2p0BIesuNeYLwT60KLyoo5T2CTRA0mUs+LsVelTLKzCk72b4OsRHiXr2EiTBdP5/ny7Nyx5rxVYC+NX/4jC2mPlFlKz8ERZJPSVFLmHZ4zc9bfc6qPP9t8J3qcW1hY1iI53rYzfpFQwsPoW22M6YDZOh+7zt6hoH2nXcHGiihMmKWIyEpWwHZ/a4eBPZgV/tv09LGAtaZTeYVNZUvs8HOSHpldJr4VsFRmnUNax1xhYOCcW2+UWk1LNY+K6xIBpCGMSWcU9iWw8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(10067099003)(22082099003)(18002099003)(261021121427099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(260925022911599003)(38070700021)(260925021911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qdcWbVFjylEo4rAXdYK7gUGn9Dx5HuJeZbbQJYg05gAozFP1yzmG2GmaOtBW?=
 =?us-ascii?Q?qL4CfZiwKfF5/wDSQnfXNFsoURNI6FYFOTMwHF0SJ5n6pK7OCHSQcRWANDeV?=
 =?us-ascii?Q?1L0DMANbnRhDC5PevoOdUn1LmPM6WnhrSaav7KLOe7oP3cFLpHe7pr2GTa5l?=
 =?us-ascii?Q?fb/ZhhGfbo9lD+X31wvB728cP1cp5385jfO5FR8/mWBb1vpCjV9G6jrGY4wu?=
 =?us-ascii?Q?vlcHhI2xnX8GJ2XXrIGRjg9kCkN3xrA5KDje7N0SmyWq6G5SH0zoZK47RNi1?=
 =?us-ascii?Q?lLV2YfXfdxfDpLUaqs149Q50NGe36wK/oO3lpvZnQ/v92nEbnpnxXzE/nUJd?=
 =?us-ascii?Q?ia8lq/cAOxVXWGJdBx8hvOHY7QMDUZ96CGjydHpZKueUMHgu0c4CSq1qKtYT?=
 =?us-ascii?Q?f98S00s/PZfuJuOwePfPqiCYkA+774MkbBQSx7dTJT8dAndI3DqJc2R++92y?=
 =?us-ascii?Q?vVO86zzhjoK6gu5E+nMDC6pLyS8E6OutZIF7t3KfuqfyYXaQ6i2iXKeZhffE?=
 =?us-ascii?Q?geEcYgAWJH1A5hKUJVCTgyKV5uR2Aige6pK45b0YUNhYAkGb9u7kfWTMQOBj?=
 =?us-ascii?Q?S+4kosuRpTFvEpMBFA+bXfMeV8gBQ9sVi9rrCSIoctDoViAHDXzVaGq2jomz?=
 =?us-ascii?Q?V4VTI3IWC+eipdT2Vs5gZl8I1maZnJ9j6vGnlalSqpVGuWQSFpAYAf7Bwtmn?=
 =?us-ascii?Q?ZdW19xlmLX6mR62Bu8SIyh+Y25ZSY4DsvGB1Spc4O9qIGaKWXBrYjkf79Rhf?=
 =?us-ascii?Q?qyYyMSP5IQktlWvmAu4WqbobTBTNug7r09bJSkgizs/zh0JuoOjTNLWXQiV4?=
 =?us-ascii?Q?incwRQVrO8lVMwN4qddN7CgYVSC6/Pnl0hPW7NcQWx18w7UrN3N0j1N7OBPf?=
 =?us-ascii?Q?Ejcn7wonNFCWtdLtXVuRgZuaHDf8UhInipzlrOr2DQa87vXEZWIp2311gtXo?=
 =?us-ascii?Q?eFafTAE0TNQXIsAlcILXAIdKgy+hMKKTNsIXDM4o5lJfzsftaX1C1c0N/hIF?=
 =?us-ascii?Q?DuatawCT/AIsoTMuHRd1mvsp0CZqVBq96xjZIuh76Bvl/C4tLWt7ufpEWj/G?=
 =?us-ascii?Q?jjTJ703pmo8FHjfYuXg8eWY0t7a+qe0ePFJZNiXsDfDj5+c5zeZA7LlSprYd?=
 =?us-ascii?Q?ZnZKbcgsgrEcmatS/G68xujeg4pmb7HjmH2KOAPXypZP/gnksfGrORYcQWZt?=
 =?us-ascii?Q?m5Z6r5uxJ51P91SuXrjYDcFgjtnDqjt5Eo+QO8sOXwYhwEnkdHnwFRvFcLs/?=
 =?us-ascii?Q?5dL3FCYdRTCMAVjm6DxF3sRWLr79Y5phBqSArTlQb9Zk+VV2h8aZT6AJIwei?=
 =?us-ascii?Q?ZbB7IZPTfGM2IE9PujuPFL7mx5ed82JtgoxpnaLQG0vZ1ocb62QtyAZrbnlm?=
 =?us-ascii?Q?a/SbRLgqBByVbd4p1enL8RQPYBvg8gk1fmzU/9pdqRhbSjZuwef6Nna/zF2i?=
 =?us-ascii?Q?msnZgZE566BgHOmUctgNZGo656BMOFnPncAIuh+279FpQyVrG+RhfWUcFntt?=
 =?us-ascii?Q?5bugpNXkRTPavI435CjkTNpkSIBzedUHrmQj0wj08uXkpr29fp0tiNhfltdH?=
 =?us-ascii?Q?OE2KEux522MZzt1bb3fkmfmFOBfPrHXojuQqRjvte7v7NJ1RMY9tFWYs5TCh?=
 =?us-ascii?Q?AUo8wKXXbdaAbAXnGTFhETJ8RfnbyvPpntvf+cZXYOCZ/WpZWFrucT8Zra0r?=
 =?us-ascii?Q?4XFJrCwlQq0bMc/PcOIjqdNcWa1tmvLbnOpZa17pWqV6yMv3ab0nFeIzR7Rz?=
 =?us-ascii?Q?NEwMSFKVFOyGSRclCBeW24TQga1B/9HNR2X2YUZXu7XD9PVPVliRIWdp4gSV?=
x-ms-exchange-antispam-messagedata-1: B+SVMlc/d0VDX0byLa2GrB7LnFAcRYJGA+A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GjWd2NuDkdfhnFg7no62Slllmh+jytYwKWgqM42IPjyKR1PIL4sFKe/YBjOxSCbeOBJj/zXutQGn5snNWW4R6r41RgZ0W2FwpbKyXPSafJiJY7zgB0qehfk8VscUzgPk+nnNXPYl0I/n0VkESJPXD8oFy/4CtRiAEiHlb0DKz65JlpkHLICun5A9+/d6B8hEqrJ8rY0SmYnpDd8yr4KmgsViMHBm0entCZFbsU7xn8Gs9RrKpyW/b3TLSRHqQjdDHVAFsXj/Lsw2dsOUDS7zw0OKQKt7/rx4OClW2VgViAu+9QJKtTIPyl5Z39kBqdOUr9OEmK0AQxFQVukew8Q8cg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd97b5fe-f0b0-4399-0807-08df3045f658
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 14:08:35.3101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjV+lspQJLwSEgjH3pqmjsoY6e/OUBKZeRhg8U/7yfxDC4zIlDc5y850bWju4ho/bvPDuabc/xu4/mL5BBACz20U5Hl3QweDk7ZYWWxz95AmLeAouMNDnsFr7UgxmNUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 22 October 2026 08:53
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v7 13/13] drm/i915/dp: Bump the max Link M/N ratio to 22
> for DISPLAY_VER >=3D 35
>=20
> Starting Xe3p max M/N ratio has been increased to 22.
>=20
> Bspec: 68922
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 045524994d85..5864e33456a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1272,6 +1272,9 @@ bool intel_dp_has_dsc(const struct
> intel_connector *connector)  static int  intel_dp_get_max_m_n_ratio(struc=
t
> intel_display *display)  {
> +	if (DISPLAY_VER(display) >=3D 35)
> +		return 22;
> +

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
>  		return 4;
>=20
> --
> 2.34.1

