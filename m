Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3702ACCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 20:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F2B10E211;
	Thu, 15 Oct 2026 20:24:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D1E10E0E8;
 Thu, 15 Oct 2026 20:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792095848; x=1823631848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xek8DdyJQ5iOIWMmSBvdLDbXBog1vXN3D7NTWPfL6uY=;
 b=FywYi0PyBOjrZHhh7hM4j44IwNWmc7RaYIAv04Xw+rqa2Hs+sMpSGR6g
 mCoLXracKMBx5F2OQs9m0qOZtZ/xlRZALNZtTfDGyOLlkh1Pft9y1aVzs
 nE1GtW1v7CVzmTBe2ad2KEptIrgupmOtQEtEXmrLJupfrTG8BQzMEMhmB
 JLSNg1kPMa8JUE2vLll1aQaEf5EXr7JJyddyoAgdCaAcge6mFtXn6U4tK
 00xf+cypObNlML6HMPDKp4de73cWIEULjczVRVWru9LDn/YOgpN9RSfxL
 1xcY5sKS784iFUiaVT1d4wcAkdbi/HlRZPw3K3vahpHZEO90g+5eQm5T6 Q==;
X-CSE-ConnectionGUID: KVYwkDShTDyRGMZ6aQTuiw==
X-CSE-MsgGUID: VDI4rU+NQHSrvqafRbJK2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="911260"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="911260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:24:08 -0700
X-CSE-ConnectionGUID: pfAoQFJ1Sq2s1BFnUXS/Fw==
X-CSE-MsgGUID: 7tlvZ5//QGaDE1tXEVBOgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2205318"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:24:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:24:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 13:24:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwbAxWFBKLEu/Y+es3aiqAW/EvoKkM4+U4SIWnhK1piIEyH20/9bHSoA4X3PccY7zqy6uazFY/u2KTCTqiJhMEUyt85kbIMLexV6EuyOyWOTbWrz/IUbX3342V4eTYTv2Xs2Wbx4QX42c8x3+z249K9jkG0BSDPMvDncpQx5joNEQrAIcjKC3q8lWMhiaUUXzgYbIYw2x7K6kKuQzg5BZclcgRaI0ybG5qZx0Q3+TpvcJZ2RC8qu73OPGfpToWMj9TtPfsZn8aKN1ADOldrAbqo2lv3FRMCCGSgrdBBwj503GkF4YlFUuuzz/rG0rbXXPG+z9KlmsJzKBxtAA7k0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaEJyWuBtbJF9q6kFMVuBC006N3/eAtsGHhACkcCzOg=;
 b=rXGX5jyqZwKu5mXFZL2z0yz7ILwGGg6P+4TWuZFgKPN8U2hE6v5p2uAmF6FXb1do9asdl3t12wt9meN/5A7ihcXQULfQfT61n9T9Mm7RLmYYZeldYmhs2yiwy/ZZFzSGC6Xjiu+MHzJYcLeRvkpvReiYjRz4ertCgosF2Ib+x2oisg1gG3262ptmCFI6oP3iW+0XvFKELK00iF/VrwutjQUvtrkVwVZ8274V3VQE2teqFTj4VW2cLbpQ7irRyN2QyS4jHIdN0Y+FoP7Qxg8HHhnPvA2WasrPAe98ml48nDmFOE4MsFv9SZGtpn9jUvKu+Ze6KrlNXu1PiHiIzOCupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 20:24:03 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 20:24:03 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Topic: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Index: AQHdRmO9DOtg1H94FEC7xnkxnTYLALb/Nzcw
Date: Thu, 15 Oct 2026 20:24:03 +0000
Message-ID: <BYAPR11MB3783EC87B61E7A237D3921EBB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-9-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|IA3PR11MB9205:EE_
x-ms-office365-filtering-correlation-id: ee93b5f2-e0d4-4712-55f0-08df2afa4131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|10070799003|1800799024|366016|38070700021|56012099006|260925021911599003|260925022911599003|260925021311599003|4143699003|261009223027099003|11063799006|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: u3cBUVzGDRvdbNYhFjMDX1HHqA5YdhqL3qMmdstA2vNJcUSYSCyuyby3PECbeg4Q5XT9OdLgNnIuf7GxZOaMweRwJgaLdgKb5qnu6eyrnjEPTGYAK6jfpB1NmbuPzuW0TTebfpK8+rszrzy3lFXz6dBRyr/+vPyJUeZTcUZu5LL1gQ6H6nD7FUuReYm8AvLiLqt72OE4sZMvtgX7OEh7og/HZ9GJoWtvQaZMXJNGsB6US7QWmBrideMKHzPDOKlyFVgPhz8c92+Lhhsw5wzY4zZzbgqXwxGsxXJLO3UUVzRbj3pBxMjgj0TTZZSYZsflKu+dc/aHIaQoAayjCo57xP16JQZcBr4GM24mCJgbhGyW28LgDX3WUhwkMZZC0c1srq+ktcOqiZ7Tr1nPPtQqphPNiyjaFxTelNfivCj83nFprnWfeUWs0xxxuMvheFsbq0uC4Kf8rBr4IivAQfq12sl+y1K+CR+jK6BkGFRQ5CFI9SffhCOhnBJV+uVtKfpxk09sT8F2/VK5nMPu0R6uFrOFEEKItSkNaExO30Gy+mAgcdgFbkETHSn5cOIbWb/akYTrirjEHBq3nksFhw3elZ/UzlEkVydkM6YQJtNQlEB9I/VTEPyzE78Ddyyf+uiPyzXpuLEUNNbOTxj56YxKeMSzLbiFS8IU72MuytiZkWbsFPL0457UfFAbhXfG2pc3CMlAytM//6ABW91fewgkfs9m8RrSbTXgW/R9HHNl5/0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(38070700021)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(4143699003)(261009223027099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CgVRH1dYNicqmdCkIjFOvxATf2MZ56RTUW4iAKpjc8ZinBm94SJkzrE1rqOY?=
 =?us-ascii?Q?is9F8BAIgvRcjYMeKNhdfdgnCoB3EiTTJikpJvFiCpr8yCdDp5QDMqpZCmwH?=
 =?us-ascii?Q?8WFmBvIoZH1aoDRKoJUG58H3k4qAcRCT/9POUYlP5hXO6cifHm6Zo0g3RzvR?=
 =?us-ascii?Q?iPhrzxCTJiTpkdzOcvBvEAHmZiBRR67sMLBMgmtfSdPxeh3gQO4XzaILyFl9?=
 =?us-ascii?Q?atWpfcDEfu0wSwfMPr/QgdcC276yMAF44pdGt9ms0HnFU8SoHRe3OM1Sx2eA?=
 =?us-ascii?Q?S/kJjOOl4TcYpQuBOtvPEznxylBvYeYH/g9YssxAnqGSUOYa+GVlIKcT3d/T?=
 =?us-ascii?Q?NqrazfGZawf8eLKV+24E+hQjDD38FFmp+qnhCxBvtPz4dB928vujjRT6Q+1A?=
 =?us-ascii?Q?qhjHs8vjYPZfVaZ1HEh+JtiRM+fgtnM39yeXFbiXHbUiQjldy+e9UG2fvfCk?=
 =?us-ascii?Q?/VzEk6tpM2xysj9QJdNHZuM/5nPc1Eq+wUsg6GYYG/iZI/Zczy4LcwMfpwh1?=
 =?us-ascii?Q?+MrblHNYOvASjXMz88MtlWHBlHCSboqiZFaOE/9DPp8O1lye826wSU4yijpO?=
 =?us-ascii?Q?9lVmUIdhmzFS5hxXEYv6zq4u5zHzxmBvM1dbdgW/QCabEqUZqArJ7tH5OJ9j?=
 =?us-ascii?Q?BMgyU4sWuIL+VCkS0DwFl+bIcnjFGjyd4q49asfKcCBr68+ilUIL5SRA/8SK?=
 =?us-ascii?Q?8cVV+N9uIiPo/cQobbHYEWLD2smrlrAO6Zs6xK148Sw+/TJaKVF4ttW4owqh?=
 =?us-ascii?Q?oYkaFpZ8nY9tkdCxKWH0xxhQfcvPMHHmstGeZ2ZBcX65W2B99H/QrF2y22FV?=
 =?us-ascii?Q?I2K0D84fM3e6J3UO07jJQFp9/wQ3AhGS5I7g7V/VVSZY90ETSLT4IKix1HRX?=
 =?us-ascii?Q?h9RN4KmApH/mL2D2Pk/yh7g/mHlkTK5091KeIS58WTVsjnkMNDg636OnQIMQ?=
 =?us-ascii?Q?V7MMVeAnf+Jn2RE5vN5FYyLuDa7tqz/fO9eT1wwDag9rBcxN9a5o6C5oW50O?=
 =?us-ascii?Q?HozoXGawN2ZCVV26j4n8EXozFRF3C13QI/IE8A1UUvF2UTmo4Qvo2kTJd29k?=
 =?us-ascii?Q?IgXgvZMm+IRILeaTB3jrqoSRXiIlbbKrXYcCocjDOcYNhLdLGVUS9jmzt/eH?=
 =?us-ascii?Q?EbtqZuyq8wX1OvOXwWGcHA+UQ2SM+cWyMIZYcWv5YeLLGAOMIs0jGN5Q4DZC?=
 =?us-ascii?Q?Lm2b5xgkw3w/Wcd0pD5YRFQ5Zf/y2rC4CBf8z8ySJMnxZCz8Sb1KTp5+uJRY?=
 =?us-ascii?Q?2lmP3cbBY/iAxyVCxxUw+BLToly3PSqf1eJrKtZWVEifDiacZ+NT+i9KXuZf?=
 =?us-ascii?Q?to95z0c+x5Iow8WGiHy9HQWbdbEjU6dgVUv0FJr9UWW2cBBn+bdnC77qhX3Q?=
 =?us-ascii?Q?THtz23Io1UUOeDHVFWNcTMukWhN+OMp26iNyAOiuo4GbeL52kO9O2dskfKBG?=
 =?us-ascii?Q?zLpBmZ9VHIVq7mMvV8z8yzVVuTtxEI2Xx+wDHPvCSzU/gOnyuMVRgX5rBPn0?=
 =?us-ascii?Q?NwLXPRHdFvrtvbo2BBAz1t6csBeGJB4fjFsHXUj3dJtAJ7zQQ3Ckm6aPDNjC?=
 =?us-ascii?Q?XyHxHRJwdJEptN3Awo59iIBZ4djvpwBw8ApjyrakWh/OS4CWBsnw4g6PpWlh?=
 =?us-ascii?Q?WyeCi9RNrVK8DxHR7cVfUHUVwcy7NEupHHBjHMJhtaOWeL69J8S8HUMLieo4?=
 =?us-ascii?Q?1LgP3cdQYAcqBgolqI5zNdaDlWBJbGY/9yUi+SVPz2kxhxTd9Np/getOdHvf?=
 =?us-ascii?Q?H9QWfuD8nxDj7apZThplr6pcSbHZjBT1jotVdmlVhWazPfSOrRJeO0ZsOkBL?=
x-ms-exchange-antispam-messagedata-1: B+GPqlHK+lCvQok/e/U22nuIZRMajZeRDSc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QMKWtpHEbppZTOv1qqmRtxS2mKp0jnhSvoP/yHG6/mcvbU5gJiFQhhsqpQD/U/Jks6EFoe8kbQIuR+1pkOx4wMukJoTj4xuS/uoc9+fvdag4ppe30Mp7uNy19JwHjrf+kaVjvDviBiTrBdVLLI3PJ7oXp69WaoABe4aNIDiTjJhEzuvrKtrQXg1TClU3xTQZS8Fgk0sTnuw4zARCNPbbBCqmvny69EeuepXnPkZg/IHUSTRr3fbFMaP9oMb2QPWLYCEmiaHokOM166Eo0KPjxgAsKSatBXLMw6x72zNRMYlGvLPq9feSr+g/7f9UuYJXU1k/wy/WIMQaEUUwzL1rHQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee93b5f2-e0d4-4712-55f0-08df2afa4131
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 20:24:03.3222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bae48JWPuAjaX6UD8jBEer6qG4AYXxoPk6JkRt62rqvhrrW0XsbZhAA4o5XKuuf4GH/tfKNXjn06SsJBhklo20+Tc/Gc5ukESI1AbcvlUiRDVKQbeWBLzZnF0itdi9C5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9205
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
> Subject: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for
> BMG DP for link_m/n ratio > 10
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Handle the bypass logic for the M/N ratio limit for DP.
> Calculate the M/N ratio, check if it can bypass the limit, and set the
> appropriate flags for the workaround.
>=20
> v2:
> -Restrict the workaround to 128b/132b links.
> -Clear bypass_m_n_ratio_limit on entry, so a rejected link rate cannot le=
ave it
> set for the rate that gets used. (Sashiko)
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 31 +++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index fbfc00101886..9c327008b733 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3373,6 +3373,9 @@ static bool can_enable_drrs(struct intel_connector
> *connector,
>  	if (pipe_config->vrr.enable)
>  		return false;
>=20
> +	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
> +		return false;
> +
>  	/*
>  	 * DRRS and PSR can't be enable together, so giving preference to PSR
>  	 * as it allows more power-savings by complete shutting down
> display, @@ -3397,18 +3400,35 @@ void intel_dp_check_m_n_ratio(struct
> intel_crtc_state *crtc_state,
>  			      struct intel_link_m_n *m_n)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
>  	int m_n_ratio;
>=20
> -	if (!m_n || !m_n->link_n)
> +	if (!m_n)
> +		return;
> +
> +	m_n->bypass_m_n_ratio_limit =3D false;
> +
> +	if (!m_n->link_n)
>  		return;

Should bypass_m_n_ratio_limit be set where the link M/N and limits are comp=
uted,
keeping this function log-only? Also, as noted in the previous patch review=
, could the
if (!m_n) check be dead code?
>=20
>  	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
>=20
> -	if (m_n_ratio > max_m_n_ratio)
> +	if (m_n_ratio <=3D max_m_n_ratio)
> +		return;
> +
> +	if (intel_dp_is_uhbr(crtc_state) &&
> +	    intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc-
> >pipe)) {
> +		m_n->bypass_m_n_ratio_limit =3D true;
>  		drm_dbg_kms(display->drm,
> -			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> -			    m_n_ratio, max_m_n_ratio);
> +			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
> +			    m_n_ratio);
> +		return;
> +	}
> +
> +	drm_dbg_kms(display->drm,
> +		    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> +		    m_n_ratio, max_m_n_ratio);
>  }

Could the ratio limit also be adjusted in the prediction and mode validatio=
n paths when
Wa_14021768792 applies? Otherwise, won't configurations with ratios above 1=
0 be
rejected before this workaround can take effect?

>=20
>  static void
> @@ -3425,7 +3445,8 @@ intel_dp_drrs_compute_config(struct
> intel_connector *connector,
>  	 * FIXME all joined pipes share the same transcoder.
>  	 * Need to account for that when updating M/N live.
>  	 */
> -	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes)
> +	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes &&
> +	    !pipe_config->dp_m_n.bypass_m_n_ratio_limit)
>  		pipe_config->update_m_n =3D true;
>=20
>  	if (!can_enable_drrs(connector, pipe_config, downclock_mode)) {
> --
> 2.34.1

