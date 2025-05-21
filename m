Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DB7C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 03:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545F610E0A1;
	Wed, 21 May 2025 03:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fya/xyJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039DA10E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 03:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747798212; x=1779334212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SFm602nD35uLL1hCSEDwZCqo+BEsrGD/wkrjdE2MkGc=;
 b=Fya/xyJ0IHepv5Q7U3e5zJG8MxiFzhM0SfIRUpF3JcIbCKf/1eVyG42h
 WMG1r9+p2KYh9XW2B4+VhhjH1rS1KTpwZRK7eqwoQ7zc99Mexxw9OVbFu
 rFdAcCjpB28dkrKTG2cFhZWbtkFNYxPMeDB78A5fkE6eY3YLYrXom3jij
 asAfdYjtIH74UEsNhbs4C7QSGmrP5gML3V0oTR7Tkcq4WDcIkltxOELh8
 dgf84FTHWo3phWqhj+plrHcbyLXbP1Oqne6dAg0Hw2zBcT4P2oOyaa78/
 /Qt5adtMAOg8oNwzxDhgRGbe9KqC0/ZUZlQQZbflU547GM73GP/UOfl44 g==;
X-CSE-ConnectionGUID: Ggke+GYURfmRM916XOj7vQ==
X-CSE-MsgGUID: trQaM5yeQcO4Wu2WRfa6Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53567938"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53567938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 20:30:11 -0700
X-CSE-ConnectionGUID: aMvpu//KQ9SIrGkqW8MFlQ==
X-CSE-MsgGUID: 7UecJ//SSumv9+IIFWNemw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140941349"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 20:30:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 20:30:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 20:30:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 20:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIHAghgtQHRZovRLW1uosX2zsSNOXfqaz2it3REYIbbAg5tKjKTbQWYRyFlgTxucuX60MIVWYPR0nl5Zr0Rxa2u/5OiUbGZCO8G0NltgFIVOnNeWcYTz74SjSGl4CDKe6Fvbs3xRZXQlHCy9w/VESpxj0CrmoEsLPKhqIC4J2bD1oR555SCFtQH0h3bae+r0qsHNiumydsMVeKtOrP955h2CweVBzlib9baFjOiPiHV8UP20zzjkpnYJ3hUEfkpPw0/pPHHyAsUq85bXirwvs0Y58G+JgeEzy+nUGaC5cCNkDQMarQXqi8q3MdxI61f3EotyKStncB2D3ZOitAGTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkN9FDivqWsN7OZS/MJoXNKmnVnqRETWsFUY+AdUiJk=;
 b=rs2hbNzX3F70Sml+KgOX11RnqHD3Jt+BEaoABfj65zqXaOgScGSmOZCqHRGd3XhuDyaTwq7tg4VONe5Q4EWhgKPx3PoI9MhSt3EquKZ66AMX89XvsNtvPuYF+oM/7SHeQdPzo/ueFUDCtwfDgG/geS/gFrPqo+nFzO0+8ss6viH5btM7FbKzoace2kvkk8oaP93hZxsCicbv3ooxR+73XYfmuJbZNUOe8UluSXOoWhuf4P4xhqTzH6ZCcyKWEx5+3x8yvZ/vd9PJ0NkyiHoMyjTDBIFAH5lYuZaJqTlG/s/hIjohJL/cdGi5NXzgo4YX4b8ojuBmSD2mXuVvGCH0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 03:29:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8746.031; Wed, 21 May 2025
 03:29:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Atwood, Matthew S" <matthew.s.atwood@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: RE: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Topic: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Index: AQHbycGSjsJqQ5ZBCU+GAfk9FjHycbPcbX2Q
Date: Wed, 21 May 2025 03:29:54 +0000
Message-ID: <SJ1PR11MB62040E8D31CA52083B132B9E819EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250520195749.371748-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250520195749.371748-1-matthew.s.atwood@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8831:EE_
x-ms-office365-filtering-correlation-id: 622eaa3b-2480-4fb8-a03d-08dd9817c0f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?b5WD2+B918VPTHtB/eyFZ/TTiMw26+LJjDd3zbIOZ4WBbOUf6zWfMGEdaSUt?=
 =?us-ascii?Q?Lfgl3s7l5lHn8niu9+7k/qUF/EdZgZqmZzJEavQBkpyVyYfPxULPtfseNPch?=
 =?us-ascii?Q?FV6UTug1gDZe2HTl+GKdcyhTklwofJpf1qJX8OXlZXYJe5PMUYK6hdrPJhdQ?=
 =?us-ascii?Q?cbUaAAEFhSd6WR3D8hr8G4trEZU26FbtTlBq9qLX8RaFG2mJDQM9KZUt0yeH?=
 =?us-ascii?Q?4QZrFK2cu/JWrwW9fYrqJplOtWLFMNdkYzzzJDJxHqURiw3+uFMQb/0aBzcd?=
 =?us-ascii?Q?rJZ1E6JJ//czuwtC1Sgz/FZDsKMfweAU62SKCB10o0ps/vtrl8uPkhy2MNRc?=
 =?us-ascii?Q?tn990j7gPn0sGCJ/egIiG87D8N222KSLEwJ5Vn11vEPqjfy4YUJcOFDDU6i2?=
 =?us-ascii?Q?DMex526fXmF4kTJVKagRX10Ax+Sw2xoKkOXVkT5SRBXbTEgIa6BX+A8Js1DE?=
 =?us-ascii?Q?Zp4dbcqjDgeDsRltG6BLm7C638ScwlGIeFIJ1iMCVjJ6bsrlauQb1S5fz60e?=
 =?us-ascii?Q?JIXkbEg+E5OkzkuNdEpIGpSJXzaymlSxn3ofwEVol3/oMxvyVWga6/A/Ga9Y?=
 =?us-ascii?Q?FyGnQXeLpWO9/0XQb80Zp9UQRH0jGxaW8+OWODE8ZamXxhcZZl1Wl+2k4F+G?=
 =?us-ascii?Q?uaClUCa79T1clLMtqbmGQKusLK+VcN2SetefzeVJUEofxSW/2Ph1tLHXrGRU?=
 =?us-ascii?Q?LRAKbC9ztViMCBYaI8Ah5RIngc+u5bkJI34AdJTOyCgt/iLh9GXOcmGeAvbD?=
 =?us-ascii?Q?tuyJlPx+NvvsfgfQLdMGh/XtqAPV1v0V29DBjgI3EW2hIYzSVAKEZgyFQXD8?=
 =?us-ascii?Q?Wl93ykpNK/HhPVCAdv+dxdXYxHVgGRex85zuMwHqG108MHkUUcSIRMnk+MDl?=
 =?us-ascii?Q?i1iRSkOIDJtIUi5ytFGzRmKUn0htuUXUruWnYPcrpwQc2QoA3DgNmqE+1ZZh?=
 =?us-ascii?Q?PX7v4ZfzyKLGWsG4NTEj9ltTseW6dkZ9vjw09aVnCU/nWzKQ//gH689l0/AH?=
 =?us-ascii?Q?79K+3ahjoA8ToiSLZb08b40oEoXB0cNrSPhyYYPTPIh+Ty/B0Mb/8JtOLsHO?=
 =?us-ascii?Q?uzleLC4A550WLV67bdsXFjErVtzeV1m8FBlFE+b9FpuemG0OaIBE7kScqz0D?=
 =?us-ascii?Q?BbQTFaIIcJmCzccMAv3QhgphIDNCqLlZLjfThVsNxVIO8Q6cCAYiQVnadRSg?=
 =?us-ascii?Q?JGDuj9R9ng+Ltf35cmMTGlWKGfMZ/j1sQ286w42NUqpY6sgWZk9JVWAMILJO?=
 =?us-ascii?Q?4wdJpvkkzFfwj2qXUFiicOV1rXvwDuQ9P6jdbiy7q5JWe9sMI3mHpmiqoO9b?=
 =?us-ascii?Q?pj/Ej0eSv1CPyupDcOyslOdYfhFQRGV0b5EjLpAB2NnpHsNMQOKLLZakfYFr?=
 =?us-ascii?Q?UU93aiYrr8zVYi9xhtiHHBR2PVCX9Xa438gY5GIb2WxcRuQchhHGXz9zBFDL?=
 =?us-ascii?Q?ho3OwC4Od5z8lHCEeJw1R7awEMutwlIexax3lYgl2bMUan+ZqC7qSxKQWZMB?=
 =?us-ascii?Q?22cs8yi+U5D+1ts=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RixEeYEZoXXDXDASkLktHK96Lep29wXZS+G9O+2q1Fy64IzLArZTrqFaRcSt?=
 =?us-ascii?Q?uSkG4+QlclUMbVQ8JMNDaRbVqvZ8xSBlGR3K+FX4QMWKq6fOVmnMunHCUuke?=
 =?us-ascii?Q?HQpKtY/YLwoQg178lpUykf0IG+0mlpiNglzCgkR7mrqN0Hqe6cFF5V+45e0q?=
 =?us-ascii?Q?3PTxlabb5eVhg3ivTXHWlAGgx2ZPd5ZDVUh+LpYIUUFrUNyZnWrCu5uPfCM6?=
 =?us-ascii?Q?waGtMATbndNInyXUatmuOzrSVNTlNExVPXWKL6SdZVyLB/pvtWnSmAfhchrE?=
 =?us-ascii?Q?NtsN0N/O8afKAznFJ0WTOpJYnUXzygQ1WEw49cMTnWn4OXhhAj0kgvonuSkm?=
 =?us-ascii?Q?467wumFfhFthBRDqXBL1iqFcf5p+EXbuDz16fFfjt/SPF/YyY3jHtFsPLjZc?=
 =?us-ascii?Q?QfXYwsUYPqtEgpONvOvqgBKbWPKwZz5L8f9K/9ViMoQtuH9FZm1ONkhhsduo?=
 =?us-ascii?Q?R9wfpQXoEmETjJ/fpouvLi3OCpTYrKyZgXeIpwKsKH3QtTUXDvUjotrL0OkR?=
 =?us-ascii?Q?ZedH60OWchXeijyrMkz4QIx+TqMyitowIUrhtGsgz/7eXRRXvGvRdx7avzMZ?=
 =?us-ascii?Q?LTHvqjioLsg0hfum65Ck00FA0krFFArtCJJFJIcYqDZsP9Sh6dSKvvrPcbGz?=
 =?us-ascii?Q?/e0ybtiuVcCe/xM8nIqzarpiOIlX93y3AkLGYjEarWFH3NXnxNOWUp5oI1rW?=
 =?us-ascii?Q?7K5fBeHjH0ZBkNVHHoi8fZjcKdHsqeajSR4CfauI9NR1CNxSe3yjeBCrgtts?=
 =?us-ascii?Q?ITqVICp9P2NFKByeys/plXXwG5yfsmf1vcWffBhSvyS8BwFdU5Qd0i1UElfo?=
 =?us-ascii?Q?8wIX0Gotq6tQ6sRI6dLb3ZmZU4WJ0/Mes3wEp1GMZ14gX5ho/r3/5nRh7Yeh?=
 =?us-ascii?Q?N+i6IZ4UP3vltOxx0esFrqQN1hZzXxDnCrGnXAsr9cJma6wzSDvbM4RMAjgX?=
 =?us-ascii?Q?LnI2SHrchU8ZCuDSc32h8o3YwKWSyuJICtXCqUc14HrMlTOLXcb6Jkc+KfJw?=
 =?us-ascii?Q?4t4G8Q/cjFhHa5uxA+Vf1SlQbXzBGpvwfYHzQNdhQn5GHax/Yyz2bsuy6iI6?=
 =?us-ascii?Q?MKE7z48V2yg0YCMOnr8GcF7vXMFht26rP5ZZJHTc4M/HU2Fi+9RJW0Q8EGE/?=
 =?us-ascii?Q?3YcWxCyiQFsUAV1Qd1g1Ytpbh10eHoqXHhV38Dg/l8gNf91CzYsjSV2yvwlA?=
 =?us-ascii?Q?6P1Xq0FyWWVxHrZ5M/Mf7hK5SUhhzXBi62JnW48BMClE50eD5knAsBMtZTBV?=
 =?us-ascii?Q?iLuEExcXOrflYbif245EAi85ki+rsryjTyvwL6GZk02dWJujjv1zDP5qgYm2?=
 =?us-ascii?Q?XFd+sPLg7POreFBhd9rxGIFGg1ge4SiLZNCvGErr137GVaQz9/uph55jMN4Q?=
 =?us-ascii?Q?nRt0BkdA+mAYDYiaPPw82MOGHlbEK4xjKnTWI4RHI8WfOigg8CoiiNtVF+EI?=
 =?us-ascii?Q?qoX58DWVnhia0bgZOfd5nH57ZyRtaC2Ti+VZ/jwzkFJ6L+1MGOJyAlIoCmMt?=
 =?us-ascii?Q?pmVZUhE/nTZrNyVk3RFD0bTUsGXG8MOliKu/QgXluUcnX3P5iHGX7XKmzOBG?=
 =?us-ascii?Q?d2h9BIu6qgJ1GXDrCGjbT9Yhl9CboFKWbz7Gumizi/x0fHB9HuILaPxVRSkj?=
 =?us-ascii?Q?fUOR/eANssdT7VnXAFVFXfxgG9gBqVOEXBM7ju91P2iG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622eaa3b-2480-4fb8-a03d-08dd9817c0f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 03:29:54.5285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QdpoynzvvFio5mCgZKS6LhAotW50BjopEFYRjdlGwz8cd+keQtoxQJzddSavs/9iG8Nei5Acsb4jthRYGG27+bozaQlVr4txzDYgAi2AeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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
> Atwood
> Sent: 21 May 2025 01:28
> To: intel-xe@lists.freedesktop.org
> Cc: Atwood, Matthew S <matthew.s.atwood@intel.com>
> Subject: [PATCH] drm/xe/ptl: Update the PTL pci id table
>=20
> Update to current bspec table.
>=20
> Bspec: 72574
>=20
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  include/drm/intel/pciids.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h inde=
x
> d212848d07f3..a7ce9523c50d 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -861,6 +861,10 @@
>  	MACRO__(0xB081, ## __VA_ARGS__), \
>  	MACRO__(0xB082, ## __VA_ARGS__), \
>  	MACRO__(0xB083, ## __VA_ARGS__), \
> +	MACRO__(0xB084, ## __VA_ARGS__), \
> +	MACRO__(0xB085, ## __VA_ARGS__), \
> +	MACRO__(0xB086, ## __VA_ARGS__), \
> +	MACRO__(0xB087, ## __VA_ARGS__), \

Matches doc, LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> --
> 2.49.0

