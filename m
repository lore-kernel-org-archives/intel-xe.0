Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9CDC021B2
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 07:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2910E142;
	Sat, 22 Feb 2025 07:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGPx6z/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80610E142
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740208791; x=1771744791;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zccIUkvxEt+y6aA17N5YUWyuonCjZiEJQUtaB+s3Tog=;
 b=MGPx6z/+OW7Zo2/hCaqGsQrUxOlyYDaC4qq9KYSYBUin5Wms0AlU0orH
 FrHdxyv8hiLUmFmUMmdbuB8Mvbwz4NspncODIqPH56VUm3xrWdiQywBZq
 2fSZwaiG0FJql2Y3LgCUTevP0UKUADaIg+EGQGNzTAQinkfSq8Yo7hH9U
 StMLMKefxRuHft7PJHukc69+BxDnog7yg4PXlTEVGXxscD8miJgLVSr53
 P1Fbfol4AiwNRXDIenv/o91+kR35D7VH6MIiwyEKPuiIY27Y9pnZv6FYw
 BP+CMKQvAlnELinIXQ0IHy751zjgzP0E9F96xPzcPZL5nM6rf5XR/ZwMO g==;
X-CSE-ConnectionGUID: 0MHPmK84RVSkBUvTiozadg==
X-CSE-MsgGUID: zV4msz4PTHii0zSvcxCp1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41294149"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; d="scan'208";a="41294149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 23:19:51 -0800
X-CSE-ConnectionGUID: zyZIeo28ToemNG+NLZQm3Q==
X-CSE-MsgGUID: HGuElvxyQQetvV47a+wQTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119690067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 23:19:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 23:19:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 23:19:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 23:19:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcB/A5uAjX50PAq0732T/2TP78jPkgmm9oDBXbuk46UTYh41jVHNRH5FV9KA+FBMe8r/V+KJPo4KTiLOGewB+uS20oUDn3Mb2uo1oVYZlhTPcJn0249ohXMaf99Cp7TIZFcI7xvQpm16Fj7VyrTEg3bE5vySx3C1Nh9BB//7syG9WUgsZrXBhkYiuwjI+QkO47TC3zGMCD+sjExvxV1+0TYYnRrfM0iGjxg6T7ZrFoAfdlSgd3WjxvMZv6m+efHXMP0T4V9W1m2q1dMlNK5SGi4LPjl8yAatmQ7PVFj+FH6SjhlICijRZSw95y1RLAs+jxb5SPUtvms8QGIJRGZIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83eghIT+4bK3aR+T8w9jDLiH9S2Z2wCJmR9H+2UIDbc=;
 b=YRCfT9pTk/TbuiDloLIp9B7HC3OZtlGOl4VoO7aaPrn7j+M84Qa61wjfVo0ufzwWDzYwDlIfXmQVnxMCDepaGipB3NoJ/dcKz8HlbIXJZ3r1LwSZSV06yp0Tk0addfT1jFjuG6yluM1sEQXZgVLDcUcZgSfay4jownLcbrBsF7C8z9bglM1EzO8oSpzvjrBPsO7rodlkokbcJaPUkGqJtLtbSEVgxnPncrAofkZfiqRm5t3U4iJ1pUekYQgwlDXCBtkStlp+PJj2uc1E2tOrXLOtLmH+MCF9cIRq6zU8sfoItN6rqI9FzX3puahB03vG3xvYM2Xl7EpErpvrylnyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sat, 22 Feb
 2025 07:19:47 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 07:19:47 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 03/11] drivers: base: component: Add debug message for
 unbind
Thread-Topic: [PATCH v2 03/11] drivers: base: component: Add debug message for
 unbind
Thread-Index: AQHbhL5TZFUfbfjJe06bLQ6dUwQ3XLNS6q9g
Date: Sat, 22 Feb 2025 07:19:47 +0000
Message-ID: <SJ1PR11MB620428D98BFBDBBC04DD9E8F81C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
 <20250222001051.3012936-4-lucas.demarchi@intel.com>
In-Reply-To: <20250222001051.3012936-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6698:EE_
x-ms-office365-filtering-correlation-id: 4d3849e5-4de5-440f-a6b3-08dd531149a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RzoRqve42Yht9k37uOP9wOXQpxLzpp5Q0vJafBlW2ORa9QPdnf9V3duh9Abh?=
 =?us-ascii?Q?J8DrX2jOwoPNVDX0hlGk2AztXIHAUnCrbF9wFfG8eSqIztKSyvUo1ThkQ9E4?=
 =?us-ascii?Q?EuHJixsyoajZKk6F+nps1GZGhVq9SiVHPbVBn5jdUfbiNhg/V65CccwSdFno?=
 =?us-ascii?Q?3HWmg1qWK7Xc21AIt+n8kSxrhIFN0WvW+kNawwiXX3LK/56GjjE8u0eGThVm?=
 =?us-ascii?Q?SvS8DFwQxvSzPOPEZfoJVWI1E+7jsmokGKgGNRC3xv3mbrs1n5zXQbEhg0/Z?=
 =?us-ascii?Q?fiFoohvjRsG8MXqgsyeFk8yN7/GDkmVpOtztae8xIXzTYPiJk/88CstsPdoS?=
 =?us-ascii?Q?Tm71TReYycuAsDUbIQJsU8eMyr3NThidGhVtQ4gIvA21fgyhoUAL8PoczAEI?=
 =?us-ascii?Q?+cP9Aht0zS3O2Y7zAEiICvf8L+tw6njBv/xL9s5nfRqNdIO+sTD9QaSOdBah?=
 =?us-ascii?Q?WGMWPlyNJlfoyMhD+VRrE+MhxR7GUz7VuH9/A3NLnsFbJoQe/3I1b78vtj8X?=
 =?us-ascii?Q?f+1/izMOWk0EadRhS1UQxP6DJXlFgwWdwAWcCkNJBxeMYm6mQqqOUX1x1aaB?=
 =?us-ascii?Q?mlckMWu3voiyW9gBzqZ5fd2UmdaGtTD/RRdUa7QtUMGlR78Bk7YqPinMq+W9?=
 =?us-ascii?Q?qvA78q0cZiRjLHZKwUoLSzec3dGc6owS9K/C4EyhQK0JFafDKEuarQwvKTTk?=
 =?us-ascii?Q?aJuAT9rOwnODhfXZgi1ezUZAfi+SQlvGic4dSafIVu4yVZCL3M1tJkXVeKxd?=
 =?us-ascii?Q?f99VJRMaBJUFZrbeOT9DPM2vQFcTTwdRiELWcwSPVh6NivmMn/1+q9tqXZnt?=
 =?us-ascii?Q?cLj1+qlnQTu5JHvPiBoT7se7kKNYJ5KUZYv7gOKWELHbevfiswvBjRfhlpIi?=
 =?us-ascii?Q?VIk2du0ZkBx8xkzeY8jU0+oCljWyShD7qB5R97VQFzy921yCErCLI+Le6KcY?=
 =?us-ascii?Q?p3jfsd6tN7bxuBMO7ugQKLSCiLsn+l2VV5q31ysL7ojAJjDgU/LzwXIzlMll?=
 =?us-ascii?Q?xAmhPhAtXRi3OLMSWJ80tTNoVZzsFmCiwLQRVvhcNN5jlFYFLYD2dtYFLQjA?=
 =?us-ascii?Q?SEX0sjwP2ClZc0S/UitVRgHgr5lFkY0Jzz+9nOChOlYdgFagKOzM5HoqbKIP?=
 =?us-ascii?Q?aiBIjuuAZFwMGLsznK52vXQTvimLP2jzm7+zrQFPzkBlfFEjpPUxo6gvjphO?=
 =?us-ascii?Q?zOnueNHt/H87RbASaLfN2eCx/lyxwjL5myziUlu3+hJ9AsFhiHffFGsYggfL?=
 =?us-ascii?Q?NJ7pqC2XP/x7X7SZ7KYp02WSxRAqT0bt/Ipeq5XJ+OknfPr5RgKmX16T0NUG?=
 =?us-ascii?Q?PudDFs5rPnR0F4oY9cYwtt0QLJb4OXJ/h6j4mlS6jRZ04JKT+wjYYC7vPE3b?=
 =?us-ascii?Q?ZoNx0eSmMpQoCdYT0bdRtfeiQenlKGURQVJF83VnqgVQo2KLtpiNM5QyEF4/?=
 =?us-ascii?Q?7qBBgD448C4fZuYwHPWmMiXTXU06NtVf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LJuxke5oAA2wsJZL9UWFJEt+TkysEOO9nrjQUciFAyu20nu6Jc/rytUjDbXD?=
 =?us-ascii?Q?+tzTjLbCWhW0xOgzazaj0iV3Wsk6yixGsoWMHiaIaWMYoitmUxYwhrsuZBoW?=
 =?us-ascii?Q?ZQ2Toqy3/E9eB7mi0fUwo7nZn5yJf1KFgNFD1p8HCT8QSR1AGTQcms7Obz+Y?=
 =?us-ascii?Q?7HfdhoNSbB9h7B89rCwDmbbLqe+TFRg7/guCGeVSS8joSes3VXUwVxQHtWav?=
 =?us-ascii?Q?jXWuFotDkUTej/0hXiH4XClulO/PZmr4cc6DbchMj95hGNmzv+LLL7GIOIoa?=
 =?us-ascii?Q?LL3JjN9Cdgrcdc6s9nNECbTkcoyyqzbZmg5pc0WT2eks53VftNVpdVVzVRBs?=
 =?us-ascii?Q?K2RBNk2mWCKrWkGZZYZ9zY5ko+4q8HTNs6Dhf+vH09mC3PkMT1tskuaoabaT?=
 =?us-ascii?Q?6ksqAuBlnWDIFq9YChpIk8tiUu6L+wUXbcYyuPzWG01Ywm6GVqcYnOAu5Hq8?=
 =?us-ascii?Q?+j371J/RIXA2BxDv9Ylrh78Yt0/UQQxyWWbiKbSOUx4EziYJYBVVpr9lPyK8?=
 =?us-ascii?Q?gGcyg5Q/mElXNx0FuaC9iB5oJHvQkU8cU+HRaEoGs0wXEMuXybTCiUQ3axr1?=
 =?us-ascii?Q?bk365T1zZ8npOQ69DfjiUWUZyeKf0Gc7YgZ1uf5iIX5JpvpNn1fXtFMG7wB6?=
 =?us-ascii?Q?OarUVMveJyS/IIbPLiJ0mYdvfQPmxg3ZLCQqNtQMLfeaEEAZwzPlCnfE2ZMF?=
 =?us-ascii?Q?51G3URFDV+abLisEwHc6zATqJ6GKs0sRJJ+FpJ9q9PZ0MFa6hprhLHAKqAu9?=
 =?us-ascii?Q?ALMOzSNImlsU2LmHLqAvropKnkdZjGiVgbYmgx7EidRhYUa41/BhrevmGqcU?=
 =?us-ascii?Q?s+1exOE/E1lMRHBIc9ZQXW2uZHd0icOrXq5bkqDESdS9CtC4UQRgPqM9y7Oz?=
 =?us-ascii?Q?cTEefM8zDeOe1EoRtLITiID3ZlQ0YxTXhYGa7SfiXEqqO3SbmVjl32YD4JVW?=
 =?us-ascii?Q?w/Hb7h+piZtZjouD9/Yz6h+q1hM1JRXq1L8AaEC3SrJdCE8ly9OGxpu0sFMN?=
 =?us-ascii?Q?E8xTvz3MrflxRGZuOiVoEeTEJ+1GkqP6q1TlgawzxhaZ9IKKuo+rdjx2U7xg?=
 =?us-ascii?Q?+lf1oKxKLneArHfZ4RRPtNd7fPTlk9QnELbY8PxlMwBfE4MbIkzevIpTYCVs?=
 =?us-ascii?Q?W2qxsgL6PitTgTgBRDGYTj0yNb/X6HUR5BG/gWUi7cKjUgoA1oCk7qpsIjzs?=
 =?us-ascii?Q?Zx86rATA5YyzsuxB/wTYA1IsnmobKiyUzglau95aWKZLCNnxyvE4l4gHGQvh?=
 =?us-ascii?Q?EIP0OoF2WHCb9HcvC2rqoHPkBEdEKz+9sdgBX1kGKfakpOJQips92q89HlM0?=
 =?us-ascii?Q?CWmhNH7Mjo+7ULhZPFtPlQIaLW75tRzE4km+AsW3zXGygfxX1Sbtg+NJCf46?=
 =?us-ascii?Q?npbE35xRBnGkffpdFcPRaz9Tn6FHMpgkSmR0OwNSqs4wHcT00mSsW0g0gYvy?=
 =?us-ascii?Q?NVqcy32MdK3li692LjcavPLb1rMWvkYNBNdbw7WMDDpaqijDanjPWEU7dF0c?=
 =?us-ascii?Q?NOA8IuapS6uHyDEgRjJzs2XpkxwgLxmtWE4/+nlrRmNwsjgS8gqGHOizsJbC?=
 =?us-ascii?Q?L9dcROVOnNiAVU0FLUvIuftsbCGoL0qJBGIKbRUu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3849e5-4de5-440f-a6b3-08dd531149a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 07:19:47.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vh+kpu68x5dAgKcZpBpO4kyPwGRQNeDyIdZnt5EkHsTxUgCvOCATVAJvW1uv26xlQNX5fxSX1Vcg86Rft9/xbNVC97T5+dQWyVb0bZthZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 22, 2025 5:41 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v2 03/11] drivers: base: component: Add debug message for
> unbind
>=20
> Like when binding component, add a debug message to the unbinding case to
> make it easy to track the lifecycle. This also includes the component poi=
nter
> since that is used to open a group in devres, making it easier to track t=
he
> resources.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/base/component.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/base/component.c b/drivers/base/component.c index
> 741497324d78a..5d10600bbc25e 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -574,6 +574,9 @@ static void component_unbind(struct component
> *component,  {
>  	WARN_ON(!component->bound);
>=20
> +	dev_dbg(adev->parent, "unbinding %s component %p (ops %ps)\n",
> +		dev_name(component->dev), component, component->ops);
> +
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	if (component->ops && component->ops->unbind)
>  		component->ops->unbind(component->dev, adev->parent,
> data);
>  	component->bound =3D false;
> --
> 2.48.1

