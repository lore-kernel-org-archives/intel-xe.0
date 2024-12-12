Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF97E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 22:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887C10EEB5;
	Thu, 12 Dec 2024 22:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+tqTMjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC8C10EE9F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734043618; x=1765579618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y5xPot7O0CrNBF05kk6jSmUO2+B9+cs0bRiCF/ElW4I=;
 b=R+tqTMjZWVi3AZINCfskgQTCenuk0bcMuHMxpylChdYOFKCcnV82lG17
 bLHsJY6vrKZUQIRA6sEKw8WvRmBeauISOi+SP24Sttk0N1aTBJiFNss5D
 JalFVNfOgwrX+22BvuHpHrgwfwkLkwiuj6u55OI7VG940MmbJAPSiBTqq
 CkOym8dFaJHagTliwCd7zKB+Ww1kzfrn3tVAGbUQxuMa9oFj6KIETNpMa
 FdLPXwN3s20vV/y0h1YGvTCb3IRQPvrYfITPpTmMNLwa7L4IziXhBHh6l
 jSHO0uSQMn5w8uFydoqyZbP7fWtGfyAQiGlQs1wvUzjj9Wc9n6gP/YdPG g==;
X-CSE-ConnectionGUID: bCZrl+YuRCCsKneSXRWQVg==
X-CSE-MsgGUID: yCaX3b6VRYek7317WAGZ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22074648"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="22074648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 14:46:58 -0800
X-CSE-ConnectionGUID: BymkiPh6R8CLI6DnDWT8BA==
X-CSE-MsgGUID: +WgyT18qSX+YHw9C9gkwTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101214176"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 14:46:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 14:46:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 14:46:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 14:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVr8zcsIsgfZnWYe5Yd/U7SE1z5PSDSCA3r7Vbh5NWzWHd2DTJzHfNwgFO2bjth9fBnSniuCnVhh0ttyMEHdkiRVOvzyzkB2xbudoDi1sOe4DgJm8+9U+ZDCLEhwlCVVseoAZqzds/T0QLfTRuCMe3chRWV8t09T1YS5dBrzZrYNYCnkmzwzGbt91LMucM6SW3l/lkxeP8LNArk3FuqAOpaPB98wX3HAyGRJsl+acaBNNQRmVqvYQl45HjzppmsTTweSNmrR/T0pXV9srErTw4J/6NRF1kCSq+VWwJIxDMBaomyTppJreQLsrwZHIuSBCGQ3TaJAjA3yjrkle1oMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPwHMjj2kLAuKjZNW1PcKZ+6xn+pkQyK0DRkgd/GaEg=;
 b=IVCUfhfUF9poRiQ+QUmYAQ99Utwy7sAKjzuVyExtjDVYkrk/kEvGy68CJ1NqJnVxBHrrFz1yIBGOfvXkjUNMMGfo4LVYWDWlrgbT5d77EcBsty/6kv/79/mmcXpa9TT0f4TiOI7hwN9n6iQgMyrBrVu6XoImh7knGWIdQ1uddWYE0RwjfKCEWDVDpjmye6XJoPxMDTFNQlBO9Hx+OOGTPHdV79TENOTzNwLcYmwK86y9EVFEsS/aTXwXGf3hTj4Wov9A3U3eLPbfnY8EojbPds9Fc+/xuozujxt4m+AEMN240Mg68oG3Ds0Tp5Ff6kBiLauReOh1IMqVydYjPP+Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 22:46:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 22:46:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Narvaez, Jesus" <jesus.narvaez@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Narvaez, Jesus" <jesus.narvaez@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Adding steering info support for GuC register
 lists
Thread-Topic: [PATCH] drm/xe/guc: Adding steering info support for GuC
 register lists
Thread-Index: AQHbTMhaTFxSJQk+ZkuWTO6Tvh3PCLLjM3Dw
Date: Thu, 12 Dec 2024 22:46:50 +0000
Message-ID: <CH0PR11MB54441552D1CB9EA3A187F294E53F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241212190100.3768068-1-jesus.narvaez@intel.com>
In-Reply-To: <20241212190100.3768068-1-jesus.narvaez@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7688:EE_
x-ms-office365-filtering-correlation-id: d9a5e9ce-9a8b-4f62-bb37-08dd1afeddc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CaCuPNqRFHHyUWo87KFsVZw+fEF3Oo8bhb07mBXSrf8Jk54rjxQelu1tkbUX?=
 =?us-ascii?Q?7pNeOBW3NcRXgBMzDKQfMXzySZZRs3P7CBMuBnrXCkC6745lOkozrKi4oQV0?=
 =?us-ascii?Q?csV3OBE/WwiOzJABC5dLZWfCYn5SO1+bA6fl8nQWkG9J11ZTMb/fdK8INIHA?=
 =?us-ascii?Q?hBng31x11flgCfruqrSHGHXQCIr+xsl95QQpn4xjDo89OsMZNqQdKRzdnFXV?=
 =?us-ascii?Q?ti3smXCnvxLPnnRn3Wh4uC7MbU9MQ68dwi8IBDU45jDL4hDLCvKa4TSycdXb?=
 =?us-ascii?Q?jzx5zeA4U3CcTwuNQGWht9T2SfeUNzin69cDyu9CiUD+pNvTMZcRyF3Ay+By?=
 =?us-ascii?Q?k8RsGhJhaIf1Ag+WBROR+xTbfg5G3MS5CA+faRfQcvDz4MszSC9dhKTT9kzr?=
 =?us-ascii?Q?zVCAMG8/vRDM991fP4qgwqrjYXwf5qADgCROyX0j8bjnKRsitigBgbrb8Nwp?=
 =?us-ascii?Q?wmxj+CVSTXp/5TPWtWQIrgWwlB1pjwEOBbF1a/7UDgnopAGx7sANGrprZTbz?=
 =?us-ascii?Q?9exkOGo/P59J9T4PNSadv0BnMxYvGecRBXpUfQZKN3+4/K7T4FMMnPr9/G41?=
 =?us-ascii?Q?ykOnwAsAsU+Tpx/M2o1nfmcKYawGExc83vyzz755RfS68k8NLoWH3DSnmuD8?=
 =?us-ascii?Q?35pms1VQA1ndz7TB+loMBb8hpOc3BiTLnehQHUzbn9SzB602lAKDlbUngJii?=
 =?us-ascii?Q?AhsLzv1aVtKkYxSOjOFWwfabSy7ffx9122/EW3i4VKEuxh/2hICYYFVkcILN?=
 =?us-ascii?Q?lIY30g+cmHZm0f81vKImTPewjmRVLFrC/a1YL4yZRpKJbc0XX02pA4oQFW0p?=
 =?us-ascii?Q?KAlJjdW1jIU7ntM2h4m0gosEiMkP0FTgBAEmjme1wC58AAvU0y9/JvwR3Q2j?=
 =?us-ascii?Q?ShR2gMwCKc9blHq2oIfmYmFzzW8h33BEb5FF2YaXrjL+K/Gz5ly6R3wcAIw8?=
 =?us-ascii?Q?O3Sf2dqBqp0zRfSSt92S63M8Od0F/vvhERReiCPDJ2kYONy1h8fO0+CmcUOc?=
 =?us-ascii?Q?pNDvF9lbv+NN83J7tZLbT6+724IPhf6TpwYSa/zrSng2tSwbeYsDuCslzMF6?=
 =?us-ascii?Q?U3o92Nq2VE1TPnn2hdyZ8DXzymt75Mjw/cTunVB3GnltfiuddHCdyx7F7jm6?=
 =?us-ascii?Q?IbG6lmGY9IxDZlsZ4ZRRM0GvbEk2c7FpNtaMshhn1euTR2nv4z5+U+Vq98kT?=
 =?us-ascii?Q?mhQkczdZNGhYN9RldeWNeoYJqtaXQdtNcDQQuimpW6gaBmTrYcx2krq+l2kr?=
 =?us-ascii?Q?yek8ojc+e0ZqVPgofRSZLkFsbiHoBfCu+FjICYaGBKvG0ZJKYbbtuQqQJ59g?=
 =?us-ascii?Q?ncnVUn/1bt7MP0cHxvgTWUKrWiKQTrwx4d92cyu5gDj7mE2Bvy5dOYMkqflu?=
 =?us-ascii?Q?HjxwuIPZEhDqTsuwMPEhtlzEVTEWq/EjoVtE+TLWq5D7p6cvJg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gRjiofuAqaedAu/yJKiEZA0AM4s8KzjR9V3GApbs0IE4BydcA8+btJVFdZKm?=
 =?us-ascii?Q?/hMSULxyih/uNPc8CoLLHKcSXj6HlqzNjXSdJaYJWRTBltl9zYDj7W+zaihl?=
 =?us-ascii?Q?Mu1KR8DgCwkPPqXijkfLOrdOPH6RHhUjGDGBffKh8JOJ1ET9swLiWht6Nj0k?=
 =?us-ascii?Q?ph/E6+10XDydu3BKZUXGgCCHRh051MGUaIylrCyyE9dGETEuGGOeQd9PmVKX?=
 =?us-ascii?Q?ssSeuz8m89wawQ2wJ7XAt6iBJJgox5clZdFvpJ3ZY24EtGBlKpYVl4rpUsLW?=
 =?us-ascii?Q?a1rDayVxGn2l4Ah2bW8zVDqi2LD/nMGBNZREtrjDcAf6kzm+wtI8FWc4Yw7p?=
 =?us-ascii?Q?qt5+Fp7QaqHxITU+tkOwBEoO8A7u/NEa68QPM7NtCGE7rxpZWSFBDQTx1xnv?=
 =?us-ascii?Q?E+305msPPXyrBJpcBo/S7N7285KrDvJmeZfRPvjOsLPLIfMeKGPuonmbM3TK?=
 =?us-ascii?Q?yhAoRmI8G9akHMOr10Jtg8txCVuCKD/fUAcPrSHSc1rOMVwJqdSF3srZivOk?=
 =?us-ascii?Q?HmL5OdSy01tIquVmdmue2nc1GfJ+FLI8aZ6hVFR8ni8ce7+8jlEgUo24eeRv?=
 =?us-ascii?Q?XcR+Wp08t+Y4/Gza7WFQsDDU70KZUhdjv6UjgjIgHodZHxh7mtUhlAwgPtxZ?=
 =?us-ascii?Q?eYVsrhTQ9qBi89d37mk/hg4Axf0jDdOfIKCNpk3LheZsTsxPuH0gkn3Z9Rg7?=
 =?us-ascii?Q?kCNCGwQCUGSESoVaPu38f0vSFFUu+SQxcxL1V+BmwVH8MVMnPIkMvV25uBuj?=
 =?us-ascii?Q?2ESDZ7Aobv9mNB4rzgFclRRlRmipSNZaT0FfYbYWe+1NhCWRdbk7xo0JnsdL?=
 =?us-ascii?Q?PcEG98czVsrJ3BvZnLpewojJ1MtcWmeW4/OB0ptyvDizQFdOO1VHDhnNQr85?=
 =?us-ascii?Q?mmLwu+2BRVUPEVPkebQXna9pnh31aumN9vuFcs2zb91pcxR6bFnCdpzo6wyB?=
 =?us-ascii?Q?DIOnfYeoe27M2CF/239Z//fB9iE5iBpYsYujoVm+Jo3XjbKY4Z8sjcPDPX/i?=
 =?us-ascii?Q?NzomUIysSj/QAVXnKKvUVWgjaikopY5moXdCvQfmMRAe40j20IoXe9aLHZWD?=
 =?us-ascii?Q?lZDQmgbQgzk0o/SuqgfVKZsILTPjX4XKdm0ZU33y+Nox9NJEp9uXx3qnDhIY?=
 =?us-ascii?Q?YWomUHBEYUbJlEeMFIAEPoicOf2krSUDNZyigOm5X4uvrJHHLPBecYs3dqeP?=
 =?us-ascii?Q?0CIiw/L56uiOAT6PCGe9+KsTjiwmubo77skPfyYyMHKt21mqDHjP1OCU3lyF?=
 =?us-ascii?Q?/BHBlRkL5UVbh8D4YMD0ElUL9Pvppo9yNGlk2E0y1uQEA547EM4FTd67+qc+?=
 =?us-ascii?Q?qXEDk/OqKBnXDkck9N0ezExFVSoC4qYIA4LvQ1G2OlzvfZXl5xM3FsGo09+1?=
 =?us-ascii?Q?mAjy6/G6Mq8XlKCRi3XNYHng2aizJSPfR7y53dwLJORcFyCoUNkgs0bU5hXE?=
 =?us-ascii?Q?0HF/+KwUfvj3g/fZuR2vgfUdVubOZ5OCro0lxRYEpZ8tZtlAeK3W98ei0tkD?=
 =?us-ascii?Q?5WdFQpkMVill+QGpWhwt3rBbKJ2XbRy2MJXYEpwoAV9bQVSCCh+HwkGZnghk?=
 =?us-ascii?Q?FRj7J7nP+ht3I0II/JIQhXUeouhO+DXgjvoyeKeI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a5e9ce-9a8b-4f62-bb37-08dd1afeddc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 22:46:50.0714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kh5bP9QwUSUaqi/jptU+sZNIhjJeLUCWbfuus/zMYO5v9/w/MS1DzzFJg9dfUAL6jI+SXjBf/e4/h1N5+Dn5HGulX3HbxJypYI/dB59SMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jesus =
Narvaez
Sent: Thursday, December 12, 2024 11:01 AM
To: intel-xe@lists.freedesktop.org
Cc: Narvaez, Jesus <jesus.narvaez@intel.com>; Roper, Matthew D <matthew.d.r=
oper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Ceraolo Spuri=
o, Daniele <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Adding steering info support for GuC register =
lists
>=20
> The guc_mmio_reg interface supports steering, but it is currently not
> implemented. This will allow the GuC to control steering of MMIO
> registers after save-restore and avoid reading from fused off MCR
> register instances.
>=20
> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c  |  6 +++---
>  drivers/gpu/drm/xe/xe_gt_mcr.h  |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_ads.c | 15 +++++++++++++++
>  3 files changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mc=
r.c
> index 5013d674e17d..d929a78c26a9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -550,9 +550,9 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt=
)
>   * Returns true if the caller should steer to the @group/@instance value=
s
>   * returned.  Returns false if the caller need not perform any steering
>   */
> -static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> -						 struct xe_reg_mcr reg_mcr,
> -						 u8 *group, u8 *instance)
> +bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> +					  struct xe_reg_mcr reg_mcr,
> +					  u8 *group, u8 *instance)
>  {
>  	const struct xe_reg reg =3D to_xe_reg(reg_mcr);
>  	const struct xe_mmio_range *implicit_ranges;
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mc=
r.h
> index c0cd36021c24..bc06520befab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -26,6 +26,10 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct =
xe_reg_mcr mcr_reg,
>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_r=
eg,
>  			       u32 value);
> =20
> +bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> +					  struct xe_reg_mcr reg_mcr,
> +					  u8 *group, u8 *instance);
> +
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 =
*group, u16 *instance);
>  u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 i=
nstance);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index 943146e5b460..fab259adc380 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -29,6 +29,7 @@
>  #include "xe_platform_types.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> +#include "xe_gt_mcr.h"
> =20
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
> @@ -696,6 +697,20 @@ static void guc_mmio_regset_write_one(struct xe_guc_=
ads *ads,
>  		.flags =3D reg.masked ? GUC_REGSET_MASKED : 0,
>  	};
> =20
> +	if (reg.mcr) {
> +		struct xe_reg_mcr mcr_reg =3D XE_REG_MCR(reg.addr);
> +		u8 group, instance;
> +
> +		bool steer =3D xe_gt_mcr_get_nonterminated_steering(ads_to_gt(ads), mc=
r_reg,
> +								  &group, &instance);
> +
> +		if (steer) {
> +			entry.flags |=3D FIELD_PREP(GUC_REGSET_STEERING_GROUP, group);
> +			entry.flags |=3D FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, instance);
> +			entry.flags |=3D GUC_REGSET_STEERING_NEEDED;
> +		}
> +	}
> +
>  	xe_map_memcpy_to(ads_to_xe(ads), regset_map, n_entry * sizeof(entry),
>  			 &entry, sizeof(entry));
>  }
> --=20
> 2.34.1
>=20
>=20
