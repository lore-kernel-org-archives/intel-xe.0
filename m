Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A13C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508A110E813;
	Thu,  8 Aug 2024 21:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThAlDbCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF9110E813
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723151136; x=1754687136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rg5hX+pytEGgRCinj4gQDtHnysbr3g4YKftoP3oSCws=;
 b=ThAlDbCeBF1VgBv8bvKwfKQ9TWzFDqShbQxESGu/8aEsI/IhPu5ClvZd
 C7rDRRzV+sfvGcGC3GflY0wpdias3Un49/VZ8vsT+KgNem+PC9GQiHZsQ
 JgjNq4c3/gVWRoXSxSxkOBe9L7E2LyEZrK8oj9ydJUz5OeE/A82VSNaSM
 3TxLg6V//ofsVquUErJ6kdVhlkl37jQ72GmnTMJKSYX99exoqMHYpmtq4
 JX9Jewo4EtKbnFRMYgoP9n0soodvwmtIK77NL2IFbrWbb/an5YlXE1QDh
 zF2ZlVMmUj/lncCYCLHnJT7Sb11KZRFS5UMyQu+YSwBl7Gc4coE1c4sJj g==;
X-CSE-ConnectionGUID: aSgrGVt3TgWgZm7CEM/YOQ==
X-CSE-MsgGUID: OiiWpb50T0OZXk76r0Ry4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38763022"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="38763022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 14:05:35 -0700
X-CSE-ConnectionGUID: tuLENOMoT5aWmSqfidJWiA==
X-CSE-MsgGUID: q7EdJgnzRY6iFNWMXPrtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="62305687"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 14:05:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:05:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:05:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:05:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcpQoltyOKRVYgcCXWu9WCOYVLvks1SD0csWRL1CH0+w51QiWW255HM4O05Tjjifejbr+Vj48ER5By8sYzheUbqJzfyNM4g6jhZeKM+u+6wACDAE5bb1kFU99GCZrvJayQhDi0C83oAg99GFLDSe3wHt6HG9dKg1OECMAZC74zUQrQf5ddP8SbkJE0MLrtkfIyK1Z0hkr5QFpYp98MkS+WMYvxvaIKPaJicyJx3Lcuf2BOGThYhhNEyp+3y2hSnzLUvBYXFYWYJB54C1K8xYmfcKNhEG2N2SFNTYFhIyIPePeQrPkkplFHhFwTfcKNLG2BhT6WLPJoMNbJR3GvAt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMJi/hMMPDrAaN1CNYixfFttBzDbFc3guXFmwdq3/Bc=;
 b=Tk/NTt4hejq+ajwn31JzJIAd4ddUgR9SL6WQq+TgSpL1cDwfKMIxEk9bqAbYxIM3OYkyC/FS3ulF+ksbeWFjBJT0+C4aq9KRj4qVyfdm3WgB+xPM611/e4abG7G/ZwX4uEb2wzFUsVYIkx5bfbN7P8Smix+7BF9BEeD5TnoYDA1fkZTZQ7BY/qgMAFLA7P65ZrD2JFmQso7KrY8PxUBfNBQ6BQbZRpfc1Pczoe1Mxzya2nLK5iMwH+RD0lmmTNImLtkC3xIWZ09ld2JkoHV0lzG0emmwrKeN+a+Tl0JVaZZ5GEs/tKzyWbJ1JaHQz7oUceJum1WwdPWCYkS64y4SDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 21:05:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:05:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/8] drm/xe/oa/uapi: Define and parse OA sync properties
Thread-Topic: [PATCH 3/8] drm/xe/oa/uapi: Define and parse OA sync properties
Thread-Index: AQHa6bpKK3L8lez0JE+1PnpV4otOkbId2Bkw
Date: Thu, 8 Aug 2024 21:05:30 +0000
Message-ID: <CH0PR11MB5444F22CA63961A73E0E4E99E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-4-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-4-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: a0d29076-b359-456d-95e4-08dcb7edd5ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9TIuV8SVbTz9ssBFiZ0beCCidyl3RHuW6K1TGbfwYqBHOkwDNQjAMr1/2uGZ?=
 =?us-ascii?Q?Q9kbxOD4k8S23atNcEDgpTofMmfzgz1wQ7E9pAx44POIJFElq7vSLE0bie5m?=
 =?us-ascii?Q?WzC3Polt6NnuyFZj+Y0L0w3Ahrr9QWSrtnwYpxMjwJIZQGVSVgssLngMkTgi?=
 =?us-ascii?Q?ZpcMNCu3gwq9hC3ddCaiLaBSmHG4MMpqV0MhJSsyKj2Vyn1Q1fdTAff/2Lae?=
 =?us-ascii?Q?onMQm2Mwbgv5BDmH9ZAKmktbU1/uZIkzmcM+YMiatzc5XuD2ELpuDu1jZilp?=
 =?us-ascii?Q?7j7sGqS5+nQcXzliU0q2K0GRzsM+FIR3u+Pl4SNOcMtrPj8Xm++67G0yiN3e?=
 =?us-ascii?Q?1aEbb51xRZOUeugicTaEica15AEMorV5GSAHJ6m3tQxlbOHQlpoL4zdAqDCe?=
 =?us-ascii?Q?NUu7E3a1T/smJH2/vKmr0UIwG9pGpSVXawaEYiWm0l7TS1qRW3SbqX7UHjG3?=
 =?us-ascii?Q?2AiLD3wos7Mb+T2ObfgMFKB9q+1+UVwLfDzDvdgrQ6rateMMWpUcpRoqz/UG?=
 =?us-ascii?Q?+JMFNKvnNhPWROPUwJybFLdgTJH4Q/SwL3RsV7cxlXt7Ykcv9g3MeOImm0Du?=
 =?us-ascii?Q?6P/9aFvfG8dm3ZOGKx5bjVD8gxp8x6kyZMDAZEH23pb6CQgxVQAkZZJgWDk6?=
 =?us-ascii?Q?YnJWonluVx4umVh2ZoVSalpr7tq28DzeqaanRyQOJRFbmyDWEx0dgPjUbBt6?=
 =?us-ascii?Q?vE+rT5+SY1GlTr7a+h8GSOOjrWpQ7Y+hV2i/cTkWOsUrWakNS9kWlM1dSQ2z?=
 =?us-ascii?Q?nmlFy81jZhBZ3MxqFwHtRaYnFuE3nMKcnBU7EpZCV3hbD0iw6+OnMHGJ9BHx?=
 =?us-ascii?Q?XNTkRl5XwlHTxq5FVmmZbc3Lkk5m+jAmhN924kyst3u8HsyRnBQY2ef4M8jE?=
 =?us-ascii?Q?W3sXphd7ywP5Ubfn9l39pacVFR2IXyYKAbcWmRFO7G0GjXpHVL/WqP8k0s69?=
 =?us-ascii?Q?+mDzVq/P2rU4ZOY3wrBOtvD/VoulFezlIl1OC1NiBK4Rc+fNbsuj2QIA5HOI?=
 =?us-ascii?Q?GgtbPBrxojnMBI/OhFE7vE25jFzOxCGbzvJf/Qz/0OS7tPWNyXWi1wWG+OKM?=
 =?us-ascii?Q?Akitm2xPIH+6IKa4lyybBujj4DC04rZbxV8pKhvA994dIzxZt9eUPJ/LyAMo?=
 =?us-ascii?Q?9HlJmZ/6qurqgz9TNwyMpLJKRinAfzDu00P4haAMyQKg2pje8p9C7QbxJ6QJ?=
 =?us-ascii?Q?/0Vgqbr+KqqEQDIwDlpvnl0yW9medF1uNt8ipQHb5MabGHG6ESQEnZy7y11e?=
 =?us-ascii?Q?E9CNAbMyl8w2ENNePZha98Lh/5onwYT5XWIOy/uBL13Y57X42lbAY+WPDSrL?=
 =?us-ascii?Q?3eF8NgQm/pS0vUQj9REvlAgHZh2CjTOc+aKjElEGmwhef7N9PS5iTSvxPiu4?=
 =?us-ascii?Q?xFu2FeVtKxCWFckOb6B7a5Mi2EcfF4NiA5oDGPHsA0FYczmA9w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hqEgEW4+0unz9L0YkQq4cqIbYJ2ffwwKXEd5IH/v9TF2G0gIQKTPtXzhh6jo?=
 =?us-ascii?Q?otVgYlel+0KUKxLgSImYzIfjW3r2A7/OccvLLuj2clRc9YEzl9deal7OGmOo?=
 =?us-ascii?Q?F3qmwmC0Zn8zIhKZbkWtaeZg5rDfsatUnTqZv8sLgjo0897F7/laryqDx2lx?=
 =?us-ascii?Q?n1QAlJTqu5VK2TFVZK5LR6AMuFA4wXJoQmNk7Fry+o80LcrjVIuMKLi8nKML?=
 =?us-ascii?Q?1DiWAffym3jTfD1n99OU4+F4JX8puX4AM/YcaeHYx0btokjYNcgxzhQCYFyT?=
 =?us-ascii?Q?yrKSGKZbxyNFg6N8dLJvP9TRVwx0pxsgz4hHmmfMFg5odwQ8lhu0dNQmdZr2?=
 =?us-ascii?Q?j+FElMrrpHTHHdNXtFCjazzw1A9jF1uHY+LZzdHqJ3fP74XfTd0tymmXFabr?=
 =?us-ascii?Q?1yybjXJui8XwLdAmOPUbWaveAtaCyaxA1V2rGseWYkrMm5OFY4LQbuyykP4g?=
 =?us-ascii?Q?/hz2ZeKburbvtKJAf3yZEvLHhvQnYoa9Iw3o9Pi7uywcBG9Uf5U5Gl1FmXSZ?=
 =?us-ascii?Q?XPktoKySrUJ+1W1rTybi2CmD5FzNba+cp+c2rV9l1xsIxW7Z1zUgUakifgRR?=
 =?us-ascii?Q?NqA/iU9WcUIKscsFGGKey4VRUcyfekjzgl8aE9uI0vjGhEOY7zwx8aoT7HPs?=
 =?us-ascii?Q?5dkzUmeQfSD9uWSxTiJBZgdrKkslQKVGwxLJ9iBFeKmmQ1ivWQyiLrisA0SN?=
 =?us-ascii?Q?1ixcADUpT2+3pLeXwDyYNfrfkHo7IuYoBeTn6SfEw1NL658N3X11fzn+7AQx?=
 =?us-ascii?Q?fUrVYgYg26e/mWj/a9B62JrDW0lweRWBNFXixTgvcwBhXXq10+y9oto9p7Q6?=
 =?us-ascii?Q?sXhAmI0MjGwZuRN/X/oLKrswalUMDbHSoMOrYqcCJLeACiT3UORZ0ysNQi2F?=
 =?us-ascii?Q?72DBCZP3TdEl5z5Gko/irDOBu5eGUFgcWNENcY0udiuDLCD+m0PHCeJGM3pi?=
 =?us-ascii?Q?WPmCUq4mpNi7BJjEx41c3awf+GKECmbP02Eq0FyAsc5Mltz/IgSDzmjthl9w?=
 =?us-ascii?Q?Nszye8jWD7+xw5B+ENg5cIGOjXrQSLNQabbsrpIHlscJN1ORAkrElxlbfIoq?=
 =?us-ascii?Q?CjkmjS46kSHM+wySoAscUuwAMB0NhOsyVToCH70Tb2BZdbRC3zo6kU4AOS5F?=
 =?us-ascii?Q?IpxffEe3c7nam7AO/OxXZ9pGnnm7pcLzDntjELzhAN1ptiKsUY5n9NYd0DdM?=
 =?us-ascii?Q?HITDLF9aIL6NV0g2qTdjB3UJC50F63NxJfgtT6CcM8nq1E6TupLZLJb4NUam?=
 =?us-ascii?Q?5GnfPQ+a01iuPLE26vsB9rtXIrR9DKuhH2cOyNWE69iychcDwucAsOt4R5Wg?=
 =?us-ascii?Q?k5ZtJDaOiNRlFCY670bxWeRkjkI3mK277V6sDxybx10rhRpGc7AF8o0z1p4m?=
 =?us-ascii?Q?5rAdt5wHMlqW1Ld7mNlZ2pKCZsqoVvdXgyXHLIZhxpKR0dpkYf7rU8PzsB18?=
 =?us-ascii?Q?BgoZiw4dRQ2wWNtinMZMv8uYW7XPex2+0Ph/q0kwV1BMzW9XFM9jSiPZyWXj?=
 =?us-ascii?Q?jE8m9uf3GHGIGWLVtcDIUnmxWJf4d4Ke+UrEvUzwWAAyFxhSO1dVQhozPGGG?=
 =?us-ascii?Q?8cbDd1W3SBdsf0juCkcbfHHxYKOpR0sOQnPuJw5C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d29076-b359-456d-95e4-08dcb7edd5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 21:05:30.1273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dKc+uHuaQ+eULnyww9gA1A/FBTCoEhxmKZvNL28eJk8Ir2ODSVdvkGYhOzeVHqJPibXTZJELL/DUC0CYBr+XKGRJsP9VrbTFf5d7mHHHBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 3/8] drm/xe/oa/uapi: Define and parse OA sync properties
>=20
> Now that we have laid the groundwork, introduce OA sync properties in the
> uapi. Also parse the input xe_sync array as is done elsewhere in the
> driver.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 83 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_oa_types.h |  6 +++
>  include/uapi/drm/xe_drm.h        | 14 ++++++
>  3 files changed, 102 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f97d64ffb460f..ba8f2e9d95b7f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -36,6 +36,7 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_sriov.h"
> +#include "xe_sync.h"
> =20
>  #define DEFAULT_POLL_FREQUENCY_HZ 200
>  #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ=
)
> @@ -70,6 +71,7 @@ struct flex {
>  };
> =20
>  struct xe_oa_open_param {
> +	struct xe_file *xef;
>  	u32 oa_unit_id;
>  	bool sample;
>  	u32 metric_set;
> @@ -81,6 +83,9 @@ struct xe_oa_open_param {
>  	struct xe_exec_queue *exec_q;
>  	struct xe_hw_engine *hwe;
>  	bool no_preempt;
> +	struct drm_xe_sync __user *syncs_user;
> +	int num_syncs;
> +	struct xe_sync_entry *syncs;
>  };
> =20
>  struct xe_oa_config_bo {
> @@ -1417,6 +1422,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *s=
tream,
>  	stream->period_exponent =3D param->period_exponent;
>  	stream->no_preempt =3D param->no_preempt;
> =20
> +	stream->num_syncs =3D param->num_syncs;
> +	stream->syncs =3D param->syncs;
> +
>  	/*
>  	 * For Xe2+, when overrun mode is enabled, there are no partial reports=
 at the end
>  	 * of buffer, making the OA buffer effectively a non-power-of-2 size ci=
rcular
> @@ -1767,6 +1775,20 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, =
u64 value,
>  	return 0;
>  }
> =20
> +static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
> +			       struct xe_oa_open_param *param)
> +{
> +	param->num_syncs =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
> +				struct xe_oa_open_param *param)
> +{
> +	param->syncs_user =3D u64_to_user_ptr(value);
> +	return 0;
> +}
> +
>  typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>  				     struct xe_oa_open_param *param);
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {
> @@ -1779,6 +1801,8 @@ static const xe_oa_set_property_fn xe_oa_set_proper=
ty_funcs[] =3D {
>  	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D xe_oa_set_prop_exec_queue_id,
>  	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D xe_oa_set_prop_engine_insta=
nce,
>  	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_no_preempt,
> +	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_num_syncs,
> +	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_syncs_user,
>  };
> =20
>  static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> @@ -1838,6 +1862,49 @@ static int xe_oa_user_extensions(struct xe_oa *oa,=
 u64 extension, int ext_number
>  	return 0;
>  }
> =20
> +static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *=
param)
> +{
> +	int ret, num_syncs, num_ufence =3D 0;
> +
> +	if (param->num_syncs && !param->syncs_user) {
> +		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +	if (param->num_syncs) {
> +		param->syncs =3D kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_=
KERNEL);
> +		if (!param->syncs) {
> +			ret =3D -ENOMEM;
> +			goto exit;
> +		}
> +	}
> +
> +	for (num_syncs =3D 0; num_syncs < param->num_syncs; num_syncs++) {
> +		ret =3D xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_sync=
s],
> +					  &param->syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC);
> +		if (ret)
> +			goto err_syncs;
> +
> +		if (xe_sync_is_ufence(&param->syncs[num_syncs]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
> +		ret =3D -EINVAL;
> +		goto err_syncs;
> +	}
> +
> +	return 0;
> +
> +err_syncs:
> +	while (num_syncs--)
> +		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
> +	kfree(param->syncs);
> +exit:
> +	return ret;
> +}
> +
>  /**
>   * xe_oa_stream_open_ioctl - Opens an OA stream
>   * @dev: @drm_device
> @@ -1863,6 +1930,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev,=
 u64 data, struct drm_file *f
>  		return -ENODEV;
>  	}
> =20
> +	param.xef =3D xef;
>  	ret =3D xe_oa_user_extensions(oa, data, 0, &param);
>  	if (ret)
>  		return ret;
> @@ -1931,11 +1999,24 @@ int xe_oa_stream_open_ioctl(struct drm_device *de=
v, u64 data, struct drm_file *f
>  		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_fre=
q_hz);
>  	}
> =20
> +	ret =3D xe_oa_parse_syncs(oa, &param);
> +	if (ret)
> +		goto err_exec_q;
> +
>  	mutex_lock(&param.hwe->gt->oa.gt_lock);
>  	ret =3D xe_oa_stream_open_ioctl_locked(oa, &param);
>  	mutex_unlock(&param.hwe->gt->oa.gt_lock);
> +	if (ret < 0)
> +		goto err_sync_cleanup;
> +
> +	return ret;
> +
> +err_sync_cleanup:
> +	while (param.num_syncs--)
> +		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
> +	kfree(param.syncs);
>  err_exec_q:
> -	if (ret < 0 && param.exec_q)
> +	if (param.exec_q)
>  		xe_exec_queue_put(param.exec_q);
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index 540c3ec53a6d7..c1ca960af9305 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -238,5 +238,11 @@ struct xe_oa_stream {
> =20
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for str=
eam exec_q */
>  	u32 no_preempt;
> +
> +	/** @num_syncs: size of @syncs array */
> +	u32 num_syncs;
> +
> +	/** @syncs: syncs to wait on and to signal */
> +	struct xe_sync_entry *syncs;
>  };
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e9..0a3daaea4eb27 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1632,6 +1632,20 @@ enum drm_xe_oa_property_id {
>  	 * to be disabled for the stream exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> +	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 */
> +	DRM_XE_OA_PROPERTY_NUM_SYNCS,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> +	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
> +	 * configuration will wait till input fences signal. Output fences
> +	 * will signal after the new OA configuration takes effect.
> +	 */
> +	DRM_XE_OA_PROPERTY_SYNCS,
>  };
> =20
>  /**
> --=20
> 2.41.0
>=20
>=20
