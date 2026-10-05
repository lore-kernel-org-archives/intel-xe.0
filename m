Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1628CA5FE2
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 03:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851D710E222;
	Mon,  5 Oct 2026 03:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEX0eDN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596810E9BB;
 Mon,  5 Oct 2026 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791171701; x=1822707701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUaTwHxpIUnjKG5Ky7r3XXb8D2nwo24e7xoTuuSe8nY=;
 b=IEX0eDN6M55n7bINBDE3uv96dYZEZ/48HNNAPp+mCtJ8CdewPkaVQxoG
 MYg6dJfiQl9YIIUtv3K6VGGWgPtfUnmBhLYtXHkNBKKxwjFwokPvfbDpF
 7YLFQrDsDhyn9CMZM1kSBm0TSRt9D/AqtX8HGbNT6Bfzo9q+Hzjh+5hda
 cwtnMlhyrcPepLEhz9vx5V6UVnCikAHCeV6Z4/A9ltQ5oWIYqGWshNu0L
 L1sVeIaeNAMJUW184cZ4KngxiDflSmxe0zDEKZf6aTfzcY1+xq7H9xy5e
 XsM/cI1nBPw6C8wsKo0ZxJs4MZdv3DxvtqvE/SUUz4X/gxnyPx+6OKfUS A==;
X-CSE-ConnectionGUID: JpnCd2KLS0Gl/ULbRE/ngA==
X-CSE-MsgGUID: Kb1QjEmsSUGWI+M+hSWl6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94711263"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94711263"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 20:41:40 -0700
X-CSE-ConnectionGUID: rDGKO+7VTX6UbE3rVpv8lg==
X-CSE-MsgGUID: PGc8j4gZR8WLSLdzIAPjpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="273114300"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 20:41:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 20:41:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 20:41:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 20:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSPbu7e/63pBJWpkLN5AHXroehPDvlg9MXeoUsdKCyc0utFQzh202FBzpZIzOUBJIMyGKq6Qp7k3GWKfcquYd36leCdXQsj9bVlSzn3P7JpO9ftUcQD3Kuom+dEi17h+KosFLmzl4VoDieeQVaDUzTonFHArJx229AYnuWvokqLxUWNa3MEgy436/jo/2cIpy3lmWtkhwr4o71hSxDvct0LZtpl4O/xE2Ytwg7V2QrlEqjG7T8nPKdqTkDcKtMoT+o25NJKlFRFVzeIOi3E0jc3kQZmWDAkDe+Ud1M664K0mTLPtZyN6YG8CJLI/ViER3dAua8SihGYnlqoAcfnYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C+d3ILfaBgCPVkfZtZ6zsMJ1Ei3scRdIzIDEkb4+Kg=;
 b=nJ/yVxlXKh6yw8r6REGaVF1OQH+3tRM8KeedZs3fBrgyPOfqLoDBwTPEvaJJ7MUK8UFPnGb+4VyBo6WcI9+iWone7HI2vtf6a38Qhaeu4ckgIOudDgCa/zyF/kgdLcfiBbkNd5mATBQVo9N9e4AEJu79HPJfTjYQrlkXHTYdcgMPUNKYxqyORcMXm3eslCSqdT5dNBFlbeBbQ5C8iNuuoq/SVnB1n1w/7jbZsX3RQ8/OOLKctZHBuUy5CsZzdgb1YT1bhFABl4yPMTHimu9xwd5OTrpbq8TZEZOHUHCA+hShHW9lERjLOC2/DtCG4HgVXI4JazmIaPo/nT8tUB3Weg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7203.namprd11.prod.outlook.com
 (2603:10b6:610:148::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 03:41:36 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 03:41:36 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Topic: [PATCH v4 01/10] drm/i915/display: Add helper to compute link
 M/N ratio for reuse
Thread-Index: AQHdRmJ686Mw0wAfiEGkjD4POlDSQbblvVuAgAirxLA=
Date: Mon, 5 Oct 2026 03:41:35 +0000
Message-ID: <DS4PPFE901A304F164C6FD9DE4C7287BC92E3962@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-2-suraj.kandpal@intel.com>
 <DM6PR11MB37878651D4BF0086632F96F9B28C2@DM6PR11MB3787.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB37878651D4BF0086632F96F9B28C2@DM6PR11MB3787.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: 27655ca2-3bfa-4123-d20e-08df22928e5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10070799003|38070700021|22082099003|10067099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: wm93YMO9bl0U06OT8aGe7vbEgTMhEyy28T1tA342cVMsq9MtIg8kfTTKNoYCFdum2L8jJuMj9yzhWVyKeThba4qNIjaYKiSp1diGcdp9Rczt5iUbUb04jMqt55w37HuVFGtRyuEytvsIXhbHJbOsGPbdkPF5qn5StoDxwpiuz9wXUBSLkOcG4E2QmtmcIH6ShW+FV7ht6ZJVh5GEwjGb2tNFpITU0qB3y91snDAWl/FVe+PYFz7eYVJUrrhZnM0h6kceDIu6rQD5NDxE/uDlzlx1YGR7vZMXIjUfzkyPVmi17GLLO+TwPPbfxTGmIet3VzQKZD2PnAqtgCEkOKYzIFbu2oSEHErztzb+qrER3ydwNGFbVzW6ggsKqYIUSMrB4MKVDFaei2ULUBw9Lu1OrW7CuN53sy1StMUizYEOxxcaFhWDTQhAyuUpkL0T/ith5XDI25Ut2mSRr7lRiyfKGs4x4MeRnald0DxzUX6iRb3Dl7QbKSmGpch7/6ZRwtvux4KkoqOMcdY8OC7mDqipF1dqWBpSxjoliSSl1MhQ7QkHHBrv1Vn4vS635e0cHyF5pzc59UVTPexaOlRlq3bPE+PgwAa+1Wtgj1d7L23tPH0j1eJyNXHy24I9/XfXN6Q67iMOgH/gvtp6Lsce4QFBmXVlNstKjbcGKgtd42hiLRbiYHm+PRGbKuKaFWh2WpMyidSo6Ih++3VWIobDBkyWew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(38070700021)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BwE46iRp4oXkZs6Mc4LjYcPxEt7b86EzPHB7fA6rvjjobAyb++2BS8GNc1SX?=
 =?us-ascii?Q?XyKp0zZJ4a7FopiEGQ+n6mglOnnrU8wO2+ff/5QjLju3/hMuq35L/C1PcPBq?=
 =?us-ascii?Q?xAZjWVjmMJ60351ATdcGQ4I9SCBwCnWB7nLZbj/WKaZ7neiW/oyOqYk6M7Dn?=
 =?us-ascii?Q?1Vb9qO2LT1bHgXiRd4SPA4QBJLzPYX9+IWyy/vZ8gbXIInWLBf9ySYxdT/ZK?=
 =?us-ascii?Q?dZqlR8n3MxQqYXz2hlIt+wFG/yxxnBxTyqKy8zJF0PSXiOPgDccrd0H0PQ6N?=
 =?us-ascii?Q?FUHSOaoQSwkt7/77Ly4bybr+U2MaDjFF2KguYs4fcSHwvlT/5jrHRDQ1BCA6?=
 =?us-ascii?Q?u6Zo88/GZmMSqTnUC8zr/JFF2MWOdL3r/ddglVK6zcO8JQakQJZuQxZRFtv7?=
 =?us-ascii?Q?YIyblyFnmHJgSqBOx/eHUpitqjOwRHlgIVNjutMtY4WD3hOmoNNHbAIoVgGx?=
 =?us-ascii?Q?cLwboJqVF7H/GiGlx2kqZQTuLrPSlt+66NyJtRTmzqq8uHJ8w8TLzrklXRPr?=
 =?us-ascii?Q?/S+JZFh0xdJMJ9HHmHCnGigwYTTT+kboaJFb/kTTNRnKzvFoPNi/TBhG4JVU?=
 =?us-ascii?Q?eDimJ96xzEEvLQILF+hagCGtcetmVgAap6C/5scz0eSxnUlAn2AKNEM8JVzH?=
 =?us-ascii?Q?m52NUTmx6+esm4RRGnf9Lizor0eCrEhJc1A461IQpBfVu/SGKCfNC+YdKo7r?=
 =?us-ascii?Q?bkM+obREWpSCRhNml/fV7cMjbgxXGub/x4RqdriUuTIIrw9bKUm40lsBQWVu?=
 =?us-ascii?Q?dTeVxl/PW3sG6oVvpSLC39lkhEaMN2xTchGz5fSFAU6lHyspaORQngeVF9RC?=
 =?us-ascii?Q?syTcEYFeaFC4s5K06+OI7OK7tPE7NhMWsY7OYZ11dq9h3AS/exLTxUH822nt?=
 =?us-ascii?Q?orXs++NUa2AwoZublbaXa7YewcEauyLw8bhsXKjTkzOZ3xqUInTxzTEuA2rU?=
 =?us-ascii?Q?NQBpPYxMTNLsKqDpDji8u7P/BBHUyCJ3KLA1rzmPO4HvwPD1+hBTWGAOHBcU?=
 =?us-ascii?Q?Qds5/p05DBxeFazWvUD3zuX5Bz8GVQ4gYn9vY/CCGil66oyXgFxFjXojq9LR?=
 =?us-ascii?Q?upfTD89IEUXu2kgeDgJcw/3lZSCEZJPnhGUMooMTBKVRKDSwYFBwHtv0M4Q7?=
 =?us-ascii?Q?fEFWYmecB9WgPlYFhOrb7H+ctVyYhN09ME+/KU17CmFqDjHfqpHx8oaKJ846?=
 =?us-ascii?Q?WEyMBcLC1k6TzW4BcMYz6hqsie5ziOUZINVBSzooM/yqZHaW0D7+BFU5wSzo?=
 =?us-ascii?Q?y8SMcpJkhYG446ok0TjPa/6pIzDXUqVdkJn6krFOKPtoznegJ9ghYbH4qC6l?=
 =?us-ascii?Q?m8qHdEws2tI9idcMavX2Q8QXQhTyTBsHvezBFfcY8DimqJ3lelCG2R3szQGT?=
 =?us-ascii?Q?sbaduoJezOzIXyR2n/Qi5gYxXn3ti/ayD6gB7JReDIDQyqNrnoMCB1E4viYC?=
 =?us-ascii?Q?gF8PF9bxD8K95iow6o7iMl59heoOq4e4YkR0+VqurjejkcCpFP7Rzixhfd2i?=
 =?us-ascii?Q?gbpRzpnEb+mkIAFoWWs5+OEhK2acTYk+ls7LcVI1RZt+FJ6AcsytGiWmzHFr?=
 =?us-ascii?Q?+XMrbtOEolp4DjsE0e2x/jKDGakypJgBqnYxOu063d25qOWJ1wuAXWqS6aiE?=
 =?us-ascii?Q?B+LJ1e6pJSC1HQz69aQa+7DRHAICJCZjMnRhqaIdv/JrGWnTNp6wnkX8mX4E?=
 =?us-ascii?Q?HoFzSGK7EU9MsRdg8SrzomKXAazfbRLy3pH73qhCjTx9bo52eibEOlBrPPQN?=
 =?us-ascii?Q?pileWhkgP71tgBUKYo4dP7KvgsQX6S94SeieVrP0nxfIuPzv7ygssql8iPLg?=
x-ms-exchange-antispam-messagedata-1: SOquYXYqIHWjnw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Gr4DNzIheiAp4J5FwHpQ/vRJSVS/Hv2d8t10utzYjAvM6xLzfIfzyC85rWja0i03yu3ghLCJJK38OHNu1bZZ1MkswaAcWvFlynGEt0eEUKLq+LmeEymvSqpLkuzH5hp1IlDfZARRXvvQ92FqP4G+cKhcKJHGG1tksaitBVclTP6kVv7HX6v3YgdB3D+IzOTufaCSNmX+we5NsxR3jLXh26nIdOE7GJevve+4h5CMgjlxNmxssceec1geyw371ysFrmkjQR7cPdkx83ZVSMMAPZr7+GlTqirk2utgz5+blVpXwd3TgZli0wpw8inxHHGBxQI3wgtdEf8EwKkKj6AqMw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27655ca2-3bfa-4123-d20e-08df22928e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 03:41:35.8779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWe8LT8/8mdPcVxYxEqRFqDqElESfdcmKKCPXUuJuY5cfdZo9dFWVatUUhY6PUESAkfj0DnZkxuhZFr33mLF8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: 17 September 2026 10:37
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v4 01/10] drm/i915/display: Add helper to compute link
> > M/N ratio for reuse
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Introduce intel_display_compute_link_m_n() to compute the link M/N
> > ratio from the pixel clock and the link symbol clock. This logic was
> > previously embedded within intel_link_compute_m_n().
> >
> > The new helper allows reuse of link M/N computation in other contexts
> > without requiring the full data M/N calculation.
>=20
> The commit says this helper is for reuse, but it remains static with no c=
aller added,
> please either explain the intended upcoming user in the commit message or=
 make
> the helper non-static when the caller is introduced.

We don't mention in the commit message that this function will be used says=
 in the 4th patch of this patch series.
We have already mentioned that this will be reused later on . I can however=
 add that this function will be used in later commits.


>=20
> >
> > No functional changes intended.
> >
> > v2:
> > - Rename function (Jani)
> > - The link symbol clock is passed in rather than derived here, so that
> > the DP specific conversion from the link rate stays with the caller.
> > (Jani)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 9151ea6c15ab..f04a6f97e05a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2641,13 +2641,20 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
> >  	intel_reduce_m_n_ratio(ret_m, ret_n);  }
> >
> > +static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> > +					   int pixel_clock, int link_symbol_clock)
> > {
> > +	compute_m_n(link_m, link_n,
> > +		    pixel_clock, link_symbol_clock,
> > +		    0x80000);
>=20
>=20
> Since this helper may be reused elsewhere, please document here that the =
fixed
> N is intentional and follows the Windows/BIOS M/N requirement.

We really don't want to document this here in this commit seeing as this wa=
s not documented where it was previously called
Either and this commit only moves that call into a helper function. Other w=
ise we will end up with a lot of unnecessary documentation
In code which is not required.
Ankit Nautiyal what do you think ?

Regards,
Suraj Kandpal
>=20
> > +}
> > +
> >  void
> >  intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
> >  		       int pixel_clock, int link_clock,
> >  		       int bw_overhead,
> >  		       struct intel_link_m_n *m_n)
> >  {
> > -	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
> >  	u32 data_m =3D intel_dp_effective_data_rate(pixel_clock,
> > bits_per_pixel_x16,
> >  						  bw_overhead);
> >  	u32 data_n =3D drm_dp_max_dprx_data_rate(link_clock, nlanes); @@ -
> > 2664,9 +2671,9 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int
> nlanes,
> >  		    data_m, data_n,
> >  		    0x8000000);
> >
> > -	compute_m_n(&m_n->link_m, &m_n->link_n,
> > -		    pixel_clock, link_symbol_clock,
> > -		    0x80000);
> > +	intel_display_compute_link_m_n(&m_n->link_m, &m_n->link_n,
> > +				       pixel_clock,
> > +				       intel_dp_link_symbol_clock(link_clock));
>=20
> With mentioned changes addressed,
> LGTM
> Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>=20
> >  }
> >
> >  void intel_panel_sanitize_ssc(struct intel_display *display)
> > --
> > 2.34.1

