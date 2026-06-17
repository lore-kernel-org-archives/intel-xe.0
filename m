Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EE0CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 16:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2962C10E09A;
	Wed, 17 Jun 2026 16:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bO2Ql56a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D2810E09A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781712379; x=1813248379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8aJTMJ6WhK4l2aL+by9YKI+VqVH4lTXo5KvvWryS7k=;
 b=bO2Ql56aN2ivGxi94VMvTfYsW5j+oC1tmsxiSOlzO28NifdBR7WGS1cE
 70CHgArUxp4j6SfM0UgToVePJGmf/CsPwCnre1KXzHNJauiPCwjQvftGE
 uyXWNMe42ET+Bxb16u67eiDsvbxDkkZHsuuL1j1Od8A9SyD0Lm0l7Xo8M
 VKHiifd2wpm5PimtYQWVl1m0WRdMRB9uhKD2dZB2Vy44xq6UqQpFutV/+
 dus6kfhZU/xvRJJ5MSZEWeAnx9fc+JzAmsjP1zh2f3MFGV+gqcYn8Qopy
 fEnEssW0LtJ2kfD//ox6bQo6lXox+KLz9MosJad52LaR0RGiLK6HvarGL g==;
X-CSE-ConnectionGUID: 4FA4T4buSeGaUPHlkDJ0aQ==
X-CSE-MsgGUID: cU9s+ZETQpG19Zctaw02/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82571573"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82571573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 09:06:19 -0700
X-CSE-ConnectionGUID: 6EgGJ7aoQzmr1o87yoaeZA==
X-CSE-MsgGUID: +eIGaSgEQKWEIQX/D/xUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="286218014"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 09:06:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 09:06:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 09:06:17 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 09:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb1wpkkNQeoByJEn71b1pKaTXrgB9ULfUtdnKAKEdLQ8zCUuUcy2wzB+D9TyO8rgs2HArdixrZEYrsXm4+DbptpyBpuwRsZc/HAYEuCEQmy4Vv9ppE51Xfa3nkknCkxzZ9Em80m1D5FmaJ+XFoFJxl9eMov5+X/TQv1VQoNXhZQAh5QmJxznqYHQjAn+4aR2cR/4YJT1PgAwMX2Dsp0FpDeoWg0DkIjg9ja9qYOjWHC6I473HMOQMF5WXh0MCYJv7JIVfQO+YSA5d4PGJzKdfWixxGWZsnUCmomzrIfr8yhZYRhm/fQsjQrJpVxYQadAxJxYy63YdJWpmzBna3dLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4J4kbkVJInjROVC9GvnUir9XLyIvceL4M3IESVzHls=;
 b=iqoqZCm8kVowHW76QrG1FzayzrxToMIQRVWmVZHFXo2hqOByvaqb7fKk+ugsrOdY1f3pSParuOInnTJpF64fBOQC+EeD0zhaaetyKLsSr+m4Awlj/lDdV2O/gWSXbguKbiTPyLHm9+SHwy7RKhdgKp3OzCt2jh7rybogYimNLAFLWUncxFjI/vKAlOKaZjWrWYb2ESpWos3v9rhubd5iCbeNpAf6PeGznzehN2GBgpdJPDyEG1m7l7g+NHk2RyVXXPbZ6hiriWJGURLHblr+uobX8/LB58iYzuYeWAcIX0OTW4C7uJiNqf3Q3oyY3LoQpaZf16SSLRkA4NhMUUeRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 16:06:09 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 16:06:09 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Anirban, Sk" <sk.anirban@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>
Subject: RE: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
Thread-Topic: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
Thread-Index: AQHc/kc2MA1Sv0Y8Ekm5e7knhsQbvLZC5VaA
Date: Wed, 17 Jun 2026 16:06:09 +0000
Message-ID: <IA1PR11MB62668515D39E33FFA12E9830E2E42@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20260617104711.79646-8-mallesh.koujalagi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|PH7PR11MB5885:EE_
x-ms-office365-filtering-correlation-id: 324d07b2-7c8d-453d-341c-08decc8a588e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021|13003099007;
x-microsoft-antispam-message-info: Eybs+hSgZMhO6m18+DTHtSn7l9NQp8HJZsCzAzFqO6b+i9PGjRCCQGDWOoG61znaxqG4IPHlXNSG8ESfLiCten3KTMHGJqJuhenu4XthfLJM0+cJRJEpm1q7i5FqQ6DP/O9olMMwji2rPA5zAXuSYKcmmENEWFSRjRXAoXhAgtNYETPnFohTmZBkaEjn+WXOeqtT/ebo3lFx8QO4FUMylarOr1Nt8WzqWY8z+xehI6okMJENEzX/irgO5qtbTFgAXUUIV0RrqfEcYSt4/jvrT4AtODhEHTsdwMREmprgvez3BkjYOqMe8eo57vF2WqGrlNvn7+KKZ1MJou1aNP++/XDCLVLhgpofR40nv2bIC+ai5d/E+zX96SKkiQfxlxzoLkNfFRegHCN4S7Tb9Inn14Z5Y+R+7pljPFrKsFV84Pf64/LMoCXqggPTnmCqw88h7ejEo+XuZn7Tcc4fPgdf2OfTY3uYO3BzQf8nAGiOzgC4QkqDhwn9iV19fg0I2cHtMm1ug8Y/8/45Fh2LpaDoNZW1d7FvEwtGhAVY0njnYSNl+UY+JtxTqA5Ht+nxYKL3/EmfVBguSgHxBgM+2YjIIXHcgTk0rJYOo8p9fr/4nnGEako4huYPS+TfstsIxDQ+aVg9uMVM3qkI/mBHJoeamhmMMFhC7cb6RNcKYSY+RnGVUUVfrHbLFxjP2kY0OrKQgdrj4zbqerGtz3AbFU05/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mULwXy4k/9fq13F9Jm6wwLhPltGxsAoZEUWShq484JvyeZUmch1opwOrqdfR?=
 =?us-ascii?Q?ut3oIWby0kJBWBSNOf3OJHoYXI479/aXSGFpb7N9uC/WSkNGDGZVwQyarL2e?=
 =?us-ascii?Q?hn5BOaP5bhuKSconaaHzhILqukSk+/pNRuqY5YpsOIHHD9o2PUdG4oWUVsaW?=
 =?us-ascii?Q?9Ehn98T+8YiFvmgh9LlbJLImErqorqH5AV+h2RUQNJRilaSd3H/gM2JR8YXl?=
 =?us-ascii?Q?4g6QCmz4rIiLGaoO9SlMlH46ZD/LNaG2rbOUChsC18IVp6eFAgsQjwe/dhi+?=
 =?us-ascii?Q?OdkfNIpJMo0uZnX0AZDUX6vtmV+htdDWcxVsl7D1SdNS3Zbk+GM/k26AA0IR?=
 =?us-ascii?Q?nid0wPEuiT01oX/7kbF5Jbs532cRShL9uibyU4HyD/CQHjmYTrl2F5z6zKfb?=
 =?us-ascii?Q?uTKYHQPoUsprkjsr3c0RPxLLjkaqnStrEGxOs0jHB+vYgZUkkN0tGaHI29w+?=
 =?us-ascii?Q?h7WJEDfy3ivANjFuxQ00QIPJrS340jcCju0gbqTIdvoe0erXZBDK64LbRrJY?=
 =?us-ascii?Q?TFD2m3VlGsm6QrhWytB/AaPmDWRsg2h8gIXiTrvA8vibFUWcqzIke3p80hLr?=
 =?us-ascii?Q?/RbUh/ngXJHNbJR/SKn5lGtMCobtRNXdC7Gv2jWwn8PmAkkVCd7Fa15SAAq0?=
 =?us-ascii?Q?BZLF0mcEH9tC3RgJkXpa4fDpzqaw6cpHdez4od1VaJ6nAld/8aKE+BzFyxMQ?=
 =?us-ascii?Q?V9RZ+s8w6bYJ0DJShw96LdFJn1vzc43Fn3peJWxoRGo8rgEim1QJGQyfdg4C?=
 =?us-ascii?Q?XgAFFdPXGj5cmPwcrVeehZr8zGPEHku08xFqBrGGaoYEa117xzv//PPem/CK?=
 =?us-ascii?Q?ByqxDQlZTTqoo56Frr2WgF5PxnC/PC/2EV7UymWEwyuJewAAmvt8Sdv3pQg3?=
 =?us-ascii?Q?rOvGCc6vRmiu+tP1EhFwsTufmHg2pu3LoKNQhxZ8nuJIrQNDnWn3mA9J8fkp?=
 =?us-ascii?Q?sFFCGsbkErsWFR1WUaAZCunkm0xfzMrEavjEQ47cIXEjkZiIe0dtzZrFeZ6U?=
 =?us-ascii?Q?zBtQv3sSqYjjWMaFLD3r9wguGUCs4rbe/Y8ECyGHH2HISgOaDTsrCyLNwmn0?=
 =?us-ascii?Q?Aohj2S4lzbxEhjWSs8H0IMO2Ok3qJl4ZL1XbVjXzEIK3tlHVlgp8tE2bYIwL?=
 =?us-ascii?Q?0CKwW1Etgw/TSdU4C/48hjVJUa6wmHuFb54A//s/GJfEmjks+VQTRSYnq0c+?=
 =?us-ascii?Q?h/XTODeXhSvuSRT8DIPm1MeGeGckxrNtylsGCrS4vR4N9yyQMeKdMjrOJLdb?=
 =?us-ascii?Q?Yd3gA1iWfDqCC0vLzOvyLIn67qNBIdJ9Bgv3lFW2nSq47wypEUTluy2l6PII?=
 =?us-ascii?Q?dgmqxCgWiBEry2HIH8PJgkh2GfObibTRoq1WRR/k/3Zltv8VjmYm7vgohVxQ?=
 =?us-ascii?Q?2tTyHZ0N5LgRSLsq3XIBQyHq+2BVybOHXqKrs8DqQ26iPBy8xyxkUMVabPRt?=
 =?us-ascii?Q?i+IK0Ftc4IlHJq6X9RZC/38zDVwntcjCGGGxlNMs2DiIou75tO5LIRdi5xtR?=
 =?us-ascii?Q?mPkWATZqcVK9C8a7Eu5u1sMOvbqpiRJB1UY/IkZEx58RjD1gjP3ZA+ayEgvQ?=
 =?us-ascii?Q?kIKpGb5p3mX2vAXE1sIj13kZFSvhYzIklplwrYpKeJkBILw4s7fLvt3L7cK3?=
 =?us-ascii?Q?g8tn7ZW9rGXjnxEczoTwv6TPMMJbE28LoYpuIx6RTFtJCFkRYb4aBuM5XooJ?=
 =?us-ascii?Q?MRyvdW0OGOMzYOQNBgpGn4dl/+qlAfj1artzEGeIej/0uIIuWxmJzINqkCtF?=
 =?us-ascii?Q?rT/QrllChr2FDh/t62xhguGVhJ2snvs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: diij/+PJgTtWUbRGLrxSiJqzwaumSrph9zBAOk+NPXs6JpseouQ8eKtNj8VpsZ4dMSO/Sg+1Yd0egnfpw9C/RhNHPw6sV8RUIf+GCKkqi6b/mibG5ORMBz1Lb9o6bXebckBy7P0cNDozP0kdBgift1J+i7RNFr1pV34Ouc2bJVavJKDlwftNhPm8fqjz2nG/Z4rAbRXyn6Dxz4M+MybsP7up4Z8ib+zpPmmh39J8bp1LhonYDZUvgjg2S0OewZMIbqT30jt1a+ACg9h2eNww2b+Pcz7KPMJrRAw4DdPsVyzhUOWJP2IEn/1ChVkc8gIhpEJBO19gGyxxJj6nc/fqvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324d07b2-7c8d-453d-341c-08decc8a588e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 16:06:09.5999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2j0tTdjKOQkargP7jfr+jOsR8yt2jCKlPC3SBvEU5WGWNf/8L7gHpEv7d/ZDoGi15Hy8PjwtC/eAofwz1/k8Kiba8CmEXv9Spoelajhqpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mall=
esh
> Koujalagi
> Sent: Wednesday, June 17, 2026 4:17 PM
> To: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>;
> Brost, Matthew <matthew.brost@intel.com>;
> thomas.hellstrom@linux.intel.com
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>; Anirban, Sk
> <sk.anirban@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Koujalagi,
> Mallesh <mallesh.koujalagi@intel.com>
> Subject: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
> xe_device_declare_wedged
>=20
Hello,=20
nitpick. Please update patch subject the /s/XE_RAS_WEDGED /xe_ras_log_wedge=
d in next rev.
> Replace the open-coded drm_err() call with XE_RAS_WEDGED() macro so that
                                                                           =
       ^/s/XE_RAS_WEDGED /xe_ras_log_wedged


Dnyaneshwar

> wedge events are reported through the unified RAS/SIG logging path with a
> consistent format, CPER severity, and errno.
>=20
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Rebase.
>=20
> v3:
> - Update message in xe_ras_log_wedged().
> ---
>  drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 089872507bdd..8284578b9156 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras_log.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1424,12 +1425,12 @@ void xe_device_declare_wedged(struct
> xe_device *xe)
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini =3D true;
>  		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to
> https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +		xe_ras_log_wedged(xe, -EIO,
> +				  "CRITICAL: Xe has declared device %s as
> wedged.\n"
> +				  "IOCTLs and executions are blocked.\n"
> +				  "For recovery procedure, refer to
> https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> +				  "Please file a _new_ bug report at
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +				  dev_name(xe->drm.dev));
>  	}
>=20
>  	for_each_gt(gt, xe, id)
> --
> 2.34.1

