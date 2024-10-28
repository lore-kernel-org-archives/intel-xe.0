Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B88AD33990
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 14:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EC610E4C8;
	Mon, 28 Oct 2024 14:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjIcmI7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E18C10E4C8
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730126299; x=1761662299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dBRZUpm6llRHPtmlKSn3zkZ9GLv78uLL/mo25pBN8Oc=;
 b=mjIcmI7YxmS+nLE0DQVlF6pGM8lp9w1dcuttf636R1YVkrnNHbM1ts5S
 +YiCeSMG99lWOVuzC32q/mH3JjLY4i53lTAH+D7CcEUJ0r2VlGLIPnYd1
 Tbm4QBpgY4HRWcQc3k1FYmkfM11HTjFHB+PV0yVSe0E4m1Pq3atb60pIM
 Woxag5OafDnItMLrqUJqdDnzDfdyaJ1YydRaCOhGm4Pyl6U48+KL+mu41
 VUVSsHIBX0SkG1sLXrEhHaBIgYHGe6gslbhEybYW4EuCnsN2fky+j4vcn
 CetuGVS2Qh9tGkHmgXeushTudpfpCDjTzVQGBw97+8eyo52sdkNgwXUH7 Q==;
X-CSE-ConnectionGUID: +R3u2wZJT0CkXDb5rARQrA==
X-CSE-MsgGUID: Rll1uW14QSGJKW6TaNOcIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52277445"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52277445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:38:19 -0700
X-CSE-ConnectionGUID: owGhMMX1QQ2yurxUotSlCw==
X-CSE-MsgGUID: 3mClwV82TN6hc7j1YFWEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81742392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 07:38:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 07:38:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 07:38:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 07:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iC43F7iYsSlzdt/JPK6W6o9BUPTJ+BT0gASkDhYDOLPOsLE8+Ii9bP5mpN1Unykqn75SdlX7ZPigRXNOWTF3cqip4jpoZfCNdHK7bY4EG8ArybZ2ZwyoOB0CD4uO2i/tFxIdPJc+ya6ucYkJzp2AVfHLMGzBCYwr12Cz+ShTptl82EHNVB2hkwKHyfCr3KcD0KWFrRCDq3MenM0nJfnnf7OVv63Ksp0cucrQXJ4blYtijcuD0rI71QGFbwXwCdBR4T+syV3pra8ABRDhAB909JQhxttHM9lyLs9XNbhcGKyI+HEl0mWL3YkuHXozVtfVALO5VIQXYv6k8cj+e0Irgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NocYOF6gVA/3x9py84Ma1jUZZ9IHz6jIEjFMmfvCPFM=;
 b=sgdVL3tAVnk2LhXoPLvT4VUf03Naoxm5TJW87D1r7dOtHyh+NJB+HMM40Arf5D6E9JaTx65dTRSCcd30f91FeA6HiK5jLwXyrxmfwzUM7vBztl2BHzmYfNZoYPOG3fZ7pdjBgOjtGLN/i+cUWAW2rsJIZn5CKSzBhQOrXhEcYEgu6PtlShhcxhPqkc5wSv/tjsY/nprr17NIQt0yjkuYiiX1h/FyxJXYhteyeUtJKL3nFwdYDY3topqmfxhQVSxdqYsv8k3u+zg0lH09aBztXulFCqxDTf05AlyLb6z6Fa9CiFFhuruEqj49nNEyleJO+XHEKNJBhAw+1lVSX7DS/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:38:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 14:38:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Thread-Topic: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Thread-Index: AQHbJ8nzf2j+65rNxE+UaE8Nuh7BULKcPkyw
Date: Mon, 28 Oct 2024 14:38:15 +0000
Message-ID: <CH0PR11MB54445C72C71D9BF538B2BFD5E54A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
In-Reply-To: <20241026170952.94670-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8025:EE_
x-ms-office365-filtering-correlation-id: 0640dda8-ed43-4dec-463e-08dcf75e289a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qa8Daaauy0sdELNspUv7U9IoOHju3QSiyin2GVFtEXgvj7vyKZF+FUkvIboO?=
 =?us-ascii?Q?k66rHwYD1I4PPx9kmHolHsjW6MNVovYgOk3RfOg+UBINva0kP1kqCyn6kMHJ?=
 =?us-ascii?Q?4VB6UHP0NElQuXgDQuBCagC1wG7R868WuZEsYBsZdMyoj9bNQ09GPf00m0Hq?=
 =?us-ascii?Q?vzHr5qZCUwRG+SP7nEjUYdJuwNxXKM2+KGBEgGCBTiXbyjSvMn48I1qQBMXd?=
 =?us-ascii?Q?EG2wbNHPSpYh8g8fxOyFtEYT2/bqC/0gZj1/QccwwVKg22aSwkS0fLXqh6tR?=
 =?us-ascii?Q?BQQpPgJuiwh9pGv75rKcoXnhke6zqpjmo9A7rmUEidkCClliEWRR3QCru2og?=
 =?us-ascii?Q?LqEOKIwJvxKFaUhcXA++VIoDIcZjeaSOM1B2SfG9ZKx5OMruMLauzTuuORzw?=
 =?us-ascii?Q?XOG04z9DHNpHI9hHL8cYCSA+RQWVGbKbQx9m0VMDZGNagJMRWemB22k3fk7C?=
 =?us-ascii?Q?wH6ZFhPbHXmDDF73hhXLygxyk97o/zl0EekVudpje3SGpY/DCM2D2xBM26TX?=
 =?us-ascii?Q?qLUbc0UmB1/gwjC3IqMbJqF+Kfu9PVmHSYA5w7EY7vl74PVQV37ck3y5N6em?=
 =?us-ascii?Q?pAYSEvc1k5i76I64mTjRJbD4dohhhD6F0blwcvsl78LBcUXZfKElNwuK9tiY?=
 =?us-ascii?Q?Bq6/8zbMnbdmkNtkByrwL3XQ8CpMzjCXv0V4EiFidexOdeFUMfBSxsgz4bHs?=
 =?us-ascii?Q?/tLPPFzbxxfDrk3BI4M962wQHO+mL4qBY5nRk+iIiBOzo77q1zt3ExRHBGLZ?=
 =?us-ascii?Q?rbCiv8lPA6K8R9aLRspzVlz3J/XXWjfh4V5pXORG30QnjTlTqbFs7BAY0JGC?=
 =?us-ascii?Q?HKZboUdKmjAsI4WxK+ZHr27fjtQ56+cVfRau8UrHF7m6mRnu0eamtTzf/n3O?=
 =?us-ascii?Q?Z5UJ8bkW2eJi0ZIQP2jxq6rgicJZOXoe2kIiXMsoaHLX4PpqsSYpfEDkwoju?=
 =?us-ascii?Q?DgJ2rpffD4CeE+KZhYTfOZrtj17IeSpIf82soqMUETXoatg2a5GCt1/BKWqN?=
 =?us-ascii?Q?GOZnq/NCbxBOLieYQ497mAUdmouphkkn8OG4vYZSry6FOBiYIqWc7r1Km2iW?=
 =?us-ascii?Q?NRfzyMyZIPhPXflHoVFfWW8aj+NLFVCPxDCtdWB9TuB6pDprZQUMLqQrLrLe?=
 =?us-ascii?Q?WT8v3c3b3sUhqeAMB5HnnjjRzooSwAoDCvgOFHHmiw54avsv1xoVpHHUk4gA?=
 =?us-ascii?Q?NGc4xPFfnEcuggAwt4A4DLm1/BSmbLi3/oaW766FBRas/HWmJHAmEnE6uygQ?=
 =?us-ascii?Q?PiLHP9vbKaveWdakD7d1U759kRWPsTuAx4O6pj0tbWzEkIHE7+5n9mpDrRbx?=
 =?us-ascii?Q?8pzPwZwrdLSPoO6szRDtmBVc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+vKT4ulE6GrEdEKbDpB0eU8T86Hf2UZiJU8EZJILF50dwednDN8DrLy7TYzm?=
 =?us-ascii?Q?a057yOp2hexflFOaGH0Xqe4pEV8fqtlJ8fr0eWF6sapvXmDipfF4nGqBEYW/?=
 =?us-ascii?Q?xN97vDIDk8REHA86zbUjm3PzvxhvlvGnKRiCjOt5nr9FHKop/2AutROKbtde?=
 =?us-ascii?Q?5CAdkzGuMfMMTO9UxI8kwp9L/FphqBLiyEoXsdpWZBekm2KfyHjmMCRjfTwW?=
 =?us-ascii?Q?+p85Bbyb6EW0g6wGqQxpTu8Uv5SEMqe/6YYN6Q5bUhzb6Tm0wrORJV4PgnmX?=
 =?us-ascii?Q?ynyNVkUhbN5pvsFTz3k/PxiZDH9PmWCy1pwfUkhchggAVaF4DknBwnEd7LPE?=
 =?us-ascii?Q?HQc754auJlcaDI7vyU5wFSslSygBlpF7hx7Cd7nGHZ90C7LSFmuxmENnr4Oz?=
 =?us-ascii?Q?DQ5feYsbepzl0XX59u1uYO35OyJHGZZoJMoegT8cWBRSeRQjUfpV3SqE+E2f?=
 =?us-ascii?Q?k9OHKCdB2iwg8J69932UrHbBrbgNsfFqTbo4IjmDaVdtT3rK6xAcptFQbF0r?=
 =?us-ascii?Q?YujBEwRE1syS+KOeDit3uWqCxAaVHRGpT0kLKsijX2FusPgA5r0rHiTEFAFi?=
 =?us-ascii?Q?dr7heAbY3aPK/0hXigI/1tHvhNIoiQzF/FIx7wx0llEaLFF0u0kqDd9xqDBd?=
 =?us-ascii?Q?BWYcBEbFtfyhHtjyNBoy9XPn46FbKZdGwfs0K7W2YFV6/wZ2OcmoSVZM8RVq?=
 =?us-ascii?Q?xGCI1yLNidU2WUL3+XoLe5eyLRnL0+KTh+LmDD7eY9HOY+yGhJtlkbqIISNw?=
 =?us-ascii?Q?ywQn5sCDIZqmzajwbPxwKyX4b3pL5WKXaTSTSZlIb1g7VtGfu+ImqdhwCbCe?=
 =?us-ascii?Q?Nl5fq9QaAuRogYa9bHSBm1KSSlrptjKS4nsdC3f2qcr3g3EQ6w9xhIIa9vZI?=
 =?us-ascii?Q?2088gjuC39/1V6S18ADs52dqJXABh46gOfyKBl3ZUfAje60fmsAlkSexJ4bC?=
 =?us-ascii?Q?V3OkaiKoUZ/zi/C3UGbX6KOZQtveRvXQm4nyDwNP3BzrcXfZ2+OPnBMgS560?=
 =?us-ascii?Q?1xIe3YufA8F5QBGpZIlwhQJfV1RB3co+AZpQf5G/2nvLH+bTp5fYug73OWGi?=
 =?us-ascii?Q?w0BW/9+dPo5+r9DoAiY9Ol7n58IzfgQQGqHLWqQ+muChIRnDyjdEU5pC1pQ6?=
 =?us-ascii?Q?IEjSJAacLJp6/7nsIw7BZy8zlsfdHA5K7WZFomGqj7e/Q5OvEn8RA+/mi3cJ?=
 =?us-ascii?Q?2RMJB2kHS0e/N6fzltLgB8vGAQFiFHKLqVY2pyJ2nT6K/cixMjCYiLKNrDq0?=
 =?us-ascii?Q?k1b6I56ijZR7Xnlmo7IZJGEvsbRI/HRAF079AsyGblw+rpR+f8GLjN7FQbGj?=
 =?us-ascii?Q?xIdPSum1Fh8ZEVRYvtUIfk1PB37oKS4hNUrxpVhmVSScLNRzhyooxDaVFDjl?=
 =?us-ascii?Q?nI3/aAU6Q31dnGEGeBzEFdACj8nFsEvGKK4RGNINAOsFaxV/+0nbby7mHIfn?=
 =?us-ascii?Q?uWjDidwdBndS0lz2CL92bXXoelLKshtC2/VL5YBp4NCRMc2h7F4UgHFA3DDM?=
 =?us-ascii?Q?eaNxVpZEVyDYytUBGRyBSm82lS58H4Nt5rIfqG4GBFneXW2w2L0Y2+lvSB91?=
 =?us-ascii?Q?pJYqGgiRK1c2ziKHyPBI/OpB1VFXg5WOSTRkRjxa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0640dda8-ed43-4dec-463e-08dcf75e289a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 14:38:15.9881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SbmdfxH74kz4ZNXf4pDK+58M36qhFp1nIVht9lCqRGs5dVdENVgHoLcBkMn6gwt67r3SIKu+iwVqZXw7J7j5THKg/5le+VSGisenz5Kdixw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Saturday, October 26, 2024 10:09 AM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com=
>
Subject: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
>=20
> When the exec queue is destroyed, there's a race between a query to the
> fdinfo and the exec queue value being updated: after the destroy ioctl,
> if the fdinfo is queried before a call to guc_exec_queue_free_job(),
> the wrong utilization is reported: it's not accumulated on the query
> since the queue was removed from the array, and the value wasn't updated
> yet by the free_job().
>=20
> Explicitly accumulate the engine utilization so the right value is
> visible after the ioctl return.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index d098d2dd1b2d..b15ca84b2422 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *d=
ev, void *data,
> =20
>  	xe_exec_queue_kill(q);
> =20
> +	/*
> +	 * After killing and destroying the exec queue, make sure userspace has
> +	 * an updated view of the run ticks, regardless if this was the last
> +	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
> +	 * query to fdinfo after this returns could not account for this load.
> +	 */
> +	xe_exec_queue_update_run_ticks(q);
> +
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
> =20
> --=20
> 2.47.0
>=20
>=20
