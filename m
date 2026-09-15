Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566D8C88E73
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD37210F38D;
	Tue, 15 Sep 2026 09:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkEAuAYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1D10F38C;
 Tue, 15 Sep 2026 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789463721; x=1820999721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lFMVb/T492rAXkCh8RntBqnC9SYjRpc2eqJFN4a1nWo=;
 b=jkEAuAYTDRXDSPxoyoMxTXtc3gthGUx1eJZyhz7TidQLhH6MmX9Yx7e9
 pxfuvmnZdcEh3CGLvy6SDdes51rYYsMNb+8Q7CzmleU0N1QskXNKc+WlZ
 5D+jJiuMVYJ1EOGfn6Atwa86xkO6Igk2mRB/qm9EYvpNrvGOv5Kx6yD4H
 h7PUhJRV4D0fooLfaDEqRrQWZOiwt7EM1ZW+vSaV4EEEx9lzaNMtNsjAs
 H4OSczB0ZXNbF6+Sbqy0sqQgApOXEzYjYyxSTjSgVZWv4qiU6jAWyw7pf
 wZYNm0wvoJKxVpX92TF4zyi/WG7lgkLiHaBJghgnB5bV35KS73WEyjR/E A==;
X-CSE-ConnectionGUID: IaN0nG1SRCaBUaKJPIDIkg==
X-CSE-MsgGUID: a+AFEPKSSHa1pJIqkLOSzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101170973"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101170973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:15:21 -0700
X-CSE-ConnectionGUID: wYoVAz+wSV+3rXGLpzcQig==
X-CSE-MsgGUID: yr7U2ucRRP2/6uZWhm7kfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271095341"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:15:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:15:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:15:20 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGnNguHtiu/8XiCSpcRNZCpFo4JsBD/hbCqYDLJdDvq0P5hOSWJKh6U5u7Y0apyM292NQHJwUFHiUoJ29qqSSAa7735A4FcIMKseRctU9Mf/RWLNxK7qwvUBX8bjV+7ibsam9IpSSIJ+nuGf6ZzKoBcZZEei27cCRJ851qeJtn/QBsTQSy+CmMh/gxVsVyz289Dhr9/+qjmk6hJHPGcbsSCoeVO0jA6VNNV2dXmVnTuHyQEas9psXfTUswnf9UvDXPgbGojpi7tb/BxJ5OEnII5CkH0rcuMJxl/WwB4dwZJKCeZai90PbSoutGNfnsIiV70/8eaJ/dk3rdEFROPy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZbbr6MFfY0nBSPBjZxkbp78dIaP2Hs/BtDSqtEcnEE=;
 b=JP+bbsCOE6ziyhiMyMasTI5LBv0+JPkiLmGIo+eBS1CkuWwUU059MjdtFoOW++eaTW6+eDhxdjqbtd4lW0pi/UTXHk/6qw70b4K0LlhMlxt5wCuZ/zoT+bgmSf1IjV+lztvVZXcJyzi57onJ7l6APHhkI/pI4dTPbQCxC2G6QnNfC6YK5/Ep5uVtJyUiHY/p/hGmiGuuTj9TsEQYPgD/YxFFt3aIwEMWgGXBPEXO9dyANHwRRhw/7dPM67TCDxbZZbZBWg1fehEmXlKTOztS/eN+zs01HaT4pt0UyKiazBc65tzwl2LgjQO0/BGE1TsByPOmHkMWEXVfASQ/NC2m1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY5PR11MB6344.namprd11.prod.outlook.com
 (2603:10b6:930:3b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:15:10 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 09:15:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 11/13] drm/i915/dip: Enable Common SDP Transmission line
Thread-Topic: [PATCH v6 11/13] drm/i915/dip: Enable Common SDP Transmission
 line
Thread-Index: AQHdQ5J8FRWrJp1IiUGBlhFCIN9qY7bPXKng
Date: Tue, 15 Sep 2026 09:15:09 +0000
Message-ID: <DS4PPFE901A304F0EFE1D8612F6B32B619AE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-12-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-12-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY5PR11MB6344:EE_
x-ms-office365-filtering-correlation-id: 37b42a29-3fac-4ac3-7bca-08df1309d75a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 854URfbCsNsrPJbY5AQF4366flTjPme0Aa12/rpaeZWR5PXxp8arzDLdU7yI0VAQ99NpLsv/inXdkZWPz5Qyp4qlKjloWMtTqBdjevI5Gx2JnhgK72YYZsSxwtfV+HZcb7HA5S2edxRLuwBRuMqMbdHb2HlSeqEre/kYDxoSMr9PQaAsePFV5jh8rHdFjIysUbA1p82kcDpiOnMEotmZ7iwT+Fnm+glFoLMASTEomS2jt2TaTkyAQVTFNfu3lVH1EvnG4kRJYjR7ZIBPWqLkz2RFGfikF8hR1ysCJ2GxLFni5L589RZFz/9XiueJdPCNGu9E+k8iVpfL8FONOYxbzt9J7n8slQ5AS/++UbiWB/7Uk8jxMRZVla0hkMwh+Q4ixeujtsxkDbcZrg/R1ZcKB9nwSEd6psQtZHjbZXX8yOXAQB3PRUwvAO/UyBv3xH8GPeD8GQF9hFOmE/EQxltt5LoIM3+lvEoAn8+dftuhzHdgv+QzGbLtUkh4cu6bUrhfUCvlyO1xcPNf+GTAKiJzwwdVF2UdfNaKPmYWTq2FfXuJUvklodEl3VTYRc/x/UaijPSXaWsUsgtrFbzPO3lfMkxaoJH8LB1lNMwDuT30H3pD0ayh2RyW8SkPsOxlZVpaMop64k3xYSP3lF961XSCLPqX86XLJXdAhvwZBW4+1bdAsd7X7hMuPHsHROwkPWZw3gVAXY9YHjIcp1GBKci8hIKim2EL9z1yu9jhMDcZ7ZU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eT2Qh/5ge1H2YSSKGZkHuudvHB5tkTTkCh+SLOahhhNfNvUwJ/xwH07QJef5?=
 =?us-ascii?Q?E04TgzGGIyHihgsilaWP/8C/a65IDxa80SfVlZ7cLt9l4RBTpV+HOV5suiqy?=
 =?us-ascii?Q?PLjVoWol1BvqIRoYbtWrsMvGgETUY110NcdJpYp9PXACD4s0gTds2AMRNzsm?=
 =?us-ascii?Q?vlUNN4GAjFIW/ow8RqPnFWe+5ljYljCcR9KYNEabJTYg/xqyvvXcl99veGHg?=
 =?us-ascii?Q?iNj43BwXGOHAADxeEXHBIkJz2SRzU0BoTDZaxBV5TG4YwWt0zFgSPvDwsJsi?=
 =?us-ascii?Q?rpz8Dn08Ywm2gBaRQUsgPobhVTc0CpLQqhvEz1xF3WLcRp4xSeiOx1teQTfg?=
 =?us-ascii?Q?zN6UKb9LcXtTLbk9TbkgO/TZQ16xQhP7yqnOYh5Im8WTw1dWNhYXWeuB7OOx?=
 =?us-ascii?Q?w1zlJK2Dmhu+LupzYrH1kHq1O0CvLgsudp44Ys1+SZbhfs1FmEFD6wqNcXTq?=
 =?us-ascii?Q?5ptFNmt7kg6LQr+LF7a5xSBhEjA2fPsCtD0ggA7H0yj90C1IXhtWT5qNOy7k?=
 =?us-ascii?Q?aYaZ3PToXaxfe2pNr3QK6u8fiZN5+FWCeZX2rENKXdC6+QFNjn7Dk8wu2Qem?=
 =?us-ascii?Q?kEYvInI19TQvPp8IdvqOKaVPuTWfIkeIbN43gMFMbAI3D76YS0yxZDp5HLt5?=
 =?us-ascii?Q?e0/qSgW1B3dFoNszwgtnPlzdzEo2xrXvxt2YuhAi/Gpa6JJg7sCslIg2jpWC?=
 =?us-ascii?Q?WApQ7MUMEy0qqOlR0rtlyZklSbVArTF4TuNNjz6rhv2eTyz8qre21dTm7g8c?=
 =?us-ascii?Q?+r73JShNVhvMsmJjImsTKfvoSKpKLPUFRbzZPPsyu6qCj+Tf4R6WtObzU9Yj?=
 =?us-ascii?Q?7moONlUMwrLAYT1vf7fOd3/Mw94GOxmgpqVVHVnNucqNT8cfRcWqly5ySKJT?=
 =?us-ascii?Q?IzTOXGChdZ10ZXVTH3Zsub/+CTHws2Ct9+xnAtmk8odKPRs/l59m8QFfAkfR?=
 =?us-ascii?Q?3QI7nlAIdZqXtxZe/Q/zPmxEde6MXIAdUtHP9KzOvDTUtX8kQ+upU+MEvz5u?=
 =?us-ascii?Q?18jlBUDWahUYEFQsE32yXjYiOP8N/Fz6xxyMnk5ZnH5rVVJZPrenptkwy6aD?=
 =?us-ascii?Q?ZmBGlNfJhDNIv8YNG5d8THrgVTsM1SaKYIIpiC1w68dUMeHJ9icCCM59ur+f?=
 =?us-ascii?Q?cb8oCpAOhGG3KNz+XOUqH+Gd5iHqJ5knJUUGcn2dixc+vCHWv1zMgPLzbtVK?=
 =?us-ascii?Q?Qe2eYjJgP6oVKKW1C2wJrgWpeSIc2BGydNHQIFYGVTXHrLNgtyVZ6sERd932?=
 =?us-ascii?Q?KLA5CrSwx61AsRwmz4aUd66m0FtCi3+Xo2jWG1aL9z5HC9QFL1oYkLbPpR4S?=
 =?us-ascii?Q?3rQZPRoCsHGELO4KF/6yRanuDY/+yU0fuDF+V3KVfHKuNqJPLoQx3gjnxrFe?=
 =?us-ascii?Q?1uGuFkppNUtTCXYei6RnBl7dI8vb9ZuSw6OYCbYBVEtL3x55CLa2M7IhAFIH?=
 =?us-ascii?Q?z7u5jRlKT2kK+phxUNzWKR/0/IX5wCrEoG+YuNXaZxMaunZdVNu4SiE5wCJE?=
 =?us-ascii?Q?nCJw/tfTZwtFSIVVDqPQJJl5alutWDUKetIsPQHb4wvg9490ZOt4ffkEz5pl?=
 =?us-ascii?Q?CuApQX2/X59UALvj2l12zP+rjK12CmJmqY7gLPU/C6v2j0Hj7CyzVxZOGFvC?=
 =?us-ascii?Q?xCcKJaG52h2j7j0fHPUQWMEh0P/zTZPTGeuIMcuDOUCzeeeeUvWczTtIyuDr?=
 =?us-ascii?Q?ea8PxPiwSGLWLuogzLXdOZ7fsQ9i7MP25S9ulf07QTj2T8tdtuh4f9lI/xFe?=
 =?us-ascii?Q?ppvni54W2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: McFRtkfxD0+LPYgzZmkQjEKc0YU1+myUiA/4f9kqKZuzGQ+vKPrQzG0a3VnMHnRNxp6fkvFf08EZ4foTMawKrwnalNJ6gXAEZ9uzalcmVoTV4M+bQblhZsKEK5kQCJFBT3ZPRkrZoSj/VFb7z87eCY+nsH8xfhoLI9Xa8mYo1oAmkZgGYxCH1ermlNl+qElzgwSpuxmj1zAWOmjh6D3ci3AhQMizQN3t+ATM18XiimDhqUjPzq7OcFTFFxlBMkfbfV38+vp6cKftK0KMnhLmZvAAAbfrtlRy9PgWO2BTUy1SJyXYSigIfxr+KOT2DfxiUnVQkdgmQmPUPOMjfl9urg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b42a29-3fac-4ac3-7bca-08df1309d75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 09:15:09.8447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLQ0YY0j8oIBwykq1YwDlmvRhfRp4oMrS+/5ZPWCdBlqLGbdJoa2Sf4AHvlfRgu+0oHsyq6p8Ji5KTvgzbaR7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

> Subject: [PATCH v6 11/13] drm/i915/dip: Enable Common SDP Transmission
> line
>=20
> Enable programming of the common SDP transmission line on platforms that
> support it. Compute and program the common base transmission line and per=
-
> SDP stagger values from the crtc state during modeset, and disable the fe=
ature
> on pipe disable.
>=20
> Currently, the stagger values are set as per the default policy of the Ha=
rdware.
> This can be optimized later if we come up with a specific driver policy t=
o
> sequence the SDPs better.
>=20
> v2: Add WARN if the Common Transmission Line is more than Guardband + SCL=
.
> (Suraj)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  3 +
> drivers/gpu/drm/i915/display/intel_dip.c | 96 ++++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index dacb4b7588a0..3cdb06e81130 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
>=20
> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
> +
>  	/* 7.a 128b/132b SST. */
>  	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>  		/* VCPID 1, start slot 0 for 128b/132b, tu slots */ @@ -3124,6
> +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encode=
r,
>  			     DP_TP_CTL_ENABLE, 0);
>  	}
>=20
> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
>  	intel_ddi_disable_fec(encoder, crtc_state);
>=20
>  	if (DISPLAY_VER(display) < 14)
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index f8e8577b2755..f447150ff7bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -10,6 +10,7 @@
>  #include "intel_dip.h"
>  #include "intel_dip_regs.h"
>  #include "intel_display_types.h"
> +#include "intel_hdmi.h"
>=20
>  static int intel_dip_get_as_sdp_transmission_line(const struct intel_crt=
c_state
> *crtc_state)  { @@ -54,14 +55,109 @@ void
> intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
>  		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>  }
>=20
> +static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_sta=
te,
> +				       int stagger)
> +{
> +	return crtc_state->dip.cmn_sdp_tl + stagger; }
> +
> +static
> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	bool as_sdp;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	as_sdp =3D crtc_state->infoframes.enable &
> +		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> +	/*
> +	 * When AS SDP is enabled :
> +	 *  - The common SDP Transmission Line matches the EMP SDP
> Transmission Line.
> +	 *
> +	 * When AS SDP is disabled:
> +	 *  - Bspec mentions the positions as lines of delayed vblank.
> +	 *  - Guardband =3D 1st line of delayed vblank
> +	 *  - Common SDP Transmission line is set to 2nd line of delayed vblank=
.
> +	 */
> +
> +	if (as_sdp)
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->dip.emp_as_sdp_tl;
> +	else
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->vrr.guardband - 1;
> +
> +	if (drm_WARN_ON(display->drm,
> +			crtc_state->dip.cmn_sdp_tl >=3D
> +			crtc_state->vrr.guardband + crtc_state-
> >set_context_latency))
> +		return;
> +
> +	/*
> +	 * Currently we are programming the default stagger values, but these
> +	 * can be optimized if required, based on number of SDPs enabled.
> +	 *
> +	 * Default values of the Transmission lines for SDPs other than AS SDP:
> +	 * VSC : CMN SDP Transmission line
> +	 * GMP : CMN SDP Transmission line
> +	 * PPS : CMN SDP Transmission line + 1
> +	 * VSC_EXT: CMN SDP Transmission line + 2
> +	 */
> +	crtc_state->dip.vsc_sdp_tl =3D crtc_state->dip.cmn_sdp_tl;
> +	crtc_state->dip.gmp_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> GMP_STAGGER_DEFAULT);
> +	crtc_state->dip.pps_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> PPS_STAGGER_DEFAULT);
> +	crtc_state->dip.vsc_ext_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> VSC_EXT_STAGGER_DEFAULT); }
> +
>  void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_=
state)
> {
>  	crtc_state->dip.emp_as_sdp_tl =3D
> intel_dip_get_as_sdp_transmission_line(crtc_state);
> +
> +	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
> +}
> +
> +static
> +void intel_dip_cmn_sdp_transmission_line_get_config(struct
> +intel_crtc_state *crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
> +	u32 val;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	val =3D intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
> +
> +	if (!(val & TRANSMISSION_LINE_ENABLE))
> +		return;
> +
> +	crtc_state->dip.cmn_sdp_tl =3D
> +REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
> +
> +	/* SDP VSC uses same transmission line as CMN base transmission line
> */
> +	crtc_state->dip.vsc_sdp_tl =3D crtc_state->dip.cmn_sdp_tl;
> +
> +	val =3D intel_de_read(display, CMN_SDP_TL_STGR_CTL(display,
> +cpu_transcoder));
> +
> +	vsc_ext_stagger =3D REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
> +	pps_stagger =3D REG_FIELD_GET(PPS_STAGGER_MASK, val);
> +	gmp_stagger =3D REG_FIELD_GET(GMP_STAGGER_MASK, val);
> +
> +	crtc_state->dip.vsc_ext_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
> +	crtc_state->dip.pps_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, pps_stagger);
> +	crtc_state->dip.gmp_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, gmp_stagger);
>  }
>=20
>  void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
> *crtc_state)  {
>  	crtc_state->dip.emp_as_sdp_tl =3D
> intel_dip_read_emp_as_sdp_tl(crtc_state);
> +
> +	intel_dip_cmn_sdp_transmission_line_get_config(crtc_state);
>  }
>=20
>  static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *cr=
tc_state,
> --
> 2.50.1

