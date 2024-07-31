Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B4C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 13:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127C10E2D7;
	Wed, 31 Jul 2024 13:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zjj0JwhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36E010E2D7
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722431789; x=1753967789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DEkK6UODYGYjoDJOs3t1YdUKM99czmVfKo7Tei2thkA=;
 b=Zjj0JwhRnFOXvIK+1RrhA3EyGYZsAkH1cPo8VkNI7cb/H1T3NCB9pKSY
 8QTEkWvVeXHgVXKIG8GDcwCG881RxpjUBSulTq4Vejnmpinkcd+cXz+P2
 js2hCgyASOhEYvh1w6GtT3UP96/8/LIxi4IFTwwyKkWam9/gHGVbkrIUj
 cvtDYHiw92vu4oPOWKLRAP9e+XpRd4vL61k0FBmr1DDhXmWw9JeU/pteK
 8dPketRYqvsm575SChVg+QRxBJnPBitYuTYonBUUyOqOvupxGT4JDj2ub
 hC3vkbKNowjE15eO5dpLdjIATzlD0k2I/YNL7gHnztMj3wb4NyBxcFxoa Q==;
X-CSE-ConnectionGUID: QxJ45yR3S7iKnyunfNPbzw==
X-CSE-MsgGUID: mI+xxLXvSG63o0yw7RS4rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20258975"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20258975"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 06:16:29 -0700
X-CSE-ConnectionGUID: udETJg9cRG6cEPnK7V8/9A==
X-CSE-MsgGUID: IlR6ItbRRZGCL2VzbC0zAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54930191"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 06:16:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 06:16:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 06:16:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 06:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+UI5gO7YuE0uNPU5L+iE4af2c4DuGMADWH3IuLVCH0h+VXPO3ndCd4j1AebUmopfknOzWJR5huLzI8Qq/y5SYFhTt+cmyStfpkpLtdibAyqRJ5tSKcklJZBFnhPprQT0jlgnDzUmtfqn4i4JSPdkQNVUZ/qWroIIHeplpwEC/kZvqbxIgh7wwQgMc5ATmnhteHo4m3OFHawgSzZY3Pl15wtRCifQxlakmbA7BOlGsBreUGMVZsBaqx0zj6CyrtS8NnmFKCaOScsvY3stezlwcjzGBG1+RALahYwA1yE5la3qat+OfJmjHZaVeLSmXk6XzMlQ52uxVZCFKKPsP7Lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCD4cfJ//dpqAQRZXtiwFwaWeOE/ArisL5HRbALAQho=;
 b=NAlnijL0aLi+7JL0TusL6CqBHOyumNqUV/E1HS2vMOE08eCMGvatJG3D8ThUAdKiMlJv/1GyxxKp6Gxsh/W2lAgsmMtCi8vARErBaLd7w/tUMfY37v1XAElZ/1n9oGUqO/rawl8HF/m0HHmlD8bQkUmytlxRivTTwbStnNaDVsoCRF5wWF1XXceB2XIT+fMeTouYddLyUXpOntKuqDVBwL1XSETuwsW1fZodTFloinYAwH288v05aew/cWFQUrP56Re3fCqypNDmb1bd84ix+MVV+50haUCTbjTJMQ8fLDEu6wQK3rlz3u4TVdwplXWCd3lreTcAA6aF+zx2Z91tZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 13:16:23 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 13:16:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Topic: [PATCH] drm/xe: Write all slices if its mcr register
Thread-Index: AQHa4yw9tTRhHqabbUOffdt9BpmRbLIQ0Tqw
Date: Wed, 31 Jul 2024 13:16:22 +0000
Message-ID: <SJ1PR11MB6204A7D244F8459B2BD04D7F81B12@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240731093152.51424-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ2PR11MB7599:EE_
x-ms-office365-filtering-correlation-id: a2666f8d-54c1-4e5b-ad29-08dcb162f96a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DZPnJmEwdDVAGN2wBwisx7ksZ4NJfNmz12jdqS63hZG/qmU4jFes3WJbOujM?=
 =?us-ascii?Q?vYcj/jQ67WilK/W122wm2fI3kugx1nWTgPEt35Z0LSV+aQUaokd5wHmHxX4t?=
 =?us-ascii?Q?uNV/DaTfrMy9MDDkOoR1rc+ck/t1iCYOj6F7plVBz/fRaHNmju5V1IRGaY5f?=
 =?us-ascii?Q?ZAq5nlxq36RMUVQSoHfXjoBVtylx32rtgPasykXRQMG0MyxLdpLIxv4+TvR7?=
 =?us-ascii?Q?j6PINBVSeGjefOic8VA65Ev13dv3gDUiaUjOITB2/S0L9egdorw4zeE680h4?=
 =?us-ascii?Q?vq09QEgV7ngjDPrbt9/lbTERL3vGWTJe1UVhN4c55fNSvkVmDx2Jg/R+oUcG?=
 =?us-ascii?Q?hZ2P4A55q2fLbOf0Ic7b4THbXsruwqYJiOUJfLFGTB7tQtKO2uHFYzEyqdqq?=
 =?us-ascii?Q?EFquN3HhPbkoH8IpAEpm6KDqN7kO+0iSrQYau4qWv2FYzVuHLuoDDRyhkEjt?=
 =?us-ascii?Q?HCWlvwIC813KLo+AKtqSNjnJ9tp6JxnQJyjAnxXk85gLi+MDwB+rJkNhbsqv?=
 =?us-ascii?Q?GQJJOOM+3GxIIrxTq+Z1URNNdyLlnbvX7935XabG0ubHM/tTzJAMhcOyj6wA?=
 =?us-ascii?Q?Q3Z3vCZ8fINqmJ33+2Tt14z3n7xnRIqiyL8aNv/MbPOS4PAZu4cYh9ORFbyv?=
 =?us-ascii?Q?Ovq2kcLJtEX8Y4gDV7DNqokKYsePr1/m/OcVL0Ww4Dul62BTRiY8YSf+Ibzc?=
 =?us-ascii?Q?aPU9VjUUa8r5bnJm1N/wgLNLX1GKR0IiFMDSOC1V+RHEHuT/9FTS7wJEzLKr?=
 =?us-ascii?Q?GomNQjUkI1KVcuZuUllm8mCPXlbpdOgTun7OKoQ9MQRZOvjevLt/FJ8cb984?=
 =?us-ascii?Q?YMoWG2lW9VSxWZwEmdgdfn7vgt3M8TRv2f1/sprYXZ5K+sZ7AvUT4S3xAdRC?=
 =?us-ascii?Q?y5PT1USgZN0WelDS6vNP2EaPGeLG3i2aNzgMU5HgNACfI+iiQul0jDBysHTe?=
 =?us-ascii?Q?UVY7NwgkxdjwnGUXcvUIVXZIwhUBj18JNsxKKTzPFy+7uDZygP2jiL13Zc73?=
 =?us-ascii?Q?SSOPcCitXseF/LQSH5LwtGNlYzmX/hrOyqOjxQ2CiiGUSkALPVQ+kDPcTe+a?=
 =?us-ascii?Q?uFtRgsQGmtGMYqYKTGymY88TPRQC42JskMDvkaF5wMPCPAWyowWGqX8CowDP?=
 =?us-ascii?Q?SrcRYC0/hmuk8tJh6iLxOsQ7SlgUtGLWueNqJYngaEZMwv3+msKXsyt/kC0c?=
 =?us-ascii?Q?8Nxkyey5ik0XmZyUmyR23FrODRfNgvVp7o4ZvbS+HL8OBJDZhwaM+1O5Njh5?=
 =?us-ascii?Q?6LpLSWxzLuoRf+8C1ELH/B53ogf84hfokz838CtVYd1l6clHqzY+OB1ybg7a?=
 =?us-ascii?Q?UW3FLocJeli8jqFfdgHfGlfGZGMBAe4/eMTx0QrYES0OzAazh/fz7+hBbHAn?=
 =?us-ascii?Q?IUVlNPCoIs/XB08Dx90VjIi/IfvtOiZMa/M4kAogp7v1EJfJ6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+052ig9MVexOJ7Wnd7IJ+4Cb3/1AR4H+1B1x9ZPIIDfVE1Fe4mXk8FZoaYrL?=
 =?us-ascii?Q?35mb/8BON53pVm/ouXFeAfrDI0xXg4Tg1JFrBCjH8BLSD9JzrefVXkdRS+hU?=
 =?us-ascii?Q?pk+X8P0433L5uuHaf0ifd7Ss8KruRxHHjEkCBfw26h7SKHYTcwQt/Q3bkUpz?=
 =?us-ascii?Q?rkMa1osM9MfmRH6Ajgalc0cZF/mmqsfNEolYj7XNgWzWc6hCGhedifl2tfi+?=
 =?us-ascii?Q?HNJL+vQhT0QUbdyIBHVoOoqGAUfjNcCo4Q1rVWL9GLpQ6pZOLQc7ZctF18Lz?=
 =?us-ascii?Q?J0n7ZWC6SbNgHCnkuqx7ONtl1hL7laATGJRlBMfUAi9bI78z5VzfUL83FAAK?=
 =?us-ascii?Q?qfcYRcPaq/c0bzv1vi5sYhC98LMQVJS6ltRBBw3kWm/uCB3XMie6+JL3j8wN?=
 =?us-ascii?Q?lB0KIKHygv3HPOpjaLyD/LtBmdrcuUUIjp1uZDxF4gcxugoet1d8lvl8TpSM?=
 =?us-ascii?Q?4IXyEgL4+/CeXslNFzAGs4+OmWsF4ejR4cJzBrllO5qpKZK1SU2TCgYmgDwS?=
 =?us-ascii?Q?2AhnvLnbQSdEE3opL2qRlqnE8ZLRFmcw7fASop8ESJKPn2psFhTMnPT7BVCy?=
 =?us-ascii?Q?p5dZnt19GX+UH6NIMGoJxutSv3X+fsTZ6mYY3P/uCRo3I5u6AekMp0ZjmI8J?=
 =?us-ascii?Q?U70wNYkose3TM1quVmc7fFWNvDV3TlvgkaO7k1pUmPYLVN/7QWCDeeSRzcp2?=
 =?us-ascii?Q?b/LULUFaajr/HtGXaIft3s7fv+svsx8JE25c8tCa5WB1BE3/tkjyR67ZWdXf?=
 =?us-ascii?Q?Vsc2UZk2NtW2ySeGjHZQIRgw/BnrsoPw6C6M+p8emUHqwGKhcMmP2RDfT52A?=
 =?us-ascii?Q?Xw+c8K9YSTunuiQDMnADgSja6EiMOx22XpQe4houn59xrpfzartqaghVbioD?=
 =?us-ascii?Q?xmZkbVLVflooJK2qkXInWyvsYBvkCHny7CO04LJGqFSlfQtvHmj21RJFeRpP?=
 =?us-ascii?Q?bzxi5BLuBUY0VJ2uh0sf8eUwxZsBiEUCIhFdV0uBBp/oJpYRoJtfGwNfr8B6?=
 =?us-ascii?Q?V4Mc3MrlskmZQ9IvnD+VZA4SJ/rd/rn7ytP1KNFyAV3fACD9e6WHUNsgjjq/?=
 =?us-ascii?Q?YiGcNp4xdnA7ZUMUmRBlkLIG+W/peEPirQqKAai3AE+GQsXX+zVl1hBy94sg?=
 =?us-ascii?Q?VE32p3crNNxdb5hiNG/KPwcKC6JlYw4qp6boqfwhmrumkt2R8K2x7+6uxGd5?=
 =?us-ascii?Q?9+YPsTxW6AsHsICVNR6GilQhW/AiTNC3jEmgYOLZrwX3SnO2RXGhR5igd9gf?=
 =?us-ascii?Q?2bLwnllfjn1ppaRRYoAIWbarL2X1vvXwOXpXh2dRqXULIQerxtjWLrj7ICkS?=
 =?us-ascii?Q?nKR3OC0G/fcKokcMjQKfeyv8l4HPPvnx05td42Cje63rh5oS38i4h9PTGJWB?=
 =?us-ascii?Q?UJftl4GODkoGMnksRWBeMyqMYCkqfoBW/1D8EiNUcH5RoxmMGCV2y5i4MzNe?=
 =?us-ascii?Q?fi1H70MYNPslPPOp/OTjxtaD6Zb9irGQZ970Weket51xs5xekyjwHAGzgVTH?=
 =?us-ascii?Q?vUpIWji9EXlTJ6wxQSxKHQPL6IopR61QiAj7o3Hkzo2EFnwg56iawcGiB/xK?=
 =?us-ascii?Q?NYGFbMVFEWMikUpNC0Mh44eawUMJPYGmtttAwqTo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2666f8d-54c1-4e5b-ad29-08dcb162f96a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 13:16:22.8380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPr4Rkccwdkkhuep38KyPgow/8HiNn6hh5rqYIz/4KZqH53tlY6dOX9vN3d5PoWKQ2qaYx0nCIiX7Q5dCTlXmXgKEOFWpJ03+eokyXm0nmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
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

+ Matt

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Wednesday, July 31, 2024 3:02 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Write all slices if its mcr register
>=20
> Register GAMREQSTRM_CTRL should be considered mcr register which should
> write to all slices as per documentation.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..b131e3171899 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,7 +80,7 @@
>  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>  #define   LE_CACHEABILITY(value)
> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>=20
> -#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> +#define XE2_GAMREQSTRM_CTRL
> 	XE_REG_MCR(0x4194)
>  #define   CG_DIS_CNTLBUS			REG_BIT(6)
>=20
>  #define CCS_AUX_INV				XE_REG(0x4208)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 58895ed22f6e..c6296dc8897f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt
> *gt)
>=20
>  	if (!xe_gt_is_media_type(gt)) {
>  		xe_mmio_write32(gt, SCRATCH1LPFC,
> EN_L3_RW_CCS_CACHE_FLUSH);
> -		reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +		reg =3D xe_gt_mcr_unicast_read_any(gt,
> XE2_GAMREQSTRM_CTRL);
>  		reg |=3D CG_DIS_CNTLBUS;
> -		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL,
> reg);
>  	}
>=20
>  	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3); @@ -
> 134,9 +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>  	if (WARN_ON(err))
>  		return;
>=20
> -	reg =3D xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +	reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  	reg &=3D ~CG_DIS_CNTLBUS;
> -	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>=20
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);  }
> --
> 2.25.1

