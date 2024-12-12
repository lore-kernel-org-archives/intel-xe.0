Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A63E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 23:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B610EEC4;
	Thu, 12 Dec 2024 23:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTvfDnko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97F10EEC4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734044411; x=1765580411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vf/1Wv8keO5ljmblYp9Ik+cTlUqDTMpUl4stgVe7KhM=;
 b=HTvfDnkobNilFkf20upac8tVQUakpJ551eSGA2Pmyf0kl5q+woz5yPTc
 JQUD66MGklyFPP9DyIB38RZgD+64vCcbZg5gFbymk58JejVLS8B+Pdbpa
 JPYQCcudoLlXAw0EYaPH/UrWaFC8NmzMbLURTgqJpj4HeT4BIwCbKeYbf
 Nomovp3C1BLzXGmROHbq6M+27REWWDwfo6dvcq9OdlrFagG+0RKSy2K8S
 Y6Ilr+z9etmXC6NDX0TXv5flhVhnmjWvSle75zac5QThQi9OHvzKA0RS1
 qcYJniviC0217Oz1WuKTT2YIfM5FgJfEC+IkoaGqW1ZPkiDWfJYt3tozU w==;
X-CSE-ConnectionGUID: 2fYmpsHeScyWWzkZKIQCJg==
X-CSE-MsgGUID: EYlwq0nlSY6Pvx4CH2MnMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22075940"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="22075940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:00:11 -0800
X-CSE-ConnectionGUID: wraAq5SeQpq+FjVIPU6Cmw==
X-CSE-MsgGUID: AktYaZqlQuONPStPmKEiQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101216836"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 15:00:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 15:00:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 15:00:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 15:00:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUSzB3KY7Js3w+QNKImGJ8SLPxtsVh7J91xCr0pOQ7BkFwRjTaamM+f5zy46TbIkJPxktvbJF03eu6UcUIgEadtRT0QKnWW6tcl3sk1IVKakp3H2hFqvjMPyT34PC3/PMhI4UPdDBZl8I8BfoN0bW4tumUOG963/ANJmaJdVaR+i0Sovq3qelLl/QuSlnuLEUFXaoFZkpo29hL27I3/7LzPfbv745EmQit7ivibGRTieicQP2/fclmXHV7k4WKW2Z1B/+1K21/TU9QrNXvxzKNQQvYKolzUrxWIya6gzMUYaaesvOAYz6udhdanmm964REcM1tIbzEgB014zTsTyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxzVGTMw8amrfHX/JV2W9UlXznhyCbF1OQrJ1bMw3ng=;
 b=AgN2b1yMT29Wx0EID4s7z8YGz7im6LV0mhaDC70VX+VPsEIi4XSOQqkOgye34Wu2HP9SEIWMLU/gjO4k64kj/LMLQA/ppUszwaxOKmZVl5ZNSRN6ioIIOA7gockYrVwhuDpk9tTcSKkhwqWoLZJFbaHdc/vnP0sCFOE4I0EuUC9Wg2dGZmNpIFUqa7MJYd7ZyZZSbeFDMuS7VTS5vOCQ9IEwtLeyBawQIdhiqgd9MEaa5VUTMKcewLtnJAppDlCTEgJTDhHCUY0G4Ph1zAx0Xwm9xz33I8Wcy1E19HF9dYRSyuGNh82kQGjCUC2X19Zd7W0M9Um9W9KIGThDCcfOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 22:59:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 22:59:36 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/oa/uapi: Expose an unblock after N reports OA
 property
Thread-Topic: [PATCH] drm/xe/oa/uapi: Expose an unblock after N reports OA
 property
Thread-Index: AQHbTOgZLmyeAHbvZEaquhv9IGYrPLLjOI+A
Date: Thu, 12 Dec 2024 22:59:35 +0000
Message-ID: <CH0PR11MB5444E1D6E5A1F98473B67743E53F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241212224903.1853862-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241212224903.1853862-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6423:EE_
x-ms-office365-filtering-correlation-id: 16492681-23d4-4a58-edf3-08dd1b00a63f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gVvegwO/FofQrvaGGN1Jy9hn3i90lCbXC0Df3mXuyGDXt8IhD8p4fy7XRKbp?=
 =?us-ascii?Q?RKk2lGHEydRhoFyNBU82Xp6yS8be1vr616IvRVO4Qe41/RoX2FrfA7wrYI6J?=
 =?us-ascii?Q?8z54ozZHjHOCXoj3+cyMWfDTDDJG+Mn5GH/qeLKM5eqKlkri+FFimKp2QtSa?=
 =?us-ascii?Q?noqFjvXg+Wnf4YbgGt6xFv2B5SZxL7AUZBTl+AtbL04WscBk8YsvH8KycqBH?=
 =?us-ascii?Q?yV2ZOEt/yggTGmpaiGAVZJg6Jxp70tzluqbRjqt8fcFpyF89Adjxknzkxjr/?=
 =?us-ascii?Q?OJKVTY3Z71jJeotslzT641gPwahp38/szr5Zu6ls7STr/2oej04HLEB4MhGx?=
 =?us-ascii?Q?W28Aui2jiaSc9RAL9yX2SZo2jHkjB0oyiTcKdCd5xuRUm4OHAFHaYY/bpqaU?=
 =?us-ascii?Q?ZzbLLLzW0g2lKDdrc5o2E6BZm2D7tkqOYwLinzsDKuDThZ1lnCdHvIMi14zl?=
 =?us-ascii?Q?BsHm3Z8O1Fg84E73pzosJsP6iCBlCBa4YUVzEcmXaIcHalJ+eBn/ZhBYTIuE?=
 =?us-ascii?Q?c6YSlZY7qSlTZFjuP2BR7Y1Q9y4pzaEsyDW1KN7moxcJGS+JYUpWE2fE0r+M?=
 =?us-ascii?Q?roXWCBBxnkEchWL+wfYPGTQpVZyfMZKP4dMqhCRScHYAMaicOgf55tCGt6m8?=
 =?us-ascii?Q?lPrnzSKxT0xvqz7n8CWMLWvHa2Fndm1q2XKZr3OfMXRzEjHYQ5RCsln1mzU/?=
 =?us-ascii?Q?zziOzHCqKiLCtonm54gpm91BOBjnogtVgB/VYRbrtLmE2HlZZtFaaICc0Fu8?=
 =?us-ascii?Q?Dc4IQyAwcciOPoTG5M7Cugdk6TkE/wV7aE9SHucCvAlwWF+HKKPrHsDcDhQ9?=
 =?us-ascii?Q?armUXijaOwa6P80geSkRTcKwD5Ws7ra2MqOog/5L2D6bRAk811bKNzxd9J3p?=
 =?us-ascii?Q?oTfqBKb/k1NEkvd2pUJh026w/WVeDgQUwNj9lO9uOLuWe2mTSCLNQ5D6S/4e?=
 =?us-ascii?Q?JB3Cd4dySPadhjR7Hw9Nq0yES5WNWERw6b9SpNuDZXbzWxH1wXXv6Db9mW/o?=
 =?us-ascii?Q?MRn+mEHDiik9IIJYjgaqvEROFBPWr/pxJLkWfw/4uf3+E0lspWVWXSznAfXB?=
 =?us-ascii?Q?JJCrgaNiO/h5HEAvTubgloANycHor2VtW/8xn38f+Spq7RaZJDlaSAy8BltR?=
 =?us-ascii?Q?DuSwQuLLaNlZH5YfgJ1OEVBAU4rGfwZIvx9Rag9OO/t7zsJNHF3UdaYzeDeE?=
 =?us-ascii?Q?BlxkPZiCsWG5ZygbzgOvkH4c4AljcRDHOnZLSUs7j81fZcGEndXsKSqppqn3?=
 =?us-ascii?Q?mEsoNAQztj4aLkqV8KUxioqrhdMmH/c+kWKyxvSYblep6xgH0tc0tSVA0gux?=
 =?us-ascii?Q?10csT2zQejCTm9Qbx03d0KMLurFdZuOVbmqQHxeJ/RTOeCafQWRXE/AHFO+m?=
 =?us-ascii?Q?ho3w4+5SkhBJOXQeHCe2jpE3QmHxH3hIPe0oInf5cJakxiBTxg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zDUi6DY6lZ3piBtCy2WYGmnX9A7RF2alMxNfS2u056XFIzuBCozsHcT0mE3C?=
 =?us-ascii?Q?mHLUmb8w/zpMzNeAmSiz8MfoUj/gL5tYFtwQE4nRDz6eSAdwIy51Lsi5nlLY?=
 =?us-ascii?Q?2Rsfnasx78iAb0wbQNtGmHss47rnwI19haok7Mh+MTPZxBJf3bbnEVW8cZmf?=
 =?us-ascii?Q?0Hf84a0/4biO0pwjQF1gFntaiut8r4s/zUN39yrS4de2uvJvr7YGCLT4Y1Pb?=
 =?us-ascii?Q?4y5D+eK80nQc42miisb3bQkojg+1DhHWSwzPIA/Fpn84eQXRDpWnrLwVF0Yv?=
 =?us-ascii?Q?aNleFXWD4RQxUSJyGVErIDXrSk32ck+OpIdVnXfdxTVAof56XFM+iBhklDA+?=
 =?us-ascii?Q?rZ909z5Q4gNlYCxJWoj2LA318oT+aInxcZDVH4w+1DA1cjcnWjXg9illZJVn?=
 =?us-ascii?Q?/Y+4iTVSKXK/166smmlm1p47Zx5zrWFo4BgqPK1xLMElITR8bnj4T5LCnStO?=
 =?us-ascii?Q?F52YfNvXJoHsRVJk2NyviRh7exB9aWrLdkcnLaiH61dHvHe/m20QXWJcfwUy?=
 =?us-ascii?Q?itg75Hwv7V+QeVzC886dc0eVRVQoiwPrjXm3t8jMZ0qVs/1KXiOzRQppPBZi?=
 =?us-ascii?Q?PYUOEWazRCitwjsOJnbmaiDoLlq/hn7CDYIy06f8a8EvYRrGGU50jLsJmrp4?=
 =?us-ascii?Q?tRcVYZSfB+yPh32XMXsa89WREbTNl5kqh7NsypN7m6A6vRm00u5KXnlojiV+?=
 =?us-ascii?Q?0DaH+A+/No8G5MqexE2kzTCoswb5E6lbG4IB9qFw4JZzZhpYMLArz6HD56D0?=
 =?us-ascii?Q?1gdVCnlp7lVieYJYn1ZlSWX2hLjA4wyTfPApuQN+PZnTOBly/IQPKICBy32c?=
 =?us-ascii?Q?CThKGPbbWDRO7H6K6XUP4Vsy8JUZY9SxZd3h0qaBdpEb5YUGGOYvzzwErwpS?=
 =?us-ascii?Q?uBYI4qBSdQEKyiocVCEpLjxsA8DpO74cnCyk9DfcQ4XSpwk+gYx8lQutdE2v?=
 =?us-ascii?Q?yNmkaUfnbXaBpmltRmCdmA96XTxkGk8F93iYfDds6wjgX38ji2bAYXSWPeAd?=
 =?us-ascii?Q?7k/QYCD/8lF/McfvudyUPrZG7WZ4b8v9SK5eNknA9eO+TrW1zG56VDtgbq0n?=
 =?us-ascii?Q?SqMOSiMdxVE2Hd25UZKh7KhJg2OVoqzRVhsnLK+D3gLo6AAE4rOHoH7akW0A?=
 =?us-ascii?Q?sYwQThvtrYBXVXyAuah6GhDCBn3xnP0FgwNzGT45HlMeffAc0YLTiqraofOx?=
 =?us-ascii?Q?4i0zMg4dzeR5byYk46dVBkvlbbC+6aumWaNT9g49GeA4TOqXDNvPEFqk2vyc?=
 =?us-ascii?Q?WofIrEdz71wVvKw6Ltiw8p84eh8jLNj1AkiPBgdWMo3Yq5TEGGH91dWsa8Gk?=
 =?us-ascii?Q?oDqYKG3n1vWIxg0AkyEFg8vudu/cY2qwmXZyft0zgJPZi06yqUT6cqXQLnAU?=
 =?us-ascii?Q?2hYmTPgDrdjI7rJeaA+VDMMDOno1VicxpHK/+UbgMJIb916Te5NTR+X32KVS?=
 =?us-ascii?Q?71qLV4EjMNQPZMtMQB0meXLS0IOIINILS9VyRrD1EUeRz6tlGz0VG8i9GQ+G?=
 =?us-ascii?Q?0AG0braxIgmyp9qMLN9LraSUO6zSwFXlJIwE3N9nkiLJwgDu9ZYvS8rOCHWp?=
 =?us-ascii?Q?krVPFQK2LkKi7Qt7nLKu+JaoYKhSX8ChSOjn13yp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16492681-23d4-4a58-edf3-08dd1b00a63f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 22:59:35.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKG8XFDzAggIK/FK/b8wiMXVliG4giZTy+Ogt+b0vrpVZQXIheIan1XxoiDqagoFss1Cczir5djMhlreFNJsyrE+3pW9vNrUCaMUwIuakHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, December 12, 2024 2:49 PM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa/uapi: Expose an unblock after N reports OA prope=
rty
>=20
> Expose an "unblock after N reports" OA property, to allow userspace threa=
ds
> to be woken up less frequently.
>=20
> Co-developed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 30 ++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_query.c    |  2 +-
>  include/uapi/drm/xe_drm.h        |  7 +++++++
>  4 files changed, 37 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index ec88b18e9baa2..56bf375a9d4bc 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -97,6 +97,7 @@ struct xe_oa_open_param {
>  	int num_syncs;
>  	struct xe_sync_entry *syncs;
>  	size_t oa_buffer_size;
> +	int wait_num_reports;
>  };
> =20
>  struct xe_oa_config_bo {
> @@ -241,11 +242,10 @@ static void oa_timestamp_clear(struct xe_oa_stream =
*stream, u32 *report)
>  static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>  {
>  	u32 gtt_offset =3D xe_bo_ggtt_addr(stream->oa_buffer.bo);
> +	u32 tail, hw_tail, partial_report_size, available;
>  	int report_size =3D stream->oa_buffer.format->size;
> -	u32 tail, hw_tail;
>  	unsigned long flags;
>  	bool pollin;
> -	u32 partial_report_size;
> =20
>  	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> =20
> @@ -289,8 +289,8 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_=
stream *stream)
> =20
>  	stream->oa_buffer.tail =3D tail;
> =20
> -	pollin =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail,
> -				 stream->oa_buffer.head) >=3D report_size;
> +	available =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->o=
a_buffer.head);
> +	pollin =3D available >=3D stream->wait_num_reports * report_size;
> =20
>  	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> =20
> @@ -1285,6 +1285,17 @@ static int xe_oa_set_prop_oa_buffer_size(struct xe=
_oa *oa, u64 value,
>  	return 0;
>  }
> =20
> +static int xe_oa_set_prop_wait_num_reports(struct xe_oa *oa, u64 value,
> +					   struct xe_oa_open_param *param)
> +{
> +	if (!value) {
> +		drm_dbg(&oa->xe->drm, "wait_num_reports %llu\n", value);
> +		return -EINVAL;
> +	}
> +	param->wait_num_reports =3D value;
> +	return 0;
> +}
> +
>  static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
>  				    struct xe_oa_open_param *param)
>  {
> @@ -1306,6 +1317,7 @@ static const xe_oa_set_property_fn xe_oa_set_proper=
ty_funcs_open[] =3D {
>  	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_prop_num_syncs,
>  	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_prop_syncs_user,
>  	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] =3D xe_oa_set_prop_oa_buffer_size,
> +	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] =3D xe_oa_set_prop_wait_num_repor=
ts,
>  };
> =20
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] =3D=
 {
> @@ -1321,6 +1333,7 @@ static const xe_oa_set_property_fn xe_oa_set_proper=
ty_funcs_config[] =3D {
>  	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_prop_num_syncs,
>  	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_prop_syncs_user,
>  	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] =3D xe_oa_set_prop_ret_inval,
>  };
> =20
>  static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user=
_extn_from from,
> @@ -1797,6 +1810,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *s=
tream,
>  	stream->periodic =3D param->period_exponent > 0;
>  	stream->period_exponent =3D param->period_exponent;
>  	stream->no_preempt =3D param->no_preempt;
> +	stream->wait_num_reports =3D param->wait_num_reports;
> =20
>  	stream->xef =3D xe_file_get(param->xef);
>  	stream->num_syncs =3D param->num_syncs;
> @@ -2156,6 +2170,14 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev=
, u64 data, struct drm_file *f
>  	if (!param.oa_buffer_size)
>  		param.oa_buffer_size =3D DEFAULT_XE_OA_BUFFER_SIZE;
> =20
> +	if (!param.wait_num_reports)
> +		param.wait_num_reports =3D 1;
> +	if (param.wait_num_reports > param.oa_buffer_size / f->size) {
> +		drm_dbg(&oa->xe->drm, "wait_num_reports %d\n", param.wait_num_reports)=
;
> +		ret =3D -EINVAL;
> +		goto err_exec_q;
> +	}
> +
>  	ret =3D xe_oa_parse_syncs(oa, &param);
>  	if (ret)
>  		goto err_exec_q;
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index df77939156288..2dcd3b9562e97 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -218,6 +218,9 @@ struct xe_oa_stream {
>  	/** @pollin: Whether there is data available to read */
>  	bool pollin;
> =20
> +	/** @wait_num_reports: Number of reports to wait for before signalling =
pollin */
> +	int wait_num_reports;
> +
>  	/** @periodic: Whether periodic sampling is currently enabled */
>  	bool periodic;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index d2a816f71bf26..226b234d07110 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -672,7 +672,7 @@ static int query_oa_units(struct xe_device *xe,
>  			du->oa_unit_type =3D u->type;
>  			du->oa_timestamp_freq =3D xe_oa_timestamp_frequency(gt);
>  			du->capabilities =3D DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
> -					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE;
> +				DRM_XE_OA_CAPS_OA_BUFFER_SIZE | DRM_XE_OA_CAPS_WAIT_NUM_REPORTS;

This should probably be kept inline:
"""
 			du->capabilities =3D DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS;
"""
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
>  			j =3D 0;
>  			for_each_hw_engine(hwe, gt, hwe_id) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0383b52cbd869..f62689ca861a4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1487,6 +1487,7 @@ struct drm_xe_oa_unit {
>  #define DRM_XE_OA_CAPS_BASE		(1 << 0)
>  #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
>  #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> +#define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
> =20
>  	/** @oa_timestamp_freq: OA timestamp freq */
>  	__u64 oa_timestamp_freq;
> @@ -1660,6 +1661,12 @@ enum drm_xe_oa_property_id {
>  	 * buffer is allocated by default.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS: Number of reports to wait
> +	 * for before unblocking poll or read
> +	 */
> +	DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS,
>  };
> =20
>  /**
> --=20
> 2.47.1
>=20
>=20
