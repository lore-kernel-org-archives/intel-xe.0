Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D2C4450F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 06:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9310F44C;
	Fri, 17 Jul 2026 06:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzknKWoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CDF10F44C;
 Fri, 17 Jul 2026 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784269663; x=1815805663;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4uZhHrNk5uo/CeG0nCYFXkun3mfbwsPg+Lpt7hwH9O0=;
 b=nzknKWoqd0eg58wNf9vustJ5UXmbtle71xfJpUOKWgtACc3y1p4Lxm8a
 gQjjRHZYzI2Ri4jnyX3epu50u/XfiL5Hbpmtf3FMC9G6NvzvhJ2Op0JUc
 LNP3hi5pVwLOiWAcUEEhe4vf+08LLazIvAGpeDBP3SGv9/Y+lVF0d0y8Y
 NYgP/jMyrqetCzulZlK/G+wvbJENCxpq6v5GbqvVVS9sO54mqIXUT7Cj7
 qTsmS2WVF2buGpnCkHe/01P+5Wv4L7QyhumaiLIZbpr6l7xvl/UsSx8Up
 slR5y4ilUOOKdswJPSOvX85u1UJ/oioCwge1p0MelOjKtxy5mhVTBLh75 g==;
X-CSE-ConnectionGUID: 67j73dQ5Qn2PD7U62i7aNQ==
X-CSE-MsgGUID: 3rHN4E3zTZ63kMNGKFsCLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96303758"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="96303758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:27:42 -0700
X-CSE-ConnectionGUID: Xzq+ChK0Sm6X7d9dXSdepA==
X-CSE-MsgGUID: 1tki53uhTVuhV8RtInqY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="252714625"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:27:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:27:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 23:27:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S561ZPvcfNFjepgdH1IP/1YKFXjEYEvA1D6MOu9G4E7HwMHLuEP3y/uDErWujlYRJ2vsGBRqMt4vX97LIXtoS+RXzkDqEIZHS+iV1fUjcxGudyvKCiKJ0FwppnFuhlf87VUcc3SHa35p/B6pv47+7niFgBOVbZPzXkKuU9ycewYU5XsZVeML8vEBOuRfIIutmjU63Htkp5PbUw/cHFJzuQE5rNOfZxV3xa2q26x4ARGPrduRol/lM4K9etysPrpJ7cqvZvbttu/xJRAbRG2VHXziYVz4A58R9JsSkLs+vGqL0xqCtWIftxYVKkBIRXsYDpmOf9C816tjn1LdvlBg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOq8TMntXBUqyU1uIbKwB0hnkBu/UFBtpTryx5DimtQ=;
 b=iyIBspEECLuO2aZWG90nPeVGP86T8AO1Od9vY+xhVOuJZCx6g13MpHgOocVhgjtIuo+PH9BjDz+QiXk1V/fkREDrWORyEB81zazyzwA8EBXYCDwSuAudh8mtZ0jD1C00P0lc0jHRnuAhquBV61DMPiK7vr7X8FWxZtteO5mMRyfYrAiuLFr/0W1hd/4Q74XjKlzan8vjoP+Y2Z4JuJ0JII0/lYiSIDZ1b2CXzDZoK9/axAlHheG+V918I5vEizeygbh6AKsArxCxbo0mcHUH/O/qLRCe38ZjHnTUc/Jnt83haUWh4XNu5ZMaoolYilW+3XuWBYP2BHx7Lrn4jF5KiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PPF6F32BC4DA.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 06:27:26 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 06:27:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 5/6] drm/i915/dp: Disable UHBR link configs with 1/2 lanes
Thread-Topic: [PATCH 5/6] drm/i915/dp: Disable UHBR link configs with 1/2 lanes
Thread-Index: AQHdE6eqEdB9ZyNcIkCkyNCUht1JZLZxQzWw
Date: Fri, 17 Jul 2026 06:27:25 +0000
Message-ID: <DS4PPFE901A304FBC80D4768001F4061B0DE3C62@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <20260714152700.555527-6-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-6-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PPF6F32BC4DA:EE_
x-ms-office365-filtering-correlation-id: 51085992-3351-47e9-92de-08dee3cc77fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|38070700021|10067099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info: P0VuGfO4bACbW43EU0+CYAUwikF9bQd+tJU6Qitax/uCImKBsTvRmy51+73L/6j/8LU7/fd68Gw8o9gspz84tEGuZPVkxrQxn0sWmqvnulWWVbb8/ryRqf0THQsMyfCI4Ztz/iYzmH/uLVDNjWRr6quJMBE/5XH8Ztp0MmQS6aeP/GaWvPCJBXPEH6+WXwy89ifsf8whNeV0lK41fK9l8fgI+paDptq1W6Fq3au+ZvjHwXppJSHqIkgL+n2EFMLjAhAstupl7y0w8+oK6ONdJM+Dv+tidWb284JwvTIovNU1+77biQfGGdmjIbAJm6KUqPmcxF/QEB+JO4eVdgta/gvrCkn1i0ELrWiNXh40NUA+q5LInvSVhvVTutUFF2yz306v5epFtL2ElmrajFDoBaj6X0iTHpty49/QcZrMqMqfz+3DrcSKHnHjVejV90roIdU4nYTcJAuppSxPNuBVcKeQpoWXRbxq4Hl+cOPOMpwUaBIFT9SWuvb8ggznU9qfShNFMlN2F4lJFPslMKb5LoTFtvROM5fi1hmN25VezuZjwRX+XNuEYXJS2rIa21g+CYU0gdi2bjME7ZHpfjbnUA74YhXTqxWkBfTOATOssOc79YdR2PYTZvR5rpuKyoWkJmczW6prprOOzsFHgEWBxXg+qkHKIaj0zAf9ulJoR6LOMxNSItRrGxRMLuKrFwf9xhZ98LKjE8/gVENPHDN4ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(38070700021)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?53aEDaRNmoSvot5eGYNy6307AVZI2Y5TVxZB1cpcZQCE/vg1ZxAns97Vch+t?=
 =?us-ascii?Q?otHcwkSSK8gHWixHOLLknZBG5v1OAanhaOADMpk48uX0p/JfB66oQQg94GwW?=
 =?us-ascii?Q?6vWA9sWswiPQ7br3iBUEncqBvm7J6nxx3AO2h06X1d/YC6fH/v65JKIBUs8b?=
 =?us-ascii?Q?imRUVhEbzNHDGsMs0vGsTA7rP7UqP3MpTm7noTkXGWeot5PY+hNS/xaLzieD?=
 =?us-ascii?Q?FvIwRsB+gPHqAOmBDAz33p/kbV0yvtX/7T2Yl65pXApuGf6sJyYlNlGHs1GT?=
 =?us-ascii?Q?e1+W9gTdp/ZdR3SOqrOoeOzoLC3YfDDr8s4OWRM3h2UygxoLayL8Ntxu9Pf2?=
 =?us-ascii?Q?uS/TRRyhh4nLOBdZ75HBwLszUegBo7QhZZ1cB7t7Y6IlUPaOJqngIonKRmqE?=
 =?us-ascii?Q?HD1cGxRFjFVWRyd+qLOHXFbNmHIVpYly60wNsIBM7rgVUKwXoFjdS2IDxe5n?=
 =?us-ascii?Q?lHXGXRqQKy92RUy8MvD0ncM1DjRXzF7Zf9Tf0QvXsdKCMFnoZ6rP1+xOELug?=
 =?us-ascii?Q?qICRHkZ5xuTGleWeLAW1ppqOTEts8H08za6o8E+ZIL0TJoA3Op8391EgSHoB?=
 =?us-ascii?Q?U+zzp2lkUQQZRz0nQcJVWrmIENPMzCSS0L7p35PZCKw02bR6iHVT6imROnnI?=
 =?us-ascii?Q?gof5UaN293duW1rojAL3Ae2nlwoZ0wCk7PoJkc9dQaABg+nLxmksYVnpDXeG?=
 =?us-ascii?Q?qQeSDItQLc+dVDVBXQhZWHMwcISmpXAU54kPdQVPeLVDwdn/Wmw0QrFiRkpI?=
 =?us-ascii?Q?VSED81hem0yfhbbCzCv7xzVNCZwk+eM3naZhlAFOuG7+KtbHMsmwr83TMxDj?=
 =?us-ascii?Q?6yygrRWm9WRPDG8baaTQbMN1PV0zPW4X8Usicl2rDDNMFyWoWNIRZZCalem2?=
 =?us-ascii?Q?DSg87D7BKI4XI0MXK/zd92A17y78+pKP8+HEW4VXbU7g3IZVYehP7irVcuhJ?=
 =?us-ascii?Q?rlusALLLcJkJDN5b6Pb+RjqnjKPEA1KFyJ0A9yClfvwKPa/octc7fjvJxE3s?=
 =?us-ascii?Q?LAVXLgCx5cKDwVgxweqX9Xu1lvQwGPRKGury97KpDm/tj9/Jkmpl9Re24nPK?=
 =?us-ascii?Q?xcwQZLYcFLGvMHi8+b40C6WDzw0mfZGbn737FPbWMNQKLs0FygGzZrYxSeBl?=
 =?us-ascii?Q?EzteEn3qtLnS8uktNi/p+ESurx4Y7nKsfKDEVfenBxmfIhmkGPrOUB0bXPS3?=
 =?us-ascii?Q?UeMpSw/HaxbDQ21rO0Sb/0QMGKEPyzywxSvyIiqY2dS02kFYvehry2RdWVkv?=
 =?us-ascii?Q?KsIQ6M1NTNeIse0g3dB2nJy5Dn7ztWdmRvRmdpRQPXR2ljw3RvHpADhX7yzE?=
 =?us-ascii?Q?c5HhA2BzWRbSdnChB2m3EdhAzDUYh1Teb8RQFlLJDBWQy+lv5XPS17HU6b0Z?=
 =?us-ascii?Q?vj2XP0VmbHJh4AYOKR6O2cc1u0IcHiJyn3bbt83PREVX9p5IAH+1/XxqzBkX?=
 =?us-ascii?Q?xbRvyhAqjMbS4vuFjMvfW/ThGE5MQlRlldZnZut0etpc3fxpiXwrN4x/iRci?=
 =?us-ascii?Q?mo1uoLPSN0K6FIiCRh2JPqGLEw3+wyOXU5wxY/M/FxwW8vO2i42kVpEorLNT?=
 =?us-ascii?Q?rsoSCAUoOfVeFH6WCbceVjqbZxomxCmZlmPuZpInAxtmMD9SdMSZchFbW8Tc?=
 =?us-ascii?Q?mY7edGUwZfK2KUAFQkGzpnQZYgiQ7zcbnumH3Ugl3vOwjR6fNdH46KHyCV0u?=
 =?us-ascii?Q?/ie7364H4zDuN777B+8EKXC5O/iFyU4d8mAjcV7auWhqL4gZ9t1stsU/++zB?=
 =?us-ascii?Q?EK2tsYgyXg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WCUpg8k0bAInpmewIM01LiDV59G9npWVT2LquXaltL5escgrB7b1LLZiADA34RuR0QMtVwLCSTzEjzv/VxjAN7EMD9CcjsZM7L1t5FS4qYXXByC/erY+CP/DvQViRN62fe3HYujGW5oo2XTv+kCCEbNt/nqoltj1+9DgXPC67hExODwzhoQ4t/uA0W8X9/jkKEbFINKrz4zCXm9hIJsdbdPH/gve19XcGqfX4kUIGF7Rl33OO9j08BsUfldKZnBwVrQqvgWo+mwZy0vfVN4wWTvJ0WiW+wvH1h8aZPS6dFMV+ausKegc9SozWjCxtOY3QETALJfQQ7czFQ8/67jEvQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51085992-3351-47e9-92de-08dee3cc77fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 06:27:25.9164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dAS+ZowiER/AnSxrq2YMcXexYRleSof5XZ3pSWH4Tg2+SQ5YBIem2WsdGHN3F9yfOPXiiAeG5a9gHFu8B6UYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6F32BC4DA
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

> Subject: [PATCH 5/6] drm/i915/dp: Disable UHBR link configs with 1/2 lane=
s
>=20
> Disable 1 and 2 lane link configurations on UHBR tunneled links, accordin=
g to
> DP Standard v2.1b "3.5.2.16.3 128b/132b DPRX Lane Count Conversion Failur=
e
> Indication and Corrective Action". A tunnel can indicate if it's not affe=
cted by
> this limitation, check for that and skip disabling the unsupported lanes =
for a
> well-behaving tunnel.
>=20
> The Standard in the same section also describes a workaround for 2 lanes =
which
> requires assisstance from the sink, where the sink indicates at the end o=
f the
> link training sequence if the link training must be retried. This mechani=
sm also
> requires quirking out some sinks - based on the sink's DPCD OUI and EDID
> identifications - which doesn't implement this link training feedback ind=
ication
> properly. This patch leaves the implementation of this workaround for a f=
ollow-
> up, but prepares for it already by detecting the supported number of lane
> counts at a place where both DPCD OUI and EDID is available for the quirk
> detection.
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  5 +++
>  .../gpu/drm/i915/display/intel_dp_tunnel.c    | 45 +++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_tunnel.h    | 17 +++++++
>  5 files changed, 75 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c048da7d6fea7..adde53dc9dce3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1871,6 +1871,7 @@ struct intel_dp {
>=20
>  	struct drm_dp_tunnel *tunnel;
>  	bool tunnel_suspended:1;
> +	u8 disabled_uhbr_lane_mask;
>=20
>  	struct {
>  		struct intel_dp_mst_encoder
> *stream_encoders[I915_MAX_PIPES]; diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0d2c696b9e4b0..e0b95fbf7db0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3629,6 +3629,8 @@ void intel_dp_reset_link_params(struct intel_dp
> *intel_dp)
>  	 * was called.
>  	 */
>  	intel_dp_link_caps_reset(intel_dp->link.caps);
> +	intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
> +
>  	intel_dp->link.mst_probed_lane_count =3D 0;
>  	intel_dp->link.mst_probed_rate =3D 0;
>  	intel_dp_link_training_reset(intel_dp->link.training);
> @@ -6281,6 +6283,8 @@ intel_dp_detect(struct drm_connector *_connector,
>=20
>  		intel_dp_tunnel_disconnect(intel_dp);
>=20
> +		intel_dp_tunnel_uhbr_lanes_wa_reset(intel_dp);
> +
>  		goto out_unset_edid;
>  	}
>=20
> @@ -6345,6 +6349,9 @@ intel_dp_detect(struct drm_connector *_connector,
>  	if (intel_dp_is_edp(intel_dp) || connector->detect_edid)
>  		status =3D connector_status_connected;
>=20
> +	if (intel_dp_tunnel_uhbr_lanes_wa_setup(intel_dp))
> +		intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
> +
>  out_unset_edid:
>  	if (status !=3D connector_status_connected && !intel_dp->is_mst)
>  		intel_dp_unset_edid(intel_dp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index df6e54508e5d4..7cbef16ab38b1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1453,6 +1453,11 @@ static int mst_connector_get_ddc_modes(struct
> drm_connector *_connector)
>=20
>  	drm_edid_free(drm_edid);
>=20
> +	if (intel_dp_tunnel_uhbr_lanes_wa_setup(intel_dp)) {
> +		intel_dp_flush_connector_commits(connector);
> +		intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
> +	}
> +
>  	return ret;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> index 49fa4c9699b61..2199396345646 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> @@ -831,6 +831,51 @@ void intel_dp_tunnel_atomic_alloc_bw(struct
> intel_atomic_state *state)
>  	atomic_increase_bw(state);
>  }
>=20
> +static u8 lane_count_mask(int lane_count) {
> +	return BIT(ilog2(lane_count));
> +}
> +
> +void intel_dp_tunnel_uhbr_lanes_wa_apply(struct intel_dp *intel_dp) {
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +
> +	if (!intel_dp->disabled_uhbr_lane_mask)
> +		return;
> +
> +	intel_dp_link_caps_iter_start(&iter, link_caps, order,
> INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (drm_dp_is_uhbr_rate(link_config.rate) &&
> +		    lane_count_mask(link_config.lane_count) & intel_dp-
> >disabled_uhbr_lane_mask)
> +			intel_dp_link_caps_disable_config(link_caps,
> &link_config);
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +}
> +
> +bool intel_dp_tunnel_uhbr_lanes_wa_setup(struct intel_dp *intel_dp) {
> +	u8 old_mask =3D intel_dp->disabled_uhbr_lane_mask;
> +
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp) ||
> +	    drm_dp_tunnel_128b132b_lane0_mapping_supported(intel_dp-
> >tunnel))
> +		intel_dp->disabled_uhbr_lane_mask =3D 0;
> +	else
> +		/* TODO: Add support for keeping 2 lanes enabled as well. */
> +		intel_dp->disabled_uhbr_lane_mask =3D lane_count_mask(1) |
> +lane_count_mask(2);
> +
> +	return intel_dp->disabled_uhbr_lane_mask !=3D old_mask; }
> +
> +void intel_dp_tunnel_uhbr_lanes_wa_reset(struct intel_dp *intel_dp) {
> +	intel_dp->disabled_uhbr_lane_mask =3D 0; }
> +
>  /**
>   * intel_dp_tunnel_mgr_init - Initialize the DP tunnel manager
>   * @display: display device
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> b/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> index 8273e681a5128..13fc8fbb6e306 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> @@ -54,6 +54,10 @@ int intel_dp_tunnel_atomic_check_state(struct
> intel_atomic_state *state,
>=20
>  void intel_dp_tunnel_atomic_alloc_bw(struct intel_atomic_state *state);
>=20
> +void intel_dp_tunnel_uhbr_lanes_wa_apply(struct intel_dp *intel_dp);
> +bool intel_dp_tunnel_uhbr_lanes_wa_setup(struct intel_dp *intel_dp);
> +void intel_dp_tunnel_uhbr_lanes_wa_reset(struct intel_dp *intel_dp);
> +
>  int intel_dp_tunnel_mgr_init(struct intel_display *display);  void
> intel_dp_tunnel_mgr_cleanup(struct intel_display *display);
>=20
> @@ -129,6 +133,19 @@ intel_dp_tunnel_atomic_alloc_bw(struct
> intel_atomic_state *state)
>  	return 0;
>  }
>=20
> +static inline void intel_dp_tunnel_uhbr_lanes_wa_apply(struct intel_dp
> +*intel_dp) { }
> +
> +static inline bool intel_dp_tunnel_uhbr_lanes_wa_setup(struct intel_dp
> +*intel_dp) {
> +	return false;
> +}
> +
> +static inline void intel_dp_tunnel_uhbr_lanes_wa_reset(struct intel_dp
> +*intel_dp) { }
> +
>  static inline int
>  intel_dp_tunnel_mgr_init(struct intel_display *display)  {
> --
> 2.49.1

