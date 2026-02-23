Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF99FEEC282
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4C10E316;
	Mon, 23 Feb 2026 21:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmwjHn5U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF5110E316
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883322; x=1803419322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eFBwHGOC/IAXMr/9MRPWP6I/F656ZMgt7M6KeCHQhd8=;
 b=GmwjHn5UNAaeJva/ezUb4sXY548c4epcmSJQPAbgTu/d2Y60ue3g/Hyd
 E9RzAy1Q/aW1Ueqlj6aZPj2gKnogunmG9wB9TUB7D0+3YnLBZbilLESnA
 GzArxL/TvVIV3JeNsE0hQICCl7ilqICrKZ7NrK0dng8lIBafpq2CwXMHa
 oPO43lOQpkla/TOuPOOC8CxlRlX4/A0NtRLVlxq0vhZ9X0gr0ilVJp1nK
 KUQaQjuXkhnJKjqxFY1r+z+0nNEZe5DD1OFROzMb75L6VhC3QbBn3afx5
 wTxHYEnUa8LS7zqfXhSnxWDIJsIsFC9TbQtul65kRxMAu6HlS91GO5R/N A==;
X-CSE-ConnectionGUID: 4BjBmH9ySGKc8D21PkMrOg==
X-CSE-MsgGUID: Krf5V3asQJ26dY2aqvjaNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60465315"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="60465315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:48:41 -0800
X-CSE-ConnectionGUID: aRI3bSfCTaWqI7ZmOzwePw==
X-CSE-MsgGUID: dQYrGm50TmuVAQWABIN0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215712140"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:48:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:48:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:48:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:48:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffgybii0faHmrtWI1i4k7e/dybDNmZxATDY71LmYcxWRqiQNj34NVjc2ZdmqeTGya3f9SYT9/RV8jI0HV0Mc68BNuIWWYsALRHnpSvJo7kOpMuM0ipp10AHPGMvqyTcQKl2wi4T/smllF713HJcRnN/xOCEVUmUyG6L0iGrrnkCkYUMxgIwd9cOJR23Ii0KenT9ay8zy8bllaisZ1WTVLy+fVZjy8rntqHhKpn/z8ey20wqLpujeTsXHIdYvKShL+AeBkzib1sW2tCL2+la8Bq+b3+pE2kO0jJJ4cmUyT5u4zBYJGGYc5XLhDSXTMrs+sR+921b0vmdqXrKXfaws3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW/+KrZX6k/QY4PF3xRfJTIe4+4JmqDhIReUOiW1dWQ=;
 b=xzEy4FdU1wwjmEi2S6Mua2sj6AKWnxD4LNmjNf7FQP/abUlc3wM3D0WB8THrzQXJp1yTe0d1b+fIT0/mCRfQV4LasU2PB+r7SN84wjY6Rnu6A9O8dIfEmClVHYWkzU0YhlXBtNB0di2tPrQiwjEme84CNadjZmn75fgsIGKd16LcShiF48iiW0Iyy1lE4GOUQ62989JwpFK1E6YmscTGnsSZAMxJWQJS6YVHjRJ2Jq6FGRIJK8BpHKhwFMuVH4OzU3G8Z1iJH5kblcUAo1+5oHYPBQkpadwbSbFJJcark+AGHKdSebt24MzyWCocdf2d/J5yQdIxvrdb9h0tsKRvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:48:33 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:48:33 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Topic: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Index: AQHckPkyBh2vRb2pEEC3l3WshI0DQLWQ94OQ
Date: Mon, 23 Feb 2026 21:48:32 +0000
Message-ID: <SA1PR11MB88393EA666B81A3927095BF5AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
In-Reply-To: <20260129082756.1096935-3-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: bdd1cb46-219b-4255-2941-08de73254a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?wQchjsUMVU0siV3oKD/3M0A5x4c4fDXDdnaFpX4WMe0eoaa3SSsCL9c9La28?=
 =?us-ascii?Q?pUjpPpvKwvK1lNpl3fZM8AP4gJC2RQa6ifF+uzUuH+fxi5qsT/JkRr9F9+yj?=
 =?us-ascii?Q?X4YQC2qVeurY+5ddkghO7HZh7mna+tG9XJC44dgOkNPRSp4r1ZRmQe7Cj15h?=
 =?us-ascii?Q?i5QaUzuirFrsKdnCWbg/YoWeqk1gPSLYu/8z85X/cct36+Io3hYmLRucOT/U?=
 =?us-ascii?Q?IhWnN31q+UD6AD7/tv1LhI5SpAqgb2k49Gh0f1ZnY+lXTxHtU36OCG1ONvMH?=
 =?us-ascii?Q?twGnXfVdk5P+tryIxG/9yOYtQOx9hXHpqTzJIYoY78j5OUxYI0CaLpERknJs?=
 =?us-ascii?Q?Lf9TLAyjT4gWKGjGazUw4a+0FPTrz44Z4X/2TYtmQNyZa+WArIfcklJoh4T5?=
 =?us-ascii?Q?ICB87bhu5qrUIFIbDgKoqCi+igOskMpqMtXLL1rY/WOLZBtITwRVscnMdONN?=
 =?us-ascii?Q?OgwsJ54yiu/diyrcaR/sk4bgWoOo5fqX6qi9gT1mYz/hIYcDtfk6qUkM2Ruv?=
 =?us-ascii?Q?2f0lRisNZ56dZYCVSR0rU1cgJAwInsc4gZ2axfm2SsSGSNkBFF8t98vYiLzb?=
 =?us-ascii?Q?SEHFbunygjrI+RChsrBcyY2MHa4+6Oip5IBLB722621tm0k/giL3EiMDnnvD?=
 =?us-ascii?Q?CL6Njqv03cA7qrRU7N/O2Nt5Snj2sxz9ReFNuwBXloiB9PLdembnzE7jfAy1?=
 =?us-ascii?Q?a1qRClmU8ub59Ai6BpBROc8NAWdQSccImPlEneu9Frx1HbFfIzAFVwuVzQ8Z?=
 =?us-ascii?Q?OjibzBx1duKCwHxj9qCzYcz3uA432q5aOqAC2Hqa1WumHOmcOkM80eYAZufA?=
 =?us-ascii?Q?IfYEZBARrnfvbAGPRZBpQHoLlscK0Rd0jKxpYs5WLQUD+EPV5Cz3KrdssSPJ?=
 =?us-ascii?Q?rddeNFqA7A0e1lr/l+ZI90dMYCgqHYu/qDuJiwMGMIJIXJxOy32fEhJpeLMo?=
 =?us-ascii?Q?oBL3dv/NLmuK/OAZJugkgu21Q6y9b0u/r5oHOlPuFiwvpcvXrKEPQ/o/iDBh?=
 =?us-ascii?Q?2lrUfVAnzHaAD0yiwgjNtkIAZe2CHdEaLgz+4iY+JiJX4IxavPSvRKXPdUlU?=
 =?us-ascii?Q?duWRri5Yl7zhXjgmfRkyXntREkOxAqS0qP4NFoHnhurAm4PfkUqwPEABHqMI?=
 =?us-ascii?Q?GEQb/CGYc5C/8hw8XMgyJnXTLMCgCqAKA3MeLdx2yB2Ln+polct6F7ZKHaaf?=
 =?us-ascii?Q?+6X97zI7QR8aKarzjEdeYoqFwKF2MAWWGcg/4Lp9TmLv/f2lFKOsKiVBbMa8?=
 =?us-ascii?Q?jH6cMwX1/MqpY4x7c1ovDDOdrUkDU00kEfbl05eMs7ISP6FeMdkzeCAZ7BgV?=
 =?us-ascii?Q?Q3Axx5W6fZpJMAexsrzRbHdikA7l2aQL/KNwqpQ5zjlTz2n7O/8ZGA4rczKr?=
 =?us-ascii?Q?C07cq9I3Su/szij4jv2fZ3h+6pojp11FlMPQKaXo/TSm5599XX+zbPBFYFDU?=
 =?us-ascii?Q?K/bMwzMn/nzGH1R+A8dPQisJdq6eyt2scftS7sUZmkueEkpFAl2tGVqPuPqp?=
 =?us-ascii?Q?eC+mg1uQMnz+LuymCP887besmWchB94DFfzuqi9ZreV+EIyb4K0iuOnJM1pO?=
 =?us-ascii?Q?/n9OlzW6Kqn7+DQS8EyxW2lEfBwbe6E/X0Y1P0V83OFgO3j5ELT3EI2xGJLQ?=
 =?us-ascii?Q?qdYH8gas9LbIMlTHSFYE1QU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MJfVchDkpY8peqtoc/3u5ys9DTsuLRWgYPnUr66I2vEpp9axaaNeDBUVcIaX?=
 =?us-ascii?Q?71Dqkt97gFQiEI2zr4ree8RVecB1CVc27niuiHggYHlteQtkbbNzemZi8u0m?=
 =?us-ascii?Q?TiACtDJ4K6/4Oosz5qx/g95wPPZcRUVUwMdlhoCMIsCjGu1zmfWINsAUtjD0?=
 =?us-ascii?Q?5Oz1UtbJhFjlRvU3Yqb6NYJ6idFyp3W1o9ghuoJ9j38pqICR54ZWQ8NVk89c?=
 =?us-ascii?Q?iHjwi6XHL0n+orlk7A1evw8TcK8wJKErRt3IvC/6qCvNsYP6QblqZRfCN79r?=
 =?us-ascii?Q?qa5amzQNfP/AYMwx2hUoIvcObBxHLM0UvqqX5oMvOSHEG5L3zJGjqXB86J6r?=
 =?us-ascii?Q?RjoMsqO/Ky45oqbhalyTmbhrVtfT+MwpM0JOWhZ43n9BIYF+LfDGEvf7J64X?=
 =?us-ascii?Q?a0PrijbQayZMwwP5WZpgLQRN8ycAo5mnB2IuBpW2aBd5ZqRxmy69fq+0tbhu?=
 =?us-ascii?Q?QFAybLR821AHXYrHppEmWFWmYKDCi+CTLMbfP/IvmghboqB6g/xmIBnZiBXE?=
 =?us-ascii?Q?ecskXBhVwQXEp0rR0V6HnUYDiLogxfn0A8XHyTFDANmgVlzDd8hvuHhhYfR0?=
 =?us-ascii?Q?vDdMDR/Qg32ElOlYMKnZHuM9G8YpEYnmjd+jY7Rt7ewlvaKdMFR9eOiXCNfB?=
 =?us-ascii?Q?F+WGfOjx3elnlgFQGSb22/GGtWsC0kAgY0/DXml0N0/iT9F9clwVgoWY6Wu7?=
 =?us-ascii?Q?ynS8cVtMCbTGTiLgu3N41ZEE/dYWhROM48ae/cW6wQk/8sm6vdNQYXW08E2M?=
 =?us-ascii?Q?sVjigqOR1hVihBc3QJVWEPBgGw84J0z81o/Bj7ipoAFXUBNyR9S8o7XVObnB?=
 =?us-ascii?Q?5Pdk0zy2/EuSx05PckROrOdsSYwqv7TyBTNnmUsdSwpStdg+EbKUrUVg6L5H?=
 =?us-ascii?Q?HeUR62xRAf2uRQvghHE5vnhthxKNZFnsMDCtMdDuqX6QGaLrSd1Wyo7FcQYk?=
 =?us-ascii?Q?0PALbVOi+GC8W5yMZP01/8JJXo6koui7GLgtLrn7IPbz879XtJHd6dibShOg?=
 =?us-ascii?Q?xWSNKWF7V+UqOiP1NgqyhRXbc6zgzppNM7mi23nrNfqmr4WObxslOzPh8I6h?=
 =?us-ascii?Q?X+KyRAnF/f6eFuxJHSORHirUYD2smiUp6CQYoHO/R2I3DL9vP0UVfz127qqq?=
 =?us-ascii?Q?iEMmXhbVeAFacRCWxZcpFQhM0lc838R3LsIUAGn8kvK46p+fc76u4nb8dGuO?=
 =?us-ascii?Q?3ZPNW5Gajqc+VoIvSpdnVNZvsmt8kyfTSQ2/Xc53hPZPhlSxFXfJoIVc5iRa?=
 =?us-ascii?Q?50OMmRH06Ic/Ll3w9S9oYeLQLWEstCAZ8Tg74BWhZWld1Nq+QnD+E5DQJvCv?=
 =?us-ascii?Q?APlb3XDxlorDqloe3ZTh3ybszHCpYTBpFzzZc3ybn9vPV+4oa8CrzEJI77q1?=
 =?us-ascii?Q?mPxCyTHbFFg6D72D0XumbcwhxQVWWm5aWgolvegQ1ppYrxE+m0gwFgJELKit?=
 =?us-ascii?Q?aUzodrEG3WWsJ6h+tk4Pxp1qAoCnExbPeyzmL92D9OfLU/cRsH661qKx6rSa?=
 =?us-ascii?Q?MCEhocuTVaoI1x4biSWF/Ss2BFR778mvXRl6vWTv7t5lGmG6+wSWv6F2gXNx?=
 =?us-ascii?Q?vg/Vm7BrVSVCAesxoFI1EZrTNEhdu8x2lmlz82kuG8Ypo5vuBntxp1FPpmBU?=
 =?us-ascii?Q?jk38lvOpncGS5REjYkWK0vuuG2Rf8UqQEQ6qRuwVOu/f7kPhCcA46HLDd+0u?=
 =?us-ascii?Q?70GlzRKVpXjr2X0SdIoUgFQgZaPnTxOn8YAMNIPCCeN4wkuPeBRTaAz2G8HA?=
 =?us-ascii?Q?O7x+at/kiA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd1cb46-219b-4255-2941-08de73254a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:48:33.0286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nGQZOZnNItlSSgwB13ogOm8Pou/rmYfwMLhn5C8ydjklj4/TP34or0A/5pGKAUTKTcgzqc0isMmn438D9IDPFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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

Hi all,
Just bumping this patch again for review since it hasn't been reviewed yet =
but the other patch in series has.

Thanks,
Brian

On Thursday, January 29, 2026 12:28 AM, Brian Nguyen wrote:
> The check using xe_child->base.children was insufficient in determining i=
f a pte was a leaf node. So explicitly check for if a pte is a leaf
> through the bit checks.
>=20
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
>=20
> v2:
>  - Remove old assert. (Matt R)
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Cc: Matthew Brost, since it relates to some of the PAT handling discussed p=
reviously for page reclamation.

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x 6703a7049227..b73a356d0fa1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1655,7 +1655,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *=
parent, pgoff_t offset,
>=20
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
> -	/* Check for leaf node */
> +	/* Optimistically check for leaf node, may not be guaranteed from
> +children alone */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
>  	    (!xe_child->base.children || !xe_child->base.children[first])) {
>  		struct iosys_map *leaf_map =3D &xe_child->bo->vmap; @@ -1675,10 +1675,=
13 @@ static int
> xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				break;
>  			}
>=20
> -			/* Ensure it is a defined page */
> -			xe_tile_assert(xe_walk->tile,
> -				       xe_child->level =3D=3D 0 ||
> -				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +			/*
> +			 * The check for xe_pt's children is insufficient to determine leaf.
> +			 * If not leaf, break out and continue in next page walk level.
> +			 */
> +			if (xe_child->level > 0 &&
> +			    !(pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)))
> +				break;
>=20
>  			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS=
64 */
>  			if (pte & XE_PTE_PS64)
> --
> 2.43.0

