Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67CC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECB10E714;
	Tue, 28 Jan 2025 22:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9L9JUlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61E610E714
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738104238; x=1769640238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JOVX0ZRf1aS5wDm4+0V/Ro9ZiiHB9updRDNNZx1zTW8=;
 b=c9L9JUlMevTdsxcy9C3ezTlF6o7fAnLSL6RdTtfpkAiYe+lmpAW67q+b
 vC5xdpbYxfjQB/gG/V9RxnoqH832yk7Xls1wiPzABD9xdiyP14enEyze7
 9TKu7w80ILrVRPK17EIb2MH8K8kaG3pGfnRUxQ1DNj9rNQWba1InC0HVn
 ZwHqQaIHJ6MCHgFGPrUPcdK84eeAiJ042YIIS0P8yME2vTMuhrPjFJohH
 wgBIjXNFCqJblWN2FyEIrX5pr7WoIh6B/OzhuhNzsIgZ8ZfBmsmK9w6tj
 7azv9dbNR1lGUxum+5vqESt7Yhl6OtNfnhPPgQLQiILVAkoIAbi7vSj0m Q==;
X-CSE-ConnectionGUID: 24QRkbd3TYGHsgs/Y7kYvw==
X-CSE-MsgGUID: G2vc/RFDQiyZiqfvq/dv3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38639111"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38639111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:43:58 -0800
X-CSE-ConnectionGUID: etGcHNumStqRMc96rthDaQ==
X-CSE-MsgGUID: lOgMSLb4QxmXwLhq1dThQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113483671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:43:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:43:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:43:56 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0UmxDCoWftAd92oeMz00TRjH+ZfhU5fXCGpwgAfrIObdmxMWIVPI3eJ7UA+wwczlkzTvPLBfHraJYFcYMS8GDG0lJ9QOefjBMLbto5YWmNFVeEekn5424Z9ifxRxVjE4cTLDzxcWwCXJ35EKrU6SCXROLAEpjGuQDdjtt6BytwNZBP7boA5nW1+YcPzxQ7orqg4Q8vGonlea1hnjFWooNAvPGSpXlNLZfMXOqZkP3vM6KqXDNWAyq6d8dlAdckL4YaG4HBSAb0PvWQX4dQ+AC7glNrc3lqWWftHscqU8A7Nxa6XFSdInSPvk7c5/CDxG01UorECBkQij21ehDgPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5eUMdbPshmPW6XdwcGc9K9sqW7WLNXGqmHlzTdk7m4=;
 b=MIPReEVbA+tYEaz5z6STcSt9NnZ5ULA5+kHxSe7FjzhfhKFRSDD4Lu0LKRaVU1DaBWCty2jGrKEN2dMuDN61ZbZTK1pOfpC8h1iWCHKVDYzkgm0YAVcroA7zGVik3czhFbyECSpXl1ckGMziPkCy3Bg4Yubf6j75Ago77B+odOC7TH2SkcEAUEeCv9If/nyXdXqwaYJcqbOYH/nOLr7ui9KWzUYZsqp72Q844LeOMOiHi5/YqXe3uXXJU6fBFi1twz1F/SZisvjqLzAtVuvganrjeO6dC3uLXTQ2BQwt1cPR5Km8KI6RZ0CnJdIX7pwhti1r4uMDnFcniZg0WHiJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 22:43:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:43:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
Thread-Topic: [PATCH] Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
Thread-Index: AQHbcdSS79bLsh5cdkKRHaCp4BEPwrMsx/Kw
Date: Tue, 28 Jan 2025 22:43:27 +0000
Message-ID: <CH0PR11MB5444475C2445DB451BAEB2CAE5EF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250128223248.660748-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250128223248.660748-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6789:EE_
x-ms-office365-filtering-correlation-id: a4409685-e424-47f3-1bc8-08dd3fed2e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nvDDgO1x3RQu5ugVH65XgAaP6Y6w2Ktpv/Z3y9K2oPLbUwKBSll+q7CLG6GL?=
 =?us-ascii?Q?Yg6qd7Mk2FeKHV+vUP6csGBYh77a+J59o5+Lut4DQZmxoz3p8HvgJSfSwRFz?=
 =?us-ascii?Q?yeW0rQeIEw3VbKZy5Cju7N3+kQ0NEKi60IsDW71PINhcXVSMLFqthmwtdyCd?=
 =?us-ascii?Q?uTosJLbNjmY5Mnj21OeD86MNtyyptOQNm3ARpInGYyNt5a/56hY7X+hFLnoD?=
 =?us-ascii?Q?AclWJncgLNnRsCcKQ15qttr+T4WcnHLMcAplejGP9hPDAmbchjFnMDHWr2Rj?=
 =?us-ascii?Q?rhVCjzWTU/Jj78n8rk6FBl1+ZWV3syuUYyjKBe80nW+3YYshfSg/PsFdSLbk?=
 =?us-ascii?Q?mH3qQAJPFc/uLoZO4GCQBFMVvvOzzKsHKJ7uUfJR81Hpp7MVYCJ18/eP+Q5d?=
 =?us-ascii?Q?ChqCrOE1mdsJpof59XKv7/gwfiGLOnDeRpAI4KJ273KheKYbMXf4yzYHehZz?=
 =?us-ascii?Q?5qC0w6J6i4ig9zptpIogWnf5JHHKjhpr67O/j29IuqLesm+DnPE1AdK64eq7?=
 =?us-ascii?Q?kGb0qBw8s1HyETAd+AVgJGi29LJlNt9SY/yG/f3I0scWqOWe56jLR6kEEPkO?=
 =?us-ascii?Q?eUPgM1l7d1uE8bek4NW1ycwB9PaN7jaC1060p1qIeL4yFgdKmMbWl+CyizgZ?=
 =?us-ascii?Q?4uXZmNwiOZYXbhR+edBdtnD9AN+Iscai73hgtRZ4H0u7mLoJrkiG2CIr2/3P?=
 =?us-ascii?Q?0HvGuGB1vj+/Tm9P6VMokZobXN1DS2wP3sBMEETdLQDKeU5gZr2RFgbdxLZ6?=
 =?us-ascii?Q?tgkIEtWlIyDj3ewXBf9DCJyOfsaAeTVguWRaqMs78yGW8tnYjNW27LK0Fck+?=
 =?us-ascii?Q?fLI/16MmR/QaZ8DASWKjQVlHTqg6o7V5KIlHaRUmpDf8uSFAscLXGkbM9xs0?=
 =?us-ascii?Q?nGKZ+vUqMO69Ykny9f+jY/diR2/o8L5G6bLn06+mHk/WPNMjtauRHZ+uGqeU?=
 =?us-ascii?Q?8mueyBCOyQdAqysI0aR8VrZAjXrkfERGUtnjeQr+K8jpElqTUHD6h1SksRry?=
 =?us-ascii?Q?KsO8W6nk3+E5wdm0ZTtLIHlWLiV6v4MPA1RtcOSoke+vcw0LXCCdtlegxEfr?=
 =?us-ascii?Q?LQ750rgZxIdth0ZgnyzQic5qzL1h6e7daRfgt6kn37ebsrOkL2FCV+meSWRK?=
 =?us-ascii?Q?U7paGfg+HfemxJTgPTjLbQRNpr8VD9aRSKIsezow2Yy7VZ9EO5/0SS3gR65O?=
 =?us-ascii?Q?beoPkQTxAkuvbzk8RSedZvARJCFQd3BjxxHaN7JN33AGg9kwS5jYMiuvxMu8?=
 =?us-ascii?Q?kOK1FVr0SxXxYemvsvFIAM2HbqOFLMQhaq7wO5E3ufvwme/0DV03W6jc0V3v?=
 =?us-ascii?Q?HvLlQagCVsNc8EPgVB+9oSjBgQYa70YsIf1GiDKGxmC+5g36grKn95CEyUJu?=
 =?us-ascii?Q?wAyvL4EhYirjmMq8lesIJ1mrreDn0kC51YbmLdBLkXEeVFUgA0etnPM7J1BL?=
 =?us-ascii?Q?s3+a3HRdlIJV46Ze0j9KG3zsLbxLB0U8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r3fhooFvypaVPQds3u0pTCHNQELNTCaAQmlXGdwBGiLfT5fTc8TmQ2QP3T/+?=
 =?us-ascii?Q?i/NZh0dI807yIyV7g4oktgO1R1jGx7fzbZZfdWsyFcMwnbxXiSK63rXZtbGf?=
 =?us-ascii?Q?awYm/vWK+iNsvsAWUy7vJ4ptubPjnyGl17iC6mz96TZ6qj2xzgJ75k8r7kD/?=
 =?us-ascii?Q?tWFwxw4/UNUpLtkuUYFLHzYvfxHVTZNtT8SA81AQzStON2vWkgbXYJJYP73D?=
 =?us-ascii?Q?NAbtaPqR5oZV6vWB2TxbWlbMQejeNELBDhU62TZYy9Q629H3kYwXuGOCKt9C?=
 =?us-ascii?Q?AvIeBsJHiJtIzKxcGqvYe6L4+ai9H7/g6xUdXg12DVzL1jQJ0fdD1ePfzXsk?=
 =?us-ascii?Q?zUwjxPPBb1i579LNzlJpWA1O/aT/7a8atNKO5UB5bYdctkvUBCww6qIAlv23?=
 =?us-ascii?Q?C5XsL+6mKtrGUymHXGKnYLcMVKNOzZ4ELYJFRyWtCI7zVi9vcMDF8BSreTY+?=
 =?us-ascii?Q?g6EHw5l+uJB+ZO6FPoJG7g73ECbcr7vzrDZhATeCA1HEnlliCNmGkjaeAo01?=
 =?us-ascii?Q?o02xywQnnCXC2R8pUYKAAII13udPHGR6oLrEaFw2Xpvo0h465TN1d2MBwtCA?=
 =?us-ascii?Q?3y/Qe/sv9iGESIL0yE/pNAaqNrvfMH2ZRjj5TCf9R6SzHXzukHlRFZ3r248Q?=
 =?us-ascii?Q?mvxe9ECfwbaaumnNmULtFMO/pmM0VkjJByNx5SB654vP1P7JHAGMOqyqZo1W?=
 =?us-ascii?Q?mOV41KrNwa0VlpGkVtrxP+oza9dcYI/DVZaGztthkmGD1tf1HwV5ugcsstwP?=
 =?us-ascii?Q?jaa8X1F2pdCicCsJ/Z1AKhVI90elVcm8tlfvVWgMjndnud05FA+b9Jk6SEN/?=
 =?us-ascii?Q?upPfPnssxVqIQP/MJZzNlPB7oQH3MjkEpRnCFfxNAu2uBTd9TA4JixyrxpoJ?=
 =?us-ascii?Q?GtoTjl+lfmZbOsWiSm1tKTUWAp4yBFoO4+Ml+CRPbvbdh6I+aPIkEc0juJZ6?=
 =?us-ascii?Q?BTkY2h0BVm3Bs0C7qSbfigQSJT+v28TuuMhE+UjGoUmB9pOunEvUu7HDAaTK?=
 =?us-ascii?Q?TfP7YbKGVuCi5hThgqmTp+9KS5Bbg6P7AmCPIT6ZZloYZWp2HzSheysQcNJT?=
 =?us-ascii?Q?IapSghwmUh/1swGk4sfZg9WbioECNDvc+SL5bE1yHQn18IFZIo7IMASfVcl2?=
 =?us-ascii?Q?Hd6+CPJ6JOriaagRsR82qSTCwh3ooOfGp6zz5nRGOBXVvn+Ggal/TMt641ax?=
 =?us-ascii?Q?6QHbrOoefxD32z8H7m2l+mfN6nye1TNgB8BTy4OaNXwJ89N0nvcl9CdPjspj?=
 =?us-ascii?Q?b/the7pgMLLP6suAis1cacHrFpr3z4CaQCl7cxY3G5Tq/IYwz/BK2i9/MZXC?=
 =?us-ascii?Q?KqNJofHDkMaYfgn3tExqWGjS+qbR1HDjOwV5V1PhND+rIFo8N4mT3FZiLocb?=
 =?us-ascii?Q?U/W4vMvkOH4yot95hJSOQhjkEq9rBiz+DXXgOvSkE3ik39N4sgSr0xIagdLV?=
 =?us-ascii?Q?x97ilQvo/vbn+LnyRVdKtZEvzjcgGXpIVzMn730JI1jMPIPDMppJKLCv6Lz6?=
 =?us-ascii?Q?3AUYtFrvnV99vbmzcVqjmjZw21fLbf5ZvBo33V9Bs3euoQWiQIboYGcox/47?=
 =?us-ascii?Q?MYz8YOOiX0GbWfpXJaoLjPG6flUeObeh+mcrjF1l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4409685-e424-47f3-1bc8-08dd3fed2e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 22:43:27.5069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dxay42AoYUHjxM8FpfMUpds+CnstCS83TCWcKzczgtMU5DoDGS+dRfupdM8OILAsAuN5pJvz7b9DH8lZu8+b2OhMlvCr4SRHO2rbqE+nR7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
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
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Tuesday, January 28, 2025 2:33 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH] Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
>=20
> This reverts commit 50554bf3e56dd0c78ef1eedb685d0ab36c9c9987.
>=20
> DCC in LNL should be disabled. It was a mistake to decide
> to go against GuC platform defaults in this case and this
> could lead to regressions in some TDP limited scenarios
> instead of helping.
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 44b5211066ef..43f9617baba2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -993,27 +993,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>  	return ret;
>  }
> =20
> -static int slpc_enable_dcc(struct xe_guc_pc *pc)
> -{
> -	int ret;
> -
> -	ret =3D pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
> -	if (ret)
> -		return ret;
> -
> -	return pc_action_set_param(pc, SLPC_PARAM_TASK_DISABLE_DCC, 0);
> -}
> -
> -static int slpc_set_policies(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe =3D pc_to_xe(pc);
> -
> -	if (xe->info.platform =3D=3D XE_LUNARLAKE)
> -		return slpc_enable_dcc(pc);
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1058,10 +1037,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  	}
> =20
> -	ret =3D slpc_set_policies(pc);
> -	if (ret)
> -		goto out;
> -
>  	ret =3D pc_init_freqs(pc);
>  	if (ret)
>  		goto out;
> --=20
> 2.48.1
>=20
>=20
