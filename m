Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FF3CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 05:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB48710E065;
	Fri, 26 Sep 2025 05:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilVEE+FP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB70610E065
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 05:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758865648; x=1790401648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nGUuhqE8G0HsBSJm2BtWOcIqALpaQok7KduJeH0B/rg=;
 b=ilVEE+FPxbEa1SiGDSYEqcRySHor+w1rZIJPVIN6H1790OBXMiwqVWHe
 V3nXN93A6odIeCwVV4FBp/6zV69NqIiMDNzGa/ArOB0dT+VgdlUitb00G
 yXlPnlcpmraadNDcw5YCcy1CkJXbBb1Eg5I28WM9bIyyG5mZmUYdKsPQa
 9IY88CWHUtydgMzgAyxwQRLvtOEeZ8JhcikBj5gP/ACA39nH0lWZlcI4f
 M2BLOGr7p1hcFKiJsk1zI/JWdammxmJQoe6WDKPYGxhKa/5v3TR5rmxT4
 YsfCnCLYF1dFctA+Ft04KuFFUFMV2G3D2OP6UgLCweq48xnzUoBar+dAn Q==;
X-CSE-ConnectionGUID: JvEv1x1AT+qCKInClz/rnA==
X-CSE-MsgGUID: RqQDHcfBT+OcNdI1hHK9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72293462"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72293462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:47:28 -0700
X-CSE-ConnectionGUID: leKvTnO3Ts2+FDhwvpdePw==
X-CSE-MsgGUID: TN+NHGh0T6aAZF0+skJykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182678334"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:47:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:47:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 22:47:26 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJirGC14I5qaG72zZmhaKNQvmN9fumY+jGmSFmjW4FXTGjEfMXX78q/Tr53d9WhOsrPjPW5Dgr8c/3/hFRWgiI6W5ry5ByCjy2khbQ8DTt4Rf8Vsn+v/wkfbk4DSR2vbHtgBkSDS4izae04tYYHD4Zu7sTmxXPRIPpfa+r/F3E+63xOPc/CHbY85jdwpsWPJoabMWzCK3LGLOV/3jrWk6L+1Uine5DDOqbNZ/uAUWc+40VwV70kquubzy5q/JsjSrtK2HWwg2ChtjFWh0GQwYAOsk7LQL3zC/+IsRspQvI8/bCAeozaDfmaBSPOAhRkfwAINNlHtMwmXaB6PZRvjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/iAs0LuiHGYoTUTOJGyZP2D4o5GxNaO1lO325MkJ7A=;
 b=Bco7ozdEAniCBYQrMr2EpokqEZ9+m3UU31RqMIW6IDlTaP2W+QzVSBUCAU8psDdmRMxOEtMuLgHA/EriDX1Q5tuF0FMMJvz/SC3NLj4ammEFrM5Z3VExUA7LZxbPFy+SavWFb+cZLnhdc9FuNcTirOjup9AIjEJAToZAdlaZmV7w8UIhz78E73B6OlwgUn3j3D/jaIPqZxyey+bQBf0DboiRVbWngw9C7qJK6r3kR5oxKTAeCIRPuzWlsLFeuz24Tqe+EgFfHhu7Hm+Ejp+GcLKsF+mdQA80XV1oO6b19X/Q5NCgBcRu7wySg1W35tZQkz3FLwFIMxj4Or3CjRdHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 05:47:24 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 05:47:24 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before testing
 Wa_16023588340
Thread-Topic: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before
 testing Wa_16023588340
Thread-Index: AQHcLna8HEzhZKLgjkGe5v5U6yaE3rSk9Mow
Date: Fri, 26 Sep 2025 05:47:24 +0000
Message-ID: <SJ1PR11MB620413C8DFD9343F46B99C8C811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-42-matthew.d.roper@intel.com>
In-Reply-To: <20250925234628.2112163-42-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5771:EE_
x-ms-office365-filtering-correlation-id: 80d1fdbd-231f-4851-2e5a-08ddfcc02b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ajzp5V+1JCd2y4lNGbTK2aQ7C0rjRK/iTRsan15Tf5ntzLqmc+gKg79SeT93?=
 =?us-ascii?Q?rRvT4Rh1vYK0ZBcnywRqCkRr/4UsP6066uoCDYa47mDx4tQ1q77gOyYM+ZG7?=
 =?us-ascii?Q?y9pII5M4U15kuohCvqTbhtvLSzGkxZ9mV1unW5BklmIiAYNdFPjlYBLCKaK1?=
 =?us-ascii?Q?8xfG2Bt8MY9QdMmIgoJmwhe1a2w/67azIk7vbkEt7cgHqxmA+HsJZQKDlc5i?=
 =?us-ascii?Q?9JdMrREv+nS/ganGQUHxRltmedy9SaNb0k+OxQWQZsqkvFL2AOfAMdHAy5ED?=
 =?us-ascii?Q?ECAkIVWfvmra48WIoxNRd8lbZALyF6+fF7g58P7asK5xgvDXs/1oLcEBF/2Z?=
 =?us-ascii?Q?Q55HTZdY4K8KumhC3i0G7S9lU8yXoBYSxfsLM2OskPzTCtnbWehn7BamoBpY?=
 =?us-ascii?Q?UzBtmFUkjx+R+Nl0WIv1x8KUhpX/HNDPLbZX8FjPUI1krN/OaNbC0jx6Njwz?=
 =?us-ascii?Q?rlYr73VMJ0ihTyTNWBR4ldhSl+WoizMLZq+q8rDkDicVf/5l3NG+oLbczZCg?=
 =?us-ascii?Q?BFcr1tlUKnTUxbB5ML0Ay6E8ETS65BKp/ddAKXm5EYAqpyjQceYGGwWbDjDI?=
 =?us-ascii?Q?tZyoCEo/HUwbUZrQ1SKqI3fB5Rc2BOs0FylM8tIpMYP82flc7d0JrALf4zPK?=
 =?us-ascii?Q?ROi8aAQtoEMEi0H145MM2EJI+5VgU7LVRWSXi/OVT6e7JdlbM5wNPcIhVPkI?=
 =?us-ascii?Q?YgrzWr6UIzAfSiWi+zX7sZoGgaIWjq74wNKBfvNkEv5qCkwrSz25OzqZJyer?=
 =?us-ascii?Q?hkZZT73MMU/q1SbOvlwWDsFda5eqZyQVDWowEtwgx1FA/kf4I3tOFMJTjv68?=
 =?us-ascii?Q?3laducrR+HIpPVuMX+C4bdi3bYMAqXp6b5MaZHBviIUSEKeIS369haQGM7ha?=
 =?us-ascii?Q?1pFH5cu0fsCC2VTiK6a2FaDhxgf7mqiBqbn2hR8UofuLVuGWTX3YoYMjULy2?=
 =?us-ascii?Q?ZfWkpw1E+5r45rTIekKRPCPSpQqvtC4OeZLw46QCfzdKuVTueMraRw9U9VEZ?=
 =?us-ascii?Q?HoRJgSVPmFy8mrZNh7lYtCfIqENRU1DuosuTCBs9l1vzmD4/RTbNVAJ9ac/Y?=
 =?us-ascii?Q?ij0/jJES2h0ZA8Rey+xLZSP5uvC/m/bTtdxH47VR+kvtjusQqjCiRSrL4evl?=
 =?us-ascii?Q?kCByVuOoAMkT3S/A0Z7Yu6FkbCEkBG+dtTPItpcdaavoix+xYBbHSxXNgl6T?=
 =?us-ascii?Q?MiudlTBMnHtjuQED/bxfVAHV5j7y96PV9td56q/g7b8tbO30jyBvpU/8ICBC?=
 =?us-ascii?Q?i9Kz4EmiDNu+mxQA8i40ks+/Oh0bJRlEnJRhPQpzWGO44vNNiQtY8cc+tgOe?=
 =?us-ascii?Q?knK4p+G0G5wuz7DvtPkw8ZNUqUtB/GRY9YL5Y3057jX3CLlnDKi/vn8+uTQi?=
 =?us-ascii?Q?FoyG8EGYL7iv+umSTB6Rq4JNCQjlnTqI0HpfvgNKK+ZmUE6XJLTg0OITQ1nn?=
 =?us-ascii?Q?MZDKKFx2/z2o8wU++yzZTlt3xPQB//WbHBtT5VYOJOoE2Dcmr3UakaNEAi30?=
 =?us-ascii?Q?pWwnvrb2r1SqSkWb+hJp+SopdvdFMfE++aDL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zg3vddkNa+TU76s4McyU1Y7EUmC01+oxhiX/M5mfLETP6+Mq2iT8IazZoz9h?=
 =?us-ascii?Q?8tag8TSbzsL368z3S7aJGm0e83YzaggEYGsIJtA+RfsMK1Uaj4NQMQF91dI7?=
 =?us-ascii?Q?m+qMged0L0kXUAFKAQgROQezEpckM8DOYHnWMTuKrYoXri6GAwAE8oLIPpPR?=
 =?us-ascii?Q?Flyt+3MCbTjXwW00BxIaWFXrYN8DeYKv3Tp4+fH3jCKOycjF81yt8cp0nSla?=
 =?us-ascii?Q?KemhGqhGP3TuwJ+mmrJw5ETLxSslKPTveSTslBFeil/c/1PNOvVWvtIApml7?=
 =?us-ascii?Q?LQ9vo4TDmxXa0Tcl7Q7HpLSYF3KNq0v0C9IUIJK0I/k+htUR+72a6JkRP4fJ?=
 =?us-ascii?Q?pw8vJKstsinTQBxupE6cN27zRmLfQgh/OPxtY8zQ/43LNgvEf8t+nYpi5ZhK?=
 =?us-ascii?Q?ooa9hKN9CeH7zTvGTb3FiX3dYdmvvllXAv417oloxeRxC7R3Z+sepfmgWi+E?=
 =?us-ascii?Q?O6Xcki7cXKjYGT50MHo0oCW+NE3ekv++730mD54bi/VlsZCN+TyHqQTQtSfj?=
 =?us-ascii?Q?hGAIuq03cka9fQH8jPc04Q6cND5bR+vsTTjem2H7xRGyAaaSGw8B2laC0x8R?=
 =?us-ascii?Q?LiGnu5bM9fnsIZX3yQhDQMbb9tcNFD6sbWbfx/eoV9kRROE1dTxhEHzW6x4o?=
 =?us-ascii?Q?ST7WWVVFTOTUxOYirVTsoGkb8l1NO9NMJaULuj8cb5vJxMbMxUaEWcuA0GYZ?=
 =?us-ascii?Q?LqKbzI0UtUQ0EAJYWqlAfVYIJXOAphiyWig6qS08+oKej2fU7mPErHuP8z2R?=
 =?us-ascii?Q?4VjinkYWN3PdjJwTLIVvkJPG80I10it7Ld0t8KjDQZySttekqIc2RiHNpRZg?=
 =?us-ascii?Q?4QWAxb8rLiE1NxvXQx0/xWo+kRQS3k6PBOYI6wurC4uuom+CQoE1WgBsAHEW?=
 =?us-ascii?Q?OrXatkJ+U8g2gNeXcKgvUvRcUBUGY9m7Q9yiH3djZjgMAdPa+oOcoS45THTI?=
 =?us-ascii?Q?UZ/32VYTq4asmxSeb/mzgscfXQ+hIpws5dclI+NdCootknj8w8bETiR34Ydh?=
 =?us-ascii?Q?mOOw6Byuk9JJxx19dXSM/qOtZ9jrOaFfICzV2IbSWzgzDxcW05kBVDIHMvKC?=
 =?us-ascii?Q?yR9M4uA3XAU96kknczKhFvu97TcSc9IJN07NyiYsTIt1u6l658tULX63Hwme?=
 =?us-ascii?Q?KVXcD029DWGO8j8RsNKg1A3vtS6FcNQfoR0H+iemrAzEYrCHCEdjAL9JQ7ZV?=
 =?us-ascii?Q?3Il8bEwLM8xZEuPII7EsafUE00iQ6y+h+AHeH2wlE11ziwcaa2+L3irfP5m5?=
 =?us-ascii?Q?hJUUyeAsmeT5YeBNQDp/iDR2fz6Ow7oTfB49YWEv+J/Mqlzkgx8p3fB0tM83?=
 =?us-ascii?Q?e12f5SmtKcqEiMofLheo+7F1Mag4hJLtSmqbOUXzqXRXWQ3VGsMcXOdUGJDc?=
 =?us-ascii?Q?4/hMJeUSnIO4mBLth+6C/dyoANKlFO+fbB++sL8DBkL3gTw4nIU8ns5+rjxl?=
 =?us-ascii?Q?KFLKVL3oSEr7JAvlDScliFYNutaJ2Y1Tgxt58RvujskWbJhxqzIO0krZJ1gC?=
 =?us-ascii?Q?x94ENhbGw05TjFkOnO61Fui1tP3AmTSrEsZjSMv0mptPYRVkQYfYjzzrl+wb?=
 =?us-ascii?Q?26XXTMDCa0COQzaZwUgSz0G4y9hQiPIM6+gCahYd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d1fdbd-231f-4851-2e5a-08ddfcc02b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 05:47:24.4275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taKgU66dBhPdqpfBDGvf/SzZTATHR70adAlPxZ6d0HkSahBGJ19jXmrjPvt+mp6oRvKajMxBQORjN/AlRLZAE02zIByYfG1+j1RDKwpUXGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 26 September 2025 05:17
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before testin=
g
> Wa_16023588340
>=20
> If the primary GT is disabled, skip the check for this workaround (which =
only
> applies to dgpu platforms where the primary GT cannot be NULL).
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display_wa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c
> b/drivers/gpu/drm/xe/display/xe_display_wa.c
> index 8ada1cbcb16c..2aa1b8c03411 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
> @@ -13,6 +13,7 @@
>  bool intel_display_needs_wa_16023588340(struct intel_display *display)  =
{
>  	struct xe_device *xe =3D to_xe_device(display->drm);
> +	struct xe_gt *wa_gt =3D xe_root_mmio_gt(xe);
>=20
> -	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
> +	return wa_gt && XE_GT_WA(wa_gt, 16023588340);

Should we add fixes?, anyways

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  }
> --
> 2.51.0

