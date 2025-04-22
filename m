Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26889C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 05:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50D10E0D6;
	Tue, 22 Apr 2025 05:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dX1HNH7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9FB10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 05:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745300479; x=1776836479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=An3v/s5N9CcPypz3D/TuglzmHdD/4Z0C4x0I1U0akmY=;
 b=dX1HNH7JDvyuYwBMlNYQIyImLSApp/EYCHlSLjk8EitaKSoU2WeacaZP
 k6hbzBgqAxHqXijss2GbjtRpX2P3vxzmOWZRNCKpXhom7OFkP47OJ+4bA
 0xIryps6TCOoQSLXLmay+3XQ62C/yDUrS4KF4ac7qbgX4QlQ7hOBcmtxj
 ueUHP8kFC1o91Z4cp6zc5yAv0Jb85Kq6bN1pEikwiBROVrqaLSmPFO0Oa
 kfI3IlY0Enj5oO/Ru4y75oH5LnPDb5jIhby84weBGJTnMBX7jqEZ09Ju6
 7aIXZzaoFnT4nyBJ99EyoV2B8I0rYXwd2IwTILpklEWOudOLLpq3ElpMe w==;
X-CSE-ConnectionGUID: RhaKV0aIQ3CSKUob3lFTNQ==
X-CSE-MsgGUID: Ry8b8CTfTQ6210kuV9CaIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57491541"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57491541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:41:16 -0700
X-CSE-ConnectionGUID: f6bySzbqT9ypJ5qLD11FaA==
X-CSE-MsgGUID: NXS2FHTUTZ2shQSbJP4prQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="136891669"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:41:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:41:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:41:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db62F/nPoA/y+dCpjrGrefqbdvGBlgIvEdQF2d7KU0XDua4L7u335gN9zE1laUI9B5CiO/2Lwd55Lvyn2+pgB8jW64VP/aOxqI3/tmkK8wjxT1QZXepb0CxW7DWPUmoNfk79ygrE+4CM8GWAX8q/WM3MhwoRCy6DKeYc/zfPl4R1B6lQK6qHlo1YlLSAkgKXYTg/R47hPFoKyJc515pzzkgxB62dSYdzc0QzAmnu46qCztA2kwVoSGxWPMErJF6PGSI0apck6GzH7CDL+rjJUPAWXJb8uUY33O/eBV+jjR/G+Gry/o1CLSiE+Vw6bAkOwJx8es8ol4q6Nsaw1iaIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXLuku8e0SzcfMeJrhWAZr0a1tmlwZX2RJoT6EXFywM=;
 b=xe8IIIU/lGIpMmXAyjPYoIfUYbrhWPkoRypZFwasmlswIycAusNkTB/aQ0rtLIBxZU9JmARVGKfOzCaIUNRsxoyD9Wn53O4Ab4D5xLBB4uiJSc/lwraxYHeSabhlmn9FMxdXZsJfaN+w7+VVg9Tajj7uIs57W8kamY6No+KqyQ2ZxPaZVQGhALS1YenGJxdPHeAAUq4sRKhoEI4FxNUwCk8c8RMeEEljo+zUUKQGiS30J8cFzK9U8VgRhXGE+ptUNkneZu057vrGHR6Z2tYDO+TYX+VO5gERsvSGlcQ20ljfdbvD125zHCitufoaSW9Svc+Q8GbKW3rwR14QID1HRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 05:40:30 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:40:30 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Hirschfeld, Dafna" <dafna.hirschfeld@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hirschfeld, Dafna" <dafna.hirschfeld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: xe_svm_range_alloc should return NULL upon error
Thread-Topic: [PATCH] drm/xe: xe_svm_range_alloc should return NULL upon error
Thread-Index: AQHbs0RnLxvwoNPD1U2AESMevg/PFLOvKZcw
Date: Tue, 22 Apr 2025 05:40:30 +0000
Message-ID: <SJ1PR11MB6204A7D780D776DB8CE25FDF81BB2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: 981181d2-e834-4ba9-7ab9-08dd8160316d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0PDTEkk/hbSSUyIENhzn962DQCdtex4cUGtZA3OtjNLCHY/fiY0Hd0bc/f0Y?=
 =?us-ascii?Q?ur0C56co0MNb5p2uZJt3lmBJsl9zTf4jOwYQyM/bpD/1WRRoUYH/xIDTrLvN?=
 =?us-ascii?Q?+k6a5pbhrotBbQnbvMMjLf+Pnu2MXXCpkCj2GuCyYqmNkVbH3taQMSBfRE5J?=
 =?us-ascii?Q?oEu2xB87MXZGFvoI4roSagJFvglPgTeOk6iCb2G67VQ3XLc6T5xpbQJ5gY/b?=
 =?us-ascii?Q?QgRLRGaFnCGblr/Y9ObMMaZaF1W8Gi7KeqE3pLoXK6WFRBRI/i4bhCBkkmrp?=
 =?us-ascii?Q?OCbCNwSdIfh5+GCRwa89JTQtdRMXMhDuzJVeaGwFp0gGdDRRxJVtBl42lKwv?=
 =?us-ascii?Q?2VnLqdUHvsMBwSDwGek9GGC5uO+frvoYibkcmvh/uKx3zmCPU3j7iKe7w3hW?=
 =?us-ascii?Q?fKLcqc5b+2jzcYJKLGoK/jQmdDjD6H0mMJv/afmwer2sR34WNIi96ENwvxA9?=
 =?us-ascii?Q?8ZBT9GlcfkPJdbBzYuGRyhuX9xXyVDB3GOrxhFALUe/n7GlxoE7s3Jzuf5nY?=
 =?us-ascii?Q?WmOa683TtIKXQN+Bs8mOq5aloyKNyfLkp2Ld/L458JOGhQxhINPLgZKS1z7w?=
 =?us-ascii?Q?zGo5NJirPJnfg+VrVBBC1UqhLsN1V3R0qbu40S/0OOzi5ny2NZiSXMK1agsC?=
 =?us-ascii?Q?JSH+6QfEE0f6dqoWj3GtipURLHDO1F6rzxH79LdVx/VDC3oGYGeGvcZXyjHx?=
 =?us-ascii?Q?3S5R8YhmnJFKFLh/Q7Vii0UaFo6Pmp67q4r4062PR+dp3/BdtgRiGvcCNEck?=
 =?us-ascii?Q?zEZL8KzwTpSAL2hn/ET3gcXZeATcCbb9AgUFVLAxpcraA5e7LjIIojtsk1DB?=
 =?us-ascii?Q?BqYHOkuuEYyjAWzxIRhlRhm4NrMBT0J05nuiqKInML0mZ1DxmoHlMqt8GHuB?=
 =?us-ascii?Q?DPxscMiAb5v0GyXM/h96JRbKVjB3HIjNcT4ViPGlkMt3thfFqfeSqDn1t3g8?=
 =?us-ascii?Q?rf+K6LKSyoNU34AIrSACZI8vUCawOwov+r9NiyPaQr3fQprhnY1zfwc6Zj3u?=
 =?us-ascii?Q?o5VWG575ZyEkzG9txJzHX44wIv02139sq3oTiFilkWNM1hqzNPP6aMZBGVyx?=
 =?us-ascii?Q?twUE9y9NfQkkYAbqt9zmD9crLUDrOLZPNc2dznXPrsX69AjhgG8j5hjgLQJ8?=
 =?us-ascii?Q?7jE9EujXP//iVilPRS6l8kjrT1d9hBkzSEJCaEmb4h5TO5NXJbJUENj7i+y/?=
 =?us-ascii?Q?vH80cjndBW75FNORPEkPPuHuYFCAXZQ9Y8PYr+ang1UwXikYa/IHynDI4c44?=
 =?us-ascii?Q?8RS2EGgx1/fBkbHTs06xEWGuBOriGmncCaRKMga3CBKn6sXbYsRqhz0TQZPU?=
 =?us-ascii?Q?amrb74ZXH6OY86IvVjIwEPMen5RqwCH+m81DYLEsjeUMbJgeppNLYVs3t/JU?=
 =?us-ascii?Q?IHwiHVd7X4/Ree+PlPuvDJEyPuJx4Mm64wuT3hp5Cj/KjuZ4b2qkQEd3lSkt?=
 =?us-ascii?Q?teEHYfl2dxFcGh/zi8EEpqFCvrsSwzRzSfsiyqdfxfIISGjgO2U0KLWHPpd/?=
 =?us-ascii?Q?XqrW8XN2VSVz1kA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FoJw6Zcc/90HzqIoJZeh3C0KGRmhkUWSoFY15mbEFMdeIP+E7dxMBhUUwGLh?=
 =?us-ascii?Q?AXAlQwxBvmvoJQ4wvC4YqF6+Bww3q69x17RJ7BwuTGibcU8c8aqjA6QT4ypi?=
 =?us-ascii?Q?p0t3uTWWAx7Az6kh/t+WKeCHs5ri+hMSiZLyaDAcTOPGT9N+P+9xZGZUS+UL?=
 =?us-ascii?Q?oSN/EZGJVcPD3qO+s8M8IYDZ9Tx1w6EopZfOp/NNVZms0rWmEdIO+UR4v6LV?=
 =?us-ascii?Q?srmp7i76GPJ68i1Yv1czJMwzjpPG8NzRuDTY9nLpl98TWuGradTFPGjvMW1z?=
 =?us-ascii?Q?mnIT2C4ma7y8iztZNDpMyxlAXbtkazTKAmn+AkNwtPuSluER3USBsCMAv1ha?=
 =?us-ascii?Q?5oygejCGdhWrGN2EaGAhZ1nv38HRIa4YOirPFtLlBAbUBulVYfGUJh9zm7AS?=
 =?us-ascii?Q?Q2QqeqWBsCTYnmSFgotsbQZEl9pyf9iFiKdPbL6B8i8bk1iO1YCRdjOLvnL+?=
 =?us-ascii?Q?Vq94aLiBOa8DOcjqRpo5U++coUNCfiNGSBMSlxbrU/espfLNnKQitldVK2bP?=
 =?us-ascii?Q?fd+NF0hVNUoh/cTHL2Nkb/KmYnDEwLWqzaXf1DeC2a38TzDlyCiiMqsO8yEx?=
 =?us-ascii?Q?ZAW3suwUqd93FwhPoLSSvZjdgfS/R8izD0nCjOyhyCKW2KRWjVFcIQqrNG7j?=
 =?us-ascii?Q?SteUv1LNp1rR4dEqOer6fT0P4qlMcvcnF6T+WHB13iYYoM8GCbZv2k4FHN0V?=
 =?us-ascii?Q?qkyB093B0U4iBrkPqHS0LvUd+N349LB85vfBNpTUYwm60KxOS7dIDM0nZB4t?=
 =?us-ascii?Q?o1APlzsMZ7YaGUcTV6xZoCsRcX6O1yP44qZbgk2hPhnHsCmt8TDk5RpvUPPa?=
 =?us-ascii?Q?jHRXambYC+u44yfGYVszK8AD74chwTELfxY5KQaSpJdsMsAvczru9xzWgpH0?=
 =?us-ascii?Q?GVx66UDQdb42Nb4ZUMEzFwu3aAoPO0ZlWlMQ3z0dJc+0pP5C24WZmslvTanB?=
 =?us-ascii?Q?QCzAljNNhCp84J+o73BTfhQ81n+jBxoWOdPBLXei+3gEf05TCzNAxoZ5DA1q?=
 =?us-ascii?Q?w5/0XSsg/kk6nSae/nkh+yH4xUOfaQqFPCfMaZjBllnRpVgTEPx6qIGf8xS0?=
 =?us-ascii?Q?APAtLWo/ifVxTNHc+dh4YMCgEO19xUT55AuPPdrBoR/15mJxv+cV1c3Vq9h6?=
 =?us-ascii?Q?b4ZebaY6+JFSzohetmt1L6n15FdwakBkQkhVxkDZAMheJXfxTLo33mCBnBQB?=
 =?us-ascii?Q?pNbVd+LYbx68OyJQIyrRDOqDT9MwTDQdGhqAuLV287XQt4Z2S1DAr6iFmsoJ?=
 =?us-ascii?Q?xTg1T6kX9A5viMkNyUZvS62f0oZXZNPPPDBqslFLR/XXIun9T/E9AvN+iFJt?=
 =?us-ascii?Q?ff62Vv4CRH/V8ylL3RI7vmgq+oivEyg2GO2shQpHc9mntCtsFeoX+GNL0cjl?=
 =?us-ascii?Q?xENqtmIMIdsR3I4zdp0cRI/FCx9Ww3nODzWv2qrAwZiqF6MOdkhGFtRlaaFs?=
 =?us-ascii?Q?lGkWkCoOcd+jwHhfF8Lo2/Q5I3RTxcxaIUApFjVY3om8mAcHsTkITsSuM3LM?=
 =?us-ascii?Q?LJZHITgBEVCIctSY/DcEFQ/HdScHvVLJzRahbxwLNeWG4srIHCYpbf1Sk2zy?=
 =?us-ascii?Q?6iSiTu1L8AdNUKbkOaH69SqH/FgylHooIIj3YP3X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981181d2-e834-4ba9-7ab9-08dd8160316d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 05:40:30.2380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwZjbdNjMf8FA/8uKwNbTeJKJP+nEWJq/P9AHijNy3EUYUzU7IHEW/eE/BQ7/9JsTMVlCgSdihm0S8ludSqtgZciD56ziY87toV+l0iNYMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dafn=
a
> Hirschfeld
> Sent: 22 April 2025 10:36
> To: intel-xe@lists.freedesktop.org
> Cc: Hirschfeld, Dafna <dafna.hirschfeld@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: xe_svm_range_alloc should return NULL upon error
>=20
> replace error pointer with NULL upon failure.
>=20
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c7424c824a14..d927f50f2a68 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -80,7 +80,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>=20
>  	range =3D kzalloc(sizeof(*range), GFP_KERNEL);
>  	if (!range)
> -		return ERR_PTR(-ENOMEM);

Yes drm_gpusvm_range_alloc expects NULL and then it returns error pointer. =
So LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +		return NULL;
>=20
>  	INIT_LIST_HEAD(&range->garbage_collector_link);
>  	xe_vm_get(gpusvm_to_vm(gpusvm));
> --
> 2.34.1

