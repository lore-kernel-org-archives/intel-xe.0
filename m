Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0330E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 16:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778B210E33C;
	Thu, 19 Dec 2024 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngeHjhkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE4010E33C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734624183; x=1766160183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6NvCgO4JhmnVuHo9wkLl3m/iHvSyOC1cjJWQ/wuvkSI=;
 b=ngeHjhkbEyW9iu8eBVJnT896Ae/Xjdo3+RQ1HhglNbavCgQUmoDOrhRz
 JqZkyrb2VQRmTSOO8+aohRqvuZbNP1llX3PSOlS0KYJnVnwp3XU0fTWFL
 L6+yKGyPM9htSPRX5wT72Gi3xtwQREAxRxIkaczbBOamy8sXnfTh+6Jzy
 uMNYYYYNE30NKIBtTmJ4WHp+o7ZDJcJ9L6LCawkRmoCHWhcsvVwREXcGr
 xoeE5WbH7H8ghKesiFPYKfQPOQtGRWRpu6BqN3oqe3/qbiO8AdYOTxTpp
 xJ7vMmNSf/O4+u5etJjA827si1Wu4GYowjU7AT2Ba9WDIVmGJWP+sxEt5 A==;
X-CSE-ConnectionGUID: FkK2aVJGSTKo4BCFEIEgHA==
X-CSE-MsgGUID: +RY662Z0R2qGlpa/rw/ROA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38921011"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38921011"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 08:02:58 -0800
X-CSE-ConnectionGUID: EAPb8EsASYqpQjHFUSjj2g==
X-CSE-MsgGUID: oKHkCtq3TFiPohngyT6yPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="103216385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 08:02:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 08:02:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 08:02:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 08:02:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vibS8xlolx1kvSh4rTTwjwgabqO5Rb7KeEy0ku2BEBZiUAHWQqbDT0MzVkLPwVoIfnMgjIA1vVVWljgmkzgcGqVIPGdg0DANolKHTxnJoqI9ckvaYZhYbtd2JRxx+Mz6lo586+r8L+Ge6NRT+sPrwigVWEDCVX73+iZ3uzu+nfVPVRGfcfLcKksTqY3tx2bTZJ847kFrDPXLtEez3VI9G00wqdsbOJXxlF6FMCSdb60hmGvA/Wsbo3UHKlPlioTXeCFHT3d8n4tQ0UKUljj+lN9dcdJEIhc05lzzl8GoZRyEW9qkpJiR707ZaKKFqyThI9HzJ+hdhrD/BkYZymO/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q8anJMe5WoeGNsHt4mML123KtFTO+FEzRLe++ln7WA=;
 b=MyW4vELgd12fyB+u1IvvVo9F25cXN80mgFXncX+fuGicT3YbmG+KvXlamnf0gsZvPC9jwVdQ7Wa06ypT2rCKp30rZEEpGECMt32A3BRKdmas9UjacrvKCecS+iLgld8myAgI0M54V/NQxsdxICGUW5x8Bm0XX+DArKfUnroH+XQVDdBp+czEYlxYCPAtvXd4zrTmRJNubqJ/5hsKEOp+qNOmAYlSVqGmmSpOaj78xuD1vfJPBd1DXkBHc+/TBDkZ2L49vX/1kZPJYV2Jr88yq5Cfb9hCEq2Hsg++mjhKyBSIhu14s8FiH5orfZnzIuif3qvdoEYdAN4hQf78K+U08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 16:01:57 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 16:01:57 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
Thread-Topic: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
Thread-Index: AQHbUeA41bExECBmSEyZgWC0HfOR27Ltq9uQ
Date: Thu, 19 Dec 2024 16:01:57 +0000
Message-ID: <CH0PR11MB54444C11555ABE33E9EC8D48E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8207:EE_
x-ms-office365-filtering-correlation-id: 292f557b-3d9b-4cf7-5000-08dd20467737
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xI57JUXwJHDpWgLiDFVV7mGK7mE2XYcGnnlpBvQoeMPzen19zXlzKGwyHQej?=
 =?us-ascii?Q?oKkyRGEzYOHI0qzkwYsyXjthqOeUT6Dd5bjGU79sTBFbexQRhPhZpAcz/Zm/?=
 =?us-ascii?Q?JPktbAYQ9WBZ6uOys6D1U/vL5+jh3uIqI66tyMcN1oxDF0aoFd/H9fXH69w0?=
 =?us-ascii?Q?EnCMaVEJJ1GPLXhswztOYxrl6yYLDX19+saxhW0593FApp6u0NCh+J2uTwdO?=
 =?us-ascii?Q?j5gYFAkvRFYob8YMVYnehbVxm66uEhRqIcW01VR+1TVleRFlbgnVGrnpI9zI?=
 =?us-ascii?Q?xHJtzLyVqKh//d4+pt6DNcuPgb1WUQUiCDH6UnCPOxWDA9yjHcNt9iPy32zM?=
 =?us-ascii?Q?rJnr45xl1haljTVdTZ3Yy4ZIymRzTtqXIJtN7PA0Qj1Db6H8M2omxoJFrnZh?=
 =?us-ascii?Q?ziA2HOjyGf3vY04ORA+ULv3tKyb+BJZtWxfzQoH0z24EnUMugjHKvD0nX4AI?=
 =?us-ascii?Q?Yx3/mrfdJDPM1S5i8aCv1qT+9dwDj1Pq/lSZVS+UvzQeGn+vNS1Qwv2HMTlo?=
 =?us-ascii?Q?xDRD01U52QKOSr2DiP2zCB01sXp4InbYesTHPMJNlM8X6V0zdkMyVZYKzP74?=
 =?us-ascii?Q?jxQ89KrUjtkdgU22EBqi6rSym/ybz84Ut98HEPOAlvPo7E1ylln9lZbifpON?=
 =?us-ascii?Q?FH87cDOtrPZNuRFe0gZ5nYaocAEvL6NUIyIqMn9VWMkmeYsb3U1bbLTupjHx?=
 =?us-ascii?Q?vzOXcekGWO6xSYQRTV71ZKKxdGbaLCz28dZM/1gqRNsUdbe+YY3/IisGP2aE?=
 =?us-ascii?Q?Yd3w31KkUJeRPiEOCFGcLjXp6uCzCpkox8Y25NOY4qlwfSzU4SM24J6LJzTI?=
 =?us-ascii?Q?LEqmlZQ1v0rBeJzqmIM7iH0S77f969FiYj3gN9jDV/4bZb1K2vMKycoIbl9W?=
 =?us-ascii?Q?k/5OAIdAYxeiQWbbxgt/USBC+7yv484zj9EOoDOD1ftE+7IgR5UXJjp3uByL?=
 =?us-ascii?Q?OV6+VVa1N7Cg1YNPGi9UgT8jxTNwQDbY3sJEf6yjLJpvTcAG2gNVwEzJbpkd?=
 =?us-ascii?Q?zLhsOPMDfcMPQEYP3azMv3oK1SySOCA+Zdyc/i22X+dInAiIUBKsVLcNBkl7?=
 =?us-ascii?Q?COGTlCuliZUdfLGSZBLadEkfxH+j/hOZjEp0fHn2mNiIY/Sl0vFRcm1+h/vz?=
 =?us-ascii?Q?EnnPIj3kQ/q9DbibZ7np2Py2aVuBDk8Ttfwa7Fd1vBqPX7GiyobOXcFVwU+P?=
 =?us-ascii?Q?LnR3RQjFXAC0D1tmZylozzPI6oETVgqJoNyx0lZwuQXiVpcxEKKDz75Je3bf?=
 =?us-ascii?Q?s+dWdVtXF9aqNcha7aGVv1ehKpX51k6bmRja1tsqTbzlEgO613OoJE7JB15L?=
 =?us-ascii?Q?6jAElZWOuSd5uVsZIcz9Xoll/a4nw19NgiPcUyoqhvnLdJNlNA8VEiy8jMjO?=
 =?us-ascii?Q?ECGF995HO4iSjvMX46/T0pYokt6e?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NeTMtXRyOF0oNO42Kzc5VqIA689XJ72SQnd0nH1722QtW3wku6BIVL31z7vy?=
 =?us-ascii?Q?4PdkXuS2UiXqgoNBKyHv84+N8BUifyb0UBUfzJCHM9kBo7f+cEVnwEuztYlR?=
 =?us-ascii?Q?fjBhApqFdaKCLFeoiHf1Sw1csewtkJACbiVc8th9gsKT9eAiom+EYx18hKFa?=
 =?us-ascii?Q?qH93gL8lQhkSYV4GI6NYowenVn1r4zB5BAcw3qNhHJ5LlNdO3h/SMW6LjJNn?=
 =?us-ascii?Q?S4lxBfOKf9y2Og50MRq/yRCagpulEG0FwIPgw0126fHm5ElMzquEGlmTX3gh?=
 =?us-ascii?Q?XtAaQ/Ow/TXBwtMKUcPDKj1X2Cr59HwuFAcDfq8y7HVWps+JInR/MICSQFwe?=
 =?us-ascii?Q?7DaqZGf1M5+usAapgrVV05U6UQ83g38yKtWlAripga5pIO8hUKbTjBE9wxPj?=
 =?us-ascii?Q?Iiq4/HRPTiX4VwELGWbxaetlZkdfPXhvBt2xcyF4lbSIZqeHc0nNwsHkJLt6?=
 =?us-ascii?Q?xQmL+ielZbXTQBZcU66x4x1QeV+R+Ke4m/e4+/cbQ+eTUyhkemN8rgZyWHZH?=
 =?us-ascii?Q?0kmiFwEX5HwSDJF7aO6QkHNY0CFRhJ8jO6WKK1SE3Z4MW1CxCQs3GqEf5e+S?=
 =?us-ascii?Q?VnbhvFP/MYMl7U/lsqCtTxAg86ekQOJSQSXt3xCw1y8dKozu0H3t/iBtCYcn?=
 =?us-ascii?Q?Ovyr6IHyiXUnVmI5xrzXjPt1ATUMAB5aBoMBZBt6gZtNmJpndKKePuuQagxN?=
 =?us-ascii?Q?jzTgTPMgvWVdb+TLFSybQgmW5n7y6rvONJc3s8xTtpoSMBrdLuVs8oLEARWx?=
 =?us-ascii?Q?zaKpvfBBA2ociUoGkThcjKn+08vv6dwl8zzpBRAMm7EdzOj3520M68072b6+?=
 =?us-ascii?Q?tIbFOS6PazjFfWXgObCjd4Vf3KESI7z5nxZyxkOvln973TrDL/zj/JXPdlRl?=
 =?us-ascii?Q?1fM/ARdy0I6BL4xb6wLibflxaINT+odTOAfMQJlS9svqxJAVmsP7ImG9DBl1?=
 =?us-ascii?Q?J0gHs7eGkx4aADthj+AfrzqY7iOqlo3SCxAnYyeV9mJcqSmQIuHcI7sWxNXC?=
 =?us-ascii?Q?8bmX3/utNpc6nxRHwvfUWkh+Y0OgR78Em6M4gK0H+Wz7S8Gim9pCmjdiSl31?=
 =?us-ascii?Q?PKnxCj2SJtoxe81MaWlG87cpUkrk3g+8Iti0zOkwhPjMRBbZh7DAlJ4HEKAT?=
 =?us-ascii?Q?qAYhK/cb+fXWOoYRcVqo9b2aPhGFlN8EFWJtAYUZFNr8gbrXQ904Ox4b5RJM?=
 =?us-ascii?Q?jL3dHthvxs2lCe45cdXiRM5cOb8pbL19+Rx8cG1xHh+5kDF3OHPIDq9+yyAa?=
 =?us-ascii?Q?YtAsRpxBoAmVCLIvjdFAANLzG2TWhNT0dKyMpdDhWsldUYXpWCkkpprZjTgf?=
 =?us-ascii?Q?GhjE/zrfgGWKT6A0W7pAQgafwS6MMw49feEqlvElzEgoPniR56T31UaA+KvL?=
 =?us-ascii?Q?K068ro6ZwZrjEzdHneDgrZKc7Hmi4bP5kUfDcdQc3hhBiITrz4L02WwZIZYX?=
 =?us-ascii?Q?LPykV/yVmZ9r9RbCH1qz9iVn3R8l2fGhjzWmI3YpNL0UgiqghExcYxmgdA3l?=
 =?us-ascii?Q?h/LtqwT9irSRDz+F23tebrwu2lAaACrh6oZ4PNDhrxNP81DXhj93mP/GG1+D?=
 =?us-ascii?Q?gRQj4Z+u/Bt3ieW/aYAJ5hduRlj2z8aY2/bgDhw72s3dlEAQDEB5/ymxihqR?=
 =?us-ascii?Q?qA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f557b-3d9b-4cf7-5000-08dd20467737
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 16:01:57.5922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV9hDQoAz0/6zUHBG6UXeCfc+4FOveLAMQ6j0chlgF2orNrghvp6os0YHb9KKW8/Wzbwhvioj5nhXD5BjXPFVhxDuVqbCSOeWsfUqfVRZWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

It might be a bit difficult to get approval for this series if there isn't =
an associated IGT
test ready to exercise the added error injection.  Namely, I think the func=
tions
xe_guc_mmio_send_recv and xe_guc_ct_send_recv need to be added to the array
probe_fail_functions in xe_fault_injection.c in IGT before this can land.

Once the tests for IGT are submitted for review, you'll want to use Test-wi=
th to
exercise the new IGT functionality: https://intel-gfx-ci.01.org/test-with.h=
tml

This isn't a NACK, by the way.  I just figured I should give a heads up.
-Jonathan Cavitt

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Satyan=
arayana K V P
Sent: Wednesday, December 18, 2024 10:50 PM
To: intel-xe@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv=
.
>=20
> Introduce fault injection for guc CTB & mmio send/recv
>=20
> Enable below Kconfig options.
> CONFIG_KUNIT=3Dm
> CONFIG_KUNIT_DEBUGFS=3Dy
> CONFIG_FAIL_FUNCTION=3Dy
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
>=20
> Fault can be injected with below steps.
> FAILTYPE=3Dfail_function
> FAILFUNC=3Dxe_guc_ct_send_recv
>=20
> echo > /sys/kernel/debug/$FAILTYPE/inject
> echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
>=20
> echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> echo -1 > /sys/kernel/debug/$FAILTYPE/times
> echo 0 > /sys/kernel/debug/$FAILTYPE/space
> echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
>=20
>=20
> Satyanarayana K V P (2):
>   drm/xe: Introduce fault injection for guc mmio send/recv.
>   drm/xe: Introduce fault injection for guc CTB send/recv
>=20
>  drivers/gpu/drm/xe/xe_guc.c    | 1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> --=20
> 2.35.3
>=20
>=20
