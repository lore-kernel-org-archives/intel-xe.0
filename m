Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2BCC6B2A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76A10FEBF;
	Wed, 14 Oct 2026 14:07:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55AE10FEBF
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791986845; x=1823522845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cf8ovyMb/Go+6qIRm7ew+4flARBUKpR6DevdHNVxr9o=;
 b=m24zE4RCESuM9EGv6P08e8VqIAR6J2kA88x1hBsrKFtgPScN2nhfSQVz
 w14umP9TpyS8a5MoT0ZWpOdARxd6cZlIBBk6VfzsTvTXvlcZGwIWPLNK0
 vmucPOCB2nWmYjbEFzCZR9x3ap44OG623JMLSXDGYkaK/QsoYZnLFN/Vh
 vl1aOzTSX3yRgLf54dje/M6QDqvuPtFsTYlRrc1w64CaSKJbDq/3JIcX7
 h5K36CGjPEDHVTmWZ5sPK9fvw5e1JFc89fw9yqdSLpvCDfD99carJ9aRp
 uyh5wM1hve3RjPcl1CbxyxY5rTgs/ar88K0I086RqGYHyGqaW7yCdzsqA g==;
X-CSE-ConnectionGUID: 6QhFcUhnR5Ke7rUj1+/ehg==
X-CSE-MsgGUID: Bv3fvuO4TdGa+XFkVxTz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="726253"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="726253"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:07:25 -0700
X-CSE-ConnectionGUID: v2QhzANVSuaYcKXrttMQHw==
X-CSE-MsgGUID: iFK56KVCQzSdhTnf9lEnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3282541"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:07:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 07:06:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 07:06:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 07:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTBORaz3fsfaD6pejQg7QWEPXb2uT4vw0LIaqMtq2MNkMULlTeiD13OcOQXFMdQ1uTNpsjzRtGpsjckI5Y0btCgGOh8R6Qgep4lWnSouWMZxwGpHzWdaN95/iZy7vH0S0NlJbfOa4Vr9ZcRdF2o8IrmhaUX0PpI7rMPRPwtvltK+BLzqsEZCgU7FspJAyiy5/kzpQOnc0ko8n0ZvoJ1nhJnWDg+c45t3qaqOThm6Mk/wRfD6OErHEybL3tLUkdxCamf4CFqGPQHlbr6A3GPTqsf2PEQllEIYukG5jqfheZB7IfgFbZ1fHj8Vi0m/bkeyPmJlHt2hjQwsUzUdI3yQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8vGt7bJDvJ43waVDismZtGePJDhF/f4+VO5t6axJXs=;
 b=AOXdSwS6WpQOKqAhE81Oxt4wYN6aTYZ6g9V06J3M92HBTT3OZYxMoEkZifZXWdlwaXYHa3nejUHJ4v1KxgPCzOiomv6KYfHmRx4LtAe6UCdlQrjpRMtSOD9uQe5YEfg0jz2z9hqfT0JdfGnKSJETRtqB3+yTtiWy7MB8Kd5UnmKUx4JfTC/FHSHEOH6eYfgGtZNjD5YS6IQcAaM6lQfPRXZRJOKMhhOt851ntTTVgGoLAJJyw01ObjhI00lzSBv+Yr1SZ3XWVypdZCfGuALJojprrm2435OYMmUX4eS7xiui79G/hPDeLba1J5OIUOjEOcOGXiQyXdVtnOjamAzziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS6PR11MB455487.namprd11.prod.outlook.com (2603:10b6:8:52c::18)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 14:06:54 +0000
Received: from DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a]) by DS6PR11MB455487.namprd11.prod.outlook.com
 ([fe80::26b2:d932:d78d:d43a%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:06:54 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe/survivability: Do not call xe_vsec_init() in boot
 survivability path
Thread-Topic: [PATCH] drm/xe/survivability: Do not call xe_vsec_init() in boot
 survivability path
Thread-Index: AQHdW0SeaD+GDXzVTkqiDsxx5Fi3QLb9Eshg
Date: Wed, 14 Oct 2026 14:06:54 +0000
Message-ID: <DS6PR11MB4554877EFFD76E28B3ED344C78C19D2@DS6PR11MB455487.namprd11.prod.outlook.com>
References: <20261007100259.2661003-2-soham.purkait@intel.com>
 <as5-5v1r-oArbrZ2@intel.com>
In-Reply-To: <as5-5v1r-oArbrZ2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB455487:EE_|SA1PR11MB8374:EE_
x-ms-office365-filtering-correlation-id: ce9261a7-3793-44df-65f4-08df29fc66fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: axdQSix/0XUARQp3OTQYgU6fEmiZcsixi/efFEAjP0Jerjg560vMOV7y+wv2IdPIg5mmOt8W0s+lFwU4BWBKvP0pGrp7RUVkQYfR7cswv6DA1Gu4uk5JiYWq3yjoiML+it+c/sn7kyzR3+QMY0BE7SZBJ64FA33O/3SfqhdE6rs0UYx8KGuDdIXCQ7vgKBOWEwkjqJdWUqhgE8U22rdTYmnVGCFD2ipKkX4nJx+e+lT54cxJEy9LFlgcq83QkyKlNBaWFxz6umd95ueksBM31/uAOYEQXg18Sa+3bHE7ImMybXUQGzXq5C8cbnkY5i5zCuJVXGn4gcrDn1UTxa6/IWDm89YOxkYnzjni9waF/+TLNk/dJ6xyqmFOFsw/uEXsi4myGmuhPSsFia4OobbgGr0XMG6fCGh1x/tX5Korw3gwAb9v5RnRVO1BlkStisebg1lNt/jQQpYvRiog0bcYB8Ib47/T5RFUNLqqVIAM7qHTcjxCGfNTONvUKHnG0ynwG4gxdqPnNovm2itt9rBJctiPRnd3VKTEUjL5TudFpkmVA+9ZT0fKONShItIqHKtTl4vmIGFZ77Dwi+gVexKk7QE2+orPsiEsIw9d4mym32mBZPghx7KM2q/xv86TvOildMImzdsQXJc3Ou3TqJw/ZGVr+2XY5o9aATjxuc6sBKg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB455487.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ohz+XSYtnnSeGHcbsTLeXxiPf0bS70r7QkBOmxkyi72b1Iq8m8+thw+jY6up?=
 =?us-ascii?Q?X8NXcgJ5NdAjAxTIPvpFWWlMhrJIpOaXi8Vra3PFYKt3ARqUOANkJtsmLeR3?=
 =?us-ascii?Q?7DAIzdauFpzJi9rlKJ5049bxP5meNK8x5e9go0tHTvKy5HjWogob2jpQ540p?=
 =?us-ascii?Q?rkWYRRzVSkDXmO5vxqZxFDGGC1RmeEmjtnXz/mirAKnLL/eKerBYHvWpDIJE?=
 =?us-ascii?Q?7vVu8MhKG+cGCFnDT+iYUHZegW9Oz6y891hFCul1ilQWisBnC8sE1G+N/MXX?=
 =?us-ascii?Q?3vodvOPNPseyF/GA5sTIh5gsAqbDHXeCsuKH6gvLGItzjIHcVRivw4rS5XhC?=
 =?us-ascii?Q?DYhLCqwo/Gy2XOqCxOLw5uPMVIAH6mIuny6HvYAFrqeFMoHKEB7GDp8R6jwo?=
 =?us-ascii?Q?j3h8/YOzEjDYFhF6tyEJru+h5Cjxkcs0w4W2hkoxvedCSwWYisv1LZMGQzFA?=
 =?us-ascii?Q?Hsld54vv4RvEJYlYdTSzZdvz83xcRdSBvCE5CAQA5f/fdpTF9Hm7PlNL2/uK?=
 =?us-ascii?Q?Sm2KzQUDp1dZp2RuC5V+l6bu9bzKGDKONSnoeEWH7TwPf/C4+gv1oy9DKn2x?=
 =?us-ascii?Q?KsxYK4ftKKTviVuvSE71lI2O7+Ye3OaZE5BaEBfOSFctAhHAPlrV0wedfFLg?=
 =?us-ascii?Q?yBjSGJuOM6KgBi7nNKglgNpjhNyKDorLQ8xAjmxdzZ/TOhoErPV4/XdevTu9?=
 =?us-ascii?Q?MBvuVL9c0mMTIjTHeO/GKxZVdk5fo2TSA891B7X0n5p67+YXXCbnL+68RLEC?=
 =?us-ascii?Q?imjhfffiD5BDk7NA9F5vMNR9ttbfhgBy0xdvrCcR0Ub1+20cLJR+3go4SX2x?=
 =?us-ascii?Q?bDno/2oP6/5h1cvEh1hMha51nIiP7VJhtzkei4dLx2ZHe+mOhaXyCZz6x+s7?=
 =?us-ascii?Q?9luOA9+wJ5DEM8h0yDtjHh74bzk7c2HUOirsHsoCXPjCATxs4BHFzE712lm/?=
 =?us-ascii?Q?Bd6hQT3rtOV5eWbQe+bRZa9fANOXff353g554Gkp3ARutnUluYWdmVeTHmy4?=
 =?us-ascii?Q?JtdrBMYz7tiFHRB/cfkRz/owaRfZ172GWVRpd252ipjxFIT/lutMbf/aNGvu?=
 =?us-ascii?Q?mbyHVBjcuO/K06mzaBkrB3Rr3gII4KAivWLAHKyXAqE/jROwTNeiWwNUF2Q2?=
 =?us-ascii?Q?XzOXB+7UrFjIBjrSIAJ65t902iQX0J4ySGnesvaogdX3LahyPv2cJ3ryjelj?=
 =?us-ascii?Q?GMpqMWz34XRPnvPMekUGMWarYhvsupUlwu0nYk7YSXc9C0bPwsYx5KOMW1QQ?=
 =?us-ascii?Q?3cwD+hisT9gRyroPkkoySIr0Nx3KGmNIqYRYmaA+eC4mF6eHeNuQKJqsUA0A?=
 =?us-ascii?Q?hvOR8Kz67FonHRlgWIbXsY8G2EQv9dwylsRrPltzIJHIGYg61IGTBFuN39Kd?=
 =?us-ascii?Q?mjVdkGBsg9BXYUtyNX3PfLVfIB0jn3mtCp+hJY24CKxryzkwN5ElcfXG36DI?=
 =?us-ascii?Q?MZ8j5UfBUs6ORBKZad2y/XVRuvKFrvDvcDyAUtbAQWOgz0cFUhAKjDFQPepl?=
 =?us-ascii?Q?mRF/W6aMqUYHH4DETTz2DIsLVOLHov1FdDmMhdulz9FQsNFqB4hjd92lVFFl?=
 =?us-ascii?Q?T0+vBM93XxMQMrkACZqgtVdN5dXNB2bn9lcHIkWiFUMBVO1ORbjyZZYzUMgk?=
 =?us-ascii?Q?KP/CKw2YFha9RxNt5lHgtzylyCUZmU8mzlPoz23SW7PZ802evHckYDtBvNgf?=
 =?us-ascii?Q?HcEkdvzmOglKk8uzUDjKec2KJdQT8HCDXl/U2uTuB9I6sexn1dF4XnOOZoL2?=
 =?us-ascii?Q?QETRtCidjw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jozksRyo+GbwQw22ELOB8aCmFHpiGNjHhUi7LKylHa37J+zr0tqKFXm2oSboaSXB4em9AIf12ZLnout+iJxQeQB4e861zJbvIIEEfh9by2gFpXsv0lJQF1XtEbGdS9XKXLXtFhecb851XXEkIdrD45MjdYepYE7tOrQCNuO8NsnNHFrxZ/1oncpcpAXwfDFLsjunVKKihLqb59cllhQ/a63fr18Pn+BLmHpLNqWctjN0dP5XM+vknkW6nMkd2qat1R99L/pOHB3ZmBc7lJKvxtia1q45Y8tSlnvIpfxtTX6KJQTNKblBLW9y2lIFY2neXnLEAZ7sH5a56b2DxiayEw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB455487.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9261a7-3793-44df-65f4-08df29fc66fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 14:06:54.5690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sjCwt2ftxY5tv+6Bc+A9nRno1fxulLWOEI/8J270H2DD2hJ51V2J7sELS593H69HfG85STAOXrGayoCvq0iKZIa/DvL/fVI2UnFcn5ZOe7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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


>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Tuesday, October 13, 2026 2:57 PM
>To: Purkait, Soham <soham.purkait@intel.com>; Ruhl, Michael J
><michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Gupta, Anshuman
><anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>Roper, Matthew D <matthew.d.roper@intel.com>; Tauro, Riana
><riana.tauro@intel.com>
>Subject: Re: [PATCH] drm/xe/survivability: Do not call xe_vsec_init() in b=
oot
>survivability path
>
>On Wed, Oct 07, 2026 at 03:33:00PM +0530, Soham Purkait wrote:
>> Boot survivability mode exists only for device recovery and firmware
>> flashing. It does not need PMT/telemetry. Since xe_vsec_init() only
>> sets up VSEC/PMT, there is no reason to call it on the boot survivabilit=
y
>> path.

My understanding is that Crashlog access is part of survivability...

I have updated my CRI PMT patch set to address this requirement:

https://patchwork.freedesktop.org/patch/760018/?series=3D160717&rev=3D14

If this patch is merged, it will block that functionality.

Has the Crashlog access requirement been removed?

M

>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>
>Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 45d44ebe288b..f5985938c60b 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -351,8 +351,6 @@ static int enable_boot_survivability_mode(struct
>pci_dev *pdev)
>>
>>  	xe_heci_gsc_init(xe);
>>
>> -	xe_vsec_init(xe);
>> -
>>  	if (survivability->fdo_mode) {
>>  		ret =3D xe_nvm_init(xe);
>>  		if (ret)
>> --
>> 2.43.0
>>
