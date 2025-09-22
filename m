Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5955CCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6E510E4EF;
	Mon, 22 Sep 2025 19:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMD9wpeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9326A10E4EF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758569167; x=1790105167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eDcT93ALYTCfOK+L7Hn7+gHGFjdU91z7BMG/l0VOAnc=;
 b=OMD9wpeQMZxWBn3Sivl/iGpgNhS/I3VEcROfyrZmoHWx5fqTuXUCn6/0
 MJkL1MJGJgMeTTLQTY2kAa2R42SA/tC1B1HKHT3mbfK6usZAo/nu+EeR8
 fy/mzOo34s1/0oaLtr+VDBT2DtX7gjoTibkgJrX9mZtcg9xFUYz7VsTcv
 X0rR+UrrLRldyk43II6C8gXdfKsRXQi+EM3PIT9IeQPNGrDkRij1WmKK9
 rzA+zCI5lm7eNYeKe9rkIm8Zn0ZarXfWdy/etcUN6bjuYIpHsCqz00cZa
 ViPA0za8Zrj/5T3cI7T0IE0/1xjJ4+jIDl+Alzpx2lsS56SyVNGpuU6/l g==;
X-CSE-ConnectionGUID: pW1Foz0zTyeQ58+sgRp6yg==
X-CSE-MsgGUID: eTBfMFbFRMuJeEsshNlEOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78282778"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="78282778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:26:07 -0700
X-CSE-ConnectionGUID: 4hLM44ShSmCF1p1Ta09NWA==
X-CSE-MsgGUID: bkf2wQhwSFGcCCRTFoNvAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181717138"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:26:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 12:26:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq899okAzyHeWrx6qG9e1+PziKSchJ3uHCB+VKHK00ZtvdUJevIsMYBqUSsDEN1aiQ/v5X2r6MH98neu00QvbhreOnFciKsKmPEXTzii7z3n3MTFqXdc+CoK9hc//xaQJWw6tsSSwuw0Hs0bxqKti47doEuIOJwRjjRSQYsdfaGjWldRUh//Z9depOfx5OWiCkxPq0pa4FB6FYI+OtVRsFj/EWPjeEw/FaGoW+1yi40fF7JMU1xxqHuFnjr/Kej14+5rHVmGzkqdZaYWUqhish+uJaWjEAcxux5AgiapLN0OsEuLFas8UzcXE3aJlpC6XctnG+BdBQfLKGuZN6WNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuDsY+qotMpBFNrc1o+mTcAzIpHriui3u1rlGXMe4mY=;
 b=Bc83TuP8B8dmgKivrDuyybv2UrJk1FgaZkADEt9KhGdVbFOd3duHuqF0XlB00UjrpR9tSgQJKZH4CwyByYytKCz7REvEv7IyDndlYuR8EDDuUGmTq6oxCAathyZWYTOb8Awt/8ylLmWVNW6+3ZMsP1iMlijcpkUekNKsjOaFQF5Daq81XLJRQ18IeirlvJu0CxTp01FeNakoVs2m2VyT3eQyw6+1Fb9OTSYjbBhH/Vy+4eT5sbC34+MbRdNXOeK3mEB/yZipbllAwuLnt6H3rKKdJHR91AUp9BhjarnqKUxyOObk91DeYb4RRNfbiCfTzQlJDD/sJ4jJo1PU1gEjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:26:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:26:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Thread-Topic: [PATCH v2] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Thread-Index: AQHcK/LEaihtJ0QSZk+/aBOP/zvPB7SflN+AgAAAItA=
Date: Mon, 22 Sep 2025 19:26:03 +0000
Message-ID: <CH0PR11MB5444FF6B7BD3366CD009DA66E512A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250922185728.73828-1-jonathan.cavitt@intel.com>
 <ctdcwj3yumob47ef6lkkxmkad7ghsy5c5gh7mlhbbuu5vrlgpc@xyvklhu6qod7>
In-Reply-To: <ctdcwj3yumob47ef6lkkxmkad7ghsy5c5gh7mlhbbuu5vrlgpc@xyvklhu6qod7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB6028:EE_
x-ms-office365-filtering-correlation-id: 5819134e-5778-41a2-7b51-08ddfa0ddea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XqqGmgYaQNcnAE7ys3IFR2GemfLKD3j5hMarme3fq8A95+Ic6EpN+6ghziVV?=
 =?us-ascii?Q?BjZguGkIW+oboiKkQ54z8A7SPd/7gkFjrNR/4azmgQXMdjw0bMG0+OEuIaL7?=
 =?us-ascii?Q?i6JXaREu2ZyPz4rhUwX8ThmsJ03XV0doe/07Vloy5T+eAuutOXiVNLCeWknj?=
 =?us-ascii?Q?AhXAJkN32t7FSsXWmrLVeVw4DgWE+sfgWDGkhhFG+dn3abt/sNRkF//OsH8V?=
 =?us-ascii?Q?Co09wzp34oUUwOGiYcxTLpPmkSDstp0NTZgfVMkdHiIDjVD8Ap4Q9jh0CB/M?=
 =?us-ascii?Q?a/P8u220PF7b4nADVSIEgtvbHdEFSRa8dHla+VTaqH1Cwanx1ezqn8fkHphJ?=
 =?us-ascii?Q?IguezQfe0HO7y4ua1r9yzbL+IrGZ3eUofYy3gexUTLgp63nRSRA/d0F9E2Qr?=
 =?us-ascii?Q?R8COH2c+euAbnjfqz57Uy6DuGXOHJeem4bqBl+FZ0ej9XXsc5V3O31Dz4PIs?=
 =?us-ascii?Q?3waZJDtSCOfkJ35PtWy4FckQ8rMk9CcUaVrWXjLMJYH0Z889FqnbAO/Fgf1S?=
 =?us-ascii?Q?bpnjiwoUBA5Uvs3ymi1ueM/pyTtuG4HHbxQ85hkiV37hslEHj0NNM7Eg1zrR?=
 =?us-ascii?Q?sQYy+KDuSsKT2LvNoCxxfvNhPzdse+WdzPwV5OE+m+9KJiq7DqgvPUgfAYy6?=
 =?us-ascii?Q?ciKw45ejwfkoTrmUYM/RlQEHnkRxNf8u+d1HCzGpsm8TxQhq6jd+UjRctJm6?=
 =?us-ascii?Q?YCRlVNCuw5DdCV7k37BqaNag9XWB43+ct7O1Mwmmndp3Gb2uJdIbH6S/gijG?=
 =?us-ascii?Q?LPvGd1BOBqLafK/EzDxMg6iFj42jc1WjNxOBt4aW+2U32E9oY15F/pIFnehG?=
 =?us-ascii?Q?u84yo92SNHjsF4fkVg+b33H/UPvz83EIwkAbYwohUqE4nikmXqsGGnB1nebU?=
 =?us-ascii?Q?A5d6aw/h+qQQBuGp/8fAgJxlz/j7QbVUSmlmGMiDYkMkozVdqeFYFllojT3m?=
 =?us-ascii?Q?7IZCULbvL8JtQ21XAvVr4GPVfacjzeEsomFQN863eDM1K+PVU3HMpERn2Hoc?=
 =?us-ascii?Q?emDanBi9wVSCwO5DMkjdEy+qn+GSksq6nWG2h/PIvCE/IsAkYYrzZdqhwvRM?=
 =?us-ascii?Q?n+9XIzchx4DGdPpni0DyCqbGn5scIGkPOnt7k9cmpP8rcexXxKsfPZobHM4I?=
 =?us-ascii?Q?mkkDMJncPuNRKsmF8CpvtjmSYJLjDMXiRq9/Z9gX5pGlySNfHE0Cn6PxdO4Z?=
 =?us-ascii?Q?Hejg1SF9kcLtNyrfwjgPpA3Bu7UMnsHMwX/f9/OgX3gHcyEwr205dv/nC57V?=
 =?us-ascii?Q?EF2wFpvSxzzeHou52oQ2W0Y82tg5lIm22kCd9tTpBNzlmevAgEzsLVYUkxo9?=
 =?us-ascii?Q?upkpdKwZyRmReqeScx4KswwYlTrG7+ksQRNLP4xdOsBtpQdfDajeCdzrqFWX?=
 =?us-ascii?Q?RZflk5ogY79/pwGuOiH0H6sG3c/MLfxM7SzreA4qmgQV6exAwQdUru+IALDy?=
 =?us-ascii?Q?HLT2TalOqeGx/x68aL5gj3aglIGk5T6f9JubFy9WvLgy3fpSEu9DahUe0oux?=
 =?us-ascii?Q?Zh0Z52CHXCZg0uo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c4bw3MFAeGIk+04bmYPw0OaSN4717Ic4M0tlj/oYf3wA0domnBoZxnQl8KQE?=
 =?us-ascii?Q?/lp5KWZh0ZaGwRk8KLEI55jmlwYeJJn8Az5TnnekgGObjlHbOZwdp9uqS6ET?=
 =?us-ascii?Q?3IStA25aU+H2eWlRDIpIMmJIFkMPa1qnpe5V03N2VeUCZTSTYw8t0yPqYRWc?=
 =?us-ascii?Q?8SqZcxawmnFVxyscvXQZ5+LUuEw8xAP9bANuovUGTvnB+pRQx+AzJropErrt?=
 =?us-ascii?Q?Xsu8cIxZKR5N0dSF2QVbzyW/vRPnEOwobXzlyNn0u5YFSeQeexJN0aK6crwX?=
 =?us-ascii?Q?Sm/CFqig2cl7qw/LtnQONy8fVsD7FjE5G5IP/CIs+HXkrU1ZwV1zoW8KSEcC?=
 =?us-ascii?Q?2pKWSw1iVcBs/qjezyAyP0XyfEc8eLYeCDftdF89FVnJjVDdITW4elp4Xc9C?=
 =?us-ascii?Q?qZbEOXTWJ9eFoJkB7SSUhNv64cX/UZqxZo0DUJtSuUQjYjycedmPekQfi5pq?=
 =?us-ascii?Q?A7CScrGE9/0fAIRDJe02tJNoyMRutofpG+Z5mPDa/pgFol4WfTFptB0zl60B?=
 =?us-ascii?Q?5bmhAmILLJ+OiHhf3DcwIO6snIFu7/0bGDWoTU/NyvSWJqiBCKtcA46gUEHX?=
 =?us-ascii?Q?M+QnptMZ8KMhUh3uAZugiKyShdZXiPioveaXtPvq4DBTsaw1rsNZkf5SLvkI?=
 =?us-ascii?Q?0QrtdDC7D9Myvadmdl0bfyjTO7tK1x9totm6t/AfVLNIZ6YI2L/+Z5ru6S4t?=
 =?us-ascii?Q?QmxyIq6JnLtEhddHxkei6pIgYDPeX9V3lgxdLZNqcLX714w5z19eEcO391ow?=
 =?us-ascii?Q?1VEmlf3RnPmxckqd7sWEZhhUvfVz94cgDCM/xhJJ22GcM7gqULtLDQS5OYhf?=
 =?us-ascii?Q?dHqTg2IADgDipo0Iok2FPa0QU8qxLjh6pT0OmDWUVBKfBrTUpHUXGGOFzuUq?=
 =?us-ascii?Q?6XVB3oxp6SDmVn4zEbcITsSSMtMz7d7dT6L2FPyf38aCF8OToSYTs3Dlu3tC?=
 =?us-ascii?Q?rxyzSbyYFw+wO9pcHcgsrGUgibZzpTkJyS0ewwT50nrWHJvPxxerZ12y45Ew?=
 =?us-ascii?Q?//dQFCI/muXmYiOIWoxr+gILj5f1+UOHkQiXfDolfyfARu43AUOiY0TJjoSZ?=
 =?us-ascii?Q?1h46TZ8SqsxSVKoE6Dlkqa4HLuBeFGLPrTc3zY8DJR7tcDPpE4ycByuGQ6Ny?=
 =?us-ascii?Q?uHzWk48rd1kX2rz7P9ybkACZTRiViL5mcLvNak+e11TOGKHTQuJ+kOxwwEFM?=
 =?us-ascii?Q?Q2zf6MsuGjTWxP4yi2aHWFS/lqULAihxu7zXaKNCTuljxTWb9173qKF9tTq5?=
 =?us-ascii?Q?xna3hZPnmjNGlsb3myfbyiTbok0TBwpzBEVKUL+p0L1ZReP5o4qk25kAl3iW?=
 =?us-ascii?Q?CRNhuyJF4hH9RmuGLwc6fm7cFjbHIrHz/hKFMLlGxNWZfSGwArQRF8LB7e//?=
 =?us-ascii?Q?FOr8MzkVvdsQslIvqLkV6eKJwVybXL9XFBEKxEg/cGUppCy85pUY+L8zQy96?=
 =?us-ascii?Q?Z2ZqdmnMZ5pcQfujUFN3Jt5poBao7G7mvAWB8nPacBxuP/FpdewD1xKS33Tp?=
 =?us-ascii?Q?ImMUM0IHA02lM/jE7qjYwP5ca0B+zp5R04fk2qsIvcXzsuu7k/1rVoJTfxA2?=
 =?us-ascii?Q?TbWuXgRrrP76P5P+mVcl2ktKMWwcWEDP0bz/A+Eq3SwhhWTZcGkwZ3w7e0ha?=
 =?us-ascii?Q?YWC7fD3SoFHLDIQyFPFmcG2G9S7z49kqZyDnIJe910ml?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5819134e-5778-41a2-7b51-08ddfa0ddea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 19:26:03.3176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KZF9Tqv8UNxOIaeKoXqot9Xd5+7cdIluT+g3anroP2Nw4hN7TRA5vQTIKOX7UCTgc6/gviHQ5fda0SzbO7P3lmKgjuF1Kg4Zvj3JklQFM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Monday, September 22, 2025 12:24 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Jadav, Raag <raag.jadav@intel.com>
Subject: Re: [PATCH v2] drm/xe/configfs: Correct mask and pattern check in =
lookup_engine_info
>=20
> On Mon, Sep 22, 2025 at 06:57:28PM +0000, Jonathan Cavitt wrote:
> >lookup_engine_info is described as such:
> >
> >"Lookup engine_info. If @mask is not NULL, reduce the mask according to
> >the instance in @pattern"
> >
> >According to the description, we should be exiting the execution early
> >if mask is NULL.  However, we appear to only do this if the mask is NULL
> >AND we have reached the end of the pattern string, as opposed to when
> >the mask is NULL OR we have reached the end of the pattern string.  Fix
> >this to prevent a NULL pointer dereference.
> >
> >v2: Update commit message for clarify (Lucas, Raag)
> >
> >Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Cc: Raag Jadav <raag.jadav@intel.com>
> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_configfs.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_co=
nfigfs.c
> >index 8a9b950e7a6d..0c048d4a33ab 100644
> >--- a/drivers/gpu/drm/xe/xe_configfs.c
> >+++ b/drivers/gpu/drm/xe/xe_configfs.c
> >@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(=
const char *pattern, u64 *ma
> > 			continue;
> >
> > 		pattern +=3D strlen(engine_info[i].cls);
> >-		if (!mask && !*pattern)
> >+		if (!mask || !*pattern)
>=20
> this would add 2 bugs in one line change.

We still need to amend the code to prevent us from dereferencing the mask w=
hen it's
NULL.  How would you suggest accomplishing this?
-Jonathan Cavitt

>=20
> Lucas De Marchi
>=20
> > 			return &engine_info[i];
> >
> > 		if (!strcmp(pattern, "*")) {
> >--=20
> >2.43.0
> >
>=20
