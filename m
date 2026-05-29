Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B417CD5BD2
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 08:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03A010FA7E;
	Fri, 29 May 2026 08:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ai/4hF9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904AD10FA7E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780041870; x=1811577870;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cQkDS/5G5uUP0Ck/Q8eGYXpQ7A+PobK44W5DDl8M0Ak=;
 b=Ai/4hF9e5Wnvsoe5/RxrgO2D9fgsq7jXwmtPsZwqKSr5Rm67K9MR0Nkz
 nh+GfMPErlIzuQJ6w9HJiBTRgZ+ACP7Yhs16a2/mRANZ7bTVRbmepytr6
 78Y/s7EsCcnnxXd83gXaPOzTPz93MHzWaBQH7/u7gLI+XAvtxZ+fOlOoX
 tzklVwt0kM0IrxiHNNIr4X9APirLBV7ZnXSWaDdbiTBF6h/bMrGs5X/AX
 BZ7eaa7YWEspP7RMiHl5eG5BAfdU9OLggGPBqr1c5R+wKKhye4Meso48d
 2Uxpb2f3ElgSRRZR88hI0DdGcsGGuqTJqplxy37cFlvl7QpazTZDa2OKo w==;
X-CSE-ConnectionGUID: F9xABIAJTauVqkHSIj7uzA==
X-CSE-MsgGUID: 95IdYYGoS1CQvE2jRl5EPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98307116"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="98307116"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 01:04:30 -0700
X-CSE-ConnectionGUID: NPVcCO8rTfO4LYRdcdYQzA==
X-CSE-MsgGUID: UGuC6pQnT+qp+DCmkJkaQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="280905794"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 01:04:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 01:04:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 01:04:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 01:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWkCaQAwhNQaETJ9I3a/Poh/K7CQgYGPcPbT1meD/b8vARpsEtgZyVHQXxdYs78HsIjhk9CR6xjwlo6axonQpVPJhYy7muvW+TA3ijclu9YxJmdRJ4AXYMy+1HdXKDXuf88cmQiZK2o69Xjk/P6gBXcRfwyZAgvcISdr+WdJh1LuEjCT0N0u6WrXotETLoYMNZbczwxjuNG6KCrx9YEJPrPFG5NR7X8vng5B9YmJCe4h/0b6LeA0tUxcX2M3Ht66scVyYpitxqzo0tFXRzcaZPGuue24Vj5yjhzzG1B44DoUR7OPQ11/5NWdCvpqkKCjRvNthUf7iUf1UaN8eun3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guxEJja7hqgkR6hTAqd8D7/FAee449v9gIwWoNUF++E=;
 b=YW411glngbMFHiZWEtbgl+ed5xsfIj7W7HEFE3vxRaCoEZDMroHRTJ/wNL2RM0REO77tmM3Ww+QvVfee0L/Mb7a7PK3kFAWvKwnD+A8nSMKtQB3xlJAjJIbbM5iXNlwA053/HaaD53Cc81auDFv1jkOxPA7OXIsRvAVDWIm9KaeovySdE6AJl3UCz3ILisZ45Ii/CsBHd3g2V7TijbpacV71MpcW5aWF4pWB626rzWwizP+ozlL75gKdSt5h39WBCYjepv7dSpuB2OGU1deXI3kvgDeOaxjEw1ILuJaY3Nu5dHM8/syl5y06XsiDRgR0fTkdc8H2gJZWUCA5h1idTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 08:04:26 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 08:04:26 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: RE: [PATCH 01/10] Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
Thread-Topic: [PATCH 01/10] Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
Thread-Index: AQHc7uxi0zF4m4g3nkyFcGz9ZfReM7YkpV8w
Date: Fri, 29 May 2026 08:04:25 +0000
Message-ID: <IA4PR11MB9251D6C02C4B289C5F6F699E99162@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
 <20260528215227.1282471-13-julia.filipchuk@intel.com>
In-Reply-To: <20260528215227.1282471-13-julia.filipchuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|SJ0PR11MB5213:EE_
x-ms-office365-filtering-correlation-id: 756b49ef-8964-4a3e-efed-08debd58e6d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 3T4CYrm/G/ePm+D/3evti1nJ5hvaJEdJyF+0KB9DAdMVCRl8M3sNPtzUs1tPbnhQupElAXqwKuFOYHeuhjT2ZqIIAmvTd5tQUbgSreGS0NBEZt9LH2RLBua81c1zWHaM9KDR9r3aBOPbG8RyuiRGer7A59SDIBlfnGcn3lnX5uotSwBHP6ovEMKwIxbRzN7OfnP3qyCLjye7pBCg2Ti3vcxouBtEFmG6Ddz2647z0iTyorfkufMwq/pMz4pQ5gZTargivOXVpm7miy+YTrtvQ9fhGBIwrviV+wqD/LfZ0ObjM0Z26DpwTg1wckCWuUjTOWBeWD/HVL1BmCrqdLSLd+//FovKIRIHWAv1HnFbIjMuVDlWyQvm1PVJBTNEM2GXVOk7GjrI81KOnqO64VLwYFHGm1ixfYLS82vVosJviq9C1JjY+0PXVUX6haRRCuNquyWMSO5eeQlpEucGhZL2Rz3k6a8KnV/2/A3n2mzl8IYdypfrxqGmNKUCmiq+BXOIF7qOx3bspS5chD7FB4GlkpsGMKPq5NYw0BozyAAiig0CpJHacLTCf33OhlkbLSIg3tz/kJmpgn9D+GEnFrEQohOA+wbWNmuBrUxNsrwkEG2e3YsbN+OGWGSApd8DRRxQ8rn7pX+tp0b3IRvIaqz6F7B85vfXPkRN6xJFhv8Ax2wO4OIGop3FAispuDioFkKJW4JrG1DgwYJhAJRADtKLrUtuNVBRwrz+Vh0D+6sX9DUUdhZ1D+1yy4iGgPTKMlkr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TsQd5hvqnWHheHL13hccdRcprNPrhxw/SUmyUJO5WCVfoUDPCTwY3ZacCehw?=
 =?us-ascii?Q?/8piB2q5MA+LDXIIcmFTSQ9tdXyHjc8BRd1XcAmJ7jSZaMZ7zMNtFEieP5uK?=
 =?us-ascii?Q?t2au+Z4XXfhf8Uc35yvHPDRg9BkbY+dscix6g0jaPYg/dkBnZB3cz9zaPr9z?=
 =?us-ascii?Q?ySZFekK7Qx/W4/mnK7vwmrpVn+GjXHLcG0XRWu4rZd0PBpXOiaX36VBArUAr?=
 =?us-ascii?Q?oguJ3oQ3Rk/FepamoUpMQVmAZ4pzyku7WdHpwd4e8+Kt9VT5TvHaF7V5fHtZ?=
 =?us-ascii?Q?nv6IW8gfB27lOg2H/POHM2FGAIJea7nHGJN2zVEqbiKMqRJFO9vPmNHj8xLm?=
 =?us-ascii?Q?dZO2rBAmCOhQPrvNSlPDdKum/I8H0rBhy14tiKujPBG30m4enult4KZfZU6t?=
 =?us-ascii?Q?EQqDJYvTBrO1kdltH3bkkENa5IyerbNmJ0rs+laNeTNpZ5kSWbYvoQkam9WD?=
 =?us-ascii?Q?AJOP1RAYBzlXVjgg55esaieMcKIp3B0ZaB5ZmOAaKZ+flXcC2JPy0eL6ffcz?=
 =?us-ascii?Q?gGesC/JPqT5H5XrOmjyaTMlPXKDC2WFKEBDXFUFjTUXESaSBDAzxbOMiRKSJ?=
 =?us-ascii?Q?Y9/2sEEGT+FEogy3gRfXje5aFyqmFduFLeIIbuu7UrkN+kZLNAgrSEHGJ94o?=
 =?us-ascii?Q?cUcLjwCIuylND7CI2XNdMmYF1dV6xf7VCtEfvc6GT65Qo1XkkusyohReRbJG?=
 =?us-ascii?Q?SCIQm58Zn+cxesE1VxXTecWcgV+2PXg7+FZ60vx5gEywzYr71GcLnmVvYO1m?=
 =?us-ascii?Q?XuhpFzFefuE3U3VFpsnYpWa0D9Cm3IjHtcCj++PiL6yV/Pg9rJuRmqy+JKPR?=
 =?us-ascii?Q?wewD4skNxxSXqt7k0iZJ2I/LjgqykNWzcUfIfzdSgOWHzMwkQzpRGyOUlhji?=
 =?us-ascii?Q?QLQFJ7WqDKonFR1Trzoc1QeO8u2IqClpgxZppUo0e7KhTLghOerdPpsIxqyc?=
 =?us-ascii?Q?MrcpZqj53xRv7dPLF6hoA174ovgrDQ4s+fkJL2bPXQf+QuHX27yJbk43pKcc?=
 =?us-ascii?Q?//wfTLR92U97GumB3sURjUIxPrYZ/mMH2ljifwcEQK8FXNN+qUBU4p3uryaT?=
 =?us-ascii?Q?gJ6i+I1r1NcUx5BcbGT2bpQJfgEMlQYdT55jhoMGIexsL5PHhVeH/TGTn/ZU?=
 =?us-ascii?Q?xcM55edn96siFaTmb0tk8WFhVXwTbGSKxoqNJBj9mjMjE0htDEGdJWgZunsV?=
 =?us-ascii?Q?hltgZy6WQKbSScmYbjeNslsMw6zHE36SOV+gVSE/roFO7PyJZobn5u29+i/r?=
 =?us-ascii?Q?ZgpQG0jrkVX1D5ZEYOA3GKs/NX7UVfYP/nx5KoFTRGlpZSfpLUxr67SNQQHK?=
 =?us-ascii?Q?ctyxwpaAOYXvHfOLmBxkd7ctlf84ElPHiTcpIqaerZvdeYxn/8r53QpI5Lxl?=
 =?us-ascii?Q?7H+X66HpmWYsrp6Sh2trBOIOXrizv8Gs0zByfEdrrbCwLUQR7/BXXDz9PA3w?=
 =?us-ascii?Q?u+X8D545Ejgc2wKkD29ZoGVJz1rwjzq443NIsRZ2shmbm8pmByQJUZMH9uKB?=
 =?us-ascii?Q?bLrypuY1/8o4AxrEqHNLsRS288O8qKj0KXtF5gQCNFSx0ufQvxmmo2+MUZjK?=
 =?us-ascii?Q?8Yx2ZlHXZ5e8c/eGaUkVzaEnwydnRvY1VtGr1dugQeZLdYOoMRt35MHSTcsT?=
 =?us-ascii?Q?gml/UM83z6MlbFOCVLgeOT6Ev31nHPSdhenijNsboFuTEImrRaNsXxN1Y1dZ?=
 =?us-ascii?Q?l8kvW1IDkrS2htcmT2QX6TorhvMd/ybPQ3Dn5q+dxfYUmef3rQd/N4oD0q71?=
 =?us-ascii?Q?UomtkDO6pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Pe8k9j15O/4Ca1TabBPK8q8xb+2MtRX/Q4bDmBqTtrhbOrhp8Wx1vet5y86r4rQniDDlUA22k3ZzruueyGmSGXhFit1C7urdfBzdwbC6swcyI464Bfz7CVXwFOkU42XZZiD0HfLq+5CyuCObbeKvBRdKfVtxFlkUIAO/EmTVYCJQovZskB2h9RauSe8ooW55qGTpYccgR5xn/rJJ8HXSYrol+Sy7ADZAcVnHy5AuPu82cCGXdtDqUa0u1vi9T9AJUFTnB9zc3NJ1bQzkIkl8ZWwjVAsfwz/IBCrbbAoS+uUffn6AEpoG2ioB8xaa2MhR3i43gJcsyqLm0MPKZwuoew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756b49ef-8964-4a3e-efed-08debd58e6d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 08:04:26.0490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XC7GGL8Pg06Yjj7NL6IefQWiD+Sy8QhQPAT9Y3iTpBFQ2pt151sXoyXk0ZJwW9ck370JFNes1NkjNtF4Rjn9uzRQA5J0KxS2oQZ9jzTrerE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

I've seen you reverted some patches and added new ones just to change firmw=
are version values. IMHO it would be better to just fix it all in one patch=
.

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juli=
a
> Filipchuk
> Sent: Thursday, May 28, 2026 11:51 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Vivi, Rodr=
igo
> <rodrigo.vivi@intel.com>; Filipchuk, Julia <julia.filipchuk@intel.com>
> Subject: [PATCH 01/10] Revert "drm/xe/nvlp: Define GuC firmware for NVL-P=
"
>=20
> This reverts commit bd9ef8d19f9e9ff47518ce48fb2002d58bfeeaaa.
>=20
> This is temporary to create a clean patch onto drm-xe-next.
>=20
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index b5a49ef9dafe..6268ca599ec4 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,8 +115,6 @@ struct fw_blobs_by_type {
>  #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>=20
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)
> 				\
> -	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,
> 	nvlpg,	70, 60, 0))	\
> -	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,
> 	nvlpm,	70, 60, 0))	\
>  	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,
> 	cri,	70, 55, 4))	\
>  	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,
> 	70, 55, 4))	\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,
> 	70, 54, 0))	\
> --
> 2.51.0

