Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17378CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 14:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82210E11C;
	Thu,  4 Jun 2026 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdpyztlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ECF10E11C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780582980; x=1812118980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CWpSYpLKiUBGeFKE6LkOQgROBCKWEUed9xa3tD1mubk=;
 b=kdpyztlZ+W0eAPPoh6l95FY+j1wz90p/ORUKP8rdJLTYLZUkzYKovQO3
 aKnjtOu2IjFDrmz8ooG11D9WJ3CitczCFg1nwfT+EMWBj3Y1fWPzDAkIJ
 s/T4S7kSJUVa7L2ASjdel8b0vTyKftPhwGUjubtObvQkYKHvNc2H/A9b7
 xH13TRYxyDdQN83PNUVMZ9Gt8HuRKCQS1aduVpn9FepYdD9eIX5X2Zjuc
 EI7IeWWEcfckf3iY3E+eqPlH3ygeC5PJFhRWGhTPifY/R+Bd4WI3uLSNT
 XQ9UBld1WB/BKE2h64kgs1ubQvLWfDRTOeg8I7ymBiwwSDyv3rESKdK4v Q==;
X-CSE-ConnectionGUID: DpiHWRvtRt+IzCoeyJyaSQ==
X-CSE-MsgGUID: 0r9ETw2NT9+Qcj9CkfX7cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81316421"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81316421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:22:59 -0700
X-CSE-ConnectionGUID: sjXn63/bRBGN5DK2ZGplGg==
X-CSE-MsgGUID: EBm0E+9NQhC3EPF2c4pd3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="244414391"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:23:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 07:22:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 07:22:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 07:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myr6eG8kKri2PKXPBsZVNAHCL8ZwZCZD0I2TNRdzZfHe5uH04OReLD1L6s+CnFeD/5OcfSXe4RSDaPCMS0jm74dUWKe76elWBdPhYFyzJ+wwkDhHurvsDxmXFCb4kKuu4lvdlayPUzgG7PCuZcLgIz6+5OkUqY4sPCWdUrZnnT55b0ERNd9xi61IcYTE/7EvOgRg/3U4SJeNmLV1mMJ2ru5X0z6Oe1tl3dNgL/QYaqrShmG0fbuz9QFbD5vqGyZYcUPuUl5ptS4VRPaz6pTomMid9MUSy2uRdOHyVhaUGPB/ovzxtP/KpqPIbdKzWnELvXhXDNhItJ2w5EXipGgr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bF78scwoD1jcOFyp0SDhkV8K4NrJPKtgtF99C3O5GJM=;
 b=k7+ntgnC0Z7CFCRRFNuURrJ7g1b5SC//xk6QDOwiv5qaBRJj7govHASHK6WMLmYrdokcZFCIH0Nw4/MvihtRNWJNZWAq1sL4P2t680Oug1rkr332Eew5sLJyfArBTFZuHHLp3cxmtpvj1vqLiSdXxCFdTQeIpoIuWwB5oRmJBL2vgzB4sKZiy18DK5V/IWyd++4BqeU5HWsBVJaY2LBgWCUJuPUOWdt6Sz2UEHzm4x0lNtTKRLR5W0SmjnGzM4j8USu/vloe0RQrGKbqHdBnwENbwiItAxuaZFZazmoh5Wvp3u1m5NNccQdPFgv49eRjY8lRUswzmfuSxF9ZbvuQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2717.namprd11.prod.outlook.com (2603:10b6:805:60::32)
 by DS4PPFA92F35354.namprd11.prod.outlook.com (2603:10b6:f:fc02::44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 14:22:57 +0000
Received: from SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90]) by SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 14:22:57 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/i2c: Report i2c irq handler issue
Thread-Topic: [PATCH] drm/xe/i2c: Report i2c irq handler issue
Thread-Index: AQHc85UJhNZ+/v9I3UeKBM0ti0ScT7YuVwYAgAAYDZA=
Date: Thu, 4 Jun 2026 14:22:56 +0000
Message-ID: <SN6PR11MB2717A1C01529294A3A96277CE5102@SN6PR11MB2717.namprd11.prod.outlook.com>
References: <20260603201007.3768029-1-jonathan.cavitt@intel.com>
 <aiFx2veqtpl9mdSo@black.igk.intel.com>
In-Reply-To: <aiFx2veqtpl9mdSo@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2717:EE_|DS4PPFA92F35354:EE_
x-ms-office365-filtering-correlation-id: 64097bec-5104-4caf-d693-08dec244c61b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: xX3wMjFjql1SldeNQmHbTHL3m1OhrRcWHA5mqNSfHlw6x5XahKgISFDs9NcVILxw3EERWcu/EFuWG811PaHtnfgmpNat30MHNlpk6MmslU9qMdD9ovVPW+Eiosa3paz75uGwORcSFowcdK+RmjKzAyfdeBnmysVSjZr2XCja42fYelpe7dvKAXrCWJljnb0bbxyV1xWxVbA9G/9PySf4+C0lI8u/OL6dK23A1xQrE9Hn+5iqLKhI0xnyddw4eMOVN9wUnfVK7lXYmBvI4yW6Bi2UCFBcNXUpaRz0DabUvd3adz/Q4wmFCsp+YlKGpNHnbhPK3mVJj2uvN9ejHk4kDGMe/fLWvGL4TS6cMAx1LcdVOPmUQTipqMWH6cjJH8ZKSkd6C54lUH27HgSJbm0qDOTq8fJaD2dX9VoEk94uPMC9RFyTDsxU+E1jrBfs/UF1vYFX+YGXFSwzwOboSNi1rG/7idpT28O3Qa392uN5+UrQgA1kYw2Xk3I1ytEMVIcxNcI6+f4efIVWabYASef9LN+cO47PTIWlwUnnyyRyLk+vQS4RLylOQV3Vrl5DeLbBbmI7Ppwgv17SItSQC30e1d0vd8YhTBcyLUBBXUwCeEOBGiHxt4lwGrudCIfl+xGLpBfdEcKExDxACHKtlJ8yU6tS7jcHHrhlc3KMZX4sbZkhr9XJEn6wCBpwK2HnAPz86GSGENX2j5OT4KF2lu7ySn8zt1tN+WcdVfU5cmI7Tz5gaROoOHT050yAC+zocupe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p+C+DPWwfNW2Qt2AGBLDT898Wz2zHsDdBfWco9FSd1JrZ+OA9AfD4iFLsvEo?=
 =?us-ascii?Q?mQQy6PJAzSQQviV1QrbWTgnuFNwsbkvOROgvbqjd1Z8CJEAOa/8bS7AXbSxy?=
 =?us-ascii?Q?ZpjmGxZhGXdk5HDS5HRhICmebciJXUPYFPYVOmdk3YRcsqxTLb9DUJ9qH9bE?=
 =?us-ascii?Q?YAxQevKRMU1LL2sOuWYTplwajCBbVPct7S26ssfh5Zcgks5U2PKfzuTMDjo1?=
 =?us-ascii?Q?eQUjEnESlf7fCi9hF3WeYQ+DWhtHIqstfOWET7KuiVRZRXK4qffOhuEFNtui?=
 =?us-ascii?Q?0gx06ZTcDWJo8YwNUKGCH0bUAbKmjO0gTeT0pI99hivUwSCTBMCqoOekqba8?=
 =?us-ascii?Q?P2XRpRJ7Wl7zPig4Bby0diSjSB1vrUgXQ7gkGjmJBt6mICWCau7/oL+aFPmh?=
 =?us-ascii?Q?Ns0Wu7WSic+EGKueef5C9jxRXYzo0sVxDL9NSVHMRZ8aPDRYQPCxT81qMrpe?=
 =?us-ascii?Q?AkjUu9T+etiz07keproY7opkiF0gjS7EA9QU8Eh8TyRN9q3cAmYUABCP6srM?=
 =?us-ascii?Q?xww20i7HtyIwbl4V7yXYPZe+S7sqJUlJT5UZ/VnE6qiMCLA/f9dpVzsnar87?=
 =?us-ascii?Q?kpRZvksnXuzIR69ntzd3ReB0XUY9Ni2BtJBvSBSEKvDGyM7auDeEzLeCG7UX?=
 =?us-ascii?Q?cGVE+tzsCD6xMjoR8Uf0amBIc82P4lguKWFX/+lyL3neUAxJBv1aRpUkMTTl?=
 =?us-ascii?Q?cKbucfm2W7/MFlai0msg3ONhY7bH/UjYqyMqQi9a0RTwShpncqueEupmsy9t?=
 =?us-ascii?Q?UiEmogCFju1B5xdO3OqLjwl+Yzn7g4uRP9nrRemHAd4Qiz0WbQhztVQLudgs?=
 =?us-ascii?Q?tm19dA9cuu96DZaa8t/UtSr+ERSrfxpkgQ6CU+OegLDt0Tp7BXVWUKxZrUtV?=
 =?us-ascii?Q?dF5ZmABtABqpGkF79vxIp5y4Z6hpfKnMPsQiu0F9YIWaHm5CXh3PcFSjVVz0?=
 =?us-ascii?Q?b5vV9hczyZvC/HKERJFoP+zFm2c4MFX0xZlR++6S6ylpwowuJKWLpm0cJu57?=
 =?us-ascii?Q?x4yLYP2F31qdaUxS5JLc9UWmwQMwGzZHtRpomPJqWQqGOsAwacJ5IxSSMSAz?=
 =?us-ascii?Q?Rmsm9usltpKiiJpboEsfIB/cYSJ9lDWJUvx/xcZHoD2ajkEidsSCANyqem1m?=
 =?us-ascii?Q?v7KIXCMIOiRn8pySJlBhF2sswd7Mr9OONfQCXZMp6xVyzxrC7HQKdPjx8Z0I?=
 =?us-ascii?Q?Rhzv6wu9UA3BGicIaR02XIqKo2OAgR6IAhLBz3+HaBUHfsWRGB96BZHp+GgC?=
 =?us-ascii?Q?DJAbd+5jo/9tuyENSSIQqBKUNNJitGcME6bSCWfB9LzEtSku9DRjKrFzkb5x?=
 =?us-ascii?Q?YgGr2v5bjYnNoRauwZr6YIYq9Vz0uhlQ9fiQP6jjQdFlzFOMBrtDTQnqY+KZ?=
 =?us-ascii?Q?m0iyb6V3/drcezv6bQOeQdv81ncsV4/KxP1fSnDBKPR+XZXxkQAF0nJVmIfi?=
 =?us-ascii?Q?z/kE5fUnrKuKoxXXsNDWPRtj78Esxo6USG0OOf8J9F+CgOpu0D5ob6JA4V0C?=
 =?us-ascii?Q?lKCeipQHnLoXoA3Fh9eHQThc4bTT0IJkpeSAFsogd0DO0uIorYYCriH99/UH?=
 =?us-ascii?Q?rcC8ktfJjlklvbGC2tQPFMHXm6/gVYh1NNvwqeW2FnrHZZKHfkO61R/WOJmE?=
 =?us-ascii?Q?VLZTDPDYcjOZmzoNTB0islJrb0CXHYGR/iAzYKQYRoqGJ0Zuk8J1DCTwryVs?=
 =?us-ascii?Q?xophMYqUpmQ21cs2kzqmV0FvDZxsGLHVI3Gkcwwoml8ep+qcgSUOVGR2DuNZ?=
 =?us-ascii?Q?zQ4DjHz1FK/tLIwy7RvdTkZZQ+NdUJwkR2Nq6Qvn2qjahOY0V5yF7nxfCEWb?=
x-ms-exchange-antispam-messagedata-1: ZVmK8ePBM9Jhwg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k/rLw/8NBCH9ykrD/UdE/nvtTyQ5H8SNAYvweBTSJlsWNLAr2eMdc6DF7en22UrNS62CfFGy2xJpUSXkFhddDcAIyj/FtzVaI6fGHH32tQ2gKb7xJ6ntP8p4JydX9jLo4RgeQH9C+5V4bYZHuNP6eC7KOm3opoI9t8Bc2YDdpp9gsdv2DEMhRoBYz3BrKvSzw8cHnGxmy413ojvsrg8U2BvV5yvYjoR6kVipvEQA04BHUu0pLq39dfZbeZ+tVPAv0AU4HTZIULBObobjdRuYGJvXhhShjqLMSOTe5/UrkbBN2UslkAk23IXIgyKCVIRlTlIuJ1K8NWEt8K7fFiVBAg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64097bec-5104-4caf-d693-08dec244c61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 14:22:57.0443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yy1QbjnCv90ZBiOnyK1Bj1PRrwvXN8snkqpk6FV/Er3FFmG0lTB4lqhj/f9RPEakBnGVI8iwxnZjw7u5pb7Fd9R9kPBNrl7Bk0QaYJQgE1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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
From: Jadav, Raag <raag.jadav@intel.com>=20
Sent: Thursday, June 4, 2026 5:39 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Report i2c irq handler issue
>=20
> On Thu, Jun 04, 2026 at 04:10:07AM +0800, Jonathan Cavitt wrote:
> > xe_i2c_irq_handler calls generic_handle_irq_safe, which can return an
>=20
> Use '()' for functions.
>=20
> > error value.  In all other cases, this is passed to a
>=20
> Why the early wrapping? Looks like the next word can fit here.
>=20
> > .*_err_ratelimited error message helper.  Add the missing error handler=
.
>=20
> There's no change in the code path so it wasn't "missing".
> I'd rephrase this as "Log the error".

It's supposed to be there, but it isn't.  That is, by definition, "missing"=
,
regardless of its effective impact.
But I can at least s/handler/logger.

>=20
> > This issue was caught by static analysis.
>=20
> This is redundant information but I'll leave it to you.
>=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index 706783863d07..acfc171483b2 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -177,12 +177,15 @@ static bool xe_i2c_irq_present(struct xe_device *=
xe)
> >  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> >  {
> >  	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> > +	int ret;
> > =20
> >  	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
> >  		return;
> > =20
> >  	/* Forward interrupt to I2C adapter */
> > -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +	ret =3D generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +	if (ret)
> > +		drm_err_ratelimited(&xe->drm, "error handling i2c irq: %d\n", ret);
>=20
> drm_err_ratelimited() already logs "error" so I'd rephrase this as
> "failed to handle i2c irq".

The current phrasing is consistent with all other uses of .*_err_ratelimite=
d()
with respect to generic_handle_irq_safe(), so I won't be changing it.
-Jonathan Cavitt

>=20
> Raag
>=20
> >  	/* Deassert after I2C adapter clears the interrupt */
> >  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> > --=20
> > 2.53.0
> >=20
>=20
