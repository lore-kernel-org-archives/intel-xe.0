Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2CAEE4998
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 12:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AB10E9D2;
	Wed, 11 Sep 2024 12:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTGSoqE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15B10E9D2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726056082; x=1757592082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z51/AypRJ+c30ST7sgzyNMQ6C375KKzuOJUsrqOnrdo=;
 b=JTGSoqE4Nrh0Dkxo2ORGnfQz0EYxhBapSA8CLrH7Yx7+SutxiGKMAiNO
 i1PNSyc/ccifTeONQpbQ1r7gUFJ+TXckWJ/ZoG+g6xkKQf7dNArV43HZU
 0p3aTdfgLhqT+7NHAiDlX1ctjtEbkoxWJoMW63fDwdFziJcIzWly/NaN/
 oXUCdFI7lHfCAp7+D5yT8D3mysgpyNzwRBYqcDrUfS9NAgvCtkMzYkHdL
 VFeKdWMrD1Ns9x2YPtM18cvreWpE9Jlcq0ezl1FB9Bw/XqFJNAR24wljT
 4Twz1ahoR0ylNe3eJiUA+ZMvMdS+g53aGcTJd49ps3pCcgtrdjqedUCDh A==;
X-CSE-ConnectionGUID: /MovlWxpS1mUWFaSlaxtTg==
X-CSE-MsgGUID: 3xM0KgWlRoqQm67z56Po0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35518361"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="35518361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:01:22 -0700
X-CSE-ConnectionGUID: jrGdMnSMQ5iKmQSrc1177A==
X-CSE-MsgGUID: BvBS7OwuTMOagA6+BChxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="68117041"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 05:01:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 05:01:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 05:01:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 05:01:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 05:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVGa48Mu0h66aV79Vl2yZuBeEy6/S3pt2V0GdaNZFx5VYDuzeJMiiNF9zuNoQztQLGKnw82GD+gCGGdlB9tXg4WAJa9aSNP0noNYzPN7Oe8YmWP/+jTB3+5gFHhrncckHVV1WZCdwrxTfSBzxmjhwihyntMKCMukHgmc7fZ4LFmZvsJ1dTWGZiPpO4JugOvUiVHP8cWwoKp/ul967+2TEQ+4KaZdyxcoSWLiiD8OQSfLhAQfSe4cs4iM6ooHZhdqTGlTLFlI1ZuB0p8dqt4q39fUhdeHODbv8UqRXCFK+225oKUxi494lWSpRrQg1N/5VdKFdfDvybk4IooPYTCTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKErtv/vGyUv+hcHUqNawxn2tn0NgsrWSARpjkurnJQ=;
 b=mDyA1RGn8GJ54MQUDCvuz9+8//hc5jLF5jMgy3RcbFRqbRbzfDKbuT+wL0lMkZY43zWwg0SaA79pMjKoWDOkoEVBesF655Og1tcrgaLX91XkLbxrfwSyZsLZbzYbiCRZDh3qHkz3iNuNAubUktP1OlcBKDW1s37NVthPE9eKxflZ7CfwGKuLMEUjQDk9wfAvnxMXLkfUPgm4NYqXIst0wB3UaiXHKz9Tziiaj/LDCflQEW4OXG8zjpHjL6hnwNl9E8knw89EMNLUJ7J0q0dBPqwSa7D5Q9myEePip57Sgy0ICCLn8pHOa8B6JVUp4w3eSBnlrrCrAR5adxr7MOh57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Wed, 11 Sep
 2024 12:01:18 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 12:01:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Topic: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Index: AQHbBC2aE0C/q0Z9wkqyX4TdiGu937JSdOIAgAAFr2A=
Date: Wed, 11 Sep 2024 12:01:17 +0000
Message-ID: <SN7PR11MB6750912B7086DD851CB8CC07E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
 <ZuGAXqmtrLOnjAGs@ideak-desk.fi.intel.com>
In-Reply-To: <ZuGAXqmtrLOnjAGs@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH0PR11MB5159:EE_
x-ms-office365-filtering-correlation-id: 65da6258-a43f-4887-4d0b-08dcd2597191
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z3Lm1hl2Kpli2WvOZP1Cb5V0zt9idhWnS8N+15++WsCwQB36ASLzqxvr3b6/?=
 =?us-ascii?Q?AJdkqC7PR9fNefZisw4zh86okt5NTKCW65thnmvxjrdS0ZnSMdrpxuocSrb0?=
 =?us-ascii?Q?pn/chJSVkuK8irBV7KNUQ9LsBptKGVcxZ3cYX260+DSeOLMM5ju99DQ/7P12?=
 =?us-ascii?Q?CwENSGNXauBAbKqpZuavzsD9qQcLAZ2mZGExsdda3nMDe/F0Gw9eWNea4ATo?=
 =?us-ascii?Q?nLHtLqhcwRYZkaJkRXrjugdEAW216Qv/0AtVRFUaNJtt7NlTV8tyu7j5HD/p?=
 =?us-ascii?Q?cysZO/eBomJYyQVzm5yZFZieQrHCRtXXXJk5LK3xcWFuB6x8ySjLXTVXX8K3?=
 =?us-ascii?Q?zZoA7G9xGBQmrVE9ZTQqIaQBXB4kaYg6DRkre0RFVDQPKaKh55FXpHYg93nO?=
 =?us-ascii?Q?4/isB5rZYgZekVl4JsidvAr3wBADWLVR46nqmHfEsVzRgccetLPsucZfX7f4?=
 =?us-ascii?Q?jKd0B5nPx51IPSpi0HDhDWsTUnCR8ptlEM9mNbNIEynynZyFy52lfbeJm+m0?=
 =?us-ascii?Q?DZeYr1a37l4L0EPM5kMNpSVRDL6Z6/mlk8/hkRrogleP9wCnL4wFB3RRw10W?=
 =?us-ascii?Q?UHZPsBIpljxbSR3Y13eUBj7wP6NoFAj0rh3Li4e6BorgdBaIP/1Vk3lmrfej?=
 =?us-ascii?Q?/0q31SCPNWXggXY5lpuhxYFMxQEi+MzOZtTeFC4yln8vgiuF2YcWDGJ4clyF?=
 =?us-ascii?Q?/phpUWEabgyEI1EJRamp/20tB0mJehsWTwOQMc0eJ5tK01A21WEjgmA7+ge6?=
 =?us-ascii?Q?MNKdRAtjnmoO0rPDm30BHOYWd2gGr2cDIhCo/hQD9AjqNIEqu4N8TeQiPZcT?=
 =?us-ascii?Q?Aud6hGdeAotygf5eW1tYAhuT7W6KkXEEptEX0NeFe8UThPFL/JWnw7nbLudZ?=
 =?us-ascii?Q?WKUcKXPkUKYfHL+7k+VUkZtvMFdAgJc8UTe/evEW4RmNmZGjCJitJ1D/q7dV?=
 =?us-ascii?Q?pYwvlougMHtXzrykKGRWAWdLZH6v9yqzbO2+AaGPqbL320vnLMaQJuMwDUmy?=
 =?us-ascii?Q?PWVfX6vffw8kiqlV5nIwut0wah7W1kyi11r+QvC8wxpzrSiuou0EoxRFuWFk?=
 =?us-ascii?Q?wW12Qf7tDlVV9sbcwJrGpNs48OfZPadZb/fgmhaeI8mxocXRe06zY+TcM92m?=
 =?us-ascii?Q?VCX2wSTj7Cw5RTm4s99XEg87noLCiNVg1V9sunfkZuGCbhMKhstFFSUa5hOp?=
 =?us-ascii?Q?BBGaviPnWtW+0hcytHUW0mP+l3YNBf3FVTLdNMI/gvT15Ty7XrCMbkRivKYP?=
 =?us-ascii?Q?QmrEBooV+61/kO1ngetVXZl2ufKZANx4Ef3qlirZD/pxUNX5cmVtDszSpH3b?=
 =?us-ascii?Q?x5k3jVhBGMTymnulEUSX9ASVmu1TG3BdzrdG/Q20B/mYyXfdehIOv+MPXohv?=
 =?us-ascii?Q?AY1DLyNgdQEQFHFalwTDrHddwQsz9gP2Gh1AjyaQyItWgGxf8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6Wk+Q8EcfJtQfWGRm8BOm0/X7Q8mPXi8WwRcMizr6RwJPUt2ZeVn1AXBH4iX?=
 =?us-ascii?Q?1S38gKqZ3L1YE5rVQlMq/oEJN+8SBckLX0v1HCPraxAx3m/jo0jpZhxUnGia?=
 =?us-ascii?Q?Gg/MTtIBpUh5I3NUHyWEC2LAUsBMqB1zbEyjmJHFpDYiquljlx8Urobcb2n5?=
 =?us-ascii?Q?azKZGmeHNPiuniqE1M3vJW8YymIyuGyAHFb23uaC5MkZWWsCJJblNUA2p1D+?=
 =?us-ascii?Q?eH0RmYGX8p/W61ZQZ6pNMqKC+N+m1LZBJfaNlMz+BgVVldvmDtlG16QuQUQ7?=
 =?us-ascii?Q?OQtI8H0EgOdwj3x/LqZ32nSbJiS0tqtd9SezDLZdGcku+5EXHkJrs+Ca7qnK?=
 =?us-ascii?Q?FLC+siu+Crq6LSOa2TW6Qkivqd23+MjerHexRGDuf4t8M1uARe6q452VBVV9?=
 =?us-ascii?Q?TBgbeg1mUhv8fydjdQFg4hgWfHSbpkShtKYSEmz9gC2oRO7W9MWErHoUgBe+?=
 =?us-ascii?Q?plpi/OWXccZPs7rzkpM/SXK9w0pEp10XgjErVPWWVke9RwBpbnpWxq1P0clq?=
 =?us-ascii?Q?/LUKdiipvcAyYT+b1uie5ubvByxkZ6WdGYAd9vsU1t9xFDIPagPSjh2g7PsP?=
 =?us-ascii?Q?y8RiA20TF9NH4ErIdoMWThhpPLwbC12ijW7leJhd2TOEGb/AAJnd9WRdiO01?=
 =?us-ascii?Q?q2qjcOP0dy2Phi4FMbZjQqRn5ow5+ziKxTpnkKJy2cjevI+g/BEk/+JWzyz2?=
 =?us-ascii?Q?ZZcNATTfgs6cXDDk2623xFBc3HkFlYV311OJ58TaYlmSbjwMN1SOtVK4Gbb6?=
 =?us-ascii?Q?+HXBzMDahsjgS+2pM4ideppuqH2h+FMFlluPlq/y3HBPFnpAGZ5qYqXj8q7y?=
 =?us-ascii?Q?a2xksgqGiYyaXJZaj9CpD3pYBelejOaSiK/HXi6p8dabJRwRva3+8QhYahuF?=
 =?us-ascii?Q?nuVDU1dJfmHkNLA8p0JQ4wiRANR27KpF3w221LwiWlzRTc9csVde6FZxv3dB?=
 =?us-ascii?Q?hdAcMfA9UY9U7CZ1GzHux3mJoMo/dqTJTjEMP+kPMITd3Wda8UEtkkJzb66d?=
 =?us-ascii?Q?mJddxhf2b0vIx00tTg1U1NGlTqe8mRqrT2FmePmWkAosmQe3B1URTCY4atdo?=
 =?us-ascii?Q?rMRNMCMmk7iRHZxLRINa50nVizVg9QGGH21ORNl0ejROeYrZa1T2FmReUGhv?=
 =?us-ascii?Q?Vkhk6bCraZf2RlSDUO0EYLUNydq5ZmKtd3agnOhboKXa7mpJfAxIfRtS+Qsw?=
 =?us-ascii?Q?7bp4an290FsayN+5ccsQNPA/+QqZ2zIU0uRKH9ma9fAk44Hipu7u9806o8UR?=
 =?us-ascii?Q?jae3VOsaTKQYEyUlXCUxKfstHAZdskmeyxa6heUDx2ycCtHpr7HRcNM+SlgJ?=
 =?us-ascii?Q?6hEk8BViZo8MTu9By/zpzl03t+pkV/DYMcpPbiKrOq7FP1qZtsJHqkl4aeOY?=
 =?us-ascii?Q?we1/uYYoX4EekHhMyH0HASkP4gHwyNwnPHOYiHUAOHheDtX/3UdKhghJCytR?=
 =?us-ascii?Q?EBVTKXLs9fTxruGWr1bsF0dlT1lqRkMRGnrTEwpPxRqnuO/yA0MhsK00aOuU?=
 =?us-ascii?Q?SSQhLkMWAdPD87KgjC5/rWRI3Ny8GRnYJBhvFFFhyLJj7IttfTUJvFDcx+es?=
 =?us-ascii?Q?rhiySjoeHmSJN1DPFBMqrHq5kbcZXD51xe4QOiMn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65da6258-a43f-4887-4d0b-08dcd2597191
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 12:01:17.8655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWzPEEW6prkbWJuUJgi+OqJ18mEXm09e8FmLOpJ8p+GlyM9n87a79NpPUg+Cn+BbnBYfVnQLwlOKWbMip8f8xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Wednesday, September 11, 2024 5:05 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>
> Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
>=20
> On Wed, Sep 11, 2024 at 03:00:25PM +0530, Suraj Kandpal wrote:
> > Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
> > funtions to avoid cirular locking dependency because of locks being
> > taken in intel_fbdev, intel_dp_mst_mgr suspend and resume functions.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> The actual problem is that MST is being suspended during runtime suspend.=
 This
> is not required (adding only unnecessary overhead) but also incorrect as =
it
> involves AUX transfers which itself depends on the device being runtime
> resumed. This is what lockdep is also trying to say.
>=20
> So the solution would be not to suspend/resume MST during runtime
> suspend/resume.

I think that would also mean the same thing for intel_fb_dev_set_suspend no=
t to suspend it during suspend resume
Where we see=20
4> [213.826919]=20
-> #3 (xe_rpm_d3cold_map){+.+.}-{0:0}:
<4> [213.826924]        xe_rpm_lockmap_acquire+0x5f/0x70 [xe]
<4> [213.827102]        xe_pm_runtime_get+0x59/0x110 [xe]
<4> [213.827270]        xe_gem_fault+0x85/0x280 [xe]
<4> [213.827384]        __do_fault+0x36/0x140
<4> [213.827391]        do_pte_missing+0x68/0xe10
<4> [213.827401]        __handle_mm_fault+0x7a6/0xe60
<4> [213.827406]        handle_mm_fault+0x12e/0x2a0
<4> [213.827411]        do_user_addr_fault+0x366/0x970
<4> [213.827418]        exc_page_fault+0x87/0x2b0
<4> [213.827423]        asm_exc_page_fault+0x27/0x30
<4> [213.827428]=20
-> #2 (&mm->mmap_lock){++++}-{3:3}:
<4> [213.827432]        __might_fault+0x63/0x90
<4> [213.827435]        _copy_to_user+0x23/0x70
<4> [213.827441]        tty_ioctl+0x846/0x9a0
<4> [213.827447]        __x64_sys_ioctl+0x95/0xd0
<4> [213.827453]        x64_sys_call+0x1205/0x20d0
<4> [213.827459]        do_syscall_64+0x85/0x140
<4> [213.827464]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [213.827468]=20
-> #1 (&tty->winsize_mutex){+.+.}-{3:3}:
<4> [213.827471]        __mutex_lock+0x9a/0xde0
<4> [213.827476]        mutex_lock_nested+0x1b/0x30
<4> [213.827480]        tty_do_resize+0x27/0x90
<4> [213.827482]        vc_do_resize+0x3ee/0x550
<4> [213.827488]        __vc_resize+0x23/0x30
<4> [213.827493]        fbcon_do_set_font+0x140/0x2f0
<4> [213.827498]        fbcon_set_font+0x30a/0x530
<4> [213.827500]        con_font_op+0x284/0x410
<4> [213.827503]        vt_ioctl+0x3dd/0x1580
<4> [213.827507]        tty_ioctl+0x39e/0x9a0
<4> [213.827510]        __x64_sys_ioctl+0x95/0xd0
<4> [213.827515]        x64_sys_call+0x1205/0x20d0
<4> [213.827518]        do_syscall_64+0x85/0x140
<4> [213.827523]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [213.827526]=20
-> #0 (console_lock){+.+.}-{0:0}:
<4> [213.827530]        __lock_acquire+0x126b/0x26f0
<4> [213.827536]        lock_acquire+0xc7/0x2e0
<4> [213.827539]        console_lock+0x54/0xa0
<4> [213.827545]        intel_fbdev_set_suspend+0x169/0x1f0 [xe]
<4> [213.827729]        xe_display_pm_suspend+0x6a/0x260 [xe]
<4> [213.827945]        xe_display_pm_runtime_suspend+0x4b/0x70 [xe]
<4> [213.828158]        xe_pm_runtime_suspend+0xbc/0x3c0 [xe]
<4> [213.828327]        xe_pci_runtime_suspend+0x1f/0xc0 [xe]
<4> [213.828491]        pci_pm_runtime_suspend+0x6a/0x1e0
<4> [213.828497]        __rpm_callback+0x48/0x120
<4> [213.828505]        rpm_callback+0x60/0x70
<4> [213.828509]        rpm_suspend+0x124/0x650
<4> [213.828515]        rpm_idle+0x237/0x3d0
<4> [213.828520]        pm_runtime_work+0x9f/0xd0
<4> [213.828523]        process_scheduled_works+0x39f/0x730
<4> [213.828527]        worker_thread+0x14f/0x2c0
<4> [213.828529]        kthread+0xf5/0x130
<4> [213.828533]        ret_from_fork+0x39/0x60
<4> [213.828538]        ret_from_fork_asm+0x1a/0x30
<4> [213.828542]=20
other info that might help us debug this:
<4> [213.828543] Chain exists of:
  console_lock --> &mm->mmap_lock --> xe_rpm_d3cold_map
<4> [213.828548]  Possible unsafe locking scenario:
<4> [213.828549]        CPU0                    CPU1
<4> [213.828550]        ----                    ----
<4> [213.828551]   lock(xe_rpm_d3cold_map);
<4> [213.828553]                                lock(&mm->mmap_lock);
<4> [213.828555]                                lock(xe_rpm_d3cold_map);
<4> [213.828557]   lock(console_lock);
<4> [213.828559]=20
 *** DEADLOCK ***

Regards,
Suraj Kandpal
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index a3d1509066f7..7f33e553728a 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >  	xe_pm_write_callback_task(xe, current);
> >
> > +	/*
> > +	 * Applying lock for entire list op as xe_ttm_bo_destroy and
> xe_bo_move_notify
> > +	 * also checks and delets bo entry from user fault list.
> > +	 */
> > +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> > +	list_for_each_entry_safe(bo, on,
> > +				 &xe->mem_access.vram_userfault.list,
> vram_userfault_link)
> > +		xe_bo_runtime_pm_release_mmap_offset(bo);
> > +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > +
> > +	xe_display_pm_runtime_suspend(xe);
> > +
> >  	/*
> >  	 * The actual xe_pm_runtime_put() is always async underneath, so
> >  	 * exactly where that is called should makes no difference to us.
> > However @@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct
> xe_device *xe)
> >  	 */
> >  	xe_rpm_lockmap_acquire(xe);
> >
> > -	/*
> > -	 * Applying lock for entire list op as xe_ttm_bo_destroy and
> xe_bo_move_notify
> > -	 * also checks and delets bo entry from user fault list.
> > -	 */
> > -	mutex_lock(&xe->mem_access.vram_userfault.lock);
> > -	list_for_each_entry_safe(bo, on,
> > -				 &xe->mem_access.vram_userfault.list,
> vram_userfault_link)
> > -		xe_bo_runtime_pm_release_mmap_offset(bo);
> > -	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > -
> > -	xe_display_pm_runtime_suspend(xe);
> > -
> >  	if (xe->d3cold.allowed) {
> >  		err =3D xe_bo_evict_all(xe);
> >  		if (err)
> > @@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >  	xe_pm_write_callback_task(xe, current);
> >
> > -	xe_rpm_lockmap_acquire(xe);
> > -
> >  	if (xe->d3cold.allowed) {
> >  		err =3D xe_pcode_ready(xe, true);
> >  		if (err)
> > @@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >
> >  	xe_display_pm_runtime_resume(xe);
> >
> > +	xe_rpm_lockmap_acquire(xe);
> > +
> >  	if (xe->d3cold.allowed) {
> >  		err =3D xe_bo_restore_user(xe);
> >  		if (err)
> > --
> > 2.43.2
> >
