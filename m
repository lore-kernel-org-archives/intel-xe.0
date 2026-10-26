Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF581606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F5uhPgRr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5E10E046;
	Mon, 26 Oct 2026 06:37:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813B10E046
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792996672; x=1824532672;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L41ALw7utKn4uN+BbRF2D391cNxNd0xwnMENymyLq98=;
 b=F5uhPgRru3oLzbG6zRhrEZylMysSsiQZTIhuy24CTPh7SzdiGxhsJ1CU
 psTku2H0REC3BbGLYtfKJSWhdR3/Aeab0sbvf1eKHj2uYP/Zmewmov0W3
 lAL0snP0UYqUD7B784LflJ61z22+/DGgx2esFugyura0LSJtT+UZBT4s3
 1JqlLEsN78Fj+ipojBo5IuwRinX9Hgm3UeLP8PBoXnDlKMex0sWpWgBRq
 Ka3VNlaqCoeO2ZUJ/5sS5PN13uJF2K8Qzl6S7ilarcH09iqcTLlM9ZabA
 fXju8FmGNutJSBQ+wnJuFO6upmZLjc8jR3QrQjm578QYcsNeCWqgWhZUv g==;
X-CSE-ConnectionGUID: 69trlkhgTza0Ju4uImFMDg==
X-CSE-MsgGUID: Z2jcaHfSTFentqlVQrj8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1528804"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1528804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:37:51 -0700
X-CSE-ConnectionGUID: bLWbvTAVTXi9Ytnb3IxOog==
X-CSE-MsgGUID: IzGNeFzgSfqmqqwdziqrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4303435"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:37:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:37:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:37:51 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkHflGATYUfI05Lx4BsDiy56S5IiUv5bOHC9LwCOmC248ImTc1mKUDqVlicGkdBr5ncEkqswsBHZbdE3O38rIO4XGH9+CIQ8rZ0kVMv3VpOgHNlhKuTn/8X5aCLRtijHeBCaivdahgEJPx/m74ZL5+Yx1j636DQu8a8iATbMeOs/4tpklr02UiNFfMi9jrf81yP/5YIzsVh5rFM0dh2ynZUFmjYhdy9mimzPvDsPEzQsxKtJlvfOBdE0btigdrxURlZrsGlZLb13swqdY2/aq7vEsnmlAkVd6N2QWiqENaN0rLlJcE4LHrXgQfLKREXrTfXAzUzq4LH3/LuVEPyjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLZCw72bC8BhFBCbW5Ah0saeBGeUQbELtbuv66mUuJs=;
 b=qUocvjO6nbiPHoONRRPuxyiER/485UstMmfHlrQHU6jRtxTlVvm7R62k6ybwMTw7+IyBIamP0gtSO2oLmr2jZMdJwjqfzIEdpntFWcI80frx3G4BhgrGRLj3Jy81dqnXXsVQBm4Nzli2KO41oypUa29mwk/1UPkVGKnSQAu1tVINGPLUNoXfzbCADLa16mFhGmAtvdQScX2Vcqg7hADvFMEs6FiSdmh8EmqN/Ctr3LKWKj2BYNYtDuEBxk+/rRdXutJck/kVCYm8lOM+VfrX9PJivOnxZ/NXfSuZhpeyZCPb5AgeP6ZGsgei63pqHZVNi/I71JM511gUCibLEftCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:37:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:37:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Thread-Topic: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Thread-Index: AQHdYrTxRqOXPSsYn0SHbZzmgAT5o7cPY2Lg
Date: Mon, 26 Oct 2026 06:37:44 +0000
Message-ID: <DS0PR11MB8718895D1AE1720ADAF15B0C81612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-4-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-4-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SJ2PR11MB7504:EE_
x-ms-office365-filtering-correlation-id: d4d9649f-ee49-42d5-7994-08df332ba431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|10070799003|1800799024|376014|6133799003|10067099003|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: DMqZMPnuvoTyvj0qSdrjIHy2aDZam3eJABuR620uMEfYxzatx2FGYJD9Zkz8b7S2DnE0d/QRYVR/c59e33cIUZkipN8FvooTfa9Kg8Wf5+K/sekgOdzcwNyQy9R4jhpSFlgA2yDmu9NzVExlE2d77k5zPIY8+UEXl16unL+/UAua4hclDVww7qaH1f1T/76qiikOXaVlHKVDJ/JRkFin6ZC3+JX3lgyuq1qDsfzvH6A0TDtz5Py84QA1UAckCnKPUb2Egl++B6fWKakd/zXOpOh6zLc2/EhiHp/6MhMCHcKh88Kiti7GP12PBUPkgNGJCCacriNu8JsiEUbrST1f28IJ07baOUrbu8LCiKUX9+gjcxXwSpbOma3sXcDWCr0SOw4dYxsvHsPS6HdK6d39vsisLU6mM87R+h/DzYPvIDcdF0DU7xIN3TtNnt45TWm8dBPShZmUmmsR6XCWkmfdhZ87Em6RHNOwRq2nGmVXzR9uIgmVZof+JE0NvlWZEvPNKSX6yu5t3EgdZ2uvFzuCe44Beh9f725xuNVq25H0XkRkSMBesyarpC6FKDQcIdn+kvGSmoY14QfbXxgnoCwlc21vnvTj2I+qlHx+p9FFt1i3z78j38O6lKsKbnLwMQVaLSgm+rFEas+WGl6zn8usUFUwbMTzQESdSraVz2DuOrs1P0ztPnoKVQosWjx6iZHJHLWzTpFrSaIkweXwQa0AVx2U9ku1uFkfioDjbfiXnug=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EQbbPDnimq2COBQZvkL585tebAes5O6yc8vInloO0+ykqykzR1Q0LO/icjA8?=
 =?us-ascii?Q?voIXJhpHRkW/6waQHJKJbh+XyFcKnZ3LWNMm0pWkJ36RzOQ/c39Uc3LjvOtj?=
 =?us-ascii?Q?aLVpR/AFKNZ34GNfM9imrrDoswY7BYWCwRAIU8hfZboj+bdrHhe6f1D/wScF?=
 =?us-ascii?Q?rwsOULGWrauzwQK77gVnkQUKTMa+cOJvqwfGAU/ZRU2dgazsuZeJx6AkW4z1?=
 =?us-ascii?Q?tc0wNvlqkiniJg+yfDiIpGRPqyaDbzWdzyV+2dvujxhxTMeE9ZvkwfKc2Fav?=
 =?us-ascii?Q?nTnJ+u9UUnYM0vuI58s9j3MZskmaSZHvnvdr6CymtwLPvcXoDEx63gOhknFC?=
 =?us-ascii?Q?gg6T2U/3bXyqk1+1/SUIoHwxPGPrQc1jLEtoN9oJkRmcEH41nT29MOirdVo/?=
 =?us-ascii?Q?UzNqF8EZbq4jnHC6+IghNg1abWqW5WexD9TybW3e1BWIXdMCoqTniqp2XzOb?=
 =?us-ascii?Q?rEToctiIZO2/Gx+2TwSIv06YeoZsT0eu/sDsEXubnG38W0Yax79N2SAzRctZ?=
 =?us-ascii?Q?cKFqKQqq2Ep2y/nLxkBv+6jV+7l24xO+xxsx4boIRzafUHOFBWF6BKXlR5dI?=
 =?us-ascii?Q?qrjaU7PdafP1qQJExtgbLpGdA6ZO3RToLjrGnLXEstFzMg1Cisqd76t612nX?=
 =?us-ascii?Q?Xk1yxdlR3+Jzt58Lq/cJvlotM7U8NCZcoEqM4mLaaP/N4155DMDnbs0Clygr?=
 =?us-ascii?Q?E9P3wE9QCbxGVh6Bo25tvZKJ+Tgj325d3iky9T1GlpqcJiAVkpVlQLgb49W7?=
 =?us-ascii?Q?Gx0SjULTq2XSO1PsXSZ8GUYU38OVnYkwB+oY3izjm43LHuli9bWSyn8v7yjF?=
 =?us-ascii?Q?5vtOis3nLHZHNJ62qPcMp6+uiSsDK6AXUXIHg93TkhZnN6tKiO8vEyOjLWhw?=
 =?us-ascii?Q?N3Ya4n1myRqI/5PEc3ysgZc3jNgDgKgLgqgj8ARKaaBSqjzE+HfoClWF+8GT?=
 =?us-ascii?Q?IX7cWxCqnyICqpy5GBoaijzg0GQbr5zfcBmFQaUcySI/fpj+oFGGGB60+8Jo?=
 =?us-ascii?Q?JVYD00uuMuUeDtLocE9j5kOFJL4wfHTcFdLZxD2M3G8jC2Kadcb3t9mkOJZ7?=
 =?us-ascii?Q?R+MoiLR4/cg+9/Gy4+ovEPoeIt8/4xaz5w6EfPZvs8VIJrxexzqJgofbc18L?=
 =?us-ascii?Q?NBa+M0Q6w9Sq5cSCWaCLFWSJxMaX+Bkfg9Ft6in1MCwYUZlIAzM9aXWjIgyE?=
 =?us-ascii?Q?NG5ZkH9T1jmuHHhZwUeF88JDYHAiO5fit30LJFAdR96QwoL5eAN+IOKeKyVg?=
 =?us-ascii?Q?Jjz4P3nn/aKKgYbw3R1CK9pDyXmdi8ZQ3E7+2yRW7GTqL+X5g/QSVKOqxND5?=
 =?us-ascii?Q?7/MVrtkDaOCibK+uuXHtaPDtxtRZ+bHVaZ/CjyVN6YFp/azSHnZK2Rc3dmXw?=
 =?us-ascii?Q?2bcZ0Y6u1YNQj8TE1wi9SYj86J7YMbyl55ElwsW8T3CtQWUNZ9/Hf+cOmReW?=
 =?us-ascii?Q?TDKZD/3+dDi3KCp3Ms2EuKBTocOECyXx4pI9giXX4yMI+cRoUan0WR3D/WxX?=
 =?us-ascii?Q?TmX96YkIT/egvqhEbz0ELS70rzQMzGFjqWIbN0wr+MqgxGFls20jwcqVj9A5?=
 =?us-ascii?Q?xNw7iYxxNDCvIwn7+JiQDu4aw679AJnKGN7Z8Fr2g4k7JbQf9Ps53UrRJagy?=
 =?us-ascii?Q?u9+luMXJYdW2Ie1vjCD+J/52K2lG02dILMW3/Zvqn+q3fIvR0mxVvpWh55dw?=
 =?us-ascii?Q?SyY8Zas5skEKImtT+WtmFbhf3KmyaonE3+E0TtewCoe7jsNeSHZlxdSWchdM?=
 =?us-ascii?Q?GXG8rQSlhdLXxL9bA/v2L69pYtLZ4hXeC9dz7ZJL/t3YSKKorup++F5ijgtQ?=
x-ms-exchange-antispam-messagedata-1: yUKEWIKjGovr0A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V+9BTdFUEXGEvohcKAcof7CethaFeNij9h8ZW2qQxZKLx6PAiB91TLCUq0SCy3RhRZgXHk70/40RZjathPV4O5P72CkVIBmTVepZ1FMl657uhoTTnCEHb6bUhqALANtsAQvqmGpQJVCMzX2pehzZZHGj2dOZCCGFk/4fGWlNvsF/X+b6ytuQXFDbVRMVBO4+9jDl6yQt34wUqyhALSfGhXgIE6WMBHREisvUx4HuguSKI84IWwVslOxt6BtUzPq4M2crFVfH8103f0MEWHPIS2EoSiEcM/UGKZxTLb9CfH5n5jNFqbIOt3NbEYmSPlfELyk4tY76EEArcac0LDpO4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d9649f-ee49-42d5-7994-08df332ba431
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:37:44.1079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24OpVbcOJTAII3i1bpvpfXIKQA5HzBWqLzQ6hStRmxHeXmxsySRAU8fbzAt/k5aTnstjuw9A6IItn/z1FbV9j1SJlS1Y3c0d0LGbL0HGN2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
> snapshot output
>=20
> Include register offsets in GuC capture snapshot print output for both 32=
-bit
> and 64-bit registers.
>=20
> When dumping captured engine register state, print each register name
> alongside its MMIO offset to make the snapshot output easier to cross-
> reference with register definitions and hardware debug documentation.
>=20
> This improves postmortem analysis without changing capture contents.
>=20
> v2:(Sashiko)
> - Ensure lower DWORD prints
>=20
> v3:(Sashiko)
> - Use the LOW_DW MMIO offset(capture in last_address)  when combined
> 64bit
>   register values in the dump instead of HI_SW offset
> - preserve existing coredump register-name format and append register
>   address as trailing metadata as a debug info and avoids disrupting
>   existing format
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Adding offset as requirement posted, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 5a4d085660a2..3e99aef53b46 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1716,6 +1716,7 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  	struct xe_devcoredump_snapshot *devcore_snapshot =3D
> &devcoredump->snapshot;
>  	struct gcap_reg_list_info *reginfo =3D NULL;
>  	u32 i, last_value =3D 0;
> +	u32 last_address =3D 0;
>  	bool low32_ready =3D false;
>=20
>  	if (!list || !list->list || list->num_regs =3D=3D 0) @@ -1743,6 +1744,7=
 @@
> snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot,
> struct drm_
>  		switch (reg_desc->data_type) {
>  		case REG_64BIT_LOW_DW:
>  			last_value =3D value;
> +			last_address =3D reg_desc->reg.addr;
>=20
>  			/*
>  			 * A 64 bit register define requires 2 consecutive @@ -
> 1774,7 +1776,11 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  			XE_WARN_ON(!low32_ready);
>  			low32_ready =3D false;
>=20
> -			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc-
> >regname, value_qw);
> +			drm_printf(p, "\t%s: 0x%016llx [addr=3D0x%x]\n",
> +				   reg_desc->regname,
> +				   value_qw,
> +				   last_address);
> +
>  			break;
>  		}
>=20
> @@ -1788,10 +1794,14 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  			XE_WARN_ON(low32_ready);
>=20
>  			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED,
> reg_desc->flags))
> -				drm_printf(p, "\t%s[%u]: 0x%08x\n",
> reg_desc->regname,
> -					   reg_desc->dss_id, value);
> +				drm_printf(p, "\t%s[%u]: 0x%08x
> [addr=3D0x%x]\n",
> +					   reg_desc->regname,
> +					   reg_desc->dss_id, value, reg_desc-
> >reg.addr);
> +
>  			else
> -				drm_printf(p, "\t%s: 0x%08x\n", reg_desc-
> >regname, value);
> +				drm_printf(p, "\t%s: 0x%08x [addr=3D0x%x]\n",
> +					   reg_desc->regname, value,
> reg_desc->reg.addr);
> +
>=20
>  			break;
>  		}
> --
> 2.43.0

