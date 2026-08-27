Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFB2C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA00E10EEEF;
	Thu, 27 Aug 2026 08:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e63CRyyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C15A10EEEF;
 Thu, 27 Aug 2026 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787819372; x=1819355372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H/0F/JXMmDuUVuTDiuB8K0XH9UHO3atkKCb0VBlBYqU=;
 b=e63CRyyIUxaHGf0OYJvK5NQWGEHX23MXk517l4VkGImTUJu65dw6v7rw
 N989DT05bC/POAjSiug7Rgde1nAA3jppayMlN9WGj3LAY2C5FIKyF8bD+
 VoU+/cedfUrKHc4nFIqCpJSOVS9rDRWaZxQ+l5lB2qrI7RRFjXjItSq88
 JjMtiRJMFCk5+XtGtyQU7DMlPpGfdBLKj+MM3/kWW2fGAvKhwJ2wg252E
 fzIIIFyWQUdFbQIEjnEriH7zBn720TPCIQoqkYzPk77/D0BuhWfK+Bri/
 1JT1vqO/lAjZjInefQ2ehRGwgxwFKRD8ShR/T+TaXmlqHvQ7rOj7cYzNa g==;
X-CSE-ConnectionGUID: 2U/mTWAJQsqeXw7LofoRkg==
X-CSE-MsgGUID: liT6rdJwSM2Ery5c7wZGOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="91999890"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="91999890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:29:31 -0700
X-CSE-ConnectionGUID: Ge3D+B7uRrKzRmt/bPH8pQ==
X-CSE-MsgGUID: 9WhfBvceS+SIlyr/uX0K+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="263537631"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:29:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:29:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 01:29:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlnVx8Fp73Vuhsc5pj1mJehbrxGLkotSAMvrOEvrY7TjGkjtswZ8PqcWmmk1YdzaLJzLvAyQ4QodardiG+YI0NW5hkUriELIviqJjBbQqFqnR/UkSXavA74l28Qa7NeJeFwG6RsQIOVc697ubgqJiXUs6zi2vsN8373SBnAwOAkoDal3qPtrrPCBkB43JsWm+WzS8o9zAbPiwKEJ5R5fFcVE0fxLFBa+oJSB0dKqZiXJ4ujmF671BU4fJfni3KH5jZ96+uQtYQR9YKGk4BRY0Eo7aAJDu2yXx1Wnx6QfZRYU0vIXjPdzNhcungxcZkPlCp/mM9oaEODHxaou3S8/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PAU541GLrmSoO4H7ie5kngVOhNQuhL5Xbn5j5WYi88=;
 b=SHboCK/EiYtiuSWq7fHPEmFxZ1EawoU5y4ucgpWsMCj1hKzMWlUaseh8PtT/pc4sTcSewxsGWkr+Zc6XXcP88ZYcwbvXBH2fhaejlE9RZpHiwlSe2bOL/eInwEpEIgr5NYhACu3U1XE7W1Z9mfAFw/j6B18llqQoIAp9qeiIiA22upSePHgAXdcZQbE9pV+SJlyOxaRmqFCvmko7ZzCon4P060EBcQ0OTNM1RMvgV9etFeKMNv9wCTewEZIgHc2VOHbDqJ62AuLZG86XdOPrcepwKRWW0AEsCHSKTDkQA3oQTyfNDh7g3tFZbrwpF5Q8KPZW4BMRjVGVRz8CnfzFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LVTPR11MB9910.namprd11.prod.outlook.com
 (2603:10b6:408:3c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 08:29:27 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 08:29:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 03/12] drm/i915/intel_dip: Add check for DP encoder
Thread-Topic: [PATCH v4 03/12] drm/i915/intel_dip: Add check for DP encoder
Thread-Index: AQHc+Xcf/+/jY5KP1EmYDzcxX2BaLLayCSDw
Date: Thu, 27 Aug 2026 08:29:26 +0000
Message-ID: <DS4PPFE901A304F7F80D4C2F91B70B2B4C6E3AD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-4-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LVTPR11MB9910:EE_
x-ms-office365-filtering-correlation-id: cfa2a459-7ea2-4a44-8448-08df04154e83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: m9dzZ9nW6p8qG/nw7s4bTUUFt6FsDJLF89SscAh5dKuueuTYxj+dwGda78MjB+ADD0MJfY2M3yLZTQcRz2ohxVjo8Eh4KeEdqxCUgIprHe2BtpGiFigo9AjoMMUM3FYZwzlrQQ6fsmrC0BsIpBEufc3OTq7QAsC9NJeuz+mBF5k2iS0qtESTEM09aYs0B4O8JhfIYofDXSGmZ9T37KHJ3MoC/zCaicTnbIVWUnN6ai7t03fuasuGHi2jGURr2VZJwPm4hR9J88f7riZYMlEkO0KyrO4DsUMg+JJ4vERi0GxmLwRvn2a1Wss0erXYCEP1Qdye8RV62Emrly0R8f9OxFp5oS7rWXbP2/KHmefdF+Dl3rQ+japTMz6S9B4HE2ZvJAx0hqbXeODLOFSFhPmyXSjolI3BYSXQfQo8Z7ukQA1OVLkw0rmCMhV4I82wvRPXEp6/1emA1hiePFsDjb/1a5yMUFq1EXuxQEHmjbfvmkE2qaWQKqo3Ky+U33x3utSWP5EqpgjlSRcadf2EVit2d8yOSW0hYjlxiWuqLYfiBZqIQSasGNJDsMw1hxEE5pBrrkFGBSdM6iGCwN8JsvZO+JgxHdZ2MQXrUvY/JXuKKvNAvPt9q3mcK6uFqO+1e1tM4hXdAa+F6AZJsRP6kTJPAANs2jptunsuaLdKuDCZjDD0cdLE2dZU1myGZa4txvQDdgJ2eBkNO5kgzBJZ0gbx4YwqxIJRGKVgq2mKyF7uHPE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j3LSQL5BCE5nkIvVqvv65ltyR0LdW/jc0XbPU9rw1eX6yBM0R+DAsHWnDcxA?=
 =?us-ascii?Q?UCQ04AuW+8XSHgesoZSYSOxZAJC12G28hbBeQ86lRZuN/iT6X0qTilFKdjC1?=
 =?us-ascii?Q?XW1KvqcAcojyVbgY4A9F5dDb/XAni1YEHYJxm9zmvqigFEFt+x/V8agotCNB?=
 =?us-ascii?Q?tUTG3tfYuq6rs4n9AOy7CT9nZwk4QBChXlqEtjIpQJY0cfx7mgluTjYla5dk?=
 =?us-ascii?Q?q1hqVeUEnGC3RBypHV0IHkAWCIKkQzHfASYfP4MHh1e77WSI3K74R67Vcvvy?=
 =?us-ascii?Q?/9TrTTDw+EiIGRNhPGkCffKfYtUKJ1N5lXrDmWKKdR8dAokzNIhx9p+rZlsP?=
 =?us-ascii?Q?QKZsgfm8q2NuQC7C+kc21J89qIu/TvMiUNV+po8AeIgc/y++eSeN5RoWed8G?=
 =?us-ascii?Q?PZmgTHDqI4esOnPkpqpbyTWn0xbt0iWqZ5LN/f4ziuUn+vl2mL6deMrMNWpf?=
 =?us-ascii?Q?1T32a+1DRwSL7Fo5gHQwoPQlA9UoFAJ4pUFygJqOgAOxvnwicXY4kT6khSHP?=
 =?us-ascii?Q?Y11ZbBeVjvJr2+HJUaK90vsmDbT9DPe/3yx9CAXqDu85Hyzi14sfCR2XMrFf?=
 =?us-ascii?Q?TUz5vKlgx39jtWWRJjv78Ti2WYdA26QqXEAGxagfRlRN8bNFti1dx2Af/3Tx?=
 =?us-ascii?Q?9x3yt41Uyd/s2cyb3J7BjDh6+XZtOiTg9zIuQ5lhOkx/Ap1+ASeWecQfmSDe?=
 =?us-ascii?Q?DB1i0vQOTJmHPx39NhAthShQ7BvoGpNTiVnwnIixBj0CKxofnAS6EkZbcW0z?=
 =?us-ascii?Q?AZ80Ngf3xithy7HDU8+j+HuLAmQhHtrmzjcr0dqTF67GsqIaPoxU4yLalPDD?=
 =?us-ascii?Q?LSYcfcYp9Z84k/9q4cWZyGr2z8AWYtHD0ozAyNWxPOmOZ7s8vSlt+Qz3XWOS?=
 =?us-ascii?Q?A1wgRIX1SBCdZ5QT1YxUug5wiTG8NrtNZqDZW41IfKtnXAs66X2OGA9zT9F3?=
 =?us-ascii?Q?PLCUWhSjhGgossESUFj3J6mkNw9V/Wd3XLVLYj9JtIs04f5+sm/fkjtbdKUl?=
 =?us-ascii?Q?2pbl6RvzojTCcRl06VJ/Cb++q7R003l7FoQtcYkSDxCAOE4G9EIvrnJDhGFL?=
 =?us-ascii?Q?vrQWwBbKcJk29hDa/9WhKPkMTf/VDYTPtNsdcJf2STAayNbkOHV8+VJ0Ifh9?=
 =?us-ascii?Q?vkeNP2eKG6u1oJArtIkOLR/tpThKvqDHm+rkHiByw4R1mPUsZVkfnwgCay6n?=
 =?us-ascii?Q?rmaxYS/poX3L6kDdpWSvUcLT7QyeSL/Zm6TnQ4lWbvXX2Z1ipncwT7YhROsf?=
 =?us-ascii?Q?4tnspQuDnQUa5Aey0e7fbgQ/BGgJACL+LIrGyWDSmNbx+DUaLx1zoRW5jMYm?=
 =?us-ascii?Q?sTQDChJ3LMpG0YfRsCBRDEGfcPP7rMv3UbdCLmkLDLTFYs5vajlRUXsyOXLX?=
 =?us-ascii?Q?3R6KU15pDIT3S5fBfccEiewOtUUb29EQEdGzoihyE/bSm6xeZ6ZU4purNDfq?=
 =?us-ascii?Q?4H3mMg1QyUTd7hAu96WjAVE3tnpvdZcw8IpqG25tRWTobawqn+0hmAxSdix5?=
 =?us-ascii?Q?7v3AMmTi3Y/br7A3Y3CBIjrNTHFShN+l3qrPYWtUqJjoDkYtRlgMODR09bJM?=
 =?us-ascii?Q?2jvRDP/TyPMKVkyd2f4IRZUOpmt10Kw491ZmCrKQJ3O9uaStceIa7dfb7ddX?=
 =?us-ascii?Q?wM1Mlv2QLM2y6tHy4GWvpwEG7aIFrbeKxxtGmQgTsCFY2gCRlQWt7BByiEUX?=
 =?us-ascii?Q?mD3KJPpUXTNFWtZo31z9PQ5FC0jKLnNJ4koT1MktkQOwQTxEmsro6lJ6cJCa?=
 =?us-ascii?Q?8g020xus3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XCNSjTOYEOwqOs6tK/oOQ5jUrMq8l6uwNFSQ28oENomqbIa14SWgfnEM8F4Q5Y2QMYsuiNSLw2dq3W9WV23MObvSJafpiuqOboIcEP0l38O6ylHj/Oubu2nPhC7Df1rX6CIZnWtBEk6i4S99tIWFGjkEFaCSEF96OWoq6MYXEWNHteUnaG85awbH2UVD6CX6TMyle5WDTvgc9lxI8ozy25CDk6bjvUAWU22fu/95Txp0MZiCCV22JMtgqmcA01P/1KPGJMQtXPIFF9t4IQqUVWWnQUusAXz+OVGsfkqBltAN0m/Yy9lwgHcjWBlaJeuTuoAQqId1CzQF0K0jfBK6lQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa2a459-7ea2-4a44-8448-08df04154e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 08:29:26.7755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23TN07aLUfmX3W+SJOEmD8rOp6yAPNnvPDb2eGYV4rVYFQm+0vT7WSSvzstilp/aiiGQWO/2EBuIjDxF6ggY0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9910
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Anki=
t
> Nautiyal
> Sent: Thursday, June 11, 2026 1:03 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; Murthy, Arun R <arun.r.murthy@intel.co=
m>;
> jani.nikula@linux.intel.com; Nautiyal, Ankit K <ankit.k.nautiyal@intel.co=
m>
> Subject: [PATCH v4 03/12] drm/i915/intel_dip: Add check for DP encoder
>=20
> At the moment, the common register for programming Transmission line for
> Extended Metadata Packet and Adaptive-Sync Secondary Data Packet
> (EMP_AS_SDP_TL) is only used to program Adaptive-Sync SDP (AS SDP).
>=20
> Since VRR and Video Timing Extended Metadat Packet (VTEMP) are not yet
> implemented for HDMI, add an explicit check to write the register only fo=
r DP
> encoders (that may use AS SDP) and reset the register for non-DP encoders=
.
>=20
> In subsequent changes, instead of directly writing the value, appropriate=
 helpers
> will be called, that will supply the transmission line for these packets.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dip.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index 2e2bdb2b199c..450a599b5053 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -26,14 +26,19 @@ void intel_dip_write_emp_as_sdp_tl(const struct
> intel_crtc_state *crtc_state)  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	u32 transmission_line =3D 0;
>=20
>  	if (!HAS_EMP_AS_SDP_TL(display))
>  		return;
>  	/*
> -	 * Since currently we support VRR only for DP/eDP, so this is
> programmed
> -	 * only for Adaptive Sync SDP to Vsync start.
> +	 * Since currently we support VRR only for DP/eDP, program the register
> +	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
> +	 * the register is reset to 0.

Nit: Since we currently

Otherwise LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

  	 */
> +	if (intel_crtc_has_dp_encoder(crtc_state))
> +		transmission_line =3D crtc_state->vrr.vsync_start;
> +
>  	intel_de_write(display,
>  		       EMP_AS_SDP_TL(display, cpu_transcoder),
> -		       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
> +		       EMP_AS_SDP_DB_TL(transmission_line));
>  }
> --
> 2.45.2

