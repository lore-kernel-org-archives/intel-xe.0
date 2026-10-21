Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99284606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VaE2ISND
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07788130;
	Wed, 21 Oct 2026 16:31:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919D010E30F;
 Wed, 21 Oct 2026 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792600290; x=1824136290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JimKBI8IJdT0XDhhndo3sjOvi9KFLTv1YKLJ1EzkFuU=;
 b=VaE2ISNDibRSqMuhPtgWyNP0TuYDoJT7KyfR/QcPirBIhzl5IJkl+uIt
 ouV19Z1Ga9I6S0BdGUFcwsgs7gxLqV63VJU0dABPvygeePFFkc0h4nrcL
 suglM8HN4Y7IPul+CKEu7LXih3ejDio+duBWsNF6Eagf6NMFzjNnPjkf7
 vsyO9aETS/vZpTbWnta0bCceQl2LXHUlGSDtSh9vqOmy2d8vnRzFbm6T4
 fSRq7C7JjS4u4Tc1LFUIKqGmJZBGqnNLlmpB1FPAXYXzzzueJuz2h0Tyx
 i+M2Bg/kpMKJnACQLmgVZQ62H3HAcj11jNtkOzaWIuiFji2RQcEVNurL7 Q==;
X-CSE-ConnectionGUID: eB8dlq1nSHC7r90bs5bAvw==
X-CSE-MsgGUID: uDEK0O96QQuYD45FyshhXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1365047"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1365047"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:31:30 -0700
X-CSE-ConnectionGUID: cPCrhmPfTFOdm/Y3LhnAgg==
X-CSE-MsgGUID: vEKgYG4qSR68RGP9pj8uEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4974163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:31:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:31:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 09:31:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ7wUADDw4Z7c0g6JNmXmw6Xu8r90m8WlN7vZ5M+FpQom1d7SLxROGUzSyJaVZLSWYHYYH8iOqKowdTQHkH9J+toFdDni2jdkg8d1mM5Q8YQqpbp756+GGQ4KcRPwFgl2M+ff11ENiGe9kpsvf/9+nUZcSixpNm8du8u5WZO56QN4ypHwrkMLDy2MJln/CpfbwUSj78GMuG9kjfKYeDWjJuh65Ksxd6737w+kzbfq6H39bWgWn8CV7/qxeS0u3p7tzhifV7/zyi2PISblxhxioSjY7ASIdIDzOc0L+pGP2QPh0j6yfoSQLC+MfmsdEfmYAtOHqqdRZu4b/ne7qShvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwL7gSpfNCCHIjy4RnMd7MU5KHPhES3bVDo+Kj0MF9g=;
 b=Rj/pM58r73hfPwfq96s2zJElBn2y00R5DDEZyzhenV4FQsSJpdRu92nzNKuWr00dukDyBaUgVU+80gLaaRoR5ADSY9cqUETZ1LA3/UOvvHgqLlbOf8jSybOTl6Utcu1aPOzh8jc2degKwQREUpXO6f3vV04QPXgBqY3WriAKaHrXf1p9Cz1DuN1DzxeVCXLS3oD7UocsQ4Nh8bzngnewjZ9awrO7SsOwNz7ChKuUbfPzsk2cTjkLZAwt/EzMF+4DRRao65unXDZwVJ8JvThcPh9b8eTHoezdRmfyj0cVDmAzQJyraaU4xlCd+nzghF3Zy9D8JyK79EJYeEUlaG1CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 21 Oct
 2026 16:31:26 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Wed, 21 Oct 2026
 16:31:26 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 09/11] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Topic: [PATCH v6 09/11] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Index: AQHdYS1OQLFzIvnbdk2v3fA4bucXd7cIMLEw
Date: Wed, 21 Oct 2026 16:31:25 +0000
Message-ID: <BYAPR11MB3783E6A85475B16CC9754E65B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-10-suraj.kandpal@intel.com>
In-Reply-To: <20261021072438.1164249-10-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA2PR11MB5082:EE_
x-ms-office365-filtering-correlation-id: 3284ee64-1a9d-4b81-e0a0-08df2f90c07f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|38070700021|11063799006|56012099006|4143699003|261009223027099003|10067099003|260925021911599003|260925021311599003|260925022911599003;
x-microsoft-antispam-message-info: f9rBioWQDJe5IxbfOTvuq4DkH4HLq49j2Xn8xgcbk0MK3WnOawZJDgNIcil7oFJd1UJ7PHxTzIeLq3tHAfs4vSCM2zpAqjplShUQqqIyISZiDxnjnFsxe22Zg0LIYY7wejZP45tjZIV47BQi7UeyVhhvxthSYI6OcdunIpNZfeO1MlDeEbxgzCtDpX79pODP6UtWG3Cb+E2wNwhQHVbeGjbkoCppkH8DtUyBFOSFG81nS4pHhSEQIRauvBLC9l5kuYdZtZ5AU4Ao/nxYfn3jnSLHvVscq0X6ifmjl7HmArtWtS5tqzIrH5P/mFzGKcJaPdZN4e5o6b+9xO2iX0IYyAGvEX5z7sKfq0EOM93JUKjU+iO7ayxmeq46X4/cZpquOC1dMuOFhps1Y6LYskvEkNg3/lyg4CLAMECzcwYbxyEWJ0xSeOhGgbtgwNRFw47n1nAKjvfUH2Mnw+xjs9G7T/JkkLZYf8RAjb4mTaVHWhjZ8MIVbTx9pXB7K0BMYPSOYzu7VlMogdXE2uuvBUkisO62Ril8eTfrYcZPXGOipCcLzu+t1uYLZDNYjqq+UE+03k7Cgkm2PC2DwOisAIOf0XOcRjuoh8O3IRzkdxyXw/uWSu2E5YIpdRVgoa/Db1dHxyhD8C3xldtgMY8ZSA/GJznE4UOYsevdcszypE5dFLsHz3q9e7FoPu28Oqgw2hzDAA5pQdHQwf3y15kPrgrsA7wbN07AhggAQ5iyiVpcT9w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003)(261009223027099003)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C3jQ1/Y6HLB3HLUNx8T+ztI3Z0DHV0GWN3fHsmwnklbpyOS4uVFMVoXPeHDM?=
 =?us-ascii?Q?4w6cItgqBkBM0wivYTAIZsDYjHBJrCGdA+zeOwfxhUdOkyxNyJX93R0wD82u?=
 =?us-ascii?Q?Amvadvy42HNXeQLOsQRN0+muxv2Az7VsxOw8gELT8qzdsoTlPxP7siXuprmE?=
 =?us-ascii?Q?2ZjdmUQ5/YcohQHZEXTlnDlvbRewLcxy2a2hYhm8GnQmjZ78eyZoIV6o/OSU?=
 =?us-ascii?Q?UlOpsQmukx6GP2zPQ+pEsbU0B9BaMnaJmaETi/rwWtXPyEd5BcQY8sod845r?=
 =?us-ascii?Q?1OqIWMLdIA6bEL5+K0rUkVSRbcMND4Rgq76Eu8XpxCcNW/lCPlf2cBEU/Bia?=
 =?us-ascii?Q?2T58PaSN0AjkwhKT/q43K0FbBHUcAmjjUZythmvqfrn/8zNxMN/TYqD4QEHJ?=
 =?us-ascii?Q?SsKkVmZaegM5PWBVi4CWPI7c5SaZbkDAZ0qvgsXrEhxy9xq4ztmiZdNMoKus?=
 =?us-ascii?Q?hyq/Xc8Md/26AVLdoPeYao15xSn/jkvLjFAkE5lv0hNN4Y9LJuuP34Rj/JAe?=
 =?us-ascii?Q?8f+A12j68LU+qZ9uKiEJTviCYqfzQFjjacoV5oGzMcPK/RmObAfWp09c0FG3?=
 =?us-ascii?Q?Uc4Zlh4EitlQbM+EMDCn00k6B8bTFo8W9lTS/hn9aQdk4B+NP49dC/+Qn1UA?=
 =?us-ascii?Q?2rbdeFr0wmMrBD43mqf6hur4FfVH2D3QkdKuk+0vVTka8Lz3PXS1pwNchr27?=
 =?us-ascii?Q?htfROPtJ8nquVgY4A+tibNprTTWjxLt3Yen0Rb91sHS51ekXMHNgERw7UNN0?=
 =?us-ascii?Q?N13MaKBN0m1fchkW7rfP4rldgT6rLteMrk6ygfenfxcqK0UjpBB4TXHdWtym?=
 =?us-ascii?Q?EXsboySdGu6zpKmaKElOAtzkzhdwOtr5iK5CnTPqq9mgEYnm7GHTm29Jwg0e?=
 =?us-ascii?Q?sZhPkSONxsirPUKHPNfv1SWeoCaN73DLk6qanI9Zb27y1Aio0iFitBFCUZhr?=
 =?us-ascii?Q?VbaHHLu+QcBR5nR3f/UvegPGg8d+vanUHkBdA0S0HknGwNDlmdWjFbq/v5Ek?=
 =?us-ascii?Q?ZYopUIYQosK1FkIlREzbyEemgpbz6Ql8gBckqDrA762RGmI/gz68WblgR3En?=
 =?us-ascii?Q?F65sytSPoFIz4FzCYd1O3bwe6pCwTMYPtmrYUy6tOt6YoW+vUdq+DeHIyWKb?=
 =?us-ascii?Q?QZJS/a+I/RGf7MXCawQG+067ocvd1bCsCIEwjVqxgcxQqbdjUftzkBSoPS2m?=
 =?us-ascii?Q?Fa6wGqAwW4JXS2cS1MBcV+eAXE1Fc7TMVyT1JnX41zWNbleytKiXinV42tWL?=
 =?us-ascii?Q?NpTc4DUtUJ8yEjA2o+HPLVEKMI+we/cdKEMVKlpnsqmv1EfX+g/dkPr+FEQD?=
 =?us-ascii?Q?MSSD3fWdt1q0s66oKoh3Up6tD2kI0eoQmFf8RQYPOFKkVYUUDTOnENCCsNX5?=
 =?us-ascii?Q?DW4N7Ro6e2tOeuB+Vpwwyl+QlvMI+AFJ4gk2m58CiTnRRwKlx3PxfqYMiyV5?=
 =?us-ascii?Q?96gMqQKdzSvLoqLUyLZdqlWeWBpwtDQKTSMlBqokjwtO75YAyF6oR7rkuSgp?=
 =?us-ascii?Q?tbM8PGY0k4FjENxEZQI/PjNxlbzFPukMKU8Euxic3NThSg1NvtL9pzZwqDqM?=
 =?us-ascii?Q?XnSDc/T4vpmeKXdXboUsJJZzEN9Dxbf9+oiXSyRdBHC2SKyS/y5LXhwpSuEF?=
 =?us-ascii?Q?FhfozHLtBpYykKUe0NBRA7MUnPsA71nhEBqDX+2SX2imcSPDNCx0HGdxT6Jm?=
 =?us-ascii?Q?KzJ2ywra8rMzCNNe316Nu6Jrb6+D9YcAB6VUYJPA4qICsJvGVe0v8HDoS5kA?=
 =?us-ascii?Q?q8UQZLdMSODcQu+Ivwlkh7DW8ZOgMPs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z91SfvtlZyuU6hehUhJj7ljLgT4lzwQ1dhA+Vc1DnJljC+B3P/p3xMkubdx6FbAD1VMQBg8i+zZA7Q3BTXg8+dB5WAd8DtVPdov0jkNadNj8wvh4ckoaGGtkSjjUZCIkOkE/aId6Et8RZSPbnc4rs62d+Ed3+eUUs+xKE6/UwXx0PE+9UMQS+ZujzgAb+gdPneT3OW5UKqE4y/Wiv2ggJw1SR54xTM72HEokbAXnV+iMuHzYkHxWkhXkdD51deKWfDhTlRSEW1pCmgNIVhw+pIt8Dt8SZ3vHbx/iIoJub+Yf4cav6h/w1wqD6uUK1GU+rNVAy61iusZbjyad96XQ2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3284ee64-1a9d-4b81-e0a0-08df2f90c07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 16:31:26.0738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMN6LFjC4bpU5CxRZr76XtfQqb308Kb7vns2TwDx3r3id0BLIFSSE4Pgz19o4FCak5sOpqtXFhFXoNS1jRNy0aVwZvW4RPum6q/R2B/PPyKy+6U3ts4ly2QGbBYogJis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 October 2026 12:55
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 09/11] drm/i915/display: Implement Wa_14021768792 for
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
> v3:
> -Rebase on the reworked M/N ratio check, which no longer checks m_n and
> link_n. m_n is no longer const, as the flag is set through it. (Mitul) -P=
ass the
> cpu transcoder to intel_display_can_bypass_m_n_limit() instead of the pip=
e.
> (Mitul)
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++++++++++++++++++-----
> drivers/gpu/drm/i915/display/intel_dp.h |  2 +-
>  2 files changed, 24 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8ef6b4c4fc8e..8e6ba5b9fde6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1300,18 +1300,32 @@ intel_dp_can_support_m_n(struct intel_display
> *display,  }
>=20
>  void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
> -			      const struct intel_link_m_n *m_n)
> +			      struct intel_link_m_n *m_n)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
>  	int m_n_ratio;
>=20
> +	m_n->bypass_m_n_ratio_limit =3D false;
> +
>  	m_n_ratio =3D intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
>=20
> -	if (m_n_ratio > max_m_n_ratio)
> +	if (m_n_ratio <=3D max_m_n_ratio)
> +		return;
> +
> +	if (intel_dp_is_uhbr(crtc_state) &&
> +	    intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> +					       crtc_state->cpu_transcoder)) {
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
>=20
>  static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel=
_clock)
> @@ -3393,6 +3407,9 @@ static bool can_enable_drrs(struct intel_connector
> *connector,
>  	if (pipe_config->vrr.enable)
>  		return false;
>=20
> +	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
> +		return false;
> +
>  	/*
>  	 * DRRS and PSR can't be enable together, so giving preference to PSR
>  	 * as it allows more power-savings by complete shutting down display,
> @@ -3427,7 +3444,8 @@ intel_dp_drrs_compute_config(struct
> intel_connector *connector,
>  	 * FIXME all joined pipes share the same transcoder.
>  	 * Need to account for that when updating M/N live.
>  	 */
> -	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes)
> +	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes &&
> +	    !pipe_config->dp_m_n.bypass_m_n_ratio_limit)
>  		pipe_config->update_m_n =3D true;
>=20
>  	if (!can_enable_drrs(connector, pipe_config, downclock_mode)) { diff
> --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 1e3da678c9b6..c834d90a1f81 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -246,6 +246,6 @@ int intel_dp_link_init(struct intel_dp *intel_dp);  v=
oid
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
>=20
>  void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
> -			      const struct intel_link_m_n *m_n);
> +			      struct intel_link_m_n *m_n);

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>=20
>  #endif /* __INTEL_DP_H__ */
> --
> 2.34.1

