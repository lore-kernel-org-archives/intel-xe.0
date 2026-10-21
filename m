Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413B606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYk8r9RW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B4010FF20;
	Wed, 21 Oct 2026 16:56:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FBA10E144;
 Wed, 21 Oct 2026 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792601795; x=1824137795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tgblWoHjE/5GJm3YTCpGv/mrT4O39nsRvzCgDktEOno=;
 b=VYk8r9RWAnEcYz13jBxBysyP/9KtavoeseUC44yKFWYt0h75AKra+pTC
 ZWvK+iusD6+xsdSeAzbN2Cdt4M9uoEY6Tqgn9uhSDaZTU9dyRyhdG0u2N
 I2sMpsiav9RE+30WBNuuJJ6VVK0J6hzoapitgbyIXKdHapzI/Cca+B/Ez
 jJr/246LClMDxcNgaZiOahv4WRJgVdHRRDoYpX0WK4jRmvKAynjNuWB4U
 dhFj4vO2qHwSGS1afkaKblqnA/zKctiKboSQaS/zh92wffER79TOj5Vil
 5VfMn8WlGd+MileJMgl2qDEDgBy7I4KFvxOaGNBmts1lP3eJSYxFUETgm A==;
X-CSE-ConnectionGUID: IOyXyy8wTT6Qwf2PFx4OZw==
X-CSE-MsgGUID: 3JSRLEYFRHynM7aSOoqffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1333314"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1333314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:56:35 -0700
X-CSE-ConnectionGUID: Td2bZE0pR1ePCQpSfllaQg==
X-CSE-MsgGUID: ZIr8Bq3oQNyhs1/NA9pIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3458853"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:56:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:56:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 09:56:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/Zye0uWa+Oe8NlXs2LZ04/hZG+xGHWG7rDpToFHHd5ZXWGczs+6QDfF2GXRBkH6+VhRg6rpC+rVMV5+NrD/GaL1wL/p8ZH8DI5uavNDxgw9pbBEYU/NfyKgx3HZZ6C2TzdK/U9LyaJnbVKqXaA6+VWV8DQL05QwXlk8oSHoNQxJ9JuYNOeHDTwhjXeFMzNp5MQD6QZPDZ3iL7fDUjyZPEX6XMuaZSEVxksbomPS0p3fQhwurAflkhP+PzF5VBlZk9uhCWubqYLuplSUC6PogpY4e5R/QBL/vEUbROWSk8thkBcC6jMx42k6P3mhw78+osvZi6ThTNRp9fnJjl/QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/ZUDgOke6VLKCS9N5bw+jdtqOhWx/jDRIv0PTRqe+0=;
 b=Er/3kIH+JYKbVbCoVZAAHD2t4XocCi7KFo1yTWWgbO3fXEbu9oJI4FcOdUrTOpIFyeIvcZNgo/YwSd8udWd4U3cBjGE0uRpEZdSEjm9TBkXtNIk+r3a8V2uP+miwbTkZiJygJpATMx+8Y1+9cwgniNO+6UJrKJcSBHxFcAKxaVAicP05JuEFB6Tyifj8Vc6r4Wb8LkfXJJk5hwGFS1wsuA3yyJVlsA8k6fitFfZtgUkEU4ooVuB3QlxdNGz+qgnVLxzAsKWQl0LCCuZCz0+rwfKQGCZ3Yi81n3e4Ss3rOikIyvU9xO8um1Euhs3aMX7011A01vEMbpt8Ne3h69TbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 16:56:31 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Wed, 21 Oct 2026
 16:56:31 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYS1QzxzVP4ahF0+UMq5MLsYEcbcINADw
Date: Wed, 21 Oct 2026 16:56:31 +0000
Message-ID: <BYAPR11MB37833527B31B2A81A4D5BA15B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-9-suraj.kandpal@intel.com>
In-Reply-To: <20261021072438.1164249-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA3PR11MB8118:EE_
x-ms-office365-filtering-correlation-id: 41d479a0-f88b-453f-a17e-08df2f9441b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|22082099003|18002099003|261021123027099002|3023799007|4143699003|11063799006|261021121427099002|260925021311599003|261009223027099003|260925022911599003|5023799004|260925021911599003|38070700021|56012099006;
x-microsoft-antispam-message-info: c2JdtQlVfRLC1+IvkOv70+NM2vSLy94SsDU1hGLS/v2QskIlBUwzbGmQLK1cZ74qDK9mMdMkI1l2MjETzBY4GiuUe6KeJ7aBAa45mvaghUPTimoWUEujLeEDZSE+V4kki8EfQbKa1LrvD0kH3dj9Ik7SOKX7pnj3jX8vAg8ojawhAjcanlG4HcQMKq3+8Gocb+B15lM7ShYG/xy+EO0hs/63Gm2rwO7XeYaFiAKsxsb5jU/hjAql7gJokJmXU2oWMZqTMpkij3mECmtRP5q6J83nGMnXJ0AuMcwaO9McvqKvdxs95eRDyMZu9n0XUK0XAqlk5XIULq31orqqSpGITZmMKGq5b/eXTV/ZalKC06VJQEfYn7U71Evs16OUDOf0Vig8BYbQZhdZlsB9N4tWYXyKaR4K3jKqT2aIpwAJ0rnppn3QCEJlC7rKIUrXGuWjHAAngFBdPivB/lvDETDT3r0MOZNnIgx0FMQab4CxabGJRjLgKTdKlMe+TsIy+3M7xiYeELOwLrOUNd3Df5ogdFXFJ+jAQ3DlodLSReEzNrIC8iDj3xmG6STqtEpt2L1Fx2MowQ/fzC0xoZh+o7jrVlgzNXGlj7klSJmowWO2fBRX+/5p0ZxluDgLYlNwJreBZXuJKa4tpyI8c13g9m9ZqAH8vAsCJHIylSJkP2XWs50TQzfkT6kCz6b3mALTT4R6YnDnmsOJIb/78xLirtCMSV8Vjb69xjueIb0lHICO+ck=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021123027099002)(3023799007)(4143699003)(11063799006)(261021121427099002)(260925021311599003)(261009223027099003)(260925022911599003)(5023799004)(260925021911599003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FEJSexHmemoHotGnFQtzM36jEHcBIW3pg3DaAL8x/m56OzdKDbey8r/JTEWT?=
 =?us-ascii?Q?DmKBV7VKK/eJrJhqHZwksbwxhfxP1T5Ru8/OYxexWJwqoT4de8dTAtAq6ZFK?=
 =?us-ascii?Q?xrMZKR4Tj1WBIvNV30fuEWdvjzsWd9pXWFeGMifg7xRMKUMSFi9StdjhOX7Y?=
 =?us-ascii?Q?b1iPMhhqnQ3UP71+jvLz3VKOCJ2GW9PI7Zd0bH3/ubPBg8J7jvvDZE6MUA8v?=
 =?us-ascii?Q?6u7V7QtwZv0xAZjRS8CQUjyX62XZ8YSwplppBH5dnvB8d18lzYQXe4ryu0XD?=
 =?us-ascii?Q?GPLnTj9b/M3M1lgL6Hb3Firc1gq7q5s9bn2jAQqLz41QtyeFjyk+CSJb6iI4?=
 =?us-ascii?Q?/3rxJqOBV6t5OH0cxBIxqr6Cy4nJwmeNszjnMazwSBGHcgIJK8GQ/vxNHtWY?=
 =?us-ascii?Q?PyBstrst+QAwsGV8xh4yIoEI7QvP1RW8KoIvM+7J6xpNWsa2H+cJjsosNxxo?=
 =?us-ascii?Q?u+zBOGDR5M2Eg5c49t4oM1LHX+qztSiMWU1d+kKdwRIeTa2hQv3+1SyJXsUd?=
 =?us-ascii?Q?Qq00+IkksuArmt49Bn5SQ5+9IogXm2uDAVA3fikSvuRQcDpvwwnJtHPw+/WV?=
 =?us-ascii?Q?EqRUATadtzZCOodJ70m+VdX3PpspN2HD5A4H0lFROAYBWgEWdOEUDny/sRdp?=
 =?us-ascii?Q?psm37TQv+RynZ8Uo01t/pX8UlCc2Yib4vvucyxxLVxOUyQIdRum+Y8QdfgnT?=
 =?us-ascii?Q?gkz6NUUtGgOAlE0p+cIACwMJ2M851pCB0KD1gvAI2yKkRNYBF58QWOkPfMZM?=
 =?us-ascii?Q?ptWbkpXx6D6vANgJJGnaCnxeESumSv4j6CAQ3Hrq0b6nwiZNsefV4W5cEps5?=
 =?us-ascii?Q?HujRn7HGyg9IsB09Xl/cAYn7xkT61s15yI9t6sI3KBZ1SheWCd7cyE1W1tNq?=
 =?us-ascii?Q?D/XTQMb+8ebmQ/JTjzLeLQJeF14ixA+iFXQRVn9PlpgYVjiBr2KezWBQi7Gp?=
 =?us-ascii?Q?/UlWBP08rIn8jDESCc5dmRmjnHRyr0csCbLekORQHDoZ3aez9wzZXjCFKjQH?=
 =?us-ascii?Q?86xB+cZ0ZsNbmksA46MQpaIM++wJL9RL2GAoI4KdIxIJPPL/LdsArUipR3sd?=
 =?us-ascii?Q?Dq0gYlmGmT1HvmFhRnbSS7oeSuuGsgNZjmlc15JRWE+nLQkYiYLqBgBfGgcJ?=
 =?us-ascii?Q?essncsh4EkXnFNg0CSiaxMpRbI4nLmS+PEONvc1SE1YrBqOba+cuDsI8O+ta?=
 =?us-ascii?Q?SoMUMjQabV45//Urj4MFIui2OWCO0xKBE7JDLOyyM75LBHiZC/8AzbQanGnw?=
 =?us-ascii?Q?DN/ZJ67zkgFQVbf2ZbgfW2XHc5obIU0clD5lOPgWo6XoSRJMxCUgVua1aMfz?=
 =?us-ascii?Q?Ble1b3GMeIn8c/0iCQAPFRN7GlGYeEnEtQHqbEJ/UlyZYfWufelhwefLpVmM?=
 =?us-ascii?Q?1/43A7woCmMqTqVKHFpXBDT4/qEsbogCMe/Z9atYIn9fIDlPsc5ooWDHkDR2?=
 =?us-ascii?Q?8zZ0IHHBBcWcLgnbh5GeADILzLivFOiyEWRIksS4H7ZTZH16M4Qi9At/1KDE?=
 =?us-ascii?Q?gPDFVDF6Ah45VYXj/wDnR/1MphmfBTo6uIsecIqaCY3E5YHfmmJ2i40UEqW1?=
 =?us-ascii?Q?/MF6QaGSVDmt99h+iA98hIdkZJxN5rOjU1ekgkwSqZ2HrQWdcBIzMX2OKD98?=
 =?us-ascii?Q?nITJaLflHToooyHo7jquzJUpxRcPiNB/yxAZUrBCal1V0o47J6XzX8Fhx700?=
 =?us-ascii?Q?NDKWCEhKTl8p8EH3LiXPekJXAiauuikwJE3zqvzVl1G9MRe9BQh4g5It5s2A?=
 =?us-ascii?Q?qCq0R6tqk6f/FJbEAKIFsnoDlO4PLaw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JXaIbm+rTybxOUOzYrIYyixvY5yXFgIA4IaKmqIzVN2QvlCny9NzQnMDdVbi6xQC5HaEyTD9Zl3Gr4udV9XnHyRfXO5SzkepR+V17iRVm4fgP/7UBrvBTyMW0S1rTOuOVs0moJIiT0Kpf9pzzMW/s3Glxf8s5fF2bJwLkHI2nAF0fgBM6WAMinXZT+6CgzeEkLuFXj3vtWyKJUt9N2cLODeNcsFtU7oDlzRlba9Les8xjkhHWYpnXqU1eicsGDDPJLp6jkv+Shb9MoZcQMO/ZZ9F0rW5S/ufyJFoU8JW7ADGTvbiO64xIYilzXU5uSonJd3EZxkvfwqdeNn+mEnx3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d479a0-f88b-453f-a17e-08df2f9441b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 16:56:31.3510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VlDE9Tov36b9Z6lcskhAGkFq/7okkDwVTL5pt67sxZmyjCOQafRC08aCqCgKpUgbHI5z3KCqPeUl9hFtZw2CrPu4vFSYbxCTqEcERq/rC4XBr7iTADlbKHAgj2mdvt4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 October 2026 12:55
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_14021768792
> for linkm/n ratio > 10
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> To support a Link M/N ratio between 10.0 and 15.0, for some BMG ultrajoin=
er
> cases we need Wa_14021768792.
>=20
> To bypass the hardware limitation within the Timing Generator DDA (TGDDA)=
,
> we need to program the LINKM and LINKN registers as defined in the WA.
> Along with this we also need the relevant bits in HDMI_EMP_DATA and
> CHICKEN_TRANS.
>=20
> Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to trac=
k
> if we need to bypass the Link M/N ratio limit in the intel_link_m_n struc=
ture.
>=20
> Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold INT(L=
ink
> M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
>=20
> The workaround is limited to transcoder A. Check the transcoder rather th=
an
> the pipe: for a single pipe the two are the same, but the joiner secondar=
ies
> read the M/N back through the primary's transcoder, so a pipe check would
> have them report the workaround as not applied while their state, copied
> from the primary, has it applied.
>=20
> CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N, since
> writing LINK_N arms the double buffered update of the M/N registers, and =
all
> of the programming has to be done before the transcoder is enabled.
> Both are also explicitly cleared when the mechanism is not in use, so tha=
t
> state cannot leak from a previous modeset.
>=20
> Only bypass_m_n_ratio_limit is compared by the state checker, not the rat=
io
> integer and fraction themselves. That is deliberate: both are derived fro=
m Link
> M and Link N, which are compared already, so the thing worth verifying is
> whether the workaround ended up being applied or not.
>=20
> Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
> are not double buffered, so the flag has to be compared outside the fasts=
et
> exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
> Otherwise a seamless M/N update could switch the DDA out of the
> workaround on a live transcoder, with the Link M/N values only following =
at
> the next MSA.
>=20
> v2:
> -Drop the drm_WARN_ON() on the extended LINK_N field in intel_get_m_n():
> it is derived from Link M and Link N, so the state checker comparison of =
those
> and of bypass_m_n_ratio_limit already covers it. (Sashiko) -Compare
> bypass_m_n_ratio_limit unconditionally, so that a change to it forces a f=
ull
> modeset instead of being applied during a seamless M/N fastset. (Sashiko)
> v3:
> -Check for transcoder A instead of pipe A, so that the joiner secondaries=
 read
> the flag back the same as the primary. (Mitul) -Drop bypass_m_n_ratio_lim=
it
> from intel_compare_link_m_n(), the unconditional
> PIPE_CONF_CHECK_BOOL() already compares it. (Mitul) -Print
> bypass_m_n_ratio_limit in the crtc state dump. (Mitul)
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_crtc_state_dump.c  |  6 +-
> drivers/gpu/drm/i915/display/intel_display.c  | 82 ++++++++++++++++++-
> drivers/gpu/drm/i915/display/intel_display.h  |  2 +
> .../gpu/drm/i915/display/intel_display_regs.h | 10 +++
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  5 files changed, 99 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 92675a88b969..c51b21222dc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -36,10 +36,12 @@ intel_dump_m_n_config(struct drm_printer *p,
>  		      const char *id, unsigned int lane_count,
>  		      const struct intel_link_m_n *m_n)  {
> -	drm_printf(p, "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u,
> link_n: %u, tu: %u\n",
> +	drm_printf(p,
> +		   "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n:
> %u,
> +tu: %u, bypass_m_n_ratio_limit: %s\n",
>  		   id, lane_count,
>  		   m_n->data_m, m_n->data_n,
> -		   m_n->link_m, m_n->link_n, m_n->tu);
> +		   m_n->link_m, m_n->link_n, m_n->tu,
> +		   str_yes_no(m_n->bypass_m_n_ratio_limit));

Please add dump as part of separate patch ?

>  }
>=20
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 461b81bf8341..ecc0e5ec181a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
>  	m_n->tu =3D 1;
>  }
>=20
> +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> +	if (!m_n->link_n)
> +		return 0;
> +
> +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m, m_n-
> >link_n)); }
> +
>  void intel_set_m_n(struct intel_display *display,
>  		   const struct intel_link_m_n *m_n,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -2726,7
> +2735,9 @@ void intel_set_m_n(struct intel_display *display,
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
>=20
> -	if (DISPLAY_VER(display) >=3D 14)
> +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> +		link_n |=3D
> PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> +	else if (DISPLAY_VER(display) >=3D 14)
>  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
>  	else
>  		link_n &=3D DATA_LINK_M_N_MASK;
> @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> intel_display *display,
>  	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
> }
>=20
> +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> +				     enum transcoder transcoder,
> +				     const struct intel_link_m_n *m_n) {
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return;
> +
> +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> link_m_frac));
> +
> +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> +		     DP_ENHANCED_TGDDA_ENABLE,
> +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> +
>  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    const struct intel_link_m_n *m_n) @@ -
> 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc
> *crtc,
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	enum pipe pipe =3D crtc->pipe;
>=20
> +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> +
>  	if (DISPLAY_VER(display) >=3D 5)
>  		intel_set_m_n(display, m_n,
>  			      PIPE_DATA_M1(display, transcoder), @@ -3504,6
> +3537,49 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> data_m_reg)) + 1;  }
>=20
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio,
> +					enum transcoder transcoder)
> +{
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return false;
> +
> +	if (m_n_ratio > 15)
> +		return false;
> +
> +	if (transcoder !=3D TRANSCODER_A)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> +				    enum transcoder transcoder,
> +				    struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	u32 link_m_frac;
> +	int m_n_ratio;
> +
> +	if (!m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> transcoder))
> +		return;
> +
> +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> +	      DP_ENHANCED_TGDDA_ENABLE))
> +		return;
> +
> +	link_m_frac =3D
> REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +				    intel_de_read(display,
> HDMI_EMP_DATA(display, transcoder)));
> +
> +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> +		m_n->bypass_m_n_ratio_limit =3D true;
> +}
> +
>  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    struct intel_link_m_n *m_n)
> @@ -3521,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> intel_crtc *crtc,
>  		intel_get_m_n(display, m_n,
>  			      PIPE_DATA_M_G4X(pipe),
> PIPE_DATA_N_G4X(pipe),
>  			      PIPE_LINK_M_G4X(pipe),
> PIPE_LINK_N_G4X(pipe));
> +
> +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
>  }
>=20
>  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, @@ -5445,6
> +5523,8 @@ intel_pipe_config_compare(const struct intel_crtc_state
> *current_config,
>  		PIPE_CONF_CHECK_M_N(dp_m2_n2);
>  	}
>=20
> +	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
> +
>  	PIPE_CONF_CHECK_X(output_types);
>=20
>  	PIPE_CONF_CHECK_I(framestart_delay);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index 404168f4213b..d53b7b4a80e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct intel_display
> *display);  int intel_crtc_num_joined_pipes(const struct intel_crtc_state
> *crtc_state);  void intel_display_compute_link_m_n(u32 *link_m, u32 *link=
_n,
>  				    int pixel_clock, int link_symbol_clock);
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio, enum transcoder
> transcoder);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 983a0d9dcb9c..bbdbc27629d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -550,6 +550,11 @@
>  #define _TRANS_MULT_B		0x6102c
>  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans),
> _TRANS_MULT_A)
>=20
> +#define _HDMI_EMP_DATA_A	0x600d8
> +#define _HDMI_EMP_DATA_B	0x610d8
> +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> (trans), _HDMI_EMP_DATA_A)
> +
>  /* Hotplug control (945+ only) */
>  #define PORT_HOTPLUG_EN(dev_priv)
> 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
>  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> @@ -1192,6 +1197,10 @@
>  #define _PIPEB_LINK_N1		0x61044
>  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
>  #define  PIPE_LINK_N1_EXTENDED(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> +#define  PIPE_LINK_N1_EXT_CEIL(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> +#define  PIPE_LINK_N1_EXT_INT(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))
>  #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> _PIPEA_LINK_N1)
>=20
>  #define _PIPEA_LINK_M2		0x60048
> @@ -1710,6 +1719,7 @@
>  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
>  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
>  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
>  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
>  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8f9fb2603638..d0748837ce97 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -985,6 +985,8 @@ struct intel_link_m_n {
>  	u32 data_n;
>  	u32 link_m;
>  	u32 link_n;
> +	/* Wa_14021768792 for linkm/n ratio > 10 */
> +	bool bypass_m_n_ratio_limit;

This patch seems to combine register definitions, workaround programming,
state readback, and state dump output. Could we split these into smaller lo=
gical
patches where practical ?

>  };
>=20
>  struct intel_csc_matrix {
> --
> 2.34.1

