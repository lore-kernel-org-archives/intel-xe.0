Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ABC10E817;
	Thu,  8 Aug 2024 21:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9aiuZz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CA10E817
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723151368; x=1754687368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ar/7StfP4TiREjKSIncclaJRPbbNbPh36qNUegfco1c=;
 b=X9aiuZz9d1heVjFb8JxH4AS3MONzAgYyVj2MQsIyPO0ESI2TJKMlomK9
 1RCXsOfaJiBVbvRwh3KIBkXQNH2YW/c0bYQOxvAtzmlYIvJ5sBgOROzqD
 HQxNhj1OyKujEvUe/5oK9bLFWjZWTRDH7SHn9xZoH+gUK5V3yxeE/G3lS
 5cZR8lSdtE6JwVe96V/vrKNlHyp6IfGkfQqPmVVkg/m8wioglWueJxxl2
 59I6H/7IQzHE7keQaCTgM3oUN6xJ9O6/qppCc1a2TfD3vu9OyVc7LdGj3
 u4MMgup284nj3fgNvCmcLzbY0LyP33OumB7tqm9fvQSqomLF+4vqtf9v4 A==;
X-CSE-ConnectionGUID: E5iE5vD8Tu6/XPHoF0OkCw==
X-CSE-MsgGUID: mVHhDS+USjKbgT/QIlb2Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="24213572"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="24213572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 14:09:28 -0700
X-CSE-ConnectionGUID: CrWnEc06RzymcQMfzji3wg==
X-CSE-MsgGUID: ifl+82WyT1mUI2rtI8Rg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="94870596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 14:09:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:09:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:09:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feoOkXWeR8oHFC0v9kfIQojd7DqWQneyMThIvDyU53Q8lPq/+pVKvPwL+knu6jBoJ891o5HLdqeeQsnyE0e9WYIu1zoJLpiuFPnA1rja+k7Fb4cfogn6AQSR5ahGRucG8g1JVab+KfftCk6RYHXWM/+OEF+3eCQfcMtIMRr0Jhr0G2m567CDqtm0bss8O1UoqPuJQsvjaXlJwUnax+f16I1I/y5oQulyRQXwrEM/SPJsewLkuGv/9oA0IQ8zXXSRecgLF1iY4ck1tspytJ/vzRaUXdNNsr0b/+QYQ749yESxSsYYSStf2RXoberZTC9/mpVe/fbZT1H1kXys4kwYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BASqqwgWUvuR5kDy763Ef/c6layRhAc+dmybgb5jcqk=;
 b=S7Cg16tN5dEZbB+iV6xyI3jVdZ6unz+WZFVMl1nsTboHj/ZRONCEA8HJVC8879URYdNC0xQQJyRB9EAcS5Fjhx6eL+l1OJS+BVEO4HX0SdQ5hig1w6r0nlrnBBrCK/zz2+mTvFPGIh0GBbSj1WQnnWSju/9HLiIIOERuTPwOzfAk1v/fOo3YE1T7uIuqnYIa9H7NT5FczNCPW0eV9hNxI7eA5EUbjD4wkzsA6eauTiWv1ixl165XnURjHcwm5lIx7pT+zOLtPol4mb05IBvMXmXM19cTDjzr3QqaKDno4B+9XbVqIdGKDlOeEJ3GWuod0HN0pzg7u2PC/xA5o2p7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Thu, 8 Aug
 2024 21:09:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:09:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/8] drm/xe/oa: Add input fence dependencies
Thread-Topic: [PATCH 4/8] drm/xe/oa: Add input fence dependencies
Thread-Index: AQHa6bpIX2Y7oTGsBkSmLLGRGewpprId2lDg
Date: Thu, 8 Aug 2024 21:09:24 +0000
Message-ID: <CH0PR11MB5444ADA07669573979A31DC8E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-5-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-5-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5069:EE_
x-ms-office365-filtering-correlation-id: 92168f32-8be3-4a0a-5755-08dcb7ee6180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DkzA0B7cCJWoYy0LIAbutEkyFUK5VXjr546823zAWCgPo4yUy02gXx3xrTdf?=
 =?us-ascii?Q?VXcHX7EaxlnjAxUx1cgVyEht7QTle40XKWc7oeaCUJ52ywabZXR7jsbgix2z?=
 =?us-ascii?Q?U/GdH2t0BS19RpSr4uTCO5IOSfTpjXaWCA1SGw9n6sRnsocmgd0yRXGluiZy?=
 =?us-ascii?Q?Lxn/g0XbLiLu8RsW33Vj6F/6sVQ4dZ35qsN2NTzPYE+t6HexqHyRzDsI/ucO?=
 =?us-ascii?Q?pDmcO8+agOGOzv9bTuh/FU+DkQUboY4vsGrX7uA8Mo5wKhVFEFdUTlQBfi2x?=
 =?us-ascii?Q?tcIyw/ygFT//Jb8w8PczNmZsBJrliU+XXzDrwJzPqyJBxFpRvauLyKMU8ueN?=
 =?us-ascii?Q?hP1DYnwvOnl1lDjlDdGFvDB9pbgbyTgPY4dz9GwuropWWPMZVZDbOnZ9zlgs?=
 =?us-ascii?Q?R6a11SF5D73NZQUouRhz1vfQt6ZA7tz9EUWdkBKcNmJys99tOXpSup+SoWrk?=
 =?us-ascii?Q?3QP9PvT877IaBgBR1fhKPK13w/ox3TCNljR8ut5zbOplJI3/GsLD/mKqhjqD?=
 =?us-ascii?Q?z34fTJHH2Y/UEIlMlY6YuIBjGtDXpr9NXewrL3AhUqfVwJlXvGbNrVZJZNwY?=
 =?us-ascii?Q?egPwNR9/koN4UUWo1SK4I0FQdYnZjrRZDG+nVX2A9F2FejDQdNNAHyWlYyYT?=
 =?us-ascii?Q?cZjw8lytxy1bbv7Grec1AQcgxtKPREfvAcUImPbug7Zf1+7VeZoZmByfTveX?=
 =?us-ascii?Q?srxBdYk8cLpEsLZBek7HJNw3SQ5sXL0ZxG5SPEBea9upcrNKWE0l8t+piPQp?=
 =?us-ascii?Q?IVG6s07osql0B1xoZottxw/LCTT4e3QQebC5BcCnhHffgydw3JRm4YEoCPUa?=
 =?us-ascii?Q?YwxXNkaZTI6HviVm2lBYEq+Yin/fbKarGSx0p7upttuEBlQYXVoTZl0TU071?=
 =?us-ascii?Q?rpJhw8IyE+f0gCagHAlNoGu6vpUeHiO1cTqGNVs28R1RPbmftSEHJ4nYGcl4?=
 =?us-ascii?Q?OY15NbcOCrUU79uJizp2RLCZAKLwcHGeJCUR7KaxoLxZWLuWvDHZJaA6k8TG?=
 =?us-ascii?Q?bo9UApOz1cUVBw7eXVDG4rp1sUgor1WHjFO7xTmgsKdZ4o8a8wcIlgOQv9lC?=
 =?us-ascii?Q?xXV2x/8UfbbzXttL1RR31GlHvTfhLwk0PDsdhL5o0xuZKExu4grFf4oX7Z3i?=
 =?us-ascii?Q?C1gOLrKrJLQoXaQV+ygsWM4rqjRhzjqBkyiKvVi/Dhi/JCbzkdG/TF3rqBqY?=
 =?us-ascii?Q?5Ac9FmCpgOlvrYmVeGE/akwDba75EY1NKopiXHOONrOeAhBXDINSYDqHk8lS?=
 =?us-ascii?Q?t+S/kqAfWmZj7dw/DJ2Ut1bcTP9nQ/uSxg5fnmDlt4DumERPaH6vlGQoJCZk?=
 =?us-ascii?Q?n3Igo/6WqMDs4HEGgsq8+qdPSqa0HlN9/PUFeT68k/s7fPqt+eTdF2/IFhmb?=
 =?us-ascii?Q?aIgBto4IounUSg1CkW2cG5yVb5BmjWSg9GmjpLCbnNi5yCwM3g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Yz8zr9/05wQQFl2qIymAJ6MG2c4oEw0KMa9nGC5N/4AjW8xr/woEJq2B+m3?=
 =?us-ascii?Q?Cwsmv/x7gJ1FpVU6GBYtboVaM7Z/UCEeyXFnSzhUAhk3OUrsIYXne5qP45/T?=
 =?us-ascii?Q?yZQuNX//5WO65q2pXcQgtEidKM6qKyDo8aGTaA+epoEgn5taz0dCLhDlv5L+?=
 =?us-ascii?Q?wX0qGOLm+59cuYKcN4jkZt2yOodvtwmoiclkyjB0CsY7VvI0ZHZOqPn/NnCs?=
 =?us-ascii?Q?dzAdTKq5arKqtjJeuQAtNRDhI0nkyLcBzLWs3JTGnBY/gFu0fYqMEgKHMjSC?=
 =?us-ascii?Q?tgsgyUYYBI+F7I/PaicOiKHURE3xSkSkTzDfw29TzBuZdpvEyqgPdrb1sf6r?=
 =?us-ascii?Q?Sq/+qiHzHFJBqRoxeKlThKvvyqXsHnGkar/oVP+QQHF7Eoxs/FGK0xqHBMS6?=
 =?us-ascii?Q?IgsG3daN+AQmrC7gRqh0Vp0C0mLfWg0+Ju0dxfP2Qun1rKRcDAZnpJdJ0aXU?=
 =?us-ascii?Q?a6g9bakG0ZTeHbN27wOQ1EPrfEqxm5awdDiwdDNiC+x9CuvBxY0gihAxvrfZ?=
 =?us-ascii?Q?v+xAFq9iUbK7zTv3G07vBJng/E1hF8B8Rvn3BEjgyPmiNMi7AHRV+K6cT9SJ?=
 =?us-ascii?Q?XlNEFPWyKBuOf6Wm8MOP1IdLCVDh09pucdknFsSXonElLPodtZYpTKLDxgdO?=
 =?us-ascii?Q?9xUel/yUMJo3+ky8s+cF01rp0+/wGe2qGDnvFewlW1A8vYDjb+uhdI9gygHo?=
 =?us-ascii?Q?bD5GFKY0CacsdQya+9DGeOIklzJIDnDAwISJa7jEi6izJJxNEL3V307+TFfJ?=
 =?us-ascii?Q?G4zwJMxySkogWnnStzWUDFsqmLaiQnMtJ9fE3sNW9oHiRJmu4yvvc31aLjzh?=
 =?us-ascii?Q?OmFjHFDR5+0eV/4HDRcb6U8HJWEYeSmu92UNAJNQ9ofyecnZ/bx5kJoK7Zt8?=
 =?us-ascii?Q?+b4nTnSXn4voSo20WqGQpHVnTPZnmriDKkZ2cUb6GnfI9fK+DP8Fej+ibTDq?=
 =?us-ascii?Q?1pkCEKuqQmBKu1zeBtN9FbJ/h8mbRvcv6AU9VsY6v+8HyJiBHXvd6bFneqlB?=
 =?us-ascii?Q?9ST+lnAXJ/Hh8sl44rm7WEdIJMGmsMeRzv6Sl+a+RH2HIfAQrm8IQqJWl/Lk?=
 =?us-ascii?Q?47XxD/48FHuxXiqhwrPlKR97URK7BzpQRmCAG7x+zgtlsPFaRw871A10u03n?=
 =?us-ascii?Q?9ImoGJlvDMR/hOy3dtbnHwNlCunWjCTH7yTkNzMijXnrObiVfK/lV2X2yLoy?=
 =?us-ascii?Q?JCa7rmp5ZCLOym3yaO8MiMjz4ODEgFpFVmcoL5ZwCSHSt/d88oD4WWG9LANt?=
 =?us-ascii?Q?bKnkEzBCiJLXArn70k/VDvPRGCwr1CnrI4eSxP7XZ/sGQ1mjM+qWecIQ3nrS?=
 =?us-ascii?Q?Vc0+t441a0Ssyao410jDVDShknXp5SyzMVBfQeIt1Zxhi3+Jn76tJXhIo6k/?=
 =?us-ascii?Q?jpDFlI4wV02PKqw9DFzcsjoaPPTcTlVmohLaJZa9KFFqQF704IUYHI2ekKyJ?=
 =?us-ascii?Q?Vusl9Je1J4rHd8e2bXQNiNGq3oth4omrGCmue3ZngdzdQQvvo9hzlrtIzbHD?=
 =?us-ascii?Q?mX0qLOznTmDLl5SproYVl0NmdMaQe9DQWrPWhXOIX64cuhEpcPssn9bEQDkC?=
 =?us-ascii?Q?S+DaWhbaVW0bDGc2OiLo0bU/iw9UMxE/dyiGNlUm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92168f32-8be3-4a0a-5755-08dcb7ee6180
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 21:09:24.5624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM+KSajukGKox/XE7dD94h4oCFd7dowBy7jLDUwGZmY3FBK7sGRt2Jmu9c/r6JIkwiGQi2LsDQGdwUCjojDfb2gGWV3mL/RsiuptFb6OSOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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
Subject: [PATCH 4/8] drm/xe/oa: Add input fence dependencies
>=20
> Add input fence dependencies which will make OA configuration wait till
> these dependencies are met (till input fences signal).
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index ba8f2e9d95b7f..416e031ac454b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -578,10 +578,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_=
table *wait)
>  }
> =20
>  static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb=
,
> -			   struct dma_fence **fence)
> +			   bool add_deps, struct dma_fence **fence)
>  {
>  	struct xe_sched_job *job;
> -	int err =3D 0;
> +	int i, err =3D 0;
> =20
>  	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec=
_q */
>  	job =3D xe_bb_create_job(stream->k_exec_q, bb);
> @@ -590,9 +590,23 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stre=
am, struct xe_bb *bb,
>  		goto exit;
>  	}
> =20
> +	if (add_deps) {

Non-blocking suggestion:
Maybe declare int "i" here instead of with err, since "i" seems to
only be used here.

Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		for (i =3D 0; i < stream->num_syncs && !err; i++)
> +			err =3D xe_sync_entry_add_deps(&stream->syncs[i], job);
> +		if (err) {
> +			drm_dbg(&stream->oa->xe->drm, "xe_sync_entry_add_deps err %d\n", err)=
;
> +			goto err_put_job;
> +		}
> +	}
> +
>  	xe_sched_job_arm(job);
>  	*fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> +
> +	return 0;
> +
> +err_put_job:
> +	xe_sched_job_put(job);
>  exit:
>  	return err;
>  }
> @@ -670,7 +684,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream=
 *stream, struct xe_lrc *lr
> =20
>  	xe_oa_store_flex(stream, lrc, bb, flex, count);
> =20
> -	err =3D xe_oa_submit_bb(stream, bb, &fence);
> +	err =3D xe_oa_submit_bb(stream, bb, false, &fence);
>  	xe_bb_free(bb, fence);
>  	dma_fence_put(fence);
>  exit:
> @@ -691,7 +705,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *s=
tream, struct xe_oa_reg *re
> =20
>  	write_cs_mi_lri(bb, reg_lri, 1);
> =20
> -	err =3D xe_oa_submit_bb(stream, bb, &fence);
> +	err =3D xe_oa_submit_bb(stream, bb, false, &fence);
>  	xe_bb_free(bb, fence);
>  	dma_fence_put(fence);
>  exit:
> @@ -971,7 +985,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *=
stream, struct xe_oa_config
>  		goto exit;
>  	}
> =20
> -	err =3D xe_oa_submit_bb(stream, oa_bo->bb, &fence);
> +	err =3D xe_oa_submit_bb(stream, oa_bo->bb, true, &fence);
>  	if (err)
>  		goto exit;
> =20
> --=20
> 2.41.0
>=20
>=20
