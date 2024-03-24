Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DDEC54E58
	for <intel-xe@archiver.kernel.org>; Sun, 24 Mar 2024 04:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D210E083;
	Sun, 24 Mar 2024 04:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBV7YsNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E5C10E083
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Mar 2024 04:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711252821; x=1742788821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+LSXWbQtMu/nmkwq8a2NXZnl0E/rC6kpWFYUAWr+Khc=;
 b=SBV7YsNAyJwDHrm34tuZN80KzcZz5qqzooIdlVlcPb9C2AWqm3vqO9Wg
 dRlpNA5LsD/FLb0+kwFqhjEDdPn0b1yW2OyCk7IrITllIfLF3Hyb1XhC6
 FW95Ua+iX5YCNdCkiMHuroNKg7pDg7njvtlK4jKhiHuvWqFQlZpeJ9vJD
 tllMY+pw2DXaluQkrpUtraUAOmMwl8gi60mAkI2wv6kVPJsFTVbge3yVq
 rlTlDC/hw1DAKOSDqgqZzMq//DG14krISfm3uswx3cJzs+dJcGXX6HTZ6
 rhBhC6j/0iNuFczU7sUUQCAHxi2AsfqsW3DoetUbpH06fucC0of6jMGv8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="23725743"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; d="scan'208";a="23725743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2024 21:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; d="scan'208";a="52735640"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Mar 2024 21:00:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 23 Mar 2024 21:00:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 23 Mar 2024 21:00:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 23 Mar 2024 21:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5fmQRI42D7rL1ltOKiu+RvAAoxcieFYhlguKUsjzYo9EmtQPPIPCAvC5iD5Mbg0CizTN0vDnxsnYarXo8LwlcfRgyNf33qMSBgGX7tflQFbWqtTwoPCZKwRVCDFUNuPfQfp4bYPqHwguOVnCtrzZQWcGx0T0G7S5zWbpeL1VFZKhj5iYbWEjyq9MZK0F91Vl5P8zoydtc7S1q7kxEvzJLoX9KLFb3UbKGXtOvIpxjBlzuBeVJDXg3sFPzMUdoNgNLiAqTQHsrlH7RXETMqPZuI+DP8EXaBcBtvCr3NaaHMK38aOHJpLSaEOCG3wJTOvbhmr7HxSpCfZNSLnSbwSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaKtajdh9XKiekfOTAVYDgR26XWkXuqU3+l56sjTSDk=;
 b=VSLk42pluCNeZ1qnjtgUoMmaN8OG0rpWIHvZQm3UYJAj5qPb8KJOXpW8aG4DxQV7rglY+YS5S1SS/LN61pxEnT+8NNzgWZxIIZtWPmG2bG2p2iaauimY2P4eUAus0eH0FQs95eOcEBVK1D+5InaxmMx2UC9/oBL+/CTpQQT4S3UckdcKVnDM/C4kIQJGFVzo+R0nxuhkSr0++6QmLTtOtpJPwMGfRj03RvY/im/tT3wcQOwUJAp9PZQ0tJ/oNq9yhqvm56xzkBfEnnOpmkh522u0kUGUOUAes8pvmBJDd1Dz4CDL29VQBs3Sj2/LKyleAE31ZEYEyfLmtQG+ICmeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Sun, 24 Mar
 2024 04:00:16 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8%7]) with mapi id 15.20.7409.026; Sun, 24 Mar 2024
 04:00:16 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH] drm/xe: Fix static analysis tool reported errors
Thread-Topic: [PATCH] drm/xe: Fix static analysis tool reported errors
Thread-Index: AQHafQ7uL9qoWNHsSkyZzHWQeFfr3bFGRSjw
Date: Sun, 24 Mar 2024 04:00:16 +0000
Message-ID: <CY5PR11MB62117FFDDFA558604599C9A595372@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240323105325.2904824-1-karthik.poosa@intel.com>
In-Reply-To: <20240323105325.2904824-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA1PR11MB6966:EE_
x-ms-office365-filtering-correlation-id: 1d3b9c4a-7afe-4f38-0ce7-08dc4bb6ea19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i1N64H3SqGALbyOMI5ZiGFY9CfdBuvar4kxy+k5QZ2+R3piR0fas+9rgCLLz6xbuPf7hDbB5AD0N9lsTZnsiUSqd6BFx6qAeIp0IqFkwYQs9c8U14CclvPgKUkEW5DU+kLkAsoTj4FFJw8DgKU97e+eF2DHlMaZJTBkXxGANTSXk/lL5xiT5W0Hq3EWPolka2VmKLOJAc9sDCFYn3pVNc+DZUdEjw3UOya61d6olw24ip1+5mnV76KdP0+ACsoyYwSv08iQbMgh05tOE5qKVf9rL0AkNCf0zd/AyMikX4+xRh7PKryfEb4j71OdHg93T+adcf+dBAY/QQ84C6Rt2qa6OASZ8uA0OZb1d7hH9qbahE1LEgy1O+4FKW9AqK6byLQkWIhq13X4g8aqlU3xVlYhgBJqXxhtaMOfB/FX/B9OsOKvI/zJ+8j79y9kYs1jENOLFKqvkUH84cRDwSW5CKq3ImYFpG4cScuFc94RQExeH26w8aQCzug5XHMaDIi0l8sUPurnXgPevv9C0rN4UPMzuw5FkDPLXBnYrpr98ub0J1X7jtX/A6q9LC3hhn0vWzfzvu75VpgVc4SnfVUxV+s+nsWcgYjvrViaKX+j7+CzsOBfsvYTKebv91GnOlTP1y/Yvw4l9tDpDfei1/Prdbqu2Y9cofiEq1fG/BrmUtARgbzkHgi3AgAv5RpoxTNTZRWyFao/j3hdW+3sykZUAoZpY0T3fOmgFE5EjE6AqoRI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W26nUkmRIGmRGHhd1xRrYqY8rg6Y2JG+2h8AWlmw5la2y4BfmgQyXmKDIuLe?=
 =?us-ascii?Q?pkB/93QslmTfcsF0MblvOKENqAf1QFRLvEjx5I5RuaiDtIKGFl2L9P5QpUEU?=
 =?us-ascii?Q?gm81oofZKkuVdHlI7f85bSVBBWBxoKsjaMc3t2INnevaZSf2FHiHeo5JpZsL?=
 =?us-ascii?Q?h8vDoxU3oJ89VuOg5FFY/iNgWjoI9wHUoabB33yS4hnn1fqmctQmg/l6RrkR?=
 =?us-ascii?Q?XjnKmv+Wam1FUqtpUcHFmCPXAt8AJqRqRU9RQjLlyYBf/11nUoY5j7cGxF9a?=
 =?us-ascii?Q?7bt0ET+hXArCxRKG9H1JtwDsLLmMx5yzdqH/w4KI2qbt02Lmr4EmOM4+0G4r?=
 =?us-ascii?Q?5kMYS+NCyHXrgHRKU0KJ00rbPIxTjvL9k0+tJf2rc/71VudBN5EZH1NwOkkx?=
 =?us-ascii?Q?0uC5WvYIxEGpS6MWpiMyHxB+t0/OBM4N3ZVUf5lG3lH/lQp6Qh34d4B16W1Z?=
 =?us-ascii?Q?2uDYHxbeGjVrplSgLA1T+ug95ZroRKBNv8Al70wFp8lWOf2VVK13F3WcCFFg?=
 =?us-ascii?Q?bn0yGt12VBfZVB/f/DayeCPeMab2xYSlpaVQYGQxGlo48+KYmO55BRFJ50V2?=
 =?us-ascii?Q?A4VDpFpO1IyOBlkRmLgXRBi1Is9xkWDYQ3yNsrf63pOupR8fXV1vanO55umO?=
 =?us-ascii?Q?PudFW8hezBb1OSkgH6oRNpTeCIoKTXwPHrONTvlHGevvJji9wo+8DhEuzbxW?=
 =?us-ascii?Q?ezsCrjAITZk4W1T3J34WizcvPaSgqumXxu0ckr1TrAl/Ju+jCU7bts0UvHYi?=
 =?us-ascii?Q?LRlSDWE/mbNw3pP3cF44VxHQWfj7zoHYIyPolf9dXPwA270qIU4+yKDfVNRf?=
 =?us-ascii?Q?29Iv3mm+FNZF22gJ6RL5weO/kXPAr0SoHHS7fR6x+xOXTQnJMRq/WqfHQVCr?=
 =?us-ascii?Q?3c2Kd4/DcW1js1VQQ1ftR9IckC2Gc6fqerE48tNRDV4bEuJfw6r8qbXgJHmK?=
 =?us-ascii?Q?EghhR3HdzjA4SZdI8uw7isp05uX74esQggC209eu32PBxMQZkL3gE9ngz1/T?=
 =?us-ascii?Q?fTBtQzcpyvp9xuu9dtRqHXHyUZb5C1l+HNytrlGKcL78kUinNsxzNHaF0SY1?=
 =?us-ascii?Q?SdQaFS9DsrzROE/NNWDrI3dBhfwjnwjmNF1wUqzYDQvbFf6aNLCOn8U6kKGG?=
 =?us-ascii?Q?5R1M2As5DkdOf+FvmsLLnjItg+W2EoJHPMTk0f1shID9s0BUFOTrWPQcusGD?=
 =?us-ascii?Q?HZ/snPqLxtzPkaedXVDAd0zhWYoY5vrqS5TJwqh6j/isGyJistp+JPKBdR1O?=
 =?us-ascii?Q?QbEBdRFL+NoMw3J3Y01kE/x0PK8cRJRtmywBaZZtRmFV/BkCFgGW2SzuPNmg?=
 =?us-ascii?Q?cbjiU+upRUM3Xde17ce0DNoVVzdE6cfqiHPPk3Fw3Wo+O31iZJhKVA30sP2R?=
 =?us-ascii?Q?JrIql6Pnyh5GTICMvTz6Ur3nkQ+vaiFN13I5Bq0RBIM5gq7jOip5nB+IgMLg?=
 =?us-ascii?Q?S2IaM+32nqqQwdmsd0AaYgAO5SZUhjAaynaupFK67pWGYdjaVGYIpnn1EB1Q?=
 =?us-ascii?Q?2bmA7XWirAzjyFi+5wcf3iau8fx2NLTBz1zfcF89FNl45FBmMmUV88jWszyr?=
 =?us-ascii?Q?l8ynKt7TxFqsjerkqiGObAoxrKNbcKSRAqfuwcmz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3b9c4a-7afe-4f38-0ce7-08dc4bb6ea19
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2024 04:00:16.3243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+usBTKPHXfBGT1HX+BWl6AsCs+NiY74E32IA/2i3/MV4y74Nre054yiRPSGZXB/oxQv+GYjpJbGLBzb7B6S/xZApL7x+HSvfMuhjJAvx40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Saturday, March 23, 2024 4:23 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe: Fix static analysis tool reported errors
>=20
> Add a NULL pointer check.
>=20
> v2: Release resources before returning error. (Riana).
>=20
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power
> lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> cc650a92c2fc..46abf63bc37b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt =3D xe_device_get_gt(xe, 0);
> +	if (!gt) {
Use xe_warn_on() here.
Thanks,
Anshuman
> +		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
> +		err =3D -ENXIO;
> +		goto out;
> +	}
> +
>  	xe->d3cold.power_lost =3D xe_guc_in_reset(&gt->uc.guc);
>=20
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> --
> 2.25.1

