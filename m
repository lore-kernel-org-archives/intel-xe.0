Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254B1C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 22:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF010E864;
	Wed, 23 Jul 2025 22:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZ8NnpNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA09910E864
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753308091; x=1784844091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kCPDt3F4k4e6z/ErxPgV+49TRVDotemVNanpF9DES3s=;
 b=mZ8NnpNqssR1xIcnev6bXtQBfgiFIUj+Zh2vBn604WaIJl/OXxaukDi6
 88kum/ebpEuQE3S+Lh9VnDupAlfUgZKHuIm/VukOz+DhpdoQ/2yD/f9EB
 IRdqOZqM6mcV4eKeDteYw+FKVVh17LKW9OreVQ39q0eoUX0XkjYnp6vZv
 KoDegMy5fN19gDoGsLE6D7ls4mxyPxsRkt2kge3ZNUvsYgs1eqhqVtTTL
 1XNoam5hg3gWKbFn2fy0E5fnw2cr7Vo0stySrNhMIMFDBQn5Sf1BLLTy8
 5bgIHlB+nEIzsgwikRJUuYktbNXtMQq14GhO4KGpZjlsvr/eZGuZWdpJO w==;
X-CSE-ConnectionGUID: 7UlEcx0sTpGrYNerxzPxuw==
X-CSE-MsgGUID: QpVht5N0RDOpJOewmx77rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54820070"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="54820070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 15:01:30 -0700
X-CSE-ConnectionGUID: Wor49521RoyzJg0xAImabw==
X-CSE-MsgGUID: ugSEM0S/Rj+6s7y9V1Go9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="183416131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 15:01:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 15:01:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 15:01:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 15:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEGABwumZKEtvljpLmSKL7KfOGVN/VYYZpIScbqw/Ut0S5BHpQVCMrR6jEtALatzzo3EtlZOnbqkBYpFYYgoqMwzIy1Dlzap4zQfOTJsr43jjH+cQlb7UQWqal5rSVT5uIOLtmVfCRMcqGO5swUs3Su8FwYdpPKPkqzlpEu7CqtBt2UOZ6GlCqWoC07CekMbBKLaG+rdSUYsOLd4wSyBK7HUanT9s+BF3dptU9wYK+apObZiYLgQ188gZfgWVc7mcMqRJ74jCXX094uCr5xFgUPojS0U9EoR0ewIFQ7ZXGNp3gTmgy838svElW9SiQ6iIWHfckJjJT7rWNQqYQHRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qJC0Oc1HN4GDcGAfQ2uXqRwgv7UId/nHvyaa1rSf6I=;
 b=WliCDTdid1mDz0Iu6ff38MfLo4dyLqiExmqIqhYz3XCz1JoyrtfEWSYS9NXykfzX6g9zhWQ5MzoZ6zkbf+4iXtvMzKzvwR6pLJgGV/ixwkjiFC0mXtKMQEK4Ei37GM1wJRe08Cdz7NJDVALkqM+KRiiPcm2sAJib4cxCgFY6DcGsf4oi1hWBmu8y0AfQgss5eSzOKp3HG4gLZfYFMHbQXuhpUvuvVnVj3y+6Vi862pHtRZNOloZIgsLd9ew6EXLoZBZJhMc0tysNfWUWgnPwZmC/GemY+7Xd7fZTPWgQxXStZe9yA6yrPmdK+tPWKCzg8GKfrBy4pyff+gUZtB+Rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 22:01:28 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 22:01:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Use for_each_gt to define gt_count
Thread-Topic: [PATCH 2/2] drm/xe: Use for_each_gt to define gt_count
Thread-Index: AQHb/A9jy74dLGen5Uay5u781FZsnrRAQOsg
Date: Wed, 23 Jul 2025 22:01:27 +0000
Message-ID: <BL1PR11MB544589805EB52F430BA3097EE55FA@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
 <20250723-gt_count-improvements-v1-2-3016134db9ea@intel.com>
In-Reply-To: <20250723-gt_count-improvements-v1-2-3016134db9ea@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SA3PR11MB8073:EE_
x-ms-office365-filtering-correlation-id: e00a6c76-430c-4126-a914-08ddca347958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kslOp3aoZTIA/5Wa/9cJYqpJxW97zzl0U2NZfC8v46ibxjKBzKh0GoZPyjzq?=
 =?us-ascii?Q?E3CMKOT3ANPNAZ+cSQ767eNJJqIqKcCl/6wXNKL3RKK2M0RAfW9gFjGIMd6k?=
 =?us-ascii?Q?XZswytSjxqTs2rvnVdI48ro5LEIVyvqh0W3Xzzk36DqZEdqRNT2LkHABa/U1?=
 =?us-ascii?Q?DSq4PqVBf5EyQAN8Psft8v4GCjaz6yVp0Sw+4rgVKvZdVVkjOzf8LoPvNzzq?=
 =?us-ascii?Q?K9hwb65RuvvsvMQHiHtcaYMnyeIJ/5e/5TIGoMq5aYIN9TylDYzIJ+NaJ36L?=
 =?us-ascii?Q?yYaPMFp8guE3RA+CFJBFHR9cSFX9r9mTtxgv0XJbuYFkJj7vQEfeHRFbMOrY?=
 =?us-ascii?Q?77BkkR+l6FiqdMsDHjjyT6vafS5ZG9i41MrH6hQBYO3OEcWk2yQBw3mJ2G9g?=
 =?us-ascii?Q?l3XyxFQ5vQaXEx7LUm0F921GCRe1ZZYrQHC2fwzGh9Wz2FAeNgYM4wGJZC45?=
 =?us-ascii?Q?XnnToJKmDmD+b3NiUPtVAmVa4zO9go415PgnXhGFNZEqg1xCgrq09fHB/P6s?=
 =?us-ascii?Q?/7iq9OzpHR/v93wOY3umEarZ018NAroLA0vbG1Pw/IUy6TKgBgoWunyVkst0?=
 =?us-ascii?Q?5t3c4oc7pNMaHOil/Pnv8zAsONoBLyP5gClcp56yTxQI28RJ3jrEtEmeyDuG?=
 =?us-ascii?Q?ymMbYG0kLG5I96R1HxUWcO2yv1Tx1RgZnHA72pATyRfvneL82e1YQAGyfD+E?=
 =?us-ascii?Q?VzHrVAMtiUFSIaczNlx90yOP1mdF+GDLB3b6WhzVZrEh7DV9eRooYHx5rtOE?=
 =?us-ascii?Q?BnsP0wO0h2nnsWCh/g7Mciv2alCl4n54+oA33E99TLpHEEEDzYDFUB49Ttar?=
 =?us-ascii?Q?7iMMnbRE6okByGeCtggLuceEM//Sj7GX8jG0kD5etJ4D860vVoXlyR8n1ydw?=
 =?us-ascii?Q?xjH/UzuL8ft5aaCJDpx/IjP9+F9EiszAKxPmIzPmL6ejUurso9+vEUAD9xRd?=
 =?us-ascii?Q?7xcMhDYqFp1pQwxJkIOl5JrZnKbLJJBLHXTKcrWZpJDuRdg0EXduUKimVACK?=
 =?us-ascii?Q?P1eXJxnYtGMGXCjGrKsXMS4Hj553F+gI/1I+yZX/zdEi302oermCi8hmAZTM?=
 =?us-ascii?Q?RXI+As6GuCCIEu2/9OfFiOYcgltKVOouO0XYCHLe/RvO8PEsBX6S5qYrC81P?=
 =?us-ascii?Q?IpxsAqjib4r6lRxmdbTI97nQp+823lvME18WWMnu3Uy/HwYrjF89XaCDu43g?=
 =?us-ascii?Q?kzl930GK2DkL7BV1+XEGv4XPTz+kw3f4kiaIyJJNV/IkRZcKKTTcTOIx8Ue1?=
 =?us-ascii?Q?Igz7rlrI8q7cdhrfleNLXoT8zNIgYyMWAu3uJ9tHszvWHLaoC6l1TGSxGFvc?=
 =?us-ascii?Q?OxBbLE4AZqfoVArLBHgYGLx69tsa4A5g0cmgMrmy0Byca1ozVT29+fjN9/MP?=
 =?us-ascii?Q?ETbKo87VTNaQByOqlBcdqbH3tcPLLtSBUzn0XgsBBedr6ZDOufFflCWw3xPt?=
 =?us-ascii?Q?eLfwYOmp4Btjocy7TMfDjaOW/Q/yeQzaP2TJTRxaUn/s1gCCEKIQ4w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fSlDIGryTIDa0Xy231UiPwgYENk8cV9Vzy6mZNlZo8n43UrIWRIe6WzbKRM9?=
 =?us-ascii?Q?hlFVOi0RN6D02teQXJRGT+iYPsW71/yEuEPaUxYMPDwcnM0EFo1OWKwUZrVA?=
 =?us-ascii?Q?mtMTDkKVUFelzCFOgGuceOgLww4RJWGCcMp2O2j93zweBn0Sltep2ZWBU0uf?=
 =?us-ascii?Q?OTq5Q29tuE0cXBXihMUypwMNcLiNmLgr6bimGsheL9yxGol+GjwNa9CF+OmX?=
 =?us-ascii?Q?w5a9jTtlP5ZePALZW9uhh5pOHSOW8SLmv6gTbjMVF/HNGATWllYWqMrIGjem?=
 =?us-ascii?Q?ZkwysSHwpvKhoseFYu+8dFlTRoWn1bD+dzgMoMKubipwe8aCl7WtW/cd4V8j?=
 =?us-ascii?Q?w9f+HL6st8upy/rpbLdnqK1z23ZfB/y5oL6v/3LLreNddACHIDpVPohfD58u?=
 =?us-ascii?Q?5cEk8ZLl0jFPguR4/FDuYakfSrFodReDEAfGF38wN3zaB0jCRHTZvZcUfTIG?=
 =?us-ascii?Q?v7kMZ8ZmBA2JLqmF1CmB85Ppaw6gu8jnWVH6n6u9x6uZeOqZPBJSmUM0OF8c?=
 =?us-ascii?Q?c8O4Dpdb3fox3qUBNUJGvVwvdKu8DWxhd13jEVyTKs25whDe/eyWwSgNkt4h?=
 =?us-ascii?Q?XKBo5TGjBeg2d5o2cS97S6IUnJmfxjU7/4Ha9c8Fp3BYfJXRuDqWdM5jUNJM?=
 =?us-ascii?Q?I16xxSP2iaYbTvqOIw8barpfO/fU/IdMRnD9RfFchcjT7UUQsZ6cAPHo/oom?=
 =?us-ascii?Q?znDrjl2R7zKux+WKiv6ISr+auigl6ugC12xFXRJvcezKGOkO7WC1oG0XbU4n?=
 =?us-ascii?Q?heItqeDG6flEPp+VcJlLerssP6IXS1wExqOfH1gN6q4KM8om9Yp8f579oe7z?=
 =?us-ascii?Q?4IKx1WjRHfFrxslt4TQY8s470SNc8LAjt68L4B8E8i8Pv8Vtt5gRlinnKHzM?=
 =?us-ascii?Q?uZomg4aUsdYWwrfLaSXT6YHYxw7xqA7jmOSwiWoJURBQMTm3eYeWb/ISCbum?=
 =?us-ascii?Q?GrVSLtLqff0GhAwezfywoW2nIczViKleI4QanBc3D9cp/WY8m6haTBQs60fF?=
 =?us-ascii?Q?50z2hVEPiMYO2WATflsUot8oMT2DNJDUWHiAtizb6IeKbmTij95gMqxquxXS?=
 =?us-ascii?Q?szZtBmDvjbumDRwj+GWtL03OQVj6HO1HtXVXgF+aKEqs4xsJRYT07trkTW5s?=
 =?us-ascii?Q?nVAbAegDZYLvzmZiEh6UjIbnSYhK9mSVDR0QxOYpxsobPxP2PCvf73dubW1v?=
 =?us-ascii?Q?hliRjxGdI07vlpz+Y1UWqAh7oTWKLjacE0t6e53C7RuOXcQLfGuqKOQKhCw1?=
 =?us-ascii?Q?oWDdtLAuHaohqYi1eTmX8GX9m7gJCPSrV/EjmemwzXBaCuLDUK06XbMga7Qw?=
 =?us-ascii?Q?pyy7wu+Cf6jbYJBlLW9yhFuBfh4XvyPjZ9kYlcCEXLYyby0VRD45q6wW5mnT?=
 =?us-ascii?Q?inRNecu3bfFU9Y2QPT/8afyR7tuHofwL2UFZFLRdFploEMxjZBhxqCHl/dTA?=
 =?us-ascii?Q?VNsG4EpcOaJjXHvroNV6zwYL4BFuDqzK5Y4p3cUibgUiWuCuxz+mSoFPLj2o?=
 =?us-ascii?Q?5QqxzjK0d8OSWTVgyAIQrM27JNLBYvSyclKMB5AzC7pQyRTG+VYeZSskfALK?=
 =?us-ascii?Q?F9N0zDcBwEv1GtIuLeYShQlMar70979NePOTq9Wpx8wT0XKa0PeQ1BDsb6xF?=
 =?us-ascii?Q?Xiewb6ICna62J4Aw7w4X/eg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00a6c76-430c-4126-a914-08ddca347958
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 22:01:27.9045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyGGbjoTLB5lontrxg3d1xaq03roolwq/FyKPb3Vp7LivR3E6UpEXBBpS8JSljggsu3jdG6Fywv9BkCFpkrq/NEi1vxrsL1jgfgppEp5cvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gustav=
o Sousa
Sent: Wednesday, July 23, 2025 1:20 PM
To: intel-xe@lists.freedesktop.org
Cc: Sousa, Gustavo <gustavo.sousa@intel.com>
Subject: [PATCH 2/2] drm/xe: Use for_each_gt to define gt_count
>=20
> We are currently bumping gt_count as we define GTs for each tile. While
> that works with our current code, there are reasons to improve that:
>=20
> * That section of the code is dedicated to define each tile's set of GTs
>   and their respective info. The gt_count can be seen as a device level
>   property. While it is fair to bump it as we define each GT, we can
>   also focus on the GT themselves and count after we are done with the
>   definitions.
>=20
> * More *importantly*, gt_count should reflect the number of GTs that we
>   would get when looping over them with for_each_gt(). Bumping gt_count
>   the way we are currently doing makes that value not really connected
>   to for_each_gt(). This could bite us in the future if in the loop gets
>   extra checks that are not accounted for in each existing "gt_count++".
>=20
> As such, let's use for_each_gt() and extract the calculation of gt_count
> into a separate block, just after we define the set of GTs for each
> tile.
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4f5d4f0a8173..4aa3381f32bc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -731,7 +731,6 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>  		gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_ring_=
state;
>  		gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
> -		xe->info.gt_count++;
> =20
>  		err =3D xe_tile_alloc_vram(tile);
>  		if (err)
> @@ -756,9 +755,15 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>  		gt->info.has_indirect_ring_state =3D media_desc->has_indirect_ring_sta=
te;
>  		gt->info.engine_mask =3D media_desc->hw_engine_mask;
> -		xe->info.gt_count++;
>  	}
> =20
> +	/*
> +	 * Now that we have tiles and GTs defined, let's loop over valid GTs
> +	 * in order to define gt_count.
> +	 */
> +	for_each_gt(gt, xe, id)
> +		xe->info.gt_count++;
> +
>  	return 0;
>  }
> =20
>=20
> --=20
> 2.50.1
>=20
>=20
