Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8550C624CE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 02:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438CB10E2F5;
	Tue,  1 Sep 2026 02:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcMjYrRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9910E2F5;
 Tue,  1 Sep 2026 02:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788231423; x=1819767423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lo6CCMmKjr5kr5hyIM0dpZMC68oPOLxYVMBTxVG8ySM=;
 b=mcMjYrRLTrVjkKk/Jy/ugAQiE5dFU12O6jtQ0hJlWiELftvhVEaU1TLQ
 6W4m6X/blCE6gSiENqWHusR0ieziHtVZtOvMRZtPw3XCidBUjk3hpJJwj
 cnxN7tk3IpcSY7xICYZqqgm9HEAebSGgdSQM6xp5cOCM/XQWjavVEQH+S
 99p9T+EGR7XVTrkZbj8XMCvj6dmLcWJtFph4aPGagTBjC+KfdErHLJK39
 beFZ6dL0rNU7sAo/Y3vLNCxmyCO+wDU/X/V1nKgvkorprWPA8KzJQBkBK
 tII9B/5Z+FTqtPuBz+YvTn5CljAn13A+6VLFqLDllC8jZOKQ/fj2rT0mN g==;
X-CSE-ConnectionGUID: 6vAcxgUkQ8e8QfIQFtTkpw==
X-CSE-MsgGUID: W6GcC/fjSO2CC40MN33zLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88524366"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88524366"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 19:57:02 -0700
X-CSE-ConnectionGUID: qadsjuEYROW8nL1AaAVSSA==
X-CSE-MsgGUID: 74hPVeJOSxaGG+yYNzVQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="262828475"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 19:57:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 19:57:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 19:57:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 19:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJFxXtA/uUQp8KR8o6YFrY0Fa/T+1ND4/LG/IHzdSpPF0hmBuDlnaj0kwK1kRSY3BVG9ouCalg9ehJI1RgdqNEr550ciPfdxb69lz1yq9GgOhqlIOzY5Dgw/tpRTC2ZetDiyYBlMwyUJEAv+/AOhy8GNgPXUUgswCdZ56z2jHXoOM45AEm423/luc1DjxqzvIQdjxXhzwPvj0ZCdCtnF9XMlJJRxp3rc+0CtkImuZzlop//fi5POKOm/VHRTdEzKXeyuqo5SZ8kVr3j+xeTLtwV6B/RNPPnPG0b+q/3a63VEI2IjnNeORoEk23UGpAXLPaAwJeB692To1V/s7YbYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrmj+b4dUqDj6ZSFxpQpBIMM31vjHr7RVPQq7DYihKw=;
 b=EyB/1fbVb96nA3gRCLipFECgHIeSFC8MDOAc7oWEQAtPn2j5Wy3+PCnA8+avL6sG4ozAyK8enW/E+mRhY8kWb6IrcwzwbANSibkqtEC+EZt8rwKkyvAXwyxk867MU5pxJ/iKKdgc50rams24cCJUB/7QoQgLnWrMZdZxe34lv3gebyfzg5WfZWXcyqrGe+tnrB8ngux6dZarYJLC7Z3qpC1hUNHA4//U6NBNiVksO0vcM50qKVa/sF+aDYbsa59s9ltHgqD8QdFld1HsOCOBXPNwnfeFzgUb9sNck/R2hR5LF1ZiFwovl2ABt/C8lKMByeAgE6HZjMudVixJm6n3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB7585.namprd11.prod.outlook.com
 (2603:10b6:510:28f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 02:56:54 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 02:56:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
Thread-Topic: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
Thread-Index: AQHc+XcduYifne/nvk+7qRdk4FuhWLa5h/3g
Date: Tue, 1 Sep 2026 02:56:54 +0000
Message-ID: <DS4PPFE901A304F9CFFE47D4BADFCF5A078E3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB7585:EE_
x-ms-office365-filtering-correlation-id: b88ad796-c790-4369-7211-08df07d4ae2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: waO7XtW5lAgWwA2f/dsB/fGP/K/D2Frg+Aa6QYyAQLXGGDboX4Yhr1GKypOzqMIJ1siTZs0A4jIKh024oL8EtgAuvdGkvdX9oae/0H/ioCLxH+NBmldj6A+CExDDGaHK5YEFvBbcp3sp2UM5Dl6MaANyfYmYKZ2xBoFr0otGzzGBwc77zQ1y6C9qLAZqKG/GSHq49MPRqjVqa4oZ3mfAxbbT75psTbgIn1Bw16UTz94F2iUgKdxZTug0Wq9Phkypqdz5HH6UsVselqIK565qqSe/tVK6SiOXKXHT8Em013DXZk1E1vhFxZEDi+xTAZQ9D2rw4lHF8qb6kMmHSGw3dFcFjPG/3Ftg5VibyERAezYYwNq7ZoIYpnT8RVvNAw5dZq/aHSWS2CDM194kaWXGicq8FJ5BsvL+F+0nHVFEWncUdRCM51424+1OvvtFaSLieOjMCwJs5I8h1lcDj9k5vN8i0DBQU6j1+isxSZXVf/4uZusu1DooJ/wqZQgU0XMs3KZ2FVIuHgfC6aUcLhjIstYqIpnYdpznu53W9aywz//YXKPsk3Fj28PHO5B/4abPUPJBWp6M4jlLMlM2YF0g3wI1Sjjv2UD7oXiLdanVtX9OQeRxRXP3r/Ybu3ESc7AxQin5NS8ytJ7KjXDABuvbLnbdByfpx4PWfzl6fGtwPZYwUbxaL4/sLS9QIydCXkzJyG3jgaaCpIO6mlvCbdDogd6+xoJ/y+aNxY2h2PH7yWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?huiyqcHUqK0rkRiSYGKXWTlh3lTQahrCkcLDlahglELSt2pEavPTkN4Nf/q1?=
 =?us-ascii?Q?obl+7oSwxS8MQgdTs3fsETe1tE5+R7aV02YQtxFFb/6NwOSENPdlJV5YLljS?=
 =?us-ascii?Q?8rbzjATG6kCTUzcJ9RQBWSwf46dMOxZFOTnZCfVvUT9u95v17LQ6qdHHMvsQ?=
 =?us-ascii?Q?cIWnT5gkWT9hI3DJO+RwIY+mvKos14bdUoCLKh5bTu+QGhDP1PyN0zWfSsQB?=
 =?us-ascii?Q?q5Ya9q82H17rZFCBFGoqG0b15xcM5GiAbq0Vt3MhbO4ehVtl4B0jW5gw8poc?=
 =?us-ascii?Q?HrXFtuAvRWkUDnMbKsV3zO6CErU76W4p6ByngB6sj4i2QOeYA0tEOX2YAg8Q?=
 =?us-ascii?Q?BQifMuoykeTnzqGT1ZAqs4cPG8S6YI0vNxyWL6BEZ5GdhaNZszoGQYhi5z1G?=
 =?us-ascii?Q?7iVpWp8rUL5cop1AwFp0OnJtu6eCJQqOsq2QKP/0Cz7DyZaPuJFKMzv7a7wF?=
 =?us-ascii?Q?mfpukMugZ5JyC6fa7G0/MOnRAwd3H+uyekThXCGliHhYoF96Rjcp2yQBRigh?=
 =?us-ascii?Q?kM15B9zU5AVVbZiBkfGzfNrm4ZXZ9zXLZ/fLGQXRR7jNttGi5rAgWRQHjyM7?=
 =?us-ascii?Q?SB8OENd8JnucN80xwcxGgVMUSVFGgwa24/kNAZLFoxQo7/+ZuZhNLLMBt5yh?=
 =?us-ascii?Q?AP6TVBFZZW+1frSX+vtDVo7MZFe55GIfRrZgNNo12Sd/Bkaxi6NphR1njsWg?=
 =?us-ascii?Q?2qu48qzvChkj4LSNcLcD3ry6fNkQPgWM5EXaRo433X36PcHVELFMYLBgl+77?=
 =?us-ascii?Q?d70x/y9jnYWhN3Lp+HtLDGKiY4VP7du/qc3vjLhSh0mTuZJfIslyWlNms2co?=
 =?us-ascii?Q?1JDazSeOdP0W4ucGSjvmfocc7EMycwCNLKJCgcMjqgRHm4TCfCO+Hfcon5gu?=
 =?us-ascii?Q?NlgkbRG3fqlQ/NOomkhSvBdJka8Fd0nJ9FuxQEfASsnpimX1WaE2SjBM1zZ8?=
 =?us-ascii?Q?+PoxSrBu7Vk44snhzQd6WCFA5uivxnb7tApovzp24+ygtAbhPCJTBGLLOre4?=
 =?us-ascii?Q?uCVjBoKojbQytPuYXkbXpsoPkFmCl4lcW1P1AQ825cuYxglnbRB8WHBYbbBm?=
 =?us-ascii?Q?SoXkMN1Woly3f/y6roEcyqLuPZRO/HXDCrJrtcF17+1Jc0/wnM6CROfUCXMj?=
 =?us-ascii?Q?uYfv0Mci35KO9E+xNC85V7kl6ytbmYCvvGRxkjX04yo9jzm3YWCozkWnp7Su?=
 =?us-ascii?Q?7xhsIG2EZHkk/us38KkfV+SVdHIiYQiUeRBqBjyT1SzEXyIlVzV5eQGmDlYn?=
 =?us-ascii?Q?xX27JOxTdnmQ5BdjxLWFECmxam/FzcR5LVK8xjhgkVXrMbHUm8oTcmHYxlhv?=
 =?us-ascii?Q?syUgndcwEt+yaOBSd8mc5PDSXmYw64Ha6xD16X+Id5JSSWWoMxtDrVGWFX4Q?=
 =?us-ascii?Q?qnU+QK9ckXAuncP/20Nldu2xG6RVs+d031hY2zDh0QsjqCyXe71cWmJQ9lKg?=
 =?us-ascii?Q?IGNQ5SEBGKpNwBH6ASG7IwuAzwmkPT2mKIc028OBDi+UyYTs3/seKLzZ6u1P?=
 =?us-ascii?Q?l7ZKIX9ubZD3vJz5yqcwQhghN39PxK+VzfOnx+Bx7j2DmiKKj8nf714jCReK?=
 =?us-ascii?Q?a4LVeeo9UEl8QStEMzG/qsIvv9YEe+/D9RHxXdajg160CY0uaF/p9g2bVNpT?=
 =?us-ascii?Q?g0WtA5DA1gDI9kbdk0idOzhJ2iiDliHIriMwGTS0qsFOi3ZctN4rgUxUvuX+?=
 =?us-ascii?Q?tr9Iozhjn95G2ua2hLnm7QdcfjdHVUU8pp4meyV7fTTyAUNQP+QlK+3V2Z/+?=
 =?us-ascii?Q?8LrG8QLCag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WHnTyMuUpBhM5J0cadDMNMNTv7nwvbVNMfk5lcOGtY1OpDiQLeIXYSnhBmiUxpgOVlgwlYc/FNeoeR85OgAWyq/W/pdU9jsrzAr7nch+egl/pmf0WDYQEPjtZ8A5MIwL5cAL6/yFfm85aIXNd45Z87zvcTikd2jlEaTjmbTdxLKYpNI3r+BKJ4pfXh+y+g+djsSScKonREtNpu8r9RSK9SnzR3hp+EBPy/F3E7mqoydXO0TqsekM1Nwg+9PDbrmA/4O9poL4ZCVa+EeMxmkLaK+68a7RA2YEZsEKJcc6P6fXVniTB2zGYfsdzbpEBWtqiw68cwpNQN3YjSNxQwwUXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88ad796-c790-4369-7211-08df07d4ae2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 02:56:54.6108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pouDRicitB53gGCx4OnBl056/xfxBZdiS0N43wEWO1F94CW0S2/A3b7/KwO2FHrHjnH16Odl+Rlec1RL2A9idA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

> Subject: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP transm=
ission
> lines
>=20
> The Adaptive Sync SDP is currently the only packet with a programmable
> transmission line.
>=20
> Make a structure struct intel_dip for Data Island Packets. Add a member t=
o
> track Adaptive-Sync SDP transmission line. Include the new member in the =
pipe
> configuration comparison.
>=20
> This will pave the way for supporting more packets' programmable transmis=
sion
> lines, including the common base SDP transmission line introduced with
> Xe3p_lpd.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dip.h           | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display.c       | 2 ++
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 +++
>  3 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index 25bae4a04d6b..37507ac3e645 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -35,4 +35,12 @@ struct intel_crtc_state;
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_sta=
te);
> void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_st=
ate);
>=20
> +struct intel_dip {
> +	/*
> +	 * DIP Transmission line, relative to the Vtotal.
> +	 * The programmed transmit line is (Vtotal - value)
> +	 */
> +	u16 emp_as_sdp_tl;
> +};
> +
>  #endif /* __INTEL_DIP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index bdf02b67c1d8..c84ee0e865ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5507,6 +5507,8 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>=20
>  	PIPE_CONF_CHECK_I(set_context_latency);
>=20
> +	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
> +
>  #undef PIPE_CONF_CHECK_X
>  #undef PIPE_CONF_CHECK_I
>  #undef PIPE_CONF_CHECK_LLI
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index aa4772a1c208..6cc3a4c2f17c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -46,6 +46,7 @@
>=20
>  #include "i915_gtt_view_types.h"
>  #include "intel_bios.h"
> +#include "intel_dip.h"
>  #include "intel_display.h"
>  #include "intel_display_conversion.h"
>  #include "intel_display_limits.h"
> @@ -1301,6 +1302,8 @@ struct intel_crtc_state {
>  		struct drm_dp_as_sdp as_sdp;
>  	} infoframes;
>=20
> +	struct intel_dip dip;
> +
>  	u8 eld[MAX_ELD_BYTES];
>=20
>  	/* HDMI scrambling status */
> --
> 2.45.2

