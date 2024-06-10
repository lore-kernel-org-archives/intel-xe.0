Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17DEC27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 17:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494E10E07A;
	Mon, 10 Jun 2024 17:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLKuYDjw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00BA10E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718040766; x=1749576766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hOi6zisEkzB/Kl9raKpaUZfdcSVZeEGYmj/9xRcxLgk=;
 b=iLKuYDjwW5GGEfQQxwv+sa6RMPE51C8UgYP5V9GvF7RbgY1XHUgITRLc
 DUNd+GPSMdgf565SpaOUCssnEVdYDClqrH2uqzJ4YLEJJ7f4wjTtSnIjA
 yE7GR2ZBqtY0lim4Nn7mxdA/dzyO1K7JnBF/eUJBw1gWh/BamLMpDIiH4
 vm/W7HEvowGQAFxb5dGzeV5VIC+L98oxFGJIOqN+WoRxovf5X+TXU5JIt
 SZvNe6eRM3lhl8JdVXNuvLiB6ve0IZizBE+M3N/E039Z/YyWQIXUlN1U8
 QDXmeRTIpKKY4pPIEudlXrWiUoOkw/pQaYvfp7cvQwOlW9Ed5SBditRQw g==;
X-CSE-ConnectionGUID: U2s0F+sUR72Xf942n2uJSw==
X-CSE-MsgGUID: m7RWBgvYS0ichBOT761qUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25379522"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25379522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 10:32:45 -0700
X-CSE-ConnectionGUID: nolsAm59RT++CS9po3NZTw==
X-CSE-MsgGUID: neR/SO1mRx6jhPa0uJLtUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43558338"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 10:32:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:32:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:32:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 10:32:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 10:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPDuZKSiVm2K95OXppDTgorPMDv+khXvKaM9dxDBHnzEaFPazRrEuLpM5wsXlD1uPUJPG5dz/ROeRoYEfckIhvttaUleD02Mjgth6K6radECpB67GWsFIW/BOk3RkzJ9KqKb6zFQ8ENrVzK9EdC5GD8nybD9yVx/6tVEc9Cyp1cWfNMOl8cCQgm/l5+10g/ebmzBWM15pBorpa8xtCioU7x1UqUWIlF3nvOROV1XY/LEgLY7LLN5bboPh+A55UImGZXg60Cb5qYZvCrcVDqYl+F2cAcGQQ7iml0F/ntrpRCQpfndXa9jNqhlfM4lzEZ+qFcuauYKFGxhceM6zyd1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPHsTuIBEGigWxGT7F6AxNZkil8nga4tFdZPSJtCISo=;
 b=LP1AdpbxZkeweWyA7VZ38w6T/DMrZkEebf7w7HwAwfjWivw5mWG3UV4FGBhc2GXcewj9eosaulOdHXdyiccg4dHMs0XsAt+ObbJkzs83r6CUABoidt1599Qgt1i6OXA8uLj+wPUQE5tofi86Ceh45QhSql4Bv2mvjzp4l8lG0a500zA+ykehWI8yrwlK21AejU6rPWB3oMHgvMaKsZOgUor3HSS9dqREB/ujlue/42pIn4+4P86fH9qgFZ/+gStRqNX/sAS29b/yv3mENuHkwzp2lQOPxyIZ73B5qfNzBphawJsCwDXVKzM+5CtvZ7dnO2dpdz97s/Juy4TOzA4xCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 17:32:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 17:32:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 01/10] drm/xe: Add LRC ctx timestamp support functions
Thread-Topic: [PATCH v5 01/10] drm/xe: Add LRC ctx timestamp support functions
Thread-Index: AQHau0EWn04VFbvL7EGpcopyK4cq1bHBPyjQ
Date: Mon, 10 Jun 2024 17:32:35 +0000
Message-ID: <CH0PR11MB54447C7BA91C9DA8283CE3CCE5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-2-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN0PR11MB6087:EE_
x-ms-office365-filtering-correlation-id: 05363c59-8374-4ac4-2cc7-08dc897350ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?uChGoC4wjPTfJy6FNRcJHFhGxQsMDoucdXJDOvz1xD7vkm48NvEO34FliQky?=
 =?us-ascii?Q?nwuGPi/USyCN2SDJxbxL/fqut1I/90K6uFfmSFpcNCeXAe4gN3oqm6rlPlwq?=
 =?us-ascii?Q?ziAsQNGz7h28+PQLLusbAqfL4AXyrgJDLW0yVtcJg3kwojWb2He5kU3fZ4mX?=
 =?us-ascii?Q?DkSHKi+xFQfW6c2Yo/EBvvnc5PSFnUdQpaaBdZ35/YMDKM6k3epPwL/asBLu?=
 =?us-ascii?Q?Memzcc6Imaw1+Iv1q5jQP/MtCgAudYy6Squuq+2KMH6sLSt2N0k7RsoziwJh?=
 =?us-ascii?Q?5W6jnXRQMLAgpNai2V2tbTtzo9Sz+KQk52Xx+1WG8XDpp83bDXCZCdmPJkIp?=
 =?us-ascii?Q?biUzWgr53EBiER9qGk9mR1PHv4TAvMddpFDV6m4asrfPJJVbTi+vH9hEYeZe?=
 =?us-ascii?Q?3619B0ip6JkxNLQT+wRcVtnfx7Bi2RFy08mY2AoYp/JgTAYF38tGr+xKjCrk?=
 =?us-ascii?Q?7peq5zuR9iedhYSv57P1GmHxvypwcDI/w6S4nD7JP5w/5BsN1S9aXbDp53Lt?=
 =?us-ascii?Q?Iylj6nFDXh8aIiBrlI3na/B/6GToDPAr4mezZCNPCJKNwYFP4CCKAA3rvC1G?=
 =?us-ascii?Q?P6KSt3zLj7Ry4lbiyxcWelrEXqUr+2EJuU7XBiYNj3McMmCkg3KfSM7Uj9x5?=
 =?us-ascii?Q?xDdOb9q8f70kyHDa03vgz7HAakn/5aJKRMmhCtkIrPx8J8xy+NeweR6T6BJD?=
 =?us-ascii?Q?O1NlOQ0CNMorTsQTQaSxfE3rK9Y6/46uvKufqxfAbY9is2aAcrTaLv7qjXh0?=
 =?us-ascii?Q?IbPI57hFdrY1IsqfHlKOXq1x0M86L4UyUHVS2ThjLIajnHesD+BDASDRBWA3?=
 =?us-ascii?Q?Ut6v8fVwab5gtKOe9URIqi98pyH6Sza56lidmAiqKklMrHO9fHLFioUSORJw?=
 =?us-ascii?Q?0DwEqXnSJJeI1bGjZz7VGXiAqjG1bYvfBqoLuoJK09QITvFB5zgdRsAIfqBo?=
 =?us-ascii?Q?x+CS6XLaKFUkm8Ykbjyu8Saiz/VVAfQO3EE/f8elicYqv2nl+pbAJ3cIjgto?=
 =?us-ascii?Q?dm/O0szKFW11Cq0oZ0RaNxGbYszT/PIOmQ3kA76su/sbIvYskzcgv7wjbnr6?=
 =?us-ascii?Q?/gdIMSPehPwRxRI13J2Jr2DbdIvAkLTpPkiV7/c4NyYT25lJb09wAzAaI1YA?=
 =?us-ascii?Q?VAv2dy4qItxeF8qeyeLYDmV3qGQ/ucfUflwgIf2AphrR+iEoxf4qyTKNwDYn?=
 =?us-ascii?Q?NCDK5UUS29d3RI4CllJYJCmT0A8J/Kf647AJIn7f2TedBRh0skTaQLIRnGNz?=
 =?us-ascii?Q?nEJjdJdOt2+hJ+Q/vVtHrljeh3/VJv2o0MoLvfmfa2j0PI6s36felQVaUL/u?=
 =?us-ascii?Q?9IFiB7Q2dAf6y+dKOulKcDnzh2a5iv/ytKonAQYFzsw3+//N+eQbK9B5R8gb?=
 =?us-ascii?Q?YGUwYV0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8Bb0OTLIQEQf092RyJaYSp/mlPy6A7VsSxfnYkUP9WL3uh255KkqulpFpzpX?=
 =?us-ascii?Q?Hb71Mau+X2NLvi/spJWrTaOldFgXRGX2xQ/+3kcq22dHbZTJRv52WSR+koeq?=
 =?us-ascii?Q?FZMz0ywdpKDGf5tRBCoScaOLu40So+puGlM+MzYIWO1TGkINlT6HoeifcM6N?=
 =?us-ascii?Q?7zT9iNZmGjchCSGjpDPpiOJl4dTOrC0Rw4FPeDNeEpGPG5QSu7bEUEB0gzCy?=
 =?us-ascii?Q?e3521AIp93NEcavnJnMGr7KDs9QlkbOv9t/sDc3krU86i+B+nhynSuvQ+VaE?=
 =?us-ascii?Q?q4IXqcHZbjDbazXjaA/LXkBklopcRuHXrxEH6OpNsqbiAM0d2NA4T5DFHyK6?=
 =?us-ascii?Q?iRxHMfOvD86qJLqDoSYSDieavG1BbkZMLERfV4LrRvN308ssKl5Usf+EynsF?=
 =?us-ascii?Q?2aY++07U/fm/f6jdLFQqKpT3w86iut48tyHXMKyKBmIRy5Dfh5Z75Neo1xib?=
 =?us-ascii?Q?FB/bCvFCmJfbzcPw9GT3NoNudoZ4xvaUU608x40qJeUayvC0HfrwtTrWkNUF?=
 =?us-ascii?Q?J00XEw9lNtmMIpTv7W4ihDcCW3qF9ibj1jvpg51icFaBvwBmDCJoVQ5ICNEq?=
 =?us-ascii?Q?CcZlDYpVFOQiVfpFJAuZkvWarQaZ/e9bg/9YKMOX8P08iMrfgKu3k61IBSFM?=
 =?us-ascii?Q?cDABPBiTKd7xxkJp19aWonExPvuSeG7yUm2XkDTHnlrQ8KGdbP9B4RhGy0Lr?=
 =?us-ascii?Q?aWT0tfHxRXLLtowQv83DH0n2Fa+fSNQsZrAkjpYYnqPsQ9RmFflKDxBjYqeP?=
 =?us-ascii?Q?K1efg4x3cSLXYDCRAWW+kJ6N6FsLEYFS23BBYZl8ayC6ZtdQW5Pq13ig2peZ?=
 =?us-ascii?Q?D8sSCwWnMQ7XDKPQpJ56IspcljhkhYCGiPAZbjf2ixTDrOsbPHje4pZNepm9?=
 =?us-ascii?Q?1D/cTTN6JRGbd6rUDBjERXYemvW6+ahcsEKcFU/IugyGTTYUQYjb4l4I7F29?=
 =?us-ascii?Q?MH/A2UhSaWmx6/YXFXVvZjb0TrK4GzUnMZjpP4aiDOsahmXQP3Q8QASML1XS?=
 =?us-ascii?Q?923llgEDJANQXbPIUijefQ/jI5eyfWqMgbEHRalaWPcy6xjhCJzvBdtLBRDI?=
 =?us-ascii?Q?U4Lls/UbH4C3XgffhmKtqehIjdT7e2mDnXFt5PAKVc9f53ydrHLsuDrwLsNZ?=
 =?us-ascii?Q?jMGJ5L+qCHkstGXiXfxKoWhBAQRCQiQj64LAGCfb5q8Pg0wZT2S/6ifznAqb?=
 =?us-ascii?Q?Oyzz094OOrGIqCVujkkzxBAbsfbu++DmxyTFb2B6ZJy9sD6VTy7RX+JlJA3Y?=
 =?us-ascii?Q?w5BimKnib2uY90u46Xi3KUMJTlxu+kIy2QvQny4orIuJyNoTZ6Upb/Af9oRY?=
 =?us-ascii?Q?yNissaV6FSjpFQ+EiZRvEgQqe6YoephSE77m9i+qW6KfFaxi2xrmDYr0ghuL?=
 =?us-ascii?Q?VhIrAvQTc2Uk7Z2RgpzglIcdROAo+15BCwnvrkyqSI2Yp3YE0roNhxuRYnWq?=
 =?us-ascii?Q?1Ol1DYekcvPxDlScMslILCzaaKYEME3OKpzbi+Be33RVZwP28hmY+RCdZp5A?=
 =?us-ascii?Q?VhT+1CF3KA0vW3GedCKcksXrtXBpdstNBRG2nXojAY+V/vpnaWG1GNKSUMPQ?=
 =?us-ascii?Q?6ys/2T775bquS5BeLK5xDVYkaPbVadH7vMWf6oT8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05363c59-8374-4ac4-2cc7-08dc897350ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 17:32:35.1255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mntfHjKuXPT8QHUuqqfhycMgvJx6o7ldqsUarh6cnZM6SAu69V8mY1Kvg+qJE6cb0EFabHTxaaAx9IvltN05jw2lyccU4RW/b3r9IkM3944=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 01/10] drm/xe: Add LRC ctx timestamp support functions
>=20
> LRC ctx timestamp support functions are used to determine how long a job
> has run on the hardware.
>=20
> v2:
>  - Don't use static inlines (Jani)
>  - Kernel doc
>  - s/ctx_timestamp_job/ctx_job_timestamp
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

It looks like a few of these functions are just public-facing interfaces fo=
r
preexisting static functions.  I don't know if it would be better to just
get rid of the static declarations and use the public-facing interfaces
instead, but I recognize that would require a lot of refactoring and not
be worth the effort.  LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 66 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h |  5 +++
>  2 files changed, 71 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c1bb85d2e243..0fef354c6489 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> =20
>  #define LRC_SEQNO_PPHWSP_OFFSET 512
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> +#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>  #define LRC_PPHWSP_SIZE SZ_4K
> =20
> @@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct=
 xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
>  }
> =20
> +static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> +{
> +	/* The start seqno is stored in the driver-defined portion of PPHWSP */
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> +}
> +
>  static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  {
>  	/* The parallel is stored in the driver-defined portion of PPHWSP */
> @@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc=
 *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
>  }
> =20
> +static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	/* Indirect ring state page is at the very end of LRC */
> @@ -716,11 +728,65 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
>  DECL_MAP_ADDR_HELPERS(seqno)
>  DECL_MAP_ADDR_HELPERS(regs)
>  DECL_MAP_ADDR_HELPERS(start_seqno)
> +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
> =20
>  #undef DECL_MAP_ADDR_HELPERS
> =20
> +/**
> + * xe_lrc_ctx_timestamp_ggtt_addr() - Get ctx timestamp GGTT address
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp GGTT address
> + */
> +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +}
> +
> +/**
> + * xe_lrc_ctx_timestamp_addr() - Read ctx timestamp value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp value
> + */
> +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe =3D lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map =3D __xe_lrc_ctx_timestamp_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
> +/**
> + * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT add=
ress
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp job GGTT address
> + */
> +u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> +}
> +
> +/**
> + * xe_lrc_ctx_job_timestamp_addr() - Read ctx job timestamp value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp job value
> + */
> +u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe =3D lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map =3D __xe_lrc_ctx_job_timestamp_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_pphwsp_ggtt_addr(lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 882c3437ba5c..001af6c79454 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_sna=
pshot *snapshot);
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_=
printer *p);
>  void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
> =20
> +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> +u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> +u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> +
>  /**
>   * xe_lrc_update_timestamp - readout LRC timestamp and update cached val=
ue
>   * @lrc: logical ring context for this exec queue
> --=20
> 2.34.1
>=20
>=20
