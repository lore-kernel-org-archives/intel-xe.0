Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFED606A337
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEWsKet7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Lcz5Zpd5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C18110E4D6;
	Wed, 18 Nov 2026 15:08:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F2710E2F0;
 Wed, 18 Nov 2026 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795014473; x=1826550473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vcqI7mlFCPVWxKygLTa+5jmQgVzFAwaF8WZy5+ZTucY=;
 b=KEWsKet7JER6bGeg6CAOfyDzeP2m1xb+lByelDvJ8r24SHqjpG2Zezsx
 nDLkOdYyCrjOZSSD/8IjiL9ERz8Sy7p7gKSn9KGI5IIEgYMiwv4lITJyS
 obS5xaLNDvn8NV6EDia5/mpSjna7lP6EGtqv6wxcVFjLKnCiapJ9HQkD6
 zG03u5SPOoLMmfl/Qmeg60iH/7DPt8EgLpYZ1C+yUZZ+ikG+Lod7PNapz
 KZFrF7eMh+nQkhCThJzWLaR1cdZgcijoBwPKTfHn5YJjGbHtbCj8Ly9sA
 IDFB6TMjl7f9ytUxcqyGv5ZG2afJ6ff82yDEK7U+UB5PIlHAJBxBoShLf A==;
X-CSE-ConnectionGUID: FmvwDZ8rQ3Ooj9WWRijLLg==
X-CSE-MsgGUID: o2nMZ8YKRJ+oflRUU6euJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3851289"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3851289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:07:49 -0800
X-CSE-ConnectionGUID: FiAnRgviT4+JhvRk7j85og==
X-CSE-MsgGUID: QmAimKkGTMCRMzyvumFDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10170833"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:07:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:07:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:07:48 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:07:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVf/EZIwNe+ra6m1MX3y8D3bVu8aE5ktLUPcjaZ/XbOVC6q5abLMfeRgQ/lMXEiMt1hCy+gXlK6SPipowGDEz7+m89/Jj9dBFERIceCpTublHniYL8q1rzEZqqaIpHM5vC/ppM8sQNzzbHTLC3TZE5OMABY3hLit+iuJvnd+oDts497XoP1GNs1fZ9e/E7EbzBA4OlaCD55fAwLYTrCnSN/XLVQURuPeO7h4iEyiF3DHdVJuaQgYxn6B0uBPHnCnoCGOEycJ2a+tnO3Gsh/REkFrwZbIjhYczUadPJ4fXPmDe/S7WCGy952VPQDZD3QNvQiZP1ucfuPET/a2AiSJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrucXp2w45ua/1NrQP38sJSKtO6Kp62HtKY01ug9biw=;
 b=eF9xxuesbJut+5ekO4C5KOVCnyvYNLAdOb91MxrxI5ZEygm6mnVEltFb2egDMbK7Afhsg7JNEoDb6bv5To80lNCbOqv8Wuu4RPoiHVHh/7ziyyzipNAqqXmQEghmSvufw3KYEkSaB49ZSc+U5X1rizQTlsgEkuxLslKhGYp5MTJVg5cIEhZAQ3QvpHgmznXEjd2CaUtvMujtBzU5lOaCWFi3hErly4DYCa+tTh9txmMEhxBYHI4K1OPqKb5XVh/MXp7qDWnTzIZ0UnmApNOvG9OOcm/OWpuaQnYCFHEddX/cn4Mu+pGbCWzzZlbmKH8uDAp6UQ8XT7OV6uhwtZgGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrucXp2w45ua/1NrQP38sJSKtO6Kp62HtKY01ug9biw=;
 b=Lcz5Zpd58sCV8LUPczYsXXe/DDa80gsIrX+iiNKZli2oVpOYOPCKWD+xETOwJDD/pP2Ugip50gWCo3eT4Xuc0AE+KP/YBjls/ZpPOQhV7yx/2XoYNpGPcH9dmdbp+Lm3TM7pbTRYcF2KTEvSeNBD481OaQA7WhuCfwVAU/MWU6Y=
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 15:07:41 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:07:41 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/i915/dp: Extend HDR mode to HLG
Thread-Topic: [PATCH] drm/i915/dp: Extend HDR mode to HLG
Thread-Index: AQHddoKc9F2VkYNVNUy0OTdjg9bkZrcyOTUAgAGys3A=
Date: Wed, 18 Nov 2026 15:07:41 +0000
Message-ID: <PH7PR11MB825255703328C36CCDD89946897A2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20261117104808.2023577-1-vidya.srinivas@intel.com>
 <avxPFH45alKwZBxj@intel.com>
In-Reply-To: <avxPFH45alKwZBxj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|SJ0PR11MB8269:EE_
x-ms-office365-filtering-correlation-id: be6e62a1-4b0b-4d6f-3ce5-08df4585b10b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|261009223027099003|3023799007|4143699003|11063799006|56012099006|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: CLHMgFmv1tcbv/O10WjEOknjuRrjR5MXa9FlpCnWOdfl6nQIk+p9xw/3lH8b4TKV2hmH6IfD30uVo5nsiibAprVj63q/HoUinkzcq7szgp1VqH350XTxLTqG2d9PwG2/kd4jWb2wd2Sm4qt9jO0JqfW1D4LseRqRAhyxN0NVYNPlXCbvB1t75jDsqPTJrm1Dt44ryRPk79iGHpUYrU+KsFGVSnSUgVHBtv9/xpENxbbBXWOsJYqHUcHlKIjpqxbKlcoQ8xZlmlzdsTLnbpnpLQW8yLK9E/sRZ17ttzg5QNcfxF7jaxZI7BzEuj0Yijb5IKBDZXqHcyqWwwsKIz2BOBr647u+F6fHBl/D5DZ4GJRiESgspkMjjd2saG8AuPbcPU58um0GZsbXXvI8xP4k8eA3kvTk9t4C/c3QZPkHXwrW0LMWM3E/f41m5AEFuNdq4AtDjtZfDPh3Op9uKMOzMSDdzvOFI0tOcs/sfNhCpfcU/UtnSIqGwWzcdu8jSchxvL8Lmp+e3e0EiGji/2bioKdZTBnQ0KXWhZvYx6VEbLVesjb0MDoL5mTEDGQKf3uM6lcYKndcBBImGBwgalEO2+O6uaVFOTv7fWaCFVcB/oDZOga58EPuRJIznU8WKalmHBfYqh1TFJb8C1iaX271ffWDrTU/f1Wftpsb8kCcFmACdg1X/VNMe54MAOgS8rLNjlLqPypeE1pcaQHk/bzPm97Riy+EPAmPQPCHhOWyJgs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(4143699003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h4WBouAlqkJ/0QVcUK1Vj58pHQeZ+MTyOzTeHNnhtoao60DJw0JBG17RNl?=
 =?iso-8859-1?Q?lVZDsYQgslgOlSAh72Qtozh36/qEJVCM3Qkqx2KyOuMsocHacrIHnYhiRd?=
 =?iso-8859-1?Q?ZJL5rshJR4CfW5MMeI7Gbl2FLcY+eJ7wf/GeDJHjmbbH2GX+/eEzfUgaSK?=
 =?iso-8859-1?Q?fHB0FcluNFNKpCJ1cfb1zOPariNmMLBVE4ALM8e7Alslya9iILu5xmFBor?=
 =?iso-8859-1?Q?WW/ZZEw4HjaZTdriF9QIrX4UgpyCFQuE8qes/hrjZhT8o2jgUeefvK/k0U?=
 =?iso-8859-1?Q?AX6VNtOKzfm+bERu2T/UBla16nrVrh22/kSpd1sooz19FLAydYzBAwx2E8?=
 =?iso-8859-1?Q?2d1Z42caONEEbB59sBs/2xoc0h5ZPETzPmdGvR9NKW1K3x2ENtmJI4h9qp?=
 =?iso-8859-1?Q?DNC0A+MGYGwuDAS69TcFT++/rHB8hG6vakmgTVbIVoYZwURxxR3i2pdnNo?=
 =?iso-8859-1?Q?BKRwf7Pa99J6WBvGqo5JLOOM4sbNz/hMMkaUyCuFFYtHV68odQiwkjBDQ2?=
 =?iso-8859-1?Q?9OCATfTgF0VujSMinElcgXm8Rf/9uPSZK/GYN7ySB/bdy22q8rtD3irNhQ?=
 =?iso-8859-1?Q?50NC/Ia9vKpYInU68nN/4TNF2sffKbFwYWZ5quG6aOrqlGnLuZpCtXvogl?=
 =?iso-8859-1?Q?ZYrVlHngmPvPTA2BiOo8gbAKHVQCM3r7PIkcnIXQfXQ5hK3acYZUiANtVd?=
 =?iso-8859-1?Q?2s2nq6CntNSBS4FcDuHv0WrUpaxhAfMuWlX18+cSzkJ6/SgrJs9jq+biPa?=
 =?iso-8859-1?Q?+9J+RyMp+jszsVyXHPBTwlr3gSsqpPy/OIyvLeZgKxA6g7yq4UONlOE5Tg?=
 =?iso-8859-1?Q?KzGS4IVagwMvbUj8pBD9TEwavFohcCHFmklYstFgZV0Tw1vagcdXuIW+xe?=
 =?iso-8859-1?Q?P9cLRgVhBaw/fyuxfHbZuDAnyRc5i7S54fBrz7AwSaPjVRab3GncBqow/t?=
 =?iso-8859-1?Q?TLBxjpShdbwuXzyILKwL3mT1htufCWW3P8JmNWUM2Y9Um/Yomh3wMfddx/?=
 =?iso-8859-1?Q?ddJedomW/7XQCw4ThKzdV+LTChgcATyu4guog6fJqN/W68EaBoF8hGdBGV?=
 =?iso-8859-1?Q?njJPeZ4sIzl6vEgwNkhEAUNaYA0ykK9ZFs7TNTAziJha800yFY1IUalX3G?=
 =?iso-8859-1?Q?mCKmaV8AQenCkB0TFkiqKTcufYoxDf3dcHjHoLWkDS0/xYHIUWjNqRIOux?=
 =?iso-8859-1?Q?CH4WHcKKugN+I7dYVovd30r5bRPkW6y7yyosH0mU0X352jMXMgGyPdUAyR?=
 =?iso-8859-1?Q?zY+bZNSDtONBVAo0qpCQVagBGpwMZUBSb7BiDSPL+flpDvsoKKTrHJApUw?=
 =?iso-8859-1?Q?073XeoGGULKSDSZHujFq1aVH7GYUEuJEmyo1+4BoK7j5Ya5JT5wxTPPsWH?=
 =?iso-8859-1?Q?zJHTzfaDQfTzeIUQbninF4/GiJr41zE3Dxrpphdy6ITSHgEY7zJzxl/gIH?=
 =?iso-8859-1?Q?buJapt/8K7TbJff3Ft7pTuXllMQX9d3DshgKbQA5fWzKsJVfTLc+vSES4j?=
 =?iso-8859-1?Q?p4oiIaxWfCjt1JZkMSe/3G/dVx5HF36lZqhfFYdkuggFy2+1olvROzTpa4?=
 =?iso-8859-1?Q?t27GqKueslWb7RUByR9v1obBH0nVd7VSgaSnCfW7xpm+9w2fmpl98dgJz2?=
 =?iso-8859-1?Q?nnLCcFgaKU9UjbmjVeNqoRmYiWn6gtjQqkdjitdkBSZojOckiTxpGV5/gt?=
 =?iso-8859-1?Q?uMBq5usnwsemC3p80Sr9BzhOHXJNsu+V8s07ZfM3JmjgF4k4oc950ctDDc?=
 =?iso-8859-1?Q?WIGIvVzmLPh2Frn46iu4XzSw/vS84z1q3ugv5eUxu8JcdwnhJ7CdaCaVXm?=
 =?iso-8859-1?Q?sB0oFDQb0ET9TBR5CjZ9v70ggyTzobyqoHMsE8368SNcM7CocK+IVnjA4T?=
 =?iso-8859-1?Q?rG?=
x-ms-exchange-antispam-messagedata-1: pVPFIx+1hNBuOw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ksljE8mX9oA5a6XX6M+aCvEhsgXRX6GRjkvKUAgZsigPHetmJliG1GXy3OXj26T7ZHq6eDgRVL4THP5LPPPiP6xCkN1YDSo5/+t6q8NuHysRM+OWfZIQDckun7yEgAnFfzXca3nRj5pFIIDhqT4204nEiJGsKBMKUORsWFv9Up71WWjPyevgrh8ucQlyU+w0oxjKoD2WHBdfWUBaLS68UNQMs4X1/JRIkOoVSRhmQj74wx2vUBgyMXCGvoybx/fX3RsOl0ciFAcOJtIDIFhesMpRkG3hrJZTzscBX30qX55mh4LwiKJCW3ST/gtw5OG0q7xgBptFsR3gXN0VS/MQbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6e62a1-4b0b-4d6f-3ce5-08df4585b10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 15:07:41.2257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qr3KlyPkR6GJ+ltBvfGmS880/6EiFnq5ML8YPp5irhfd1DpWgcbN4xEnFXiJFrALzxHSbcQU6X9l0PHIUz5JyEH41k2H2PZMR2Oszhn3POU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 17 November 2026 18:27
> To: Srinivas, Vidya <vidya.srinivas@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Shan=
kar,
> Uma <uma.shankar@intel.com>
> Subject: Re: [PATCH] drm/i915/dp: Extend HDR mode to HLG
>=20
> On Tue, Nov 17, 2026 at 04:18:07PM +0530, Vidya Srinivas wrote:
> > intel_dp_in_hdr_mode() only recognizes the SMPTE ST 2084 (PQ) EOTF.
> > Extend it to treat BT.2100 HLG as HDR.
> >
> > The eDP HDR backlight interface in intel_dp_aux_backlight.c uses the
> > same check, and its TCON can only decode ST 2084 set
> > INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE only for a PQ output and
> clear
> > it otherwise, so that the panel doesn't decode HLG signal as PQ.
>=20
> I can't parse that.

Sorry about this. Will rephrase the commit message in v2 and clarify
with proper reasoning.

>=20
> >
> > Suggested-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c               |  5 ++++-
> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 +++++++++-
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index ef164a797618..adaa8fb25732 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -3388,17 +3388,20 @@ static void intel_dp_compute_vsc_sdp(struct
> intel_dp *intel_dp,
> >  	}
> >  }
> >
> > +/* True for both HDR transfer functions, SMPTE ST 2084 (PQ) and
> > +BT.2100 HLG. */
> >  bool
> >  intel_dp_in_hdr_mode(const struct drm_connector_state *conn_state)  {
> >  	struct hdr_output_metadata *hdr_metadata;
> > +	u8 eotf;
> >
> >  	if (!conn_state->hdr_output_metadata)
> >  		return false;
> >
> >  	hdr_metadata =3D conn_state->hdr_output_metadata->data;
> > +	eotf =3D hdr_metadata->hdmi_metadata_type1.eotf;
> >
> > -	return hdr_metadata->hdmi_metadata_type1.eotf =3D=3D
> HDMI_EOTF_SMPTE_ST2084;
> > +	return eotf =3D=3D HDMI_EOTF_SMPTE_ST2084 || eotf =3D=3D
> > +HDMI_EOTF_BT_2100_HLG;
> >  }
> >
> >  static void
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index dc2f0f3088a9..fa68cc6803a6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -284,8 +284,16 @@ intel_dp_aux_fill_hdr_tcon_params(const struct
> drm_connector_state *conn_state,
> >  	 * HDR mode.
> >  	 */
> >  	if (intel_dp_in_hdr_mode(conn_state)) {
> > +		const struct hdr_output_metadata *hdr_metadata =3D
> > +			conn_state->hdr_output_metadata->data;
> > +
> >  		*ctrl |=3D
> INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE;
> > -		*ctrl |=3D INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> > +
> > +		/* The TCON can only decode SMPTE ST 2084 (PQ), not HLG.
> */
> > +		if (hdr_metadata->hdmi_metadata_type1.eotf =3D=3D
> HDMI_EOTF_SMPTE_ST2084)
> > +			*ctrl |=3D
> INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> > +		else
> > +			*ctrl &=3D
> ~INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
>=20
> If the TCON doesn't know it's HLG and not regular SDR content aren't we
> getting bad results? I suppose it's less wrong than when claiming that it=
's PQ
> though.

Yes, I agree this should be the case.
However compositor will be detecting HLG capability from panel EDID and sho=
uld send HLG
only if panel advertises. And as you said even if it does, it will be bette=
r to not claim as PQ.

>=20
> Are there actual systems where we still need to use this custom DPCD
> interface *and* the display claims HLG support? Or is this a "user uses H=
LG
> anyway even though the panel can't handle it" situation?

We have not seen any eDP with HLG with this custom DPCD. However we just ad=
ded extra protection
in case such panels comes up.

Thanks Ville for your valuable feedback.

Regards
Vidya

>=20
> >  	}
> >
> >  	if (DISPLAY_VER(display) < 11)
> > --
> > 2.45.2
>=20
> --
> Ville Syrj=E4l=E4
> Intel
