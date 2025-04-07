Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD9FC36002
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 03:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D548B10E0F6;
	Mon,  7 Apr 2025 03:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrX/WnXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6B10E0F6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 03:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743996594; x=1775532594;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3dityMq+/8C7hCptiXhmGbMvvhFJ4h8YAQJ7qIcJUIg=;
 b=QrX/WnXNLHSK+pdVUNQekw9HO1jH5dEBhqaExwPUeIjbwkaOZzeoHtue
 aiF24J2olIWyw79GPb3EtuAvo5ypkGFXu5J3CsjO8jDyesOd8uEdJJ6kB
 CAPhpsVYshh5nHOYLDfdmdM18H1RcsaqZAZ1aFWqytEhvv1SwZvRrSQ01
 UqgxRGafWTMlZwKUrtk6i7K9zC6DGzLv+InHuBEEaHU8wkLxNFYpcr06h
 ky3M4Dvwjx1JtnPTGSXqDjvd1q8r5EE59exYo052yfaYhOjHaWlBxkjYe
 54h+8c3nZZCi6tjGuHmz8BAEwj9lSa7gNf8Nq9A+r535oHP1H0sMhjsmE g==;
X-CSE-ConnectionGUID: 4g0W6VLlSe2tpI8o6Bwa4g==
X-CSE-MsgGUID: tR/FJdx2Q2GX/CM0XI/5ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45078537"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45078537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 20:29:53 -0700
X-CSE-ConnectionGUID: VI6p+uObREWV+t3d4iCrZw==
X-CSE-MsgGUID: gIAEr8XwRgCI4NLcTqlAlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127699369"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 20:29:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 20:29:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 20:29:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 20:29:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk3Jt/KLXQBn/Tm98zVpxYJvK/7reNKK3clHXDM/lxdGx/HNc224LJwbzUVrC27ASqCat5Bt5/qpEjZXpYwp31rHAZN82SX51ckduweL5QfSNJ08DVEnm17odnRs0rcQqKKTc0wvB39EvnhvXvAVEpCKK8SGIhdpsNrCnkcccpjGK16D6yfN6yL0O5mdTmzFD26Qnp/fGAGx1cndOA0Z5kqCq/5aYkBGXzKN7vGQPfpRN9CCxiv1T2gYYchWJ+YQJ80hIGOfm5u7qfazp2rq2/1S4EEp4IsZMTRvd0VI8dV8C38MR96k8LGOGMpJ0uIexEzm4W+3qBreRrF0L/eZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQhyYw8buEbqBZXBkF8BKWW9pvPGB+c0ZTn68iUOIFI=;
 b=Jurizcp2XjWmV9tHCQiF3egW9SV6zqYbRylI55iHhgOqn7Ei0K8XO3cKTho6b8uB9gfloTXvzLnbMQpRogNGBhyap/POTheyMcXDehNUztiZH7tLnLKibXDDfGwnAak4NFmdhi3xGsreE/QfuEeTeiqF/wiNJBvvVpPua7MAHKdCQw+gkxXBBFRDkRiPKq0FBekGzap2XKAmJ0ym4YSHQIShPbGc3rs7XqtQnrkO91U95dYv4c08KkE2A6lEdWx8sucrxEkIEQB5GtQgAHvQpI3Td5/Extdx4sW1iVOwcs+U/j2EmyYrAgesDnOJmANz7bOIDcIzOlb2PyIbRtaEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 03:29:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 03:29:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: drm/xe: xe_hw_engine_class: Add fault injection and improve error
 handling in kobj_xe_hw_engine_class
Thread-Topic: drm/xe: xe_hw_engine_class: Add fault injection and improve
 error handling in kobj_xe_hw_engine_class
Thread-Index: AQHbpfzd9m5R/R4ojkWKpmkTJVJaT7OXjlgA
Date: Mon, 7 Apr 2025 03:29:21 +0000
Message-ID: <SJ1PR11MB6204C6A62694D4872EEBFCDA81AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250405071703.2255259-1-sobin.thomas@intel.com>
In-Reply-To: <20250405071703.2255259-1-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8804:EE_
x-ms-office365-filtering-correlation-id: 1e58eacf-97a3-465f-c963-08dd7584634c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0MwmR3e3m4byflqKZlO9sDvNykxLv+wsN0LTaHlV54U7WKquA0lGVmHz9rv+?=
 =?us-ascii?Q?sxWLvBtUCdB0LzGVb9aWCbdw/PSnYNbgtmol/31jha3p7w1HMPn6WBSKVr5S?=
 =?us-ascii?Q?ljVx03NO4QImtIVTlE9CP4QcSs3h6h/52LMnomX0CS8c0dAXNulztuyHKhQN?=
 =?us-ascii?Q?6wFBB5jwXyP/uK0/tEUbRdVwqLf1UbJgY1YQEuzTQPytOyE7FyptfDa/8Xkz?=
 =?us-ascii?Q?TG4+GiUJV4kP8zIexkmkmaxOnwUeQHH9Gbh6gYOOj6AXoag1fXEnLik1PN5+?=
 =?us-ascii?Q?j+PPBJI86SlQ9f/d6OWsgiDNyGkwDHqgc2D5Ey68nN6DqyyaJqrZMBDq43Y6?=
 =?us-ascii?Q?ORLOTG5QcxRWzu7gnghJJD/sT1wxY9g3X6bFtWPp7qs2zZQPafVukVGopGZH?=
 =?us-ascii?Q?jSHsEa80plOLHPIzJu2YgeMwxORcEb9ePu7mQYEp9q6NcHWAmpOUm13/KOZ2?=
 =?us-ascii?Q?lL/tdgLtH098URmmKRCcuVNfJ2krCnPIybs/fwe3sPlFM9Lt1U0WvukOhIeA?=
 =?us-ascii?Q?bwZX2CGJHe/2CKnDTZ6KaXhPc5zDTqkmn0QiujL0DTkGhn5D5e3a6Wf46cxh?=
 =?us-ascii?Q?nrBVmV6PBqSh7uBwZ0MEmjLJVjhVrvxAeKX5cLT5H0xNTcsq02BSjptYQwo0?=
 =?us-ascii?Q?gB0+jkzJtSk9NEkmejhx85KNApq/dnJLAfC/g5tSDd6ez6VFArWXCt+FNRH6?=
 =?us-ascii?Q?dgOssjpythPHBRfDyGHH6HLXLWqdrvf7AIPXJBGP2gqseZvmOb/VdXtzgTVC?=
 =?us-ascii?Q?Q+BiQ8QdyNLNGKzfcJG1jnoyaXp/lf4E+V1cDv4gyjb8qdsalOav/LdYqCpE?=
 =?us-ascii?Q?DsyX7+m+Lflimys300poiKm2KomxgnYBEFsXWrAeipAaPSpQ/rkUFVzK8T5X?=
 =?us-ascii?Q?c1W/sktmUKqOmu7kj+dQp+hxs8211mfnCM/QTYkAe5MisbxX/K9trHkMnUo8?=
 =?us-ascii?Q?hzpIujepnJYdbz+HYzhPOwF6P3moYqz0VRJfGh7zx2IXK5wYfPQwKfS15va1?=
 =?us-ascii?Q?/RrJTZl9JBq0IS1rlk6OtpSvYhzSjO0+iKEEs5IhotiDd0m8clm6JttasQUV?=
 =?us-ascii?Q?jjmKl2GwozWzCBk5imyv2kaeZ5mhGrrDqYICSolxfgGfRLcIny0L5qSJDyVr?=
 =?us-ascii?Q?K7wSQh+4U9200dzMfAJjLWYLIQ21XPHeDxAgYD2erxOpo2tttQVBIKWh+WmP?=
 =?us-ascii?Q?rwv5R6iuPAi/YUCrOpby3ZaKUbKgCs8c3p+q2f81SO5xu18vrQ3KRxyZyF5z?=
 =?us-ascii?Q?4AdYn4YUuDEAVOQv/hnA6NqddJsjiadieBI0n7lm6fjPQwF2ihO7R69aOLmg?=
 =?us-ascii?Q?WtEXnHbPIzUjeWUNC1V5P7s/cEoMr6kotRolzsXTJ6sHhvbgkuNRVO2W3qlE?=
 =?us-ascii?Q?UIogTUrNLBbwrXxv9Tn3cvDbaDB0MzQa/xA2l3aBdUMEp3WFd0PnoLI1jaQv?=
 =?us-ascii?Q?3JbYCusdpgIwm+hoajEGDKEGhyNqJ8sl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vIpsLLO6DWyTMz2beDJvCCiujQHg09lS+DEHUbmlWJ9GEUKnn1qxTTJxslpY?=
 =?us-ascii?Q?YY1cqsRHO2IC9nG2cJ3eszOZJkaHdPyMz1Wc06io+Ks+MLkz7GiOINyV/efv?=
 =?us-ascii?Q?wjX4NRLC2t/x09RxUEzyuT0aLkNBZnuTw+xdSB50ERFuE2fP1pPJ1COead1k?=
 =?us-ascii?Q?KEycLju3fzKoytHpCtgSq1SDPvm5hMqIc319zjXUsk4Ipx79q2dbaUaf0Xn7?=
 =?us-ascii?Q?YAZ0dN/y0/okpZh/EzTSubYv3blJKPfSGu6WGKcVLPLPeP63sAbp2lYyTpm0?=
 =?us-ascii?Q?HWtRtAB6XV/3fvprUMabi3DaemUxAVhRtWlkcby+Bap51k6i6n+mxqmvByZx?=
 =?us-ascii?Q?z2QUyH/F87Bkhn2HiiHGmZDMcKw5ewLcMvrQshs4YRhOpQ8qYCBnQP/ybVEN?=
 =?us-ascii?Q?w24cFxDkClIZva8s+sRkdIZcNYOnPWMsTHQEutHvECHoHZ/XfwqYdSsAJO8p?=
 =?us-ascii?Q?fZHIDFiKJ+dQN2BXIPgZzzWp64LCMIpuVP/FB88dzWZWXWhrdx7fksojLOxL?=
 =?us-ascii?Q?jVYKGv9kuFHiWdYNiVFTiAlF3APhhJApulgr/ueAdqOSy4Nd4xRocWgquIWl?=
 =?us-ascii?Q?jdDvpavBm5zT2fLZynhDbcphole9VmplbLCW2ZeBLn2hO9pIelctshMSeWdv?=
 =?us-ascii?Q?whouCrFxBrdfwg3VDkrWOHF9PK/w0zyLI0Zwqd8J5J2PKP0K28sWX1v18iqR?=
 =?us-ascii?Q?aN+UvzF+6OxOkjaS9110/CU8qFmUe9Lkbv+4UZy+2b38dg09jRikPUdmRT6d?=
 =?us-ascii?Q?7MayalU1eNJvBTyIDz3XHHXKmOqtUW4sizlTJcLQRLV6QsONxQem94LnMIGu?=
 =?us-ascii?Q?YDagbxEKROAJlCeYYHStE0wDaln1NYc/sboMQKyDLWR+BLpLqPdQzNLkSd6S?=
 =?us-ascii?Q?/iJZ7VAcVuRNGbDoKSVWO/imz1qy4BL8g9TWjC6UTwWb3DhBDAcov0A9BYcu?=
 =?us-ascii?Q?Bt7KJCkkqqzjeLWDbrbvZ7+VehG/R8vQ+htNeMvtnubOlAcMB39+WxdWgdTU?=
 =?us-ascii?Q?aejXRYiAXeSIZN/6rP1QLced1V4hNJhRCdyRzJavSXHf3UjWgAQr7iXrtBVY?=
 =?us-ascii?Q?bZAFjJGv8AnfwgB+jqIja9b+uAvVjz2VNEVFhnKXpj1VtmFQBzYazUDmWgV0?=
 =?us-ascii?Q?SRaFvLjmBQKx9yc7zxWeprhpJ2V4L+N2rG3J9aHxnCdHt3B8RIKp3b4dK2kN?=
 =?us-ascii?Q?kn0dqRxotlCk5AaaQv2hwZDFm195H0VUpzqco+EbVoEaPtFNqOWZPy7bNlB9?=
 =?us-ascii?Q?E+xGE2Pct8PlTs19np3dBjloqr5czjhbj0SSSN/FMw3lH/Czj9srmZ364mHj?=
 =?us-ascii?Q?HRhJ7dgQLqYtQa8lgfJom4uRa3BjA+OSfaswzkk05dNNePoK7u9FhOzrOwxI?=
 =?us-ascii?Q?ut3ZK5ecmX8FzuXY9E2RJLjKmqx1XADuATF5mGTGpnGWovSvV49Rtq22W/kT?=
 =?us-ascii?Q?PXtdb5tm3JQrGQtzDZxuvZRwDtJ4Eru3COriafTVIIMXWzRhhplEaJmBneL+?=
 =?us-ascii?Q?Ul4xfJBVdaBw/PXzTr4k/qfvQipM80GTm0kJgawg0VLJZjIbogEaMMlxHeQb?=
 =?us-ascii?Q?fsVZt1QBidOWLDFpCwXK8tG5cynh7zLEwvXvg1US?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e58eacf-97a3-465f-c963-08dd7584634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 03:29:21.7981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9pFLoV6d0RDrEWMXbe4R3UxTrQtnlrK4LzCycHcuYV1kFEcHpl2YYPsgqMausveuE98dz7HHjXx11WRaby5AkOnyZ83ROWVCANLKsAjBN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 05 April 2025 12:47
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: drm/xe: xe_hw_engine_class: Add fault injection and improve erro=
r
> handling in kobj_xe_hw_engine_class
>=20
> - Added fault injection for `kobj_xe_hw_engine_class` to enhance coverage=
.
> - Improved error handling by checking for `IS_ERR_OR_NULL` on `keclass` a=
nd
>   propagating the error using `PTR_ERR`.
>=20
> Can be tested using inject-fault-probe-function-kobj_xe_hw_engine_class
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 640950172088..0cafe1175389 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct
> kobject *parent, const char
>=20
>  	return keclass;
>  }
> +ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);
>=20
>  static void hw_engine_class_defaults_fini(void *arg)  { @@ -662,8 +663,8
> @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  		}
>=20
>  		keclass =3D kobj_xe_hw_engine_class(xe, kobj, name);
> -		if (!keclass) {
> -			err =3D -EINVAL;
> +		if (IS_ERR_OR_NULL(keclass)) {
> +			err =3D PTR_ERR(keclass);

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  			goto err_object;
>  		}
>=20
> --
> 2.34.1

