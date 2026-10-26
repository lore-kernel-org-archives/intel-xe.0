Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440EF606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BaqAWDf0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6D10EDEC;
	Mon, 26 Oct 2026 10:49:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB51B10EDEC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011789; x=1824547789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ErRK5PFAOluiEfjdEpuls6EXltiRwSr8An/D+Pa/pBs=;
 b=BaqAWDf0I6xa3phOcTHSrciQ5uF8YPPvWhZUYaq8NVDHNphbmuANU/Cj
 vHsO+vgha0DVMnV+HXA0C1AfqwdJYL5ikZaYIO5RbJNhXh6y/+PqykCfq
 FbRPp4nns2W1ue+Qp1ZP6PKOTQzknN/nSbQzz7HW4WZwx9u5lD+hBVywN
 PDIIVEEycSl1NflgcUbXu4MuBDwgXe8AGRX++eQ/BUDDIEjFP5STZVi/c
 Gbciz2ug9E+hGG58+2G7y/m6RTQHgWtsivKxIBsz8rrXvz8p8oM8pxpKj
 J8ipIhMgOOd3tD/9CKvAN9HJ3lLjTed6sbIKk5U2uc9e0y536ExdY4M6V w==;
X-CSE-ConnectionGUID: guv3HTXOQUqiwYWo41/jcQ==
X-CSE-MsgGUID: Z45jopmkQqS1u1AYuSNbQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1701873"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1701873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:49:49 -0700
X-CSE-ConnectionGUID: g3+PlbaqSi6Ydeoe9HJVBg==
X-CSE-MsgGUID: l74gFnI3Tx6AlV9SrznJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4180836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:49:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:49:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:49:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in/rP3YFI/93/eGS6ZBf7MjgPdJbsbhJ5NPSy9gZyi4iGnF4QWEJV9OoyGx5RggEdqT7LEPnkO3sSl3EmQQd0Xw/zkuGfe4dH8fMpc0JwSszrsbnHUC1FymDNFY7nlo1bMxeulo4yIYUmpNZ+8Q2A9s3g3ab51cHsSnQkXuvqm6bjyghILjFmvuWqyJsQl7GAKgDPLwb5MqW1FQoE187zDLp0IzVdrtcOSqvuk1IdXeqgPl9YuakP51wAa7hH4jSEIpJomGEyT7aL5qYC4lfM2OpLbc86q1BjUxJomCXXKH+1FrJci4xOzg685JGowbRMlTJ4TejaLrLyujZULf2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjFKiDkqei+lPojIQDqo1PApONvOoYap3w99ai7umvQ=;
 b=pc06dfKABtXf8m3ocUn6dx1e3d28Wl38c3JW7OpIlAylmi071jAEazqyqejObN984/7gY5q3+uICmBRSDq/jGMDJRq6NgiXwjA5/XKVEJUI1tOz+SIAjxG6IQYCnMfH0ygPHgsNX55sT41ppgPKVYN5y1ZdOomJYUg1Gd0MXgBvJ3fTy2WVGzQ3ynaVlul/9yPxbMWlxShi8NlNVdl+pYj2NFrz1Syq96SgWIAGBngaSXgN8eM1tg/ZtQVcx3LtZbqJ2mGrNUZvxkKy+U+ty57AQkBBDhNe20foGaobTJY1XPMZiA90c1KYhfIhDZtdEwDVoflfTQUmJiZY7fszeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Mon, 26 Oct
 2026 10:49:46 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:49:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>
Subject: RE: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
Thread-Topic: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors
 routed via direct IRQ
Thread-Index: AQHdZRAIEvcsMhXgMEmQOqR+hINm37cPpRTg
Date: Mon, 26 Oct 2026 10:49:45 +0000
Message-ID: <DS0PR11MB8718FF0E8B9E8E9D88D87E1981612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
In-Reply-To: <20261026060459.771448-15-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SJ0PR11MB5006:EE_
x-ms-office365-filtering-correlation-id: db6fb405-0e3d-405e-9c4c-08df334ed958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|10070799003|1800799024|261009223027099003|261022113327099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: kLaGwUXdnMGv2CSfoPbapEMujbAOXUmfbJh9nQqNmXwxoeltKhxT01pQewZQYIIHqFupwXPQVrrCSVSctISsxLFZeHVsrYZ5gNEqDQsRO+GtTDNKhppRTIqupxTy+inpY70OX+b+fBArZtunnV5U+KlJhrDw+zzZKhtAHNElg3uzWwp+N6feJUKBPMOEwTxtI8FMwS5dCgLanDDLF9y59MbfD/2aYC2j2lqNwOmsR/d7UclJwvFLUnPC7q6VSQF/QQi/vXNAxdccQ07b1qKO1R/qDXDsN2NS4zUDOzm3Nci2ERe76G1Fjy4KS3EPA+rjAqLxXhZIg7YZz+Xl3UNeX4Qv+aSIwQBvfOqm2jV+V8ZkFPn92W8wkxdqNTlTjFHFlBSnxRgJm5CGdMiIVEsXY45fGBFBXjFIWZSqMlJcjMjpZ/UMQb1G2ODN9WAJ75QzptNkqqE7dLznnKm68nUzhleXGjzBh9SBulR369P6TN91m2QvQfVdjJs72rPOarW+tZGLMeBAbJrnA4xh+D3gSaoMx3V/c7YDf39Oikv3pk3+alILo1a8DD5SMAO3hqBjFtg8krmteJag+FyZr1pvQDpORPYbubWrzLXQ+x1LfPnjGj7fu2jmpskvMo8zS9Y6cnLm+J4A8Ydzotmhgkq0FMnszabn/wOsqCzIM2z8XORg1PdWDZMyYvOIWL7yICXYLvS8Jr5hF3LqmIHFcyq47+5ZpM+8pdym2k1409kAFQI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(261009223027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RtqQT//ll2DgAOuX8/lIl8swNEB12gshq9YPRIE/1hfS6aeAAm47Y3Jj/eBl?=
 =?us-ascii?Q?T+gEyUuRtFdXH/UtBW+aTH6DaOYW3oq0D9TC3ewrUQjmtQ+5mwjX+/x9ksU2?=
 =?us-ascii?Q?3WSHhQNyAjQuGOhOWAdai0WOnFUJ+wTGrDgjOJKGKCxKEqI12kDAm97gMzPU?=
 =?us-ascii?Q?kYujHOcChqrzHjN4glkwgd/fX1iFgB4MSvj0e8F0+k94iLMrW2XbMPbqBQKh?=
 =?us-ascii?Q?rbQajK0oeFqSqLo5yfXYrwTRyxhsnwWLE0aPfpp5ArRwE5F1+o+8B+PlE7ZK?=
 =?us-ascii?Q?NNe2LgJP+YQwkmt6hDX3gWlKhOq5NFLiAXBPbn4ukNPkwmdlsXLJ7J1gByHi?=
 =?us-ascii?Q?5nuPT+ovThhVFs3aKmlvB0bILgEVh3THgCGXd6l8FUhtBaXln/7B6XsWnfKO?=
 =?us-ascii?Q?58MaLhyYTOV9TzuxaaIAW3JGRdcFl3N2Laqc4IHqOhBAQhghLjtcsmON7/43?=
 =?us-ascii?Q?lFFYuVDGezC574ZtmXy6Z4IebRVtusU76R49gZmATurB2StfiaaWWExopbph?=
 =?us-ascii?Q?O9ugbRqUYaht4u817yEqST1Uruk6d64clvhUrwH3W/CVLylBWh2lnv3OBRjR?=
 =?us-ascii?Q?lHI5vvzIZlZ7KG0YAiky14g++1STrNkMaZH7sReP1b9CmcxffXnDuS95t1Dy?=
 =?us-ascii?Q?/EZwxGhyvGCsu2misE02Zdzfp9C8eFmoK156pYz/KHCJhgbsxu54YBTCLYst?=
 =?us-ascii?Q?0a6wAcnvtd1USOvN/l5E2ShfPVw1qlRdofGicrM+5iJwmc7udIPp8xb0TMbG?=
 =?us-ascii?Q?e6Wn8X4L3Ppm9pcp3isCi8NAcneLdxh/C6XrboasFhL6WpKjEznRuVmWvfdk?=
 =?us-ascii?Q?5kR5jzxaq3IzgVB1RRu55ZeOEkVzDqQNca92sC62jnhwk9PMW92sKMiHfB9n?=
 =?us-ascii?Q?/0PI49E+ItJv3o43qJxHJiX4P90+75MMiy1EC26w53IQRV6OEWG8OCMQqcQ9?=
 =?us-ascii?Q?KVSTtBzgFDrDwnhv8nr9qo+GsCy8ASA/2BVNz8OVVRqo0WvjD4y1gDljOMzn?=
 =?us-ascii?Q?5NpPPU0pwYTKnpdy8PCYlqrHIrgNUfknaVgxSQ9dgTA2JHqI2Fxnfb+OzbNu?=
 =?us-ascii?Q?pawU92Z9ttPfOD62KAF4hyIYQvRYvsXWZ9ivJFwVqCkEFhyMJDWzxwsakhwe?=
 =?us-ascii?Q?Bam5NkrsXDH6UXW05nr7JRv486BdjAQ6v0wb+UVv3Jky744PqVyatBVv/kl8?=
 =?us-ascii?Q?Z08zBUFbxcoeBYy4HH0jK3ShEptHtT7zHP76OyPWT+xCdnPw7GZSsEmiCkZA?=
 =?us-ascii?Q?j/UZGGhNe+8cUsFYsZiY6u2Iq3sZuTFCZZU6IXaXixmxg6nf959wIb7uh7kW?=
 =?us-ascii?Q?5+H6lYDHay1fypGX6awFD5sEY7KEsbnNTQE1aZQg3vrjY7cgzqQV5yDQqU/+?=
 =?us-ascii?Q?1Zu6GpnFguqfBrmv1NPYHOM/Kht8ZR67h1R11whFg4lKFBZLqlGoLeA4QzbE?=
 =?us-ascii?Q?VswkL2T6RTDnM8Y02C412y2Y3fIf95Z1dkXNyTNsm6iIY7EtjsfddbqbwimR?=
 =?us-ascii?Q?jjQrExhU9MtnYIWl+552qXc/kVFpEEEiu4ps9M1EDjs+Uf5aJ4dPRuTPSmu4?=
 =?us-ascii?Q?yCFTZ4Zi5eHsXUsYNKGkvRLSa/MuujjFoLQdJpJ/wXlGKy5yMkD+PJ0C7Lb/?=
 =?us-ascii?Q?OOqUeaUBuopGkjI4aA3nFkA3/Gt3hwjYqF8Ukb5SxTxyYX7l+sFYZGGhKqAH?=
 =?us-ascii?Q?WmwIavp581FhEFN/929/EgFkdTWSfv8xj9FDaIhudBRcITkLsOMqRV/avWMK?=
 =?us-ascii?Q?4JxSswfTHZLaZk6IsnFZlKGLvnaGRE3KDrwcYfOkpCyMCELmuyxHqrsXgTgO?=
x-ms-exchange-antispam-messagedata-1: O9e/twy3WqLKMQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tRluliphu765dPxjktCGRU0+FRot3SDuJR19yPkiUsBnu8R7unWzwepalaVYGgV8y/YXexnV1SVQ3ihIbmhK5k5sGjw5Qn9fcbpFBS2N+oP7NRbMas3wRnLl/SrVIyzdpVDPBrQgrmO23wkkYOERckXg7UkjPRB1zN0Etq+bz2iP6fIzDHWcoe/LS3MRz9IBiBb+0OPRBJmjv8h6W4KWNDRzJHAIIilUS4Uy6Qo9INPuLf5V5dBoaOFNJvmUdKoODYlYy1KbJDwrDQWu9v03ikvYoZKcmuObVOmHE4OsiaoQCaASEibaFLWB+OhC/6BT2V/mfXMcws4eZbenFOlfMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6fb405-0e3d-405e-9c4c-08df334ed958
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 10:49:45.6048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38Pka/t6L0et0p/xfDk3+JZhPoCK5PUVuXiJwdyP8qbA8fib9/NfU1dmSkX25QIfpmM9dO4uR6n1Fly2/ObnkgHoR5WjTbc0U8foDAHR/8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 26 October 2026 11:35
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors route=
d
> via direct IRQ
>=20
> Process, log and recover non-fatal errors routed via direct IRQ.
> Double-bit ecc errors belong to non-fatal error category and are reported=
 via
> irq. For pages that belong to critical BO, wedge the device with bus-rese=
t as
> the recovery action.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 37
> ++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>  2 files changed, 41 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
> b/drivers/gpu/drm/xe/xe_hw_error.c
> index f7799c3c08aa..269ce6a19a80 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>=20
>  #include <linux/bitmap.h>
>=20
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "regs/xe_gsc_regs.h"
>  #include "regs/xe_hw_error_regs.h"
>  #include "regs/xe_irq_regs.h"
> @@ -15,7 +17,9 @@
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_ras.h"
>  #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>=20
>  #define GT_HW_ERROR_MAX_ERR_BITS		16
>  #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -166,12 +170,36 @@
> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) =3D=3D
> XE_RAS_REG_SIZE);
>=20
> pvc_master_local_fatal_err_reg : \
>=20
> pvc_master_local_nonfatal_err_reg)
>=20
> +static const char *hw_err_to_str(const enum hardware_error hw_err) {
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "Correctable";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "Non-Fatal";
> +	case HARDWARE_ERROR_FATAL:
> +		return "Fatal";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static void hw_error_work(struct work_struct *work)  {
>  	struct xe_tile *tile =3D container_of(work, typeof(*tile),
> hw_error_work.work);
>  	struct xe_device *xe =3D tile_to_xe(tile);
>=20
>  	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
I think you should have all these in 1 patch for 14028434957

Tejas
> +		/* If the device is in reset in AER path, skip processing
> hardware errors */
> +		if (xe_device_is_in_reset(xe))
> +			return;
> +
> +		xe_ras_process_errors(xe);
> +		return;
> +	}
> +
>  	xe_survivability_mode_runtime_enable(xe);
>  }
>=20
> @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct xe_tile
> *tile, const enum hardware_er
>  		return;
>=20
>  	/*
> -	 * Hardware errors are reported through System Controller on the
> platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should
> never be
> -	 * here for those platforms.
> +	 * Non fatal errors are routed as a direct IRQ on platforms that suppor=
t
> +	 * system controller.
>  	 */
>  	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
> routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n",
> hw_err_to_str(hw_err),
> +				    severity_str);
> +		schedule_delayed_work(&tile->hw_error_work,
> +msecs_to_jiffies(MSEC_PER_SEC));
>  		return;
>  	}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> db3cbc186a51..e6a0ee468b17 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct
> xe_device *xe, struct xe_ras_error_
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
>  		ret =3D handle_page_offline(xe, info->sw_address, true);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported
> via IRQ.
> +		 * Wedge the device with a bus reset for errors that require
> SBR to recover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe,
> DRM_WEDGE_RECOVERY_BUS_RESET);
>  			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
>  		break;
>  	default:
>  		return XE_RAS_RECOVERY_ACTION_RESET;
> --
> 2.47.1

