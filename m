Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FABC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674A10F8FD;
	Tue, 15 Sep 2026 04:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmMbRYyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764AC10F8FD;
 Tue, 15 Sep 2026 04:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789445346; x=1820981346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6xSDJzRmMyzVjslldgTzkIvqw2HK4T7rf2MwYSVs4UA=;
 b=DmMbRYyM52g5HkKpgDb07VCONYm81ZtumazICKhWOx/dMoUi5w03P8PD
 4LEtSlAWEZtSILIIuFEu2IySegyw2oSz/6KpQg68MMnbVn3QRr96pdkPV
 IxqEH0r8ozIqtjERw45Lxp4hXgdBeKqsgKvpm6tKO9KpQp0BiPh+2i7C9
 1muM0EVbTTc92jV5i5UjHErAnj7yqdACHlBNkWsEDzqZMo0wVtsXCzI44
 Vj8TBh+Ok6jVMyPkb1ug4Oa+C7yXtTqnKCh21RWLebE6C0+889YP2+pFL
 iq9k4J86GOHtDCAWW1D/X9fxL+wFpa6StqZ6ZuJeNJXLNfAnl3/Y9gLWf Q==;
X-CSE-ConnectionGUID: EAl98MViQCG8F1SZwqfh4g==
X-CSE-MsgGUID: pWF345I2Tp+BZhcOEFQfpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89931334"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89931334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:09:05 -0700
X-CSE-ConnectionGUID: QrSrXPHOS0CcqLMznMlaWg==
X-CSE-MsgGUID: C3Y/88RuS9CqQ4N2jcaGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268549010"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:09:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:09:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 21:09:04 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iact5QW5GgoeAL7ZkCig/4/topWIxee0PjgBr6VLmf6Bd12P5UAVvtHuLKXHDZGkV9hm3I7ZOCi6FRb5PLL+KJ93GgH2fTvTJIHalcFXhvwFUf3X4FFw3FAkBhYwd6tzV+HHqBOMWCvWBQ1F/fHIOT3ex72ZG4ZnMRWnNl7SiHN1CqQ3DmqeGYX+0q4z7sxSFErqxGvEh7b5t37DOTUO3Zzs5HQyR7hIuFXQ59QEIoCNR1E7Bz8ZqCY9XDT5QpJT5e44urnYtHhteGMV/d2VNTCpau3Q8C+qI2Ochyu4UH0mW/ZXJDqN8B0cloclHJkg4+UGEyUwxhAU9jQJhU2KAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tVP376VHo7PTBdgVZEOf+FS0FsqCxFSKAPqwwi/SZk=;
 b=Dd7AusQV24AWJCN5QLMGvDyjCY6vg1leiEvKJuFYtrKEtwMxkMXg1l456AcmcPsbTtd4nKUMEviDrSJr1l4MSVudeScX/Ss9q6loGpRq0YXC+9Mfm+nj5U+L1mIazXa7VtCtQj1zrYeBln7V+l6dKxhh0fXUVwYvay1JEHLv1cVAs+Qou6Buwno0vda0TEPTrtMI4uTMnHlBghsMY5jpaSIs1l0/7TTKshk4PyRFjR20gBNc1xkXmbjwAQlqMUOHKBKFuysGUxA6wHuBVpgTNKmuczp9rnAOmH1dpETyHwkhAIwtzEtOSZ9rqH8aPlBsHnSFDSXsiVVT+T03cXUTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB7725.namprd11.prod.outlook.com
 (2603:10b6:208:3fd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 04:09:01 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 04:09:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Topic: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Index: AQHdQaQg389uNdczOEupK8a/jvJQMbbJPN0AgAABEwCABc5B0A==
Date: Tue, 15 Sep 2026 04:09:01 +0000
Message-ID: <DS4PPFE901A304F0436FB5A376954794FAAE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-2-suraj.kandpal@intel.com>
 <123bd5fd897e0c5d7d956d2cc94eb8cec6d7f91c@intel.com>
 <7fdf17c66751d921b26c64c3ea25060fb4f9db54@intel.com>
In-Reply-To: <7fdf17c66751d921b26c64c3ea25060fb4f9db54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB7725:EE_
x-ms-office365-filtering-correlation-id: 18d5e4b4-9121-4af0-a319-08df12df1322
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: Ju4i5DljDY/UFwqUPsZ1wZZjgQFI8qXnq+87oMJPh7WNogQE98x6l1p1nwoUGYtOpViY9mx+ZVvKOnKFONgKn0g8mRqMl2j8vRGOHghxVVVqZbt2A/0UdSlbV/x7xL/wA4nhugQ8ph/2WP6IqwqWVlXijicOt1CHgCU7vQXi+M+l8j2e2NlVmqInv3ad83kBdGXc4A/BHERF7QGLDnV2xQoNEgnrIVmjIOXSvep3mb14C5DrQ/TLBR10K3XL/Q851uODt7Dv0vAVjQMNJMvs9AXV/H+dT3k8pkcxjO1GEumN6hdoMIBUZh1Pztznswip/fFk3OuFcKef0AokV1XbrJm52AtNerpu2frJFtjgkyTGt+ZQdK9aWx6hNXygcA78g8ZAx9+2Uesf+TXQgcn2hBD2lc4U4B8hcdWCcYGLsN3g710MJgKGoceFt1xPtm/0nG6CA0aLMWnGiJJey6K1XQjlMl1Myf8JXEq5fCvHtZ7frjBLI/ueILG8VGxXGLY3tcI+crGafjPrkop9ErFCHGEtHJ6oMdnlnzRMHN2fOKsml56C6Z0eN8saivi5Q+Yb02qqPST+Y4vAvb0ZN4M5cF+VigOPvWdy/+8gmaDaxUiJB3QpT5/yoewrPkJezZSQz6bBBAh5j3aRN13uIMNQrWZoCvjIlqzRUgzlTycr2dzGHyhBax+cuWqiCSeGCFwXylu6Q3AJNTrD8DJeO+IHJmtYQuGiHR8050dYgyjqXYQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZjqREqICbQr5JmHl7OEDrz+xab91tMwIwPXDMe9CQwmdAa3a/VRZuEPjjHGn?=
 =?us-ascii?Q?iB21Ncy2n8UjAKQmTEHQB24mwDPUdsEjD+Apk6GGLIs8a9+5wJawIz+IWU4y?=
 =?us-ascii?Q?PXaL2Ve3adEW9d8nBrdd1pEvKb8hqE/jvXlL/lg8Ui6aOiLpFLtkVfhe8yMK?=
 =?us-ascii?Q?7cDmkiUxFs76Q4EfDI2G/h9RDqM0jGW6R3283deGgF/ddbgiwsPrRIg+a/yy?=
 =?us-ascii?Q?U+wR1FKvoBYFLuPr+Lv6yy/vTe43B0/5KpD2y0H0SO//LsXOy+JIUrJ8HQSf?=
 =?us-ascii?Q?+yjntrClYL2LPl0piJrL/FZAmUQI7Y6VXv9WIfy/F+Cg6OXyCfXCd2bdynv2?=
 =?us-ascii?Q?hJNMwF2SuokinK032uoXGDA0rzxyMc/6P8jNDU09+z2wvnVkjUJO5mcRrcce?=
 =?us-ascii?Q?ldoXu92x3YXyfzxuAp9EGeYWaVA3kaE+6TWY+kjXs8LJd7w4sLsZCfeHLwnt?=
 =?us-ascii?Q?TPTQzs/zJL3D4xDDd3mRTwfhE1onsRCWrBPZ9v22X5A4lYX3m2+7POSEaanP?=
 =?us-ascii?Q?ZC7+h5OgNkUQgEA/yWUJV84mavwOFDgZDgwbfc34sL2bqbAVX+prDW5G12df?=
 =?us-ascii?Q?8/a0c1rv5A8N8SQUMW2YsfRM5j5Et93i3P6enIXMGFkNUt+2cUAHCVVlcuwk?=
 =?us-ascii?Q?W9gcl/lFt/+bbHhePCERNFKLZ6YkB7EaOGp7jKD8/+R8NWMCzwWzxnbMYDWI?=
 =?us-ascii?Q?4lkiYvp4R827OWqMkYcUaoK5gnNeaKX20FZqm5IshWNByw/TdxPhLKzwL+fm?=
 =?us-ascii?Q?q3biaYfRiNYJ1D0tRQccVAxqO3qR9V37nXVfU9MyLHzAqXnBkHYw4dH+c/+D?=
 =?us-ascii?Q?iwUzT+qXVOpwJpbDz9gK17/gaFC5i4GNQC2UaO7+qQJiW0KNSXaBnC15S9BW?=
 =?us-ascii?Q?gwVSvblyo0MFR4BYVLapch2aG0s9J64uE2UwEXzJt9k7WG5FIl12XP7MSOIO?=
 =?us-ascii?Q?GFwWhbvX0iEluoxi+nTbOCotvrmMTvy7KYnFu3wz2nR8beNE6O9OBMzWqU18?=
 =?us-ascii?Q?TCLErhB7WuwcrRd/CVWzPZH25KD7CrW6fGlSMRl4Iu6lFrYtVMIMJQ7ptJrV?=
 =?us-ascii?Q?mIGDUoONsSmlYeE7zoMcI/zgTn/4/jDbCrk493xRzZaK+HOoFqGAMt7Btx3v?=
 =?us-ascii?Q?Ww3Xf8agOaQt1+Ws3Sm1rDcFLefZPmOZ5gc1Jw6g7skABACtFP9bI0A2uHi8?=
 =?us-ascii?Q?8XYPgc85sbNRsMF2UZKhmIdk6WEYExezj0Rn+VtDktF/K6m7wbspoLaeWpaP?=
 =?us-ascii?Q?qxZHMKTW0ZFlCmoMrBjudma6eghjU+e5v7WY7lsFbkgn2Ji5Ru88F0lAhs7E?=
 =?us-ascii?Q?nBZsu0TUQyjHVpvohYsK+Fj3mOOIO5qSPYP1SF7Tf1vaa5/LS5keXbgohKpt?=
 =?us-ascii?Q?zqN3i4JwvTi7Q8WVBsZwGKRy2dvd1wAOhCSZo5T425J9ae1LIqcOBlnShWaE?=
 =?us-ascii?Q?6H4U2mQJ+SoVUrlyQt8o/uee3DAXjjTk9GBH6VMvOwNSBga3wcd8q0AuhL1E?=
 =?us-ascii?Q?YxOnCC+RIBdz3X8lhwo3ioT/F5fxYbPiVSYCBucKJF5lfv5Q6FMtTnzH3jWX?=
 =?us-ascii?Q?3R46ohwg80qEwAPqTat2yCDODSRKqKI0fbKtXX162gofX94PPDf59MLLIJa5?=
 =?us-ascii?Q?LRL6LOqfIrucXhOBTuBd1TksKnRxwTw53pEGS/1i7bhYPS/h0/WM3O/D4q5C?=
 =?us-ascii?Q?hqeJo+OV8w/Khwca20v+MATopSIoPYsrscFf0fGcx0PxUO4FyhK34MP8+v3N?=
 =?us-ascii?Q?7lUVDOcHYA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ikfYaADDBWifnGGjcnzEd5lbcNLnQIwmiuev5AMxxdZL+lPlcrkHouB3HURVWQM6vejqu0RHa07XGhvAnrS6xzaf7xn6xQLMV1GKClPK/62Clk8G69HY6xpZIHYv2uKUTpXBwS3oE9SajywaTYTRXal+f2SXuYZlGNxK1qsAfCLuz4bupijpc/Xs2rYZPUxQbHb/VX2jRiHH0TiX5VKMnt2kyiGVdl/cxRrk3b3/YKaK8jcHAEzLWMJFArBV7XABT6Pl1kbcAXog8oW2oZM2MXCnyQ9HIvaM95NK4kCfSAWzX2tahXdiCQySaFjydgn06unHG8mOV+RgcC78W5Lf1A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d5e4b4-9121-4af0-a319-08df12df1322
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 04:09:01.7765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFhPztoby+5A1lyTQ6yX4MW/BqgeBgp60z4bTO97iO1sLpuCEahhOWq93lkdgBk22Evuj7W2aPa92B4H9YSkLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
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

> Subject: Re: [PATCH 01/10] drm/i915/display: Add helper to compute link M=
/N
> ratio for reuse
>=20
> On Fri, 11 Sep 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Fri, 11 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> >> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >>
> >> Introduce `intel_display_get_link_m_n()` to compute the link M/N
> >> ratio
> >
> > Please drop the backticks. IMO it's just ugly fluff in commit messages.

Sure will do

> >
> >> based on pixel clock and link clock. This logic was previously
> >> embedded within `intel_link_compute_m_n()`.
> >>
> >> The new helper allows reuse of link M/N computation in other contexts
> >> without requiring the full data M/N calculation.
> >>
> >> No functional changes intended.
> >>
> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
> >>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> >> b/drivers/gpu/drm/i915/display/intel_display.c
> >> index fc30a455bed3..b5682c196646 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -2633,13 +2633,24 @@ static void compute_m_n(u32 *ret_m, u32
> *ret_n,
> >>  	intel_reduce_m_n_ratio(ret_m, ret_n);  }
> >>
> >> +static
> >> +void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
> >> +				u32 pixel_clock,
> >> +				u32 link_clock)
> >
> > Now we have two functions:
> >
> > - intel_display_get_link_m_n()
> > - intel_link_compute_m_n()
> >
> > in which one is a part of the other, but the names are quite different.
> >
> > Why? Shouldn't the names be somewhat similar?

Sure will rename it.

> >
> > BR,
> > Jani.
> >
> >
> >> +{
> >> +	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
>=20
> Moreover, this is now DP specific.
>=20
> Maybe you need a different abstraction level to keep the DP link symbol c=
lock
> stuff inside intel_dp.c.

Got it.

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> >> +
> >> +	compute_m_n(link_m, link_n,
> >> +		    pixel_clock, link_symbol_clock,
> >> +		    0x80000);
> >> +}
> >> +
> >>  void
> >>  intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
> >>  		       int pixel_clock, int link_clock,
> >>  		       int bw_overhead,
> >>  		       struct intel_link_m_n *m_n)  {
> >> -	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
> >>  	u32 data_m =3D intel_dp_effective_data_rate(pixel_clock,
> bits_per_pixel_x16,
> >>  						  bw_overhead);
> >>  	u32 data_n =3D drm_dp_max_dprx_data_rate(link_clock, nlanes); @@
> >> -2656,9 +2667,8 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int
> nlanes,
> >>  		    data_m, data_n,
> >>  		    0x8000000);
> >>
> >> -	compute_m_n(&m_n->link_m, &m_n->link_n,
> >> -		    pixel_clock, link_symbol_clock,
> >> -		    0x80000);
> >> +	intel_display_get_link_m_n(&m_n->link_m, &m_n->link_n,
> >> +				   pixel_clock, link_clock);
> >>  }
> >>
> >>  void intel_panel_sanitize_ssc(struct intel_display *display)
>=20
> --
> Jani Nikula, Intel
