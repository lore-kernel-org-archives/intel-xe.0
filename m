Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F98C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9246710E8EB;
	Tue, 16 Jul 2024 21:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGHazqz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F5C10E8E9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166137; x=1752702137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FbAj8g/cj62suGzBIVqKGNlQ6gHpnt2ZXYDw4ik2wR0=;
 b=KGHazqz0VkRdc/ZOrcGossV3uFE8a/eCjwEPbr9OoNfMg2Jbxk1I+69F
 rNzLmNVK0AdRz2gHrmygH6AUpohYFO7K/z7zTd666cAtxA6y4rhgXg6Tn
 vKFVRVzwAmb1lM+LpjqUnzhP/QNKtIsD7v4NSG7JvIzlV0Wk4qrGLEjaG
 QYVI68GAux945O5X9vbZiAua/ev3I2IJCh5ECXNPQi2iEwMwVoeTxcQFl
 2jDqxeYmiGprXf98XjSc8LfhoMYPX4Xe7dqxV/tGomUD6yfUK+o//BmyG
 fZ09OMt7bdaPWEvLnWMHpxwazCK6NOIWHb7oSD3vqghYy1HwqjnPDcrDf A==;
X-CSE-ConnectionGUID: Zt62HkAUTi6nXB3ZA8CeHw==
X-CSE-MsgGUID: ZLL23jVsSkydLsN47b4SBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29310404"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="29310404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:42:17 -0700
X-CSE-ConnectionGUID: /3FRd+KhTRqgZ4e8qASvRg==
X-CSE-MsgGUID: OT2uUTfWSR29Na7lG41h7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50514204"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:42:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:42:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieDSng+YP3v09vAbVav+WvEuOOJeNbS0Fr5bTDwoa1/jUFruMcQuIVAbKyboQR7mNDvFNCItGvqE1UvyUs2ZMt2FOAFT3ISPpr9vPyTqfRVqTfNb3vM7wu8HxH4U7wrXkZIMfE221f5E0nW0RS03D+eAlzFrOQKypLZoC5D9vrLYvo12uhCG5VaQIpzYW7W4sk7NdbXfKVs3RHrS5C2iJYYijzZjElRmuE45XknYX5JJd3dI/6UB34Ds2kklwotRCiPsP073fT7uQS8Tgywjf74G2VLo2SIBt6NQymvTeK9OAqUImGddOtskMaSJ8BgcBZjmI7Ap4ec64cZn+8XSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nt0tjLLOFhDxRGLSfkPJTWPhXICSHZuIhwPk9DqZHQ=;
 b=M5OyqTk/QThGcMCi7kMexzyuUNysCOIe5ynWgA44ef4Em87lEY303IJJ2c7hzHNoWiMdtYtjH5drYQLDZwjSI1DpF7O4PLq4YNJ0a2vqmN+xcucHJ89PDj4U/hYam8IfGVvHuK0M/z3Iz4mVf9WON4smxChi7p+x/liig+nULeigL7v/VtoV685X63rJpz9r9y3nYFGfTMLpO9oOcNSNnlekokHcjExlf4T4YOQxdGssAbub/wqljR6LsvtrYROOBtby3KyyFZXZ+1lmI7hTdALSU0DCoXXbdPSODjtNkk0M7hLkxWoYWLV3fhSNWnbQjX4QA5XsGlqBRaSqOAMcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Tue, 16 Jul
 2024 21:42:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Tue, 16 Jul 2024
 21:42:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe: Wedge the entire device
Thread-Topic: [PATCH v3 1/2] drm/xe: Wedge the entire device
Thread-Index: AQHa10rHis5fg8W4ykON6enGFyvuTLH54yGw
Date: Tue, 16 Jul 2024 21:42:08 +0000
Message-ID: <CH0PR11MB54449B0B4A348EAC3B1077EFE5A22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240716063902.1390130-1-matthew.brost@intel.com>
In-Reply-To: <20240716063902.1390130-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8319:EE_
x-ms-office365-filtering-correlation-id: c5e1ff17-b765-481d-988e-08dca5e024c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BfbVHhg/SOwVRCDrq39EGpFcka6gUiTJkHHt/3an683Rbo3UlCLF+zPYStYH?=
 =?us-ascii?Q?2guAS66ZCXNOlYD0AlyJNnN4Svij2NL3/bPlHtrpPWCCerg/eW5v4ix2fgTH?=
 =?us-ascii?Q?dyBTCd9mJYYsL3i06lSlCv8wrty7+qOzdUlkcOsRsIskF/3UoYrRJYbyMYAQ?=
 =?us-ascii?Q?WyYMl37bhsfte1x8hNuHBMvcoOtHe6C1/TYOUbREJTVV/ZEKQ+xeIJpifub3?=
 =?us-ascii?Q?YsNMKus6NbpbqS+vQ03AJZs6IsaMtLSVoNdkrY2qz8jWF72TKcLS0S7VjS+/?=
 =?us-ascii?Q?yIm46t7EY5vL/QvF5BGVJM5GGDrApzcoGkzOnDTFmfaaVMb2YGn1kQ0IdvRr?=
 =?us-ascii?Q?EMb6pti3xnWi6zpYWvXidE5lPa1J7DL+S8VOSUxEE8q+Vq4AoVtzp1qP0c98?=
 =?us-ascii?Q?ocjcJsJEKcikhOK5yIohhUFp3MEWEzDoRuKvHRcUUZcI3X3FEyWpxursxB9j?=
 =?us-ascii?Q?VaTZWOf9tPcbXi9WlAvhh9WlJy0Uk/wxtHP2eekvfknMfRcavOBOWTPMgyaw?=
 =?us-ascii?Q?TwZfm2GiCDQzkD64GwDZlWRVkbM+5DMr9wb1eibvoSTJ2SiL1Tle1GglYhpa?=
 =?us-ascii?Q?knPIVnNUs7nFOgP0y1dmafMON0vR1vGaxLiTjoCRdrm+bsBr567bv01s/yer?=
 =?us-ascii?Q?M7tKu0cDgXGZYhF3dJojSjgubRDkgEhj4CMNowDaDDNOVg0hxOR6EFLIoQoG?=
 =?us-ascii?Q?uOmGN+Jb4XtRK1s5IbdrIsuGbOBWDZ0d2hrTRXscHAY30Gp8FQUeyX1r7WZN?=
 =?us-ascii?Q?G8DtLs5BGZi6j7Z+emlb6V3VCsn4I7nA4y0fp43Zu95yPbDJGaRq1fdrovtG?=
 =?us-ascii?Q?2KZxbJW7MO7tJSG1wEyQvRIZncpgBy+Hn6qHGzYIWFGdIcDBtCvqgwpanEBl?=
 =?us-ascii?Q?cVjjydTLH39UItNgJd3IEL3IPNtsh+ufwuI/7mKufXjztkKGT0BLm95lhEgt?=
 =?us-ascii?Q?ZtkfrHbdfCdpthWOZZfiSz5BARsVqnucymZ/ZzMyU56hdHbdteamdpGbXBTI?=
 =?us-ascii?Q?n4KD9+fHyE9JjyCAVg0oSEBXVQCXdVhu0qnpNIFRVZDSBe8LooRuK/FyfggI?=
 =?us-ascii?Q?I8mzkaYEiEy/PMdLELol/tzoX9dX/nUGfqraAu3AIC9DTBVil0icMaArljmm?=
 =?us-ascii?Q?aPcuA3GqI4i4//Uk5X/rRbEISDldQQGgxzH0t5FyAMV9twNtRBFJJi7Tzyvi?=
 =?us-ascii?Q?15xrv50o6mJaSG5A3KnE9u7srKrpoid6q+wUBvwIws2TUIdGH6Dx6oqObSul?=
 =?us-ascii?Q?4XjC2jMQ5sPyOkzNbnXOkxi3Xo3S0GeaKX/JRWNk6cVerDMTWBC6EXebFXj9?=
 =?us-ascii?Q?6HWt/pztdqUz5xJL6TNLYYA11xBppOz19v0AIS+yLTyCbqyBIxM3EW06yhNo?=
 =?us-ascii?Q?/RmI2og=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3gvmmzSimocS7DY6dOyQl/BSMw64q886fIjWME6veaF95LsfaqlGKTMCh/2J?=
 =?us-ascii?Q?0jKDo1o8iPjpXtNbWizJ3lmTKNw2Lxzza1dVaaKqusKwy6pegOIvPzPic+Yf?=
 =?us-ascii?Q?Oo2SJwjvwE916DmFs3QdiG0UqaD59Zidz4p9H5GYXTXyA3+obUY22mppTZgB?=
 =?us-ascii?Q?ry+Vkmq5ZGtuTNbOkLy2XCEpDOSiRoH32vOZP0d/uvwLLRgvOOUH5PfeQJBu?=
 =?us-ascii?Q?d2Rr2RUrvl7ICDINz0hJhjYNMJMZw4R4LLWDkN1BDFtykDxolYDqaOWVl+mG?=
 =?us-ascii?Q?Qn35nEEPK50JxKIgMukup7SOofq0TBl79rUNd31CjCWvQAowz1qhd20eECRB?=
 =?us-ascii?Q?OdmQ6JXLDNWHqchssPmOodG061FfJdPzTanCM8BPsQ+VpSNLkLhkBsbuRtZn?=
 =?us-ascii?Q?mgkhrHSWVAK8CCoE4Ovh+1C0jz93uKRgiArnWi+9c4to5E5DBC3EC3ZjWmNm?=
 =?us-ascii?Q?69j7n4yU3dG1sHZ7Rnwg9qBwwj9LvQyhzNcPo7+r7Dnl4Va9EPTErGhI/YE6?=
 =?us-ascii?Q?E7GFPsLCCLQ7Yd8nszZYVIvxh2rYKiLA9TXxhBa7L+BthQB5T62l7DoRH5dz?=
 =?us-ascii?Q?LovffpFwvPciW6bWz669gMkC//3UnyXm1u6CGmuT7jDRT3C8d+Y+SHdpAHgB?=
 =?us-ascii?Q?TP/2IyxhoDsL6PU0geY6e1/mFsa7/QYf3fG8xkmttKwbfZ9tMjgyoVely5ci?=
 =?us-ascii?Q?nVcKbppgbhQWLfUWKHuqEQpam3ilRRr25rqvfxvolYQHJ0X4QWUI6NRGucNg?=
 =?us-ascii?Q?fyrB6GtqrkfuueCankcRPa+D97ovg1RlK+rHvQlu6TR87waa/A4f6SVdw15v?=
 =?us-ascii?Q?XQiglwATqWkV8nOUHKU67D68M5HpIY65PBQDMab84bnKvpy0WY+MC3PtG/RP?=
 =?us-ascii?Q?cfnviHOurseye1IYqhfnt5TLupCSe/dkYeyP43E8YsYDOdFvAxq3P25Br7lz?=
 =?us-ascii?Q?y+xX1+qFQO0ofO1C8Y2wjS8IF12GWMRs1FP4Dk2OAeWbz6njue8Wm5/pcV3X?=
 =?us-ascii?Q?/Hc+TCX1EAwSSTqaDkjsQX5krVApCdz66TMj9aa8x6N4cuIet/acDsJM9OQu?=
 =?us-ascii?Q?4c5xrRdDf0sCHco7uqq6iUofIvRv8cn7kW1u0uCqrvgu2R7nuL6NcuTH1UE3?=
 =?us-ascii?Q?xc4MTwY3e5YUyC38OQ3tr7Sr5NWFpvpZqKUecHVqp9rnMbHV01Mnt7vCzHJ4?=
 =?us-ascii?Q?+OQ/jdAsl4uXVXNxSMnz1nSngGb6BQJhiBYvmsKw7pnK8PN7zO9rLRGbFJkP?=
 =?us-ascii?Q?owCsJ/IQmhZv44vJFW+zMPLBMA0QeAh32FkdJ4mB+AfuWvKmguanXSA6BCzk?=
 =?us-ascii?Q?qRZ8GbWaE68SZA2bbL4bU5J4ShDnuCoPfouLwXUfS8Y1MyureM+OiBbuJb0d?=
 =?us-ascii?Q?3HQYppFfi6Rz184td2HQee8+0T2kRJTg9hzhsUKH1Ondl10a30t/orGpJHWZ?=
 =?us-ascii?Q?UTIVnD7c3VRFnoOvjYpg7+LETFxqxrr76UTRdEqk1V1+eLZaFWhilf5V3Y+l?=
 =?us-ascii?Q?Nihvq5Geg8hHFzC+gdaNFvpivAVsJv3fEqe8eG3Uukt0IdQqSb8G+tAN1paZ?=
 =?us-ascii?Q?fiyFft16M1/ptMkoqjHA7ZYLE2XE0ykJH8jozNZA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e1ff17-b765-481d-988e-08dca5e024c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 21:42:08.7407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqtG1OJCZc9wxMp536zeaLSppbtYJP8+ukFcrPSVg2AkE3+ws7wOczyNUKd582r9aWbs9PrZnB9OyLIw6gxvkoXrQRlxX07lCf3rOmFg3Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
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
Sent: Monday, July 15, 2024 11:39 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Wedge the entire device
>=20
> Wedge the entire device, not just GT which may have triggered the wedge.
> To implement this, cleanup the layering so xe_device_declare_wedged()
> calls into the lower layers (GT) to ensure entire device is wedged.
>=20
> While we are here, also signal any pending GT TLB invalidations upon
> wedging device.
>=20
> Lastly, short circuit reset wait if device is wedged.
>=20
> v2:
>  - Short circuit reset wait if device is wedged (Local testing)
>=20
> Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon =
any GPU hang")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c     |  6 +++++
>  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  1 +
>  drivers/gpu/drm/xe/xe_guc.c        | 16 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h        |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c         | 14 +++++++++++
>  drivers/gpu/drm/xe/xe_uc.h         |  1 +
>  9 files changed, 80 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 64aea962afd5..1e3d3a7e74d5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -909,6 +909,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *x=
e, u64 address)
>   */
>  void xe_device_declare_wedged(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
> +	u8 id;
> +
>  	if (xe->wedged.mode =3D=3D 0) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
> @@ -922,4 +925,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
>  	}
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b04e47186f5b..a4fd3665c1b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -957,3 +957,18 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_g=
t *gt)
> =20
>  	return NULL;
>  }
> +
> +/**
> + * xe_gt_declare_wedged() - Declare GT wedged
> + * @gt: the GT object
> + *
> + * Wedge the GT which stops all submission, saves desired debug state, a=
nd
> + * cleans up anything which could timeout.
> + */
> +void xe_gt_declare_wedged(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_gt_tlb_invalidation_reset(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 1123fdfc4ebc..8b1a5027dcf2 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>  int xe_gt_init_hwconfig(struct xe_gt *gt);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
> +void xe_gt_declare_wedged(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
> =20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb655cee19f7..de0fe9e65746 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1178,3 +1178,19 @@ void xe_guc_print_info(struct xe_guc *guc, struct =
drm_printer *p)
>  	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> +
> +/**
> + * xe_guc_declare_wedged() - Declare GuC wedged
> + * @guc: the GuC object
> + *
> + * Wedge the GuC which stops all submission, saves desired debug state, =
and
> + * cleans up anything which could timeout.
> + */
> +void xe_guc_declare_wedged(struct xe_guc *guc)
> +{
> +	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> +
> +	xe_guc_reset_prepare(guc);
> +	xe_guc_ct_stop(&guc->ct);
> +	xe_guc_submit_wedge(guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index af59c9545753..e0bbf98f849d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -37,6 +37,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);
>  void xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
> +void xe_guc_declare_wedged(struct xe_guc *guc);
> =20
>  static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class clas=
s)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 6392381e8e69..f69bd7317a5e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -861,29 +861,27 @@ static void xe_guc_exec_queue_trigger_cleanup(struc=
t xe_exec_queue *q)
>  		xe_sched_tdr_queue_imm(&q->guc->sched);
>  }
> =20
> -static bool guc_submit_hint_wedged(struct xe_guc *guc)
> +/**
> + * xe_guc_submit_wedge() - Wedge GuC submission
> + * @guc: the GuC object
> + *
> + * Save exec queue's registered with GuC state by taking a ref to each q=
ueue.
> + * Register a DRMM handler to drop refs upon driver unload.
> + */
> +void xe_guc_submit_wedge(struct xe_guc *guc)
>  {
>  	struct xe_device *xe =3D guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  	int err;
> =20
> -	if (xe->wedged.mode !=3D 2)
> -		return false;
> -
> -	if (xe_device_wedged(xe))
> -		return true;
> -
> -	xe_device_declare_wedged(xe);
> -
> -	xe_guc_submit_reset_prepare(guc);
> -	xe_guc_ct_stop(&guc->ct);
> +	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> =20
>  	err =3D drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
>  		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged=
.mode=3D2. Although device is wedged.\n");
> -		return true; /* Device is wedged anyway */
> +		return;
>  	}
> =20
>  	mutex_lock(&guc->submission_state.lock);
> @@ -891,6 +889,19 @@ static bool guc_submit_hint_wedged(struct xe_guc *gu=
c)
>  		if (xe_exec_queue_get_unless_zero(q))
>  			set_exec_queue_wedged(q);
>  	mutex_unlock(&guc->submission_state.lock);
> +}
> +
> +static bool guc_submit_hint_wedged(struct xe_guc *guc)
> +{
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +
> +	if (xe->wedged.mode !=3D 2)
> +		return false;
> +
> +	if (xe_device_wedged(xe))
> +		return true;
> +
> +	xe_device_declare_wedged(xe);
> =20
>  	return true;
>  }
> @@ -1704,7 +1715,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> =20
>  void xe_guc_submit_reset_wait(struct xe_guc *guc)
>  {
> -	wait_event(guc->ct.wq, !guc_read_stopped(guc));
> +	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> +		   !guc_read_stopped(guc));
>  }
> =20
>  void xe_guc_submit_stop(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 4ad5f4c1b084..bdf8c9f3d24a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -18,6 +18,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_wedge(struct xe_guc *guc);
> =20
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len=
);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0f240534fb72..0d073a9987c2 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -300,3 +300,17 @@ void xe_uc_remove(struct xe_uc *uc)
>  {
>  	xe_gsc_remove(&uc->gsc);
>  }
> +
> +/**
> + * xe_uc_declare_wedged() - Declare UC wedged
> + * @uc: the UC object
> + *
> + * Wedge the UC which stops all submission, saves desired debug state, a=
nd
> + * cleans up anything which could timeout.
> + */
> +void xe_uc_declare_wedged(struct xe_uc *uc)
> +{
> +	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
> +
> +	xe_guc_declare_wedged(&uc->guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 11856f24e6f9..506517c11333 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -21,5 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
>  int xe_uc_suspend(struct xe_uc *uc);
>  int xe_uc_sanitize_reset(struct xe_uc *uc);
>  void xe_uc_remove(struct xe_uc *uc);
> +void xe_uc_declare_wedged(struct xe_uc *uc);
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20
