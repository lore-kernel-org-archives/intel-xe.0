Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB83CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 17:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4540A10E200;
	Thu, 15 Oct 2026 17:29:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD2C10E027;
 Thu, 15 Oct 2026 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792085347; x=1823621347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vwnW2CJ4/88Ufng6/9oh387EiuDCZoi4hbcGolwXDPQ=;
 b=i8eoc8QMlzJKJIYph+KTpICaWWaibi+R7ktifDsIUR1G0Hf3r3SyIwZ5
 OrAtWM1syiJHKz2axsav5BiY8SPpS5yAkIjj5dxZyNjf7+y371S0ksu2c
 8wRVxGI7s786NCBGo+GuuZxFCtUMuLHTo8VeoQ7n+fAJnguxngqVTclCW
 k/EWENNQTB4KENoX+ohklkSG4eth3tw7ZHwsAM0W762NEpF2jvX1H6u6/
 Ki12HD5uZ8bI/7ZSelMJyb4G/s74LILEA4KGv+VQlUn8izD1Wb5zNT9GX
 uqBAYoqhkkJ0mN5zBF05ePdAp+pFzf7A+QOetGHNrrPYUPj2IFhEK2qGQ A==;
X-CSE-ConnectionGUID: KjETtDvuQ5qQtL7YLmw6Zg==
X-CSE-MsgGUID: E/RstLIaSU+/3ff170fetA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="733931"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="733931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 10:29:06 -0700
X-CSE-ConnectionGUID: Xgh6xybAQ22PVonpKe5XAQ==
X-CSE-MsgGUID: Pna4Ji1cSZasYcxuRCvDzg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1757546"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 10:29:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 10:29:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 10:29:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 10:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6TFENQ4sKuD/FFUolE7gPTdAovrw0/cil4LXUBKXOjuYsbV/9y7Lh0bgUZFAHA3Zb1huLVTGJRBdejCuXERawqu+Z3tbnw21qxbCA0foljBNt/xqt/9s8fP8OgZpu0g1/yvQAh9E1Ow0wVeyv/qdP4MVVo2nswtIAZYxYlN61YHYrDaPxW6wvBG39JGhw248q2vfO6D0xR4FnNf6acAy7EuFQn4kN5B0RkkA6Ma7EDCeW6LUj7aEgTaci1NfysI6KJ7ISSzS7MFfW3B3ek9Bg2Ee0TT2Aja7M0aQQdwRILAGB44MkRpAnNvcxvtZcGVY5bzM3bl9hIR4mbZv6YC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mx6KZ6vKBj+RgWz1ZXgm9vh0Y5d9tFKoNaHGYPUx38s=;
 b=Qy6suDQG8gV42xGIJWrG9oXcc/ArH6QMIA7/SaVtZSHyYzNbwkAO0JaiP3Vj2ClRfJ/RdNw6ChocwbtJET0ZJY6JJjp5ge5He01Iijbz7xtj0Ha2yrMd8zUEclLyonO16itkboOYtXG/sw4RZDQdVRHp0DgwoV4KdnorXmVEYbj8AIEFPz113tcgnBpbvPSZli1XmJnpfmM/v7rJlA6YIJoAcR8C5281pHQQ7Ji/Scd2lrIDmzaMkIrOxAf4U3RZJhwy6WMuYk9SCopnCirkcFlv6sEelhEno8WcveyUE3UVHPllk3rEwZhP2uOY5+xo2vh0YqdeF2iMjNISLdJ+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 17:29:02 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 17:29:01 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdRmKBPPnQz3Jb902r3ldfhtBDtLb/CEwg
Date: Thu, 15 Oct 2026 17:29:00 +0000
Message-ID: <BYAPR11MB37839CAA76DDB9487E2B50BDB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-4-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SJ0PR11MB4816:EE_
x-ms-office365-filtering-correlation-id: dbbcf223-b303-4bff-56e0-08df2ae1cd5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: JPbD136otrD8cK91hLltQcpyljWoZh1d7NpXgswdCpHihCYpEy3wAUEY22zp8psz9Tkfv6Kp3XIzKryNYB1nGu2tSF4m6owwxJM5ckVESn3l5bYoyYcoLn1dmki+38uZ7ksgB8V5QQsEQ1sNsK65gbnUJfJoSr1RnWHCJAan+mNZ8vkZ/Zs9j7ygZtiogz76IB/ecyRvUgDxc6YIk/NKIfqGsMk1yrZ7Aq4H0V8ZtkBvP/+cZYIR7KJ5+qx3I8Z8D+tpZiA6xlov4VGILNHHu90YeVCKWrsL28hOmMmS4zNFB5xWKIhhGvL4HjSytiijtO4lMoiSp6Q1kgh0GNWW6XcLD8j+rDZafrMvQoSbMvj7Pmrc5GUS9IN6HU9j7EcvRoXAqCQPQ9EteC4ml2iwc4YLO94hQdzkVPrArFY9a9qniCC3rG9/uns3NH8rtlOCf2wRydQDt6oGTEIyOJX9Dh8FBsggqNvJ6xjHyk9FRA1cmmRR17xvxezMMmo8CpenBOxX0n1uFymqYcbqhORk85JZi79lf3Q8PDgT21taf6E+EqlkzP6lyd28V9i2pYDsjMI3EjAT4erFCmhqHMOd+ipSpsnm3mx3TSe5Zat21NIOyfWEjlsaKnyg9Vm/x4hozlZCmpDXiKpigRDUTu61YkLmjYaO0B13xxOIdTcutuOfC/Qhfmdk3Q19jB3IKunSiFpvVejFNQCKg5bjU/TLYmuaS7BX26TNSktzTIcsEWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(4143699003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xhTEXGkNoQwsHlPQ8iNH6CCvbN9MUri2Uj/wFT169GRGam5Hy5MEaopqxF6Z?=
 =?us-ascii?Q?ARDk/Zz6jMtnvq9f+vHaQ4CAI2Vdub3rEdls1hO7O8475WJTC2fYx/jON2pl?=
 =?us-ascii?Q?orzMsb9vTEXHXWrEwRd3tbIVp5OJ0m632PZU4lNeTHAr27uRUVChyxzYLGM4?=
 =?us-ascii?Q?ZIFeFl4hQkkB0veOT6a4R7uNgF10dvn2YZo/8hBhLa8FT2heCznWdMTmvMcs?=
 =?us-ascii?Q?2GTyOpNHumMdi2t3PLb223RC9Y1V5fuUEUIMi2tH/AqWudrlXumTgBmW9BE9?=
 =?us-ascii?Q?kKiK7FarBLemx3ejyi/mf755IeWo2k5XcYYuYae16N3XzAyPKP+XrR8QrNIv?=
 =?us-ascii?Q?7V71lQ/lC4Sn1QcOQV+NRtl9SsqeCrtOkvcl/YvMu9DTj/VxWfQHHg6adqN6?=
 =?us-ascii?Q?NYAAQgAr3oFUVQEdv0EtdlXWoIiJsdCxdcql8RLjQyCZ+zs88NozAqVPYfLj?=
 =?us-ascii?Q?E+0B+VlW1hQ942KGcPrryhBacLC/sjFBO0Xknculsha68CmO1Ukisu8RKARA?=
 =?us-ascii?Q?F6lkw9w3mZz/+hGgLAjg5KBzrDfdoOYKxnzITlrvnL5cBS6xo5SMF/Obvt3T?=
 =?us-ascii?Q?8UoK0ZN5D/0Z41uDmNnm0HMPdgG70lDoHGv4EDQoHBO7QHTH+ymd8Ph0D2hg?=
 =?us-ascii?Q?8KvgEJl1EToJxp6zYcJ6tgixWpNS38ifnWUToZ4cDtMiArLa/mVgsk7YW2/K?=
 =?us-ascii?Q?mGelEbMGr869m+kVMhG9afxmWl49B0+6rtaiD+TJULdOOYkQshzmeuohSccF?=
 =?us-ascii?Q?l0bIpEqlYb3m9sGtYcDm74vTZ8Unkc/fzXl6Os3PLttQ5QoTEuH2YONQkCMy?=
 =?us-ascii?Q?Hl/sIudg6FaZuivNEhZaZe1cdOsyU7BVGUd+uAxA1Slkv1l75CbnRLiGMzCH?=
 =?us-ascii?Q?JYtOXpOna5ESKiKfF3kDs8Zlx06mAd4q03NuDpO0eA2esiOFYbbooSPaG5D6?=
 =?us-ascii?Q?biCSOVpGy3xIfmv1CU8o552//Jj0eShZoQFgOfVSTZvH/XcLiB6dJagNVCfK?=
 =?us-ascii?Q?epR8Ys+xRW405IOfoJYxClQ6NflX5Fy+IXZre7g61M/N2LJcPJWQOM5W0oMW?=
 =?us-ascii?Q?cv549Va4NWUmwaqFuUfwre35K5ZKw+yC+hnb8S2zLXbl+aguOz/NjLgAZKHh?=
 =?us-ascii?Q?r93r8UO52ZennSyVakyNGThyaqrMsKlEWSGO3C3nf7Uq50LwXG7AHKRk06Kk?=
 =?us-ascii?Q?H4jX94eL1WARYqSO7MBSJEBkzgimlJ/4/Vl6VVy2gPgUhAf2qUK0Ru/PhJgm?=
 =?us-ascii?Q?XzJUP0Zvo0S1KoaDiC27eqnKYTJG49Z7a/S1y/5wWQ8J0Us/R8ScPxPaEDiM?=
 =?us-ascii?Q?WGSrO5DoRr09b/lvFYbzZf/g7Ox/eVxex9oYW7GbhluNrAgczXIOnMhjYZTc?=
 =?us-ascii?Q?c/xM64aBHwVjD84tXVT5FGbRBnKH//Qp81dB2tcrZgpHnU8gSSmhbdW4aPLe?=
 =?us-ascii?Q?GC5S4uNJaeuvZju8JUy6kFWe5FuyPV5R6fZtplIJLRb3gwFDh/RhJcoH6QNv?=
 =?us-ascii?Q?loEzX4zqE6E8UrroR8ajnpHHJDh7Evzts5K0wDSNn8AFdVmZXDa+q2wTj1co?=
 =?us-ascii?Q?I+isS2qntbjN89T9VNhHx4M82ft1AYqg49H4AwkcD8kyQrv0G1HKHVei8zwg?=
 =?us-ascii?Q?rqG57UgPVlcBESqrbmWQZgX/71GstAouM4bJyoS2/AcyI296l4a1UjmdcIdR?=
 =?us-ascii?Q?JmLeIrDxN4PNly9idoUfcBpG84MRYBdNSYpG88lFntcVxCF4FbgC3gewWZ57?=
 =?us-ascii?Q?rrCiYSxnwLAvh31zajKjiqx6Hhp00gLU03ayCb90bA8y8e4uUdSf7mCrhxoE?=
x-ms-exchange-antispam-messagedata-1: 3Zd1r5fP2hJ0lOTxUwQU44U4j/fbNcABdqI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jj7cgAF5iXESxZiIAzdW5NOaQCkmOuoPq5RfnfEmxYxun88MfVByTRbCk14xBTWDDqPugV79wjub8KPoec722KklG3eUq5uO24NuDMpiadrXpWwhsM0xhI1gFHXxJIbLEVK2TLr9JQk0NvWpk/IrJZXagB/Ke/xgp4GwY2B1OGR9nMCo1W8k0hY3l0pRKaD7TWbrDDor8xg9/9glqYITym3tHqGRrlZ2w/kcI9UU6Un7zQPH+ZC5p8uXrHqegavzu5n7RVIvxlEyHi4+U4saXESl8BoVzlUMgxW8R77+Jc3kMS3uzmfGwXRMTWC6kDYEPoxzINJI2phCqTdhxekinQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbcf223-b303-4bff-56e0-08df2ae1cd5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 17:29:01.0608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZM3ghl+zOp5cLEPulvvpQnO75pFy2PXyYO8LIZWXbHuDUiILABWE3QGy1ufCM0XcmCPRv8rWgXLU4n+rIAvdvSl4o4pLs+7gYFuD2XkiWKChPtWnioyePw3i02+5AWd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: 17 September 2026 10:37
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> The hardware does not support DisplayPort configurations where the ceilin=
g
> of the Link M/Link N ratio exceeds the limit. Enforce this constraint for=
 MST as
> well.
>=20
> The compute config path needs no change: MST goes through
> intel_dp_compute_config_limits() too, so the link config filter set up th=
ere
> already excludes the configurations violating the ratio limit, and MST fa=
ils
> there if none is left.
>=20
> What is still missing is pruning such modes, so add the check to
> mst_connector_mode_valid_ctx(), reusing the helper the SST mode_valid
> uses. It walks the link configurations and only rejects the mode if none =
of
> them can satisfy the ratio, rather than evaluating it at a single link ra=
te.
>=20
> v2:
> -Drop the checks in the MST link config helpers, redundant now that the
> constraint is applied while computing the link config limits. (Imre) -Sha=
re the
> mode_valid helper with SST instead of evaluating the ratio at one link ra=
te,
> since the link symbol clock is not monotonic in the link rate and there i=
s no
> single best case configuration.
> v3:
> -Now that intel_dp_mode_valid_m_n checks for all configs just call that
> (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 0c362784afe4..823fe99ca0a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> drm_connector *_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
>=20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}

Since MST appears to use only the max_bw_config for link configuration, sho=
uld the M/N ratio check in
mode_valid also be performed against that configuration's max_link_clock? C=
urrently, intel_dp_mode_valid_m_n
accepts the mode if any allowed config passes the ratio check.

For example, on DG2 with a UHBR10 MST link, could a ~1.3 GHz stream pass th=
e check using HBR3 but later fail
during config computation because MST uses UHBR10, which does not satisfy t=
he ratio limit? If so, should the
validation use the same link configuration that MST will actually use?

> +
>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode
> --
> 2.34.1

