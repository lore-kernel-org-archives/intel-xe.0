Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E02CA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 12:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004510F3A4;
	Wed, 30 Sep 2026 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3Fp+Wj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207F610F3AB
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790773060; x=1822309060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sgoq13onKrx+5fH9yy7XL8XxCVcm3jo1rXpGL2DENp4=;
 b=F3Fp+Wj5RVHhtJJ0n1ZFAf9jsQKR7CCK1pcIZ0JLbmILR49VNt641b4h
 SdxQA/ra++JQRQX9bC1whRFMCZ4uT+FwAOMpBbufExBdjw6NQiaS4X+eX
 SADDKLrGyXh8NMT84ZCm99vS/Z1Z0n79/pXCOuvxHQbp9iElkZgb6/ldy
 wW9DhxYCmolPnW8Nsqf/XAXN6mYimPP8uP37vlD+O+EIJyqvwv8pznGGy
 UIBIpwaOZTStgPNUB9pZ+YIA8U/mB4OldgjV4qsO8nn85vWzYHeOw2tGM
 BCBZJ9Msz1DvY7NtgwNWXoysDqjjsEY4X4Qb8Ev0LZiW96DmUTeVJT0s0 w==;
X-CSE-ConnectionGUID: UdTJePraRWODRru9bWxagQ==
X-CSE-MsgGUID: H2bnxsR4QsmHV2FzIpFKfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90558946"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90558946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 05:57:40 -0700
X-CSE-ConnectionGUID: WCAvshDhR863qxpJc+qtYg==
X-CSE-MsgGUID: AvcGviwaQcq8kPD587GZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275234845"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 05:57:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 05:57:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 05:57:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 05:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or5yb76KExP9ZdX7WgTfrG5D7lsnjlKGeMie8oZOoxu4Z2HTomEZ40RpxKJyKd2mVYXyWlVU4Y1uGZpypyebDNZ6ML/8RC/7zjGxcWY8BIGE9NCz9UrZXiOrUBESjbmQ2bBcCmSnrRNx4eqSWGUjg1TqwRzoidHgNgFNT737s1alxEhFqXY9DzjxnAeBxPje5htRLbTQeH1blbupriBGFN1KzW3cup0JOW8Gkw3gjx/u47B16Q1TyyK7of7rLNLqL4xLqQAvIA6bHbrXevJi92fw4ExoUyGHsBdZOUM7qBbN0qfcOvhgUG93nyVwKpgalWLTl3dyAHWnQqmTQUbRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMMgMusYfEVik6E3J1tcCHlVtjPD3hYKk/GPCHJvFAU=;
 b=OB8H91r+mRKEdjUKWU9pILTiktwDKfHMExAXTAdnCE9sClLweznJOdA+2mwV9dvOnhbdFBMc3cbgt/bZ56SPYnKb8VxosND72thrO/czVK/0I4CRxyMFWgafQ9mxqyTOrgjAzoVw0KfDoMjP8y3PaI8+5JvSzpiYIFj0QtfOVBllfz0SPIatfHFTjC+YYtxCsFeZYjUiaFeDV9NqJ4EuaAgH/zmPoT2nogjVZCoEUN1IJGRQNVhPq3ALjU1GkBaHqY4vMXYmqAvhIPN2rpL9UjZVaYJBiTAtgSVEB2js4yBl2u2VeAk8gtyabc2XfCbERzFVSSFNP48k3IzUfQWNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by IA1PR11MB7678.namprd11.prod.outlook.com
 (2603:10b6:208:3f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 12:57:34 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:57:34 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
 <david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdS4cds6Bpox/KB0KHpVzIxWAP1rbmi+CAgACTJqA=
Date: Wed, 30 Sep 2026 12:57:34 +0000
Message-ID: <CH3PR11MB0461495FC2ECED12A6574C8102C18B2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-39-michael.j.ruhl@intel.com>
 <aryLbyn1nW5CysJC@intel.com>
In-Reply-To: <aryLbyn1nW5CysJC@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|IA1PR11MB7678:EE_
x-ms-office365-filtering-correlation-id: 97237f2f-ac10-418f-faea-08df1ef2658f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: MzAgJCJMt6JjPVawnjWJF0yhKrNFq8amXREQ7P9gCVom7A7rnq4KZPIF43dbREl6Tt1jVP5RSrmbNqKLdnBIUP3l5uN9resaubL2uFCij8b4AOTMa3jdi9NvIYHD0DrMwbomQ8VWe9CLMIIGfQt0qwTYbM6nbiaX2KKvT1lQvXgbB+wncx15LRWi7YXAov/2bvh8NBCU89+wity+t40W17vProtHiB4RSM1feEigm+E9Zj+g2aaMjUjKxt2m5Cxv89jSkIrDWBgIIYbhwwU49dERyEwFXLOMw4T5ZC8x6Ahwh73JP+kOl5l8nf5ETyonj5Z+jCdsVQ+8deOUyF+Bli2tMrXX/145wlRKjyrqwEPkXsOpMQHmJmc9uI0bPQVe4jK/szHDScYsYXlKDj4FYYyt+jbc+p5nGy/FOxTdTkiy24/pT3lrHNO+2omQ/ZoQMJyeQmRK6qUhiFU3D0FzBgwwsqGIbAypHuWGtraahXUDIMYHeR5YHjptAo+0iLdIjX1wfPfbdnW8uTPuS9ysPu2OKkybY5/5LWq0grC8qV2gIhQTYSUfzo5+Q8ToRl4pOIwOkOkHLX43gFe7yu8XVaxXw2Z06IgZ9nFqfP3GaJ0rC9j81ZYEW5p4pbm3sIf8gsLQoMDGHFW5MDcTX20jEbtgV2QV/eOqdBVjERNz4g2GwY26ELSyX3ckt8izGF0AkSjuuQnMY1nTIvmLEZ+J4jkpd05Ay0cb3jpqiKU01Rs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Te/erdLzdOyX4VzN/eOfC7QtWVEgWU0FQWN50nUxIs9daj1RPrv7bGLbXK3x?=
 =?us-ascii?Q?pelH71fPTGHXjqYqBeBEA4q5OdNdQ1jhvrqDy2+tr4VGj8Toc4fL8tJo4FcJ?=
 =?us-ascii?Q?FAzM0ZlWWkxREEBjDGF/VoS3ojsV0eWbrHZyj6Hk181d0fk0H16eExRP2EYk?=
 =?us-ascii?Q?bsN8xACmKIiW52/u0YiIaFy8A/sWQMbc/16UXaRu8qip8+AnQnuEu8flHwFV?=
 =?us-ascii?Q?DF05PprBOtV7gqvqzrXj+BG7Ealq9+YzHSBciQsE773tI7Vd1KOOhoYSh4Bc?=
 =?us-ascii?Q?bmYIV31MiHTVehItFruJId0nZXoXASj12imiWPPcJs0hL7ZAxJgaxPdGeOUH?=
 =?us-ascii?Q?1JuFoF+z8cDRLFc8AFsGxsAqEX7ZdGBPk5bZrBMsGo6SvwsDhpfR1H0tYiOj?=
 =?us-ascii?Q?ruqvceKfaNpXB2Z2AUqI5FW+XWz0ula3TrDYWh1QY+DfL2LJaUwR+bHLvius?=
 =?us-ascii?Q?wZP4I2UUcAhAcTkKFvuCqhbJ6rI04w/JKCDezTW4ILuJtNiTOTWm1qytqFom?=
 =?us-ascii?Q?8+QqPTX2XCT2SFMVhnRWF/9oMz813L0GyWc7SEteuFaZs1WlPMjpYANjXHuw?=
 =?us-ascii?Q?GZ9LNesYk6XrQeSiJ2w1yjRaZqq4aOigVVOL3RNItsb2JkSKNOgSzz7l4xLQ?=
 =?us-ascii?Q?GH5YO1JJgN7DhSAV5lJvUBFFSzvSHB78lyFczdSgiG38EJmDKl5ekgMUdfNC?=
 =?us-ascii?Q?9ZAqIjayvJRMiaSo7NdgQ04kNusMlMak4n7cY/heUjg5UgtxndIwe55ZINPc?=
 =?us-ascii?Q?F1eGlNSbgWJZ5QjHLwKU9FOC8jtdRicnr26m6ozw22ZB3RaacxDKZ5OCoJK4?=
 =?us-ascii?Q?qMpJzjKqtZGjPKhOQ+TajvZj5ybwwwRW5TU35oh0SPGwM2+IThFqq5PgYOFD?=
 =?us-ascii?Q?uiaqV/8eIgyRArUcr1rVBsvox/9AfRJnG68iDmenNGjLnDFfWRX8OMXWuzx8?=
 =?us-ascii?Q?G99yCufgVoJTfxZQGH5O4zrJedzY8Sz4it2BdeD7lRVKxR9vBO8sSdHJbxkQ?=
 =?us-ascii?Q?ZZLNNzUiusaP15Lds/ZzHjs/uLXA4cT7h8uiXQpq892ZaMHTQm/xNRT0YJuD?=
 =?us-ascii?Q?QPBemBteafWjV+xjoQVK7NTBOebUV3+XkWDAoKi3JkpNHwmYx45Rd+JIHPt9?=
 =?us-ascii?Q?QjPPIwTLD09g5CM3bBCPfAbdt8dE9MbmKp5ADmKvKj63rvXHe9H/V99tq68m?=
 =?us-ascii?Q?E7xoFxxMjUyDMbSMt/UBrD6Jjs5Cn6510BGljUeycsonUqI11oKzEof7zQTg?=
 =?us-ascii?Q?eaVFtUkffO/J0uD9/elEuKASx44hh9VCeJ2dS3BFVcLOQJ+QxrQYMepVj9ly?=
 =?us-ascii?Q?FIjQrCUutxSDsDWC7SEb9rTMcC5XpCvd503o17e9vIi7o85i+flP3RFJCcsm?=
 =?us-ascii?Q?gvOPXQ0VrXXae8/cl4PvDgJG0YdEXlDyrlFNzfVfwyUzcGOtlqEHRkjeC1CF?=
 =?us-ascii?Q?g1IXeiQNPlqD7JfpoTr+e3Iemg6QSRThBmsTU+PVw+STUgz3pndo5CHm4c9x?=
 =?us-ascii?Q?SI2jtYkOcDAliI6f7PlZ3blFVtd1S0hTkiSTesQ3l7tlev6JAemlbeW5c7y0?=
 =?us-ascii?Q?qN/hgTIOCRXU6Eg0kGqilnJvn/10S9/+kJaGhniuzWG1qf1hnqoTcP1Uv5wO?=
 =?us-ascii?Q?4QPfTkSi//v1iZVd/a1/uH8amN4Jn56KYMb8X+zUmO7ptoKi/SZ5hnwduIMl?=
 =?us-ascii?Q?33rHv0vu69xPo+giyPkWabTZyLoeaI3o+ougvd0R2Jok+5je/k89h3wzobdb?=
 =?us-ascii?Q?ILJ1jgnlWw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UMLtenoHIhQMg0RE4dDL8Op2HUfISI9GThiue2i8gXZfNp/QAWb4BkSbYP+keGYW4pTFRa3t3xLSK4IohUSI9C8cIxdIf5R7Gwdfynj0fJFONeQEU2ZEuGLXN3NLP38hSRYqENLN6P0/cElk5HRtSpTVA1rize0KKlrdAhM82R7qE6UVs8dknpWBrYyXgvpBUiMsP/cgCngXvX9Ih6cxQ+7QUWJ+HTagK1iio+bMl16prwa3PmWuHIR6umdsRbydKY7QGW/42tpl7FhD7R/PlBoe6uLfwozLCv7nTtXXc4hBrhXsP8/3DWtABRkReV8bu76GQgMlIRoDnYokJd4O1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97237f2f-ac10-418f-faea-08df1ef2658f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 12:57:34.4624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yzpu7dVmviVTQP2PkbfB/uZzGq5VC3E2I5cNPCR9YHSWMLKDgCb6Jro235q5QRe2dkYX36GPICOyXBRffh4lMpCOb+d1T0BbTPMog9ygoH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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
>Sent: Wednesday, September 30, 2026 12:09 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;
>hansg@kernel.org; ilpo.jarvinen@linux.intel.com; Brost, Matthew
><matthew.brost@intel.com>; thomas.hellstrom@linux.intel.com;
>airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
>Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>
>Subject: Re: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw informati=
on
>
>On Wed, Sep 23, 2026 at 11:11:32AM -0700, Michael J. Ruhl wrote:
>> CRI FW is loaded on power on.  Because of this, access to the FW cannot
>> be done until it is running.
>>
>> Update the XE PMT probe and access to check for late bind devices,
>> verify, and wait for the appropriate FW state before probe or access.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>We do need this patch. One potential but unlikely corner case is the suspe=
nd
>while this worker is waiting... might be worth investigating, but I'm not
>holding/blocking on that:

I take the xe_runtime_get() before setting up the worker.  Once the worker =
completes successfully,
I do the _put.

Can a suspend happened in this case?

>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you!

m
>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |   5 ++
>>  drivers/gpu/drm/xe/xe_vsec.c         | 129 ++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>>  4 files changed, 134 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>b/drivers/gpu/drm/xe/xe_device.c
>> index 3ec950606e67..a2c8c7909688 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1053,7 +1053,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		goto err_unregister_display;
>>
>> -	xe_vsec_init(xe);
>> +	err =3D xe_vsec_init(xe);
>> +	if (err)
>> +		goto err_unregister_display;
>>
>>  	xe_debugfs_register(xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>> index e08348a95b28..8f5cc5d65419 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -7,6 +7,7 @@
>>  #define _XE_DEVICE_TYPES_H_
>>
>>  #include <linux/pci.h>
>> +#include <linux/workqueue.h>
>>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> @@ -488,6 +489,10 @@ struct xe_device {
>>  		struct mutex lock;
>>  		/** @pmt.base_offset: device specific base offset */
>>  		u64 base_offset;
>> +		/** @pmt.work: support late-bind probe */
>> +		struct delayed_work work;
>> +		/** @pmt.retry_count: late-bind probe retry */
>> +		u32 retry_count;
>>  	} pmt;
>>
>>  	/** @soc_remapper: SoC remapper object */
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 0f6e3be520c0..5384fef5e5ac 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -3,6 +3,7 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/delay.h>
>>  #include <linux/errno.h>
>>  #include <linux/intel_vsec.h>
>>  #include <linux/module.h>
>> @@ -18,6 +19,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_pm.h"
>> +#include "xe_sysctrl.h"
>>  #include "xe_vsec.h"
>>
>>  #include "regs/xe_pmt.h"
>> @@ -173,6 +175,14 @@ enum capability {
>>  	WATCHER,
>>  };
>>
>> +/*
>> + * Late bind will delay 100msec for up to 20 seconds
>> + */
>> +#define VSEC_LATE_BIND_DELAY_MSEC	100
>> +#define VSEC_LATE_BIND_RETRY		200
>> +
>> +static void cri_late_bind_probe(struct xe_device *xe);
>> +
>>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>>  {
>>  	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
>>  	return -ENODEV;
>>  }
>>
>> +static void cri_late_bind_probe_work(struct work_struct *work)
>> +{
>> +	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>> +
>> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>> +		cri_late_bind_probe(xe);
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	xe->pmt.retry_count++;
>> +
>> +	/* wait up to 20 seconds */
>> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	if (!schedule_delayed_work(&xe->pmt.work,
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>> +static bool wait_for_fw(struct xe_device *xe)
>> +{
>> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>> +
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +		return true;
>> +
>> +	while (retries--) {
>> +		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
>> +			return true;
>> +
>> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>> +	}
>> +
>> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a
>buffer
>>   * @dev: valid Xe device
>> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>  		goto dev_exit;
>>  	}
>>
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>> +
>>  	scoped_guard(mutex, &xe->pmt.lock) {
>>  		/* set SoC re-mapper index register based on GUID memory
>region */
>>  		xe->soc_remapper.set_telem_region(xe, mem_region);
>> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>  		memcpy_fromio(data, telem_addr, count);
>>  	}
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	disc_addr +=3D inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>
>>  	scoped_guard(mutex, &xe->pmt.lock) {
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> @@ -404,6 +466,7 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  		*reg =3D readl(disc_addr);
>>  	}
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -434,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  	disc_addr +=3D inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>>
>>  	scoped_guard(mutex, &xe->pmt.lock) {
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> @@ -441,6 +508,7 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
>>  		writel(reg, disc_addr);
>>  	}
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> +static void cri_late_bind_probe(struct xe_device *xe)
>> +{
>> +	struct intel_vsec_platform_info *info;
>> +	struct device *dev =3D xe->drm.dev;
>> +	enum xe_vsec platform;
>> +
>> +	platform =3D get_platform_info(xe);
>> +	if (platform !=3D XE_VSEC_CRI)
>> +		return;
>> +
>> +	info =3D &xe_vsec_info[platform];
>> +	if (!info->headers)
>> +		return;
>> +
>> +	guard(mutex)(&xe->pmt.lock);
>> +
>> +	info->priv_data =3D &xe_cri_pmt_cb;
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> +
>> +	intel_vsec_register(dev, info);
>> +}
>> +
>> +static void vsec_disable_late_bind_work(void *arg)
>> +{
>> +	struct xe_device *xe =3D arg;
>> +
>> +	/*
>> +	 * If the queued work is canceled, the runtime reference needs to be
>> +	 * released here.
>> +	 */
>> +	if (disable_delayed_work_sync(&xe->pmt.work))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>>  /**
>>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>>   * interface
>>   * @xe: valid xe instance
>>   */
>> -void xe_vsec_init(struct xe_device *xe)
>> +int xe_vsec_init(struct xe_device *xe)
>>  {
>>  	struct intel_vsec_platform_info *info;
>>  	struct device *dev =3D xe->drm.dev;
>> @@ -490,11 +592,11 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	platform =3D get_platform_info(xe);
>>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
>> -		return;
>> +		return 0;
>>
>>  	info =3D &xe_vsec_info[platform];
>>  	if (!info->headers)
>> -		return;
>> +		return 0;
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	case XE_VSEC_CRI:
>>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>> +
>> +		xe->pmt.retry_count =3D 0;
>> +		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>> +
>> +		xe_pm_runtime_get_noresume(xe);
>> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>> +			schedule_delayed_work(&xe->pmt.work,
>> +
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>> +			return devm_add_action_or_reset(xe->drm.dev,
>> +
>	vsec_disable_late_bind_work,
>> +							xe);
>> +		}
>> +
>>  		info->priv_data =3D &xe_cri_pmt_cb;
>>  		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>>  		break;
>>
>>  	default:
>> -		break;
>> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>> +		return 0;
>>  	}
>>
>>  	/*
>> @@ -517,5 +633,10 @@ void xe_vsec_init(struct xe_device *xe)
>>  	 * resources.
>>  	 */
>>  	intel_vsec_register(dev, info);
>> +
>> +	if (platform =3D=3D XE_VSEC_CRI)
>> +		xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>>  }
>>  MODULE_IMPORT_NS("INTEL_VSEC");
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>> index a25b4e6e681b..c4a1e2fc67d8 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.h
>> +++ b/drivers/gpu/drm/xe/xe_vsec.h
>> @@ -9,7 +9,7 @@
>>  struct device;
>>  struct xe_device;
>>
>> -void xe_vsec_init(struct xe_device *xe);
>> +int xe_vsec_init(struct xe_device *xe);
>>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
>user_offset, u32 count);
>>
>>  #endif
>> --
>> 2.43.0
>>
