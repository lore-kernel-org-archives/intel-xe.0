Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E97C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 14:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9104210E523;
	Mon,  2 Jun 2025 14:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gsv3zQ/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D639610E533
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748873369; x=1780409369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G52udCoFjGUcoekG6sNXez2VKTajdVfsn6npuclFYhM=;
 b=Gsv3zQ/8dW8i2Tkr+0g5FwPHo32dzw3UDsRU26GOxd49E4jiY3R4x1LH
 2U28ueZ4lISqX4w5mot6cTU0XC7VUFlEiBl6KWKhWDNQLdfCoJzB38OOz
 5Ic3ZCEDjZlRVwgREHUMV5VTDLIVVY9i2WanDzr17/I+xYKmjrxd8kYOl
 rKHI8B/8HqROvFX2oVin2/BqxP2UvMwzOsy2txyv5eK+PrvqwGSiU3L/d
 i6urca+xIJZVdUB6gMYYoggoFH2xukj5S7Ko1WC2YwrVRYgGbKHzvdIlv
 tCzwQQiHMtaV23MAbFbt5FoSJo+JWT17Cfj2XcbhmfSKwV4FhzoZqpGaV g==;
X-CSE-ConnectionGUID: c90zJL93T3eZCBUgk33YXw==
X-CSE-MsgGUID: J/Ka1utERrqYK9T3dKnrXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50798797"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50798797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:09:27 -0700
X-CSE-ConnectionGUID: uO3SmbgtRlGzJJbC1raMOg==
X-CSE-MsgGUID: vddEU0lRQ/CEzHIz9tcMJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144425528"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:09:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:09:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:09:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svii5q8Nxt87vANz7nuMM3bHVSkY9frsWSQ87ju/jlkF7g/Xvoe9QLEHsLn61CfU45SLUXz/angk6LjPmgMgDRX6hQHERoRtRs9pOTLkfvezJWmfu91wuupbVvSHlUQxL6TH4ybsAxA2Wxef9aFUfzFVgXJMX3UpIXSBmPllQSAOiyRlvH3ryU5mPStABzMD4EwkLXWJ64JGD15fiJCAplfC4OkpqQysjwNaneCON/5CnPfTRFFGqTE8qTHrTWTPOCJ8FowTjcfkR/B9jC3VgdVjlTgrHHTclIwCzyciwRJ2SPGhbM90AD9bYNuIHr1Pir6+eNnfWQQ9SV++5KxIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cghTO5jYewZE3G/I+DrFNDycf8mCEJCE0ZR4I1VEe68=;
 b=Jna8DhDBK0L+O1xDAvv8ZN10nQNlxl1l3f0NXTkjGVxjTjiZXvzVhr5lKC/RMAgqlK5G6du4aJSLjdOiMTs/K2ahBSTYyvcPUbH9iunv1wHPiS7P93d4wIbf2pjtm1V5UMnaklVHFWJFih/GgnGwOcKRswHcWhAVlAIqWvQuBObMxde8dBeLANtsDN1IAkIKVOR0MMdfbvHAazcVB6DgilklNYZsy1JmsvtkXOwI95P+TCGLK4QqMgG38L0Z6JFqQEpip0KQBv99QD9p5AIHZ0Z9QjwQj92IgU1cJBRi9pF53xvm4eIZIsL3MZRzZ0W31j1Mxo+5pJckZ1kJTsPFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:08 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 14:09:08 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/vf: Add sanity check for GGTT configuration
Thread-Topic: [PATCH 3/3] drm/xe/vf: Add sanity check for GGTT configuration
Thread-Index: AQHb06nRgemrAlvK4UudOymqSTSov7Pv6E5A
Date: Mon, 2 Jun 2025 14:09:08 +0000
Message-ID: <LV3PR11MB8695D1D920AB67BAAB9F4B97F962A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250602103325.549-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: 6529ce99-462b-49ff-34ba-08dda1df0a86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?offsrv05EOnLdaphUZNQBoatMzaXrndLHM8rOz6zh16fYxxJ++DaVJEHzhtW?=
 =?us-ascii?Q?UhhzIVkTlgfIw+HMYZjOeIJQBh9O4r0Ow9/J2VTMc2ZnAaCJTr/bh2evUfw0?=
 =?us-ascii?Q?63OGuLqHZGF/q3h0V8iTL/ajNVVsZ5JvKxNgXqy5M7K8tm/LMYBJR/Hic6tc?=
 =?us-ascii?Q?nzJ4i4N0KKwc+EhD3bpIb3EfesVV80kNHcjZbCvGL7G75hBtCk2ElBkZ9Rfl?=
 =?us-ascii?Q?lBF0ilMhVw2QNG32+v/j3wz3xHqOmkTcXVMN5GfqGjG/xJX3dnrwE7XgqwE4?=
 =?us-ascii?Q?6BXr+Y5ksOcoNXYWJp1DP0bLlN26nQr790I0wx9nqE0KGB43puAESXJ1gAob?=
 =?us-ascii?Q?+EQVQS0wD7rt+nqNqCDj4gCSFp6AinX5bgry2gBSKdlS+XmeH6X2Usxe9tru?=
 =?us-ascii?Q?PAWj+y/Og1M6MgsRCUW7Y24c9bEV8grPLoyd0dtjPA6w0w3dm5yyobYXoeZL?=
 =?us-ascii?Q?sFej0kcjXDbCOsLAvgWlOfYiT6EsBGs61PUD0m8hrJBCB0D1Ga/2ZUFPqET6?=
 =?us-ascii?Q?o5MmI9e4DredukFnA6d3ATLC0tBb44tw+NOa6o+6jra3edqB76eUKYv1CZzr?=
 =?us-ascii?Q?1wnEeZmPt0DN1gxw3OI45/tc0sjCg9YJkfA+xGBZlGMGXOezoj8MmtLXDNru?=
 =?us-ascii?Q?40DG0kSb5pC3M/vwtiZewmeTJFHj2TDu8dJwv7oGJB4/sE8gvMKBI+DxDjgJ?=
 =?us-ascii?Q?jnzPCnGHy+U8ElJ4l7vd0JGKjw6nCn8HaDtpuuP2iT8TvBuaaU9B8EF70GzE?=
 =?us-ascii?Q?aYiFcnTBZKSt11FadPMObX4/X8g7c/i6nswNkRDG9Cq+DSlYvioetBfQk41V?=
 =?us-ascii?Q?Q5zpY6f5bNts0lkf0iVfS3FxlAaejdg1IMeikDT9kuMFUa8uJL1UEIVLklNt?=
 =?us-ascii?Q?Kq+mt/HnKWy2tDr/eIgiTYJubWdX2lWxpd3UHCItJ025iEuKC3GY9MpUfDiJ?=
 =?us-ascii?Q?94+7MDoGKccyLaVY0DwLvxdSjOvWRYqHs6OfJ+OEtB87Ys9jZRto3BWsH8Ov?=
 =?us-ascii?Q?804nGZTp7SDYAAlTL6ClKcV0bpD3FERJTOmiJlMZm5BBH56f6tr0uNvq9bph?=
 =?us-ascii?Q?q2u/bJyJGzjHLSxd+4ahE4FsZKjwFathcJv7vARDpCCm9ivz/Fi+GF2GCGux?=
 =?us-ascii?Q?Ww9av5AG4+RKqVFnYcIj4eK++h2PkEunCsgZLRwtwACfLZeqD7TkH3yoQ32/?=
 =?us-ascii?Q?4xnlJM8acbNBdCK9Nw0uTW9RaewuSScMT8DusA5Y9VXX6/jJHgP5QKdhMPGw?=
 =?us-ascii?Q?gkn0QhjX6azEkBFRjQ0Kj0cd6tU8xfKQ+Q9H4Z2CJ0BezOWMAPzEIoWTOR2y?=
 =?us-ascii?Q?VC/CCD6GVQ9DAiOB9nonxKI/tf8J1Zlf4Gtl4dA0vCCsBtIf2JyRHfh+c3DL?=
 =?us-ascii?Q?lfkzGt/TfRAqxT9pOsISOuKRKoTg3M/LG9jSYYvmBstjblp50B0e66VfZ4Nz?=
 =?us-ascii?Q?1TsUkxmkKmltn927hmHMv0CLUdxO3u9UBup1ym9KalJQDxVTnpikPC8R8z1m?=
 =?us-ascii?Q?JAsyOEOeI/sNko8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B3+YE2W2rv0/r8a05aSaLNw/yUgcM2AJyx8tP5ukn2Cr0EmmI7L+CPEzq757?=
 =?us-ascii?Q?wrev3qO+dpkYVwWzPkduBUo/Mzp7Ha4Hc95X9TKCljye0arwymQeOm+nzuXw?=
 =?us-ascii?Q?+DSNonCaKboLa9BKKmOWC1uebXl4bIZ5D3cwS+Vg/jNiGyf7nKA9iFQdEXzw?=
 =?us-ascii?Q?mJDik8U92cjy30D6ZjqYw/dNnHagfa1R57vJsA4tkhkA1sMsU5uRNK18lVRN?=
 =?us-ascii?Q?t6q0ib5oqcncYnxYmemU763S61onrmEnjsVFWMhnplW30FxIeJL2upyU/vhS?=
 =?us-ascii?Q?oOnwGfabOPM9N9r1hF5JGCNPKGLn/0TGfqgt0b+k8NdNfpFe9on1R2TY+VVo?=
 =?us-ascii?Q?a12hyFv3gfKftvWTFpuDtRBCYeau1WQH0WEfmkFzw7C/Ll1UEct/UtXem9lk?=
 =?us-ascii?Q?eph4QVsqNW7jo4OZwLAsdIekYPYi8buCp7RRonUUwtFU7L4HYbwA+DRVtJAP?=
 =?us-ascii?Q?v5lZ2yQRC2KPjBZG41bjvfPbFuCFFKe1x6o+02ZCWVYA5aeqX9sWkHXZY/pC?=
 =?us-ascii?Q?9v6A9aOZt7ZTvt99BINTlXuenBrJb1AY5li04dfD0PqPLdmq59rrpBf30lNZ?=
 =?us-ascii?Q?AcQli0u7uqqS758+XXucn7nB1OUvj1va0Dg/SXdsG02AehxuU1YDBIU3rl6f?=
 =?us-ascii?Q?bJTlhXLfVg9qhbqENnO+hkhCTOt8req0dptUtm/PeBp2fcGtJs0Rh4yjwU2H?=
 =?us-ascii?Q?7o3Gx2BA4/r8tNU4188T6SLgpW2JXiBeNyEul8BpcCWcWSvwZ3I9EE+TAm/S?=
 =?us-ascii?Q?O/Xis3jCqedir7l7xwl4qRJFvSFekh0GZuNyuwY6EFowjM1m7ddPKv87UdNI?=
 =?us-ascii?Q?zT7SFG7xBATf0LzuehzCjZCA8hOAGfTspN45AJKtIuqtZsnlRw3gjsEvqUUQ?=
 =?us-ascii?Q?NmWwy+lo14Rlt0AI49hxBnZ+aIL3jf6M227fJ3nG0DHyFnUu1XzZH+QMKryu?=
 =?us-ascii?Q?t94U6y3JM8BXwWmfYectPBUQKdfdwUVgwry8zLEtxAgSJytRuijw5huZP69M?=
 =?us-ascii?Q?uhYo22ADLBtqehMWhHrpsD2BOp4+jdsNFwxMMBjuWn0rvnwkFQx8od6SOnbU?=
 =?us-ascii?Q?rwdLu/mdSKOV7u3ROY3h5GHUjee42cYb2Ep1lQ2BZceBM5W92t/JeSBUUE+0?=
 =?us-ascii?Q?cqjKNUdcHx/TUJkGOmcRy293IUZaTlAFiB71f7ccEZV0PfEkQnEwpigxt2Qe?=
 =?us-ascii?Q?y5nem86jgFgtSWULlrk1pYmZqd+gjV35dE0lGzaC6a+4kigrI8I44b1QN4hP?=
 =?us-ascii?Q?XksDS7hgZRk14o14lLcxmMHD/qWggP04nFGfMjanz+zc6uNfVVnoYiWS23Ue?=
 =?us-ascii?Q?T1pxx1WKygESonHc70KOvRRMjhjidlT72hjDzcg8lRMUyjGHmYB4zVpRfXaL?=
 =?us-ascii?Q?PaCrIax0E5LCKTThGPrSe4wa+U2WF8gpdJTlbR303l4AaoFLtdlE3wWERnvY?=
 =?us-ascii?Q?W4Esabbl06UI7CIo31y7XGAZcBFhT2ZziM8ClK5s8d1Rw5GHeJcdFfF+6bsr?=
 =?us-ascii?Q?6XaUE4U/OXlXJoceW6mTyQOqvxQq0JHPWUWqgv1wOvZH1CbuZdnDcu0KJEmo?=
 =?us-ascii?Q?SnDg4T2DzTWqcbsn5U/aqKCPeXpNefIxFH+6/jf77olg+Gb59gXOgWb0+hQD?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529ce99-462b-49ff-34ba-08dda1df0a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 14:09:08.2743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xj6OKfh0yNmEE0asCSHoh9ccCmUD5EXj1dUSVQQnL2x+v1IQOnjiZ3FqDftHo7x6SzsNgw1JvJi2YfrLhe6G9pANiqxcxyJ3tmVxI0LzceA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

Hi.
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Sent: Monday, June 2, 2025 4:03 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH 3/3] drm/xe/vf: Add sanity check for GGTT configuration
>=20
> The VF GGTT configuration was prepared by the PF, which should be
> trusted, was obtained from the GuC, which likely already did some
> sanity checks too, but since it's a received data, we should have
> our own sanity checks to detect early any misconfiguration.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index 88e832894432..f221dbed16f0 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -11,6 +11,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_wopcm.h"
>=20
> @@ -44,6 +45,7 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile
> *tile)
>  	u64 ggtt_base =3D xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
>  	u64 ggtt_size =3D xe_gt_sriov_vf_ggtt(tile->primary_gt);
>  	struct xe_device *xe =3D tile_to_xe(tile);
> +	u64 wopcm =3D xe_wopcm_size(xe);
>  	u64 start, end;
>  	int err;
>=20
> @@ -66,7 +68,14 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_til=
e
> *tile)
>  	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
>  	 */
>=20
> -	start =3D xe_wopcm_size(xe);
> +	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> +	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> +		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-
> %#llx\n",
> +			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> +		return -ERANGE;
> +	}
> +
> +	start =3D wopcm;
>  	end =3D ggtt_base;
>  	if (end !=3D start) {
>  		err =3D xe_ggtt_node_insert_balloon_locked(tile-
> >sriov.vf.ggtt_balloon[0],
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> 2.47.1

