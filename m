Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC95C982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 16:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F710E954;
	Fri, 18 Sep 2026 16:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmmiOAAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436FF10E954;
 Fri, 18 Sep 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789749647; x=1821285647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qDNSjuvk1xuzLcJJp1dMey9SAsaC3d1PBI7l3UKUC3A=;
 b=ZmmiOAAY8pqNeQRk2MN+rbuaIyrcxrV9JUmNX+qYPkv/FwEmZ9acsYwp
 NXEM6VLUdqPsoWtzepNMDSaQQIh+TTDaloN8YdvcAW2PjNJoh2eLLBe/c
 K6ioYaQnVzPK5zUbL3TA0uW5cHcsxMSHnd2eJ9Os5oCwjQI/R6j/1mWAm
 UYm8co1y3v4TcOtcq7jRu9WsN1gomfiy4kFL2nlnQBUfcjHU9Azmfr77q
 em2UPKhLxmxDzufxNucdGRpP55uU7LJzPxq3WtydnHvi4woOAJaIyI2bB
 R7jpte5sKaPwr5LNUj+X8KURvn1f+MrkQhzGLvBtHXDX7SndssaWs2C3T w==;
X-CSE-ConnectionGUID: b3XeLtbpS4WgKTKOE+tq0Q==
X-CSE-MsgGUID: 2fFf079dSs+Gsygei64Qbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77833524"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="77833524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:40:47 -0700
X-CSE-ConnectionGUID: 7bsFMYzRS9uExqpf6pbALg==
X-CSE-MsgGUID: 7xFUTOfDTrWtd30DPFgN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="271807685"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:40:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:40:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:40:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkSBF2shR5FUQDxKsXv9y3y9Na+7C5VeuEpHV/oWbLMZjVRts2rkT+S9WNA0X0ZA8R5Y4TgwVKH7k+dTUkBN7vYqJLYJ/Arwa0xFVEzFFA2ASMCZ5YUSKRRaBVuMzftnJCYP93xPkMrCNdl+zwyFC+bGkN0S/GEs1od3zibJz2o2dp5zmYvUcXPDAGLLYmpUkpob3M771h/t/+s7NWFmzOKq8lH15fhGy9Qwq4swzQSxrjkkswwwq6CFlQZyDUxQrmrXgyXPDq8f51ewVMJ/1op5np096XuHnKH1WpkoYCHwGSyMJ66cxln8zRdsM8aMhNUOr6vWo0yZBbvv8BqlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4onLxDCUqoSUZ7znE5fZaYNGXNSIw5LTSyz/it3LfVQ=;
 b=fQXncRWFlf1U1C0+WPHsCEDRU0FWVS3WPY5wccTbXJ7AL4Z+zFrkXfVa6f9Q2kjJhMwhbdJpLGlphNh+bVArCNEpM6675Uf0Q/QRsW27YSx7UHwCIf3xDenKFZNCEk50n8I2s3ReVEL2NXNmWaKMoOTZGwi7ghmp4HCqMGtfXIU6SrGI5TH7JcWsG9nUTQM3xJJnBmvLn1A0ePDvXCJShuDfwk64Gji6KgCTrFp6zYTTD9RpsnMpsAzoKbbRG0yJzBKm/g+VD+6k3/H/NSHIyozYVjJtTPy1W2+5Cbz35bG3gwxUIgMiR+0TkVJ9Hgcogi8iJQO5wSVi8EwqVGsy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH3PPF10E309DEE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d08) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:40:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:40:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Topic: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Index: AQHdRzhdVLsn3FabEEKhj5Fa7KTMM7bUHN4AgABtecA=
Date: Fri, 18 Sep 2026 16:40:43 +0000
Message-ID: <DS4PPFE901A304F9530E567AE28B1247913E3872@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
 <990495a5048d910d16fbd0452db5fbc21cd65701@intel.com>
In-Reply-To: <990495a5048d910d16fbd0452db5fbc21cd65701@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH3PPF10E309DEE:EE_
x-ms-office365-filtering-correlation-id: bacca320-b067-4ac4-5ab5-08df15a394e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|10067099003|38070700021|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: 9kkSjegjj8ni58C1OlXkeDzkc7UE/hIB9xxL0RosqZtRQgO6sN9iajrov5oy0EB+jh5LWuSiPewQ8BPQM2AaQTlQbF9pfFdGTXbUlI5LVeez2pCBA5K6uermcMmebPVWcri4ppUP3kJduVHj3S5cNJ6AbsLBI6IJVnkja/lShiGnXItQVshb9aentDvhnSZhO2y3+e/FLdK/NYY65pS8UgwNWX8q0bHHhLCgYIhOuX+qZWV/NWrjQDQP/uC1FJWiJSs+PzY8IgLwlhtkAfxEBsbhbuFnqRYxu1NB+KeO5FrfTT05Mb01KWVA3v2H/9H1XDctEBA8t574aBf+RNs9otUxklnhgXHsj6x1++MWToJVbKirHoiHaqmy1lQttIGMsjNTZ7o8eFOnYBW3xe1WGeTKpnvPhSUgFZNXItqOKJc58v5A8ZpXV3KbvbwOyUnIsLjsmSkqOJoFqWAwVUXXNmV7KrnSCcaPbEuybeLGNcIy5JRgdXcqAVmElNRpQikOcJ3uy/pfDFV2dEy6otRiTb8SkgfOlOsdbbTfajSavy3pMO7Mg9p55Exr+ly7R5idysrbGK2u2H8vuRbz2jNaWvhMRHWKO4bXKhSagoS8XTDSS+yj8vR70WKpRrMoPVaKvlr7y7wwDpIPKCKb66VwUTv45BH4kBVLLOtXUDenZKNFLVlZWNxs3Y+Mb/o/+lpGwpNtC+QOFGKPDzQIPqV48V5jC2JDLJe66oyhI1LUpR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(38070700021)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K3WuTC0Nq5wGtQmf2NYBFub9HwR+gNjqlZauQwv3UAuHavUkbSVRiBc4bfWn?=
 =?us-ascii?Q?8s3LlznmgxNMVXAVsGXBx5EWRKl9pQt+dGFEteDnHWU5z8qJs84PsYb8zwxF?=
 =?us-ascii?Q?dAwHJmocf4KRa2ISviCmqNQbwsy6mIeBaoVo/9LqoHYaEs8t/Le4jLgoq2FS?=
 =?us-ascii?Q?EMbXlI1pfrX3/6IBZHub0C0ZpxSVbtGbWP1u3Z+SK8HvY5N3H67aPt7/kGPB?=
 =?us-ascii?Q?WlBQlgHF283jTNYiCXLkCjjEGyUfdCcLGTD+KllegjIVXWLDv7MgvZb8PCME?=
 =?us-ascii?Q?yaLQA2o7o6zEG0v7xTFhY4c/hMzA1zQxDSdmiSj10bPrH337pns4EBVL7y9j?=
 =?us-ascii?Q?ic32ztl1a6VMrJyl4YPTwQxkqD0Sut1Fi32tJ2EcvVCH04PO3zVlvBV+EokW?=
 =?us-ascii?Q?6SkzfK+TZCGzg2NE9lZCzdFwD/Tj3tLb+/MuQCTeYGr1s7nhTotOdf5T9m1g?=
 =?us-ascii?Q?Ls/hG58xriPGFEW4gyyMcBjulYWXvcy1RKs9c/KuCXz4CHrmsKdyHKKfJb7r?=
 =?us-ascii?Q?S3rJWy0ubRtE9Qh5xqNPhXiI6R5XUfUfHoXOZiHVfBYAMjzbE2hGxUWldTi5?=
 =?us-ascii?Q?lGGbhh3gTkSEeWAH8kpV94w3hX4j/zPP1kaSMQM7pxfGTnU1OPBJjjI4YQ7+?=
 =?us-ascii?Q?CID7ite0PN+VjLTZXEYbc+bEPulG8n+Zll16YXhskkHpwW8GII8YCMQSLm7r?=
 =?us-ascii?Q?gFOFxBdNpSbAnemu8OyBHf+nH+dLVi6PlStTj2KmCKhauhD7gSR+18OY5ncA?=
 =?us-ascii?Q?UjJsKo18HlBuPikMGlcpBOgVVvw6jgvAW1D2Hg9ILawPckGXm+Jh61CRVs5I?=
 =?us-ascii?Q?3Bg6k+LQl9k5HZrLGUs/nKjb4H52CRWgEtsxoA3nL+xtTr3TqVVZeLIqGAax?=
 =?us-ascii?Q?/hFI08n8OAEk2D9OKkMWdMfoDDxWv498URFpJjStwJ/0iE5vEvcw65m/7QCo?=
 =?us-ascii?Q?scBuJhBSzZ8LNFhaw2oeyQl2Xo4qpbBnDXZuwOO8UbsiTF739DvYTONLxXEG?=
 =?us-ascii?Q?LaaNTZPGXKXU80cBNcqwnrC9UJlKXDUMBDo90GIs5zNyPE3ivrrBiaqioWaP?=
 =?us-ascii?Q?xh11C6gmVcio6IaFwctkBBqUymcVF+pz0QKWbB4s/nV25OkbU/mCF+ktCzH5?=
 =?us-ascii?Q?pvXkVAiXkHkNN8hcjBGj/hh49zS6dISHNb87c3ADYF+ySCeoFu9quF0coCSu?=
 =?us-ascii?Q?dbSyD7/tSFNFkxjChT4YFitNHY/4zQ9obj8TmjCpGRxtyXiq3eCNtV0f5huf?=
 =?us-ascii?Q?TPSwF/8MW3609XfWj0TruKcOHARx1KLtGVU0bnQkzlnjz3qe2vBTANhVUeJX?=
 =?us-ascii?Q?A9tWly44Jt6uQBpXm8clH3nRK0Q+CqPPARjL11mFCRiBCRiBUtZw0QcHHWvi?=
 =?us-ascii?Q?tpiUK68MFjzcCT3RU4LVN1gixLVEc7vG9e1rE2Iaq5lOwzHeGPYb4P55zcX/?=
 =?us-ascii?Q?KhwGuU0vm6mt8naDKSXcnmY3eT2nI+OcfqTlCEY+Qsm53aB3F3MPLflk24Eg?=
 =?us-ascii?Q?miMMe6LRSumtal0Tdvxo1/Nde7gwWsh3D8+sIAYDadk4fEVsZxP62O8LyCr6?=
 =?us-ascii?Q?m/USJgshOu6MLO1KhoCKYYFYzqCT2rCVoDz5P1F8MsSXOSQw/X4qdzXFt5o1?=
 =?us-ascii?Q?+bHZ9MmBJvzD1e+O2Kg/5KHIlRiRTAbFhBWICc/QinMHL9S+5hnYbOSOdhaf?=
 =?us-ascii?Q?lXM82z9Vdg9h9nKrtWxutpTXesbJWwNdLlLHg9a0L4a4WrL9FhDqjbZca+Zy?=
 =?us-ascii?Q?b1ipFfLP/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D+dcOlVhFGk4dv4UJIQuQ90j1FtNpD0ihHMOgSN60SN2wJkOQgyurc/c+6++pQl9WvE3jHKPQKuh/kiXlypwA6Jinti0u8aIl1yWbuVxBczF4Ig83A4DdejkkwtljUJ/4LHQRGwrfdVYGY//h6JCLwfxB9i8SaROhSJi5+1FJKjXOWNCcVgW81hXQvr4+otEjes0QSuoPEWS/XvLwrsvbHg3LPhoZM06jqzyMDbFBp+aa6eyEmLtI58horDypHC0zTHEi3Pgs8WsE6jKkAp9JeoDyww0EB6W1dln4syqPEvm/hOLgi3xFLetZUQT11PfTg7+D4BN/oREu5IqtPz+rA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacca320-b067-4ac4-5ab5-08df15a394e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 16:40:43.1607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kU8elloT1aii33QGCDtHuxlgzOWUT33oMby5iQIqPQrKGbKyILSyp6PCX++7XTgmW+z4xN+KUnTJEjuo/cTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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

> Subject: Re: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
>=20
> On Fri, 18 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
> > for SNPS PHY Aux will be always up. But from Xe3p LT PHY was
> > introduced which powers down the PHY. Which means we need to make sure
> > "Disable DC5/6" of AUX Programming sequence is honored.
> > Disable Dc5/6 when programming AUX.
> >
> > Bspec: 68851, 68967
> > Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
>=20
> Per submitting-patches.rst, "Since Co-developed-by: denotes authorship, e=
very
> Co-developed-by: must be immediately followed by a Signed-off-by:
> of the associated co-author."

Sure will update it in next revision

Regards,
Suraj Kandpal

>=20
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> > v1 -> v2:
> > -Fix commit message (Arun)
> > -Fix the if typo (Arun, Sashiko)
> >
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > index 3cb07b0a901c..879b203f9258 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	u32 aux_clock_divider;
> >  	enum intel_display_power_domain aux_domain;
> >  	struct ref_tracker *aux_wakeref;
> > +	struct ref_tracker *dc_off_wakeref =3D NULL;
> >  	struct ref_tracker *pps_wakeref =3D NULL;
> >  	int i, ret, recv_bytes;
> >  	int try, clock =3D 0;
> > @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >
> >  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
> >
> > +	if (HAS_LT_PHY(display))
> > +		dc_off_wakeref =3D intel_display_power_get(display,
> > +POWER_DOMAIN_DC_OFF);
> > +
> >  	/*
> >  	 * The PPS state needs to be locked for:
> >  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> > @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	if (pps_wakeref)
> >  		intel_pps_unlock(intel_dp, pps_wakeref);
> >
> > +	if (dc_off_wakeref)
> > +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
> > +dc_off_wakeref);
> > +
> >  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
> >  out_unlock:
> >  	intel_digital_port_unlock(encoder);
>=20
> --
> Jani Nikula, Intel
