Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E7606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfyBn/tA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C6F10E545;
	Fri, 23 Oct 2026 05:33:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A512310E527;
 Fri, 23 Oct 2026 05:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733601; x=1824269601;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3I+EXqARu61kJnSZMT6YJ15e6KL7lDI2yE/p/0o52Fo=;
 b=JfyBn/tArgyeJ4zM5+NkNYuF4y7X0kUNpj0kHBUpNXMBQCMrhiofLmVd
 s2f36nUHeij/I3RJ+SlidELVv+LZIj2AAXpULLVVAHvHJexEDT6iPr3hy
 Mi38Cxj75AmwwTBn0Chs2tVPVYqE72sCfvsIfS+OPtoErPiOf1CT/kxo0
 Rx34U6uqCEn5ZigYQj9YPMOm6sXG2pjZHk2KCIe3kpVZJsyY+6l2Qgw9r
 c9QKVBGi5q55WXeQybiQOorxUj1Z/CDWoYUEJoOlvNLhC1/F5ACJwC/rJ
 oLnY07+2949gTwgcpi1ww9x408AnG1w04BYeXo6G7xcDtjJNNQzUHJLxg Q==;
X-CSE-ConnectionGUID: rNwWR7dQRiW6nuliG66oWg==
X-CSE-MsgGUID: BTTBrsHyRRKQx5zLEVzVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1504473"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1504473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:32:56 -0700
X-CSE-ConnectionGUID: t87qK/qkShW0+I4T7MgywQ==
X-CSE-MsgGUID: w2xtEHB3S8KdWJlhKG6BYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3930862"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:32:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:32:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:32:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0kGOsDOE+S6XscmJFBwIhqSPpnsVLjFQ9bzczVvrxo7oJCOMDlb+fH6RP29QUIW9GAqVZgyAHdrI6jpY2wPMS06WxteAcTO4+xt2txm71QNMDLB/A4Z/lIbaDxmR5dRnfJVk6qTj2WJiSs0Xqe2uLw42WbnV+CvB83z0cRhE4LFgQdjS2zxpwsZ2jMLEnfx/EGInhVMmVo22VcZ/SCRwU/7F/5IFms8BYp+iOdp0vQIskaqyXCpbmSlF4jxA8HRODfzjcEKOyq+89zA/EPg9iH0s9TBElO7PeaGe+zI2Leb9bcMc3+AaNLeDlAuSpFKkxoLHfCW9dy53/mbi2HElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdEJLxu5Olh8H0WxusG1b9tqsSIee4ieMcj8h+BPDwI=;
 b=F6fBsf/ZcT84WRZMQ5OUvD+7bpLTrgUC8I+M5L58h8VT2GlkYrivvUbeLEwuNxI6ONNffIthVUTedkCwX3GeYnAFDUSa5mW3EUPSfMAOSM2VdM8hAHqxGOoy4nQUnWkilCJHHM5n1stoFb2KZCIVLVTfJY4xeuPFa3zG2rJ9ysKkPRDjzOUN0XDdACTy75ia7a2tW1bx+yMD1RWRJyHY/rjuU3wYOMnsVwVtEV2l7kYpIEXl8tmRfqo+8cPwZjgRcR3wJUR1Cy4khsUO87s+JGtg+0Pol/ygRA+I2dx5DgZAtLeIbyfWLiCvoFvwViba+Purp+ZGsUsC56JRYa86IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by DM3PPF960565C2F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 05:32:37 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:32:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH] drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to
 A-step
Thread-Topic: [PATCH] drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to
 A-step
Thread-Index: AQHdYdq29ASepUZ84Eqgx/pz8R2x5LcKnAbA
Date: Fri, 23 Oct 2026 05:32:36 +0000
Message-ID: <BYAPR11MB37839943422BCD5916FB6709B2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022040528.1403569-1-suraj.kandpal@intel.com>
In-Reply-To: <20261022040528.1403569-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|DM3PPF960565C2F:EE_
x-ms-office365-filtering-correlation-id: 16fa1640-de78-4bf2-65b7-08df30c70bee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|11063799006|261009223027099003|10067099003|261021123027099003|261021121427099003;
x-microsoft-antispam-message-info: I6IZLVuYMhxPOH3SUQei/Wq2V32aqydWZtau920wW7Dl04vMHBnVBf95oYwyb18ceA3uEFf2W6bC9vVMMXSWhw6iPn1dAGmOJN6suVnc5THqrsJdrGIVUdbI8fWHimadnNPb6r4CF1lRdd2X91aVtdEp4NAguZTo4d0edT1cst92IAaTlYS9jwm8etIHnqM6ibHie2qVLYW7E4ozQ9S76dCieMCMsBUDi2EiB41aK5RmwrhFFpMbsAVpff14e74zf3iHfYEWPzCsjxig0OujitDY8CkdqB3X08wRsjIWpv1jgbw4Y3KNfJ8ddv0oikLn+Nu7BTTpamWEongpDXhrgnRJmG90vKi07h9/THG3dN2ygw00MtiPM4GDM0vrhTRp5+LvjN2VnKOPwiFNX6wnJYWMY6iCviZI8t98ncKLNRxzPkucoeuFK+kRfZtwe4rtqvZPtXnXSndVHRbUrOUJ6DgUNV0+wgqqk/7B8etd+iQdKyt6n1YROj8ueIphNeNfY/oGvcMEJ3MxTecJ97asG3xL0UYErRFTZVbooRig1P9EbkPCuOYIkNSoyfmUb6KpKvLzeIDnXty3wjzm3KiGYHaXOObTq3/1NliwuCFkN42+YdJMPOlarfhLsqOx93eFxn9246zLvPgjCDLWnHf89sv0yRt86Be2OI76qdPwPOnvP+Fn/qI0u4bFR1ZZY0xMQOh/3WqdYgsNxop9DKvmNCrxUNvCi1cUSx6SxNpFhdE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(261021123027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vAEymYDNWROzX2xufDi3qq7GZim17ILBifBqvY/1kBPD2n//pOcxFqRBiFtA?=
 =?us-ascii?Q?XLYd6hMd72xWzcCm3YH3HwA31JSXyyuvpgzuv4sNgqp7lX3fUamvpEY/jLCl?=
 =?us-ascii?Q?daJF3W6U9tTNTg1k63QsW3S75anbc5EroFZwVWzpumIFDCb8XsEtkLiUPm80?=
 =?us-ascii?Q?qgrleMnp0+IbIchKug9r6uLJG/WXFJOy2Jt+ejzNw3mtyvcnt+4aKtzBhGcr?=
 =?us-ascii?Q?xLwXrUYzb527cRrHr43UEFwcQHAlWeojDNUonWQLG4RXteWmvRmAnU673MGk?=
 =?us-ascii?Q?wACdS5v/8k7GzAVRE5L78z9BU3hrz2gDsFd+epGYjaxTlaF+E4Xrs4m0h7zI?=
 =?us-ascii?Q?zL/RGDMDZzK7csJnUnWvjdzxAWP5ULtLxEMfWVF6Vgqf00k7HNSw4hOxFRfJ?=
 =?us-ascii?Q?d56FLO8m0doCwa6upTW6wZg9b6K6i4yWSwdscNGfxvOEMBz5kQ36Z2EnIxs3?=
 =?us-ascii?Q?y+Miqh3aSvubltBW8K6GDcUrGVLpDN3YBfgUOU0j0sM6ohgz5r/hovItPVbx?=
 =?us-ascii?Q?M7Ha5cL2JPRDcwlEoXLwJwJlcgpMLsC66MnxJ2HWhoZes00J1SzTUQSMMG+e?=
 =?us-ascii?Q?JikDYYillTAnPFr7UISG/RDuH+bXcvAS5Jv1W/3e2n/rLgHXWmiamPhl9YxQ?=
 =?us-ascii?Q?yn1W1/wNQhnK9NOXIK0BlcILBCSr68NkIE05NLkHFeLUxyOO/1HZj9cIpYTm?=
 =?us-ascii?Q?nxy43pDIUl6faJcEvF9PXa0dhqX//xJSPPQEtldIvBC/b98DpRMJT9h69dlD?=
 =?us-ascii?Q?Mk1aG3rR6mi6V6XNVm4QzuBoZo+CpsXKanoJ5s1bV52lSXGRGcZ3HENVuY16?=
 =?us-ascii?Q?uslfek+C5DewsRJxRi4zne3suVU49RNMi3UuncXm3hpnc8QIz0L/EGEDCMnG?=
 =?us-ascii?Q?2mv6rQvxY2S87g0Fi0+VYyOyUZy5GFZ0cp3IRqPk1a+ryAPAoL7nQutgx5k+?=
 =?us-ascii?Q?ZfAtMYBIVy+WaVB0iqwa+EMKTmfD+e62yKJ6CDG8JfpX+MWgPEhsl6BA7jdk?=
 =?us-ascii?Q?5VMrSEfUXJXpiqMDW3GWrTaTjy6DOCAji8KqsNIHIZffSEjjurnY8HSKR9YY?=
 =?us-ascii?Q?FBLFF0RVi8pHlgZB30RV7vcrpC3sk8sS2kENXApbJOr7719IsD7uodmr2krK?=
 =?us-ascii?Q?K/DPRBA57ygWcdagF05yvfZiJnrgwVuMrb6+ljFjmwl9LzrPDyfrAbUPdxsN?=
 =?us-ascii?Q?w2jWNBSJf8xe2IgcmwU8EnM4+afXwfm2qAm4kX8fbbr9BTvw9yQZ8hzV0AvM?=
 =?us-ascii?Q?VncQUZmZ8Kn27uGXZ9/3Nj8C84m9J4OMcmf2XrrleeP8L9rN+k2XRLkFQShw?=
 =?us-ascii?Q?P7hGnnCQeyIX1jkpNf/+NeOyYC0QfjfzrTKN6cZCqDqmoc8fCUdAh9SkPqIO?=
 =?us-ascii?Q?oJfrGiW0Q8EFAIqcGCySJSkoDctFxCJGfhhqgxhNiYKtMg8dmddF1qkS8Ker?=
 =?us-ascii?Q?GkLniu+4P9VBALRVbR6Yaim95sXiKtYDoZiIBExqaqM/6eWthRtDvGD7lPzW?=
 =?us-ascii?Q?0QxGF1IM9UA6yjTeEk02qrap5gZPiAKebRpkAgO/jSOBZ3y+RhyzSJrue8sf?=
 =?us-ascii?Q?qRsyAWtMEmjmRX3Ccob26pcFvLjycIrrf2sBIixvGvckndooBwbd+iwSsCkB?=
 =?us-ascii?Q?rUULAGVUJVeXjdnb6OLvBc7ND82OoWPT8z/+Wd1ZXLNqlCVgq+cxWJf3lV0G?=
 =?us-ascii?Q?nsjAe3ZNidUo7dKtJS399cUwD+Kdpq0y0dqsqBC9d9ZKwfN5BusnqWAdp5ar?=
 =?us-ascii?Q?3fO+ctAZn6bv8wftc0yzihKjvgD4GQdC4gA7JwJewJDBbVumjvNj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UThvPTwVco9m9RVsJl51QIdRydHjZXmMtQqAvMKcSbpEdCvUSsMhwtOsKl66s6IM1D6Kg0CD95Zwz6IjdLHDCuA5iLw+hiwPKDHrMGl6kxwf0mA72uc5uMkmV8yIeA7LV4+biXTh7mZ0LrOMTeIVD2L4LlleTIStUJOmVC+i1LdtKyVD8MjyI/9KzGz0pWNW/PPzTuwGBjatcd0xIDA3GReV4PyRRoFmw3LTbzpwI5PkL96Exrz49Qs2CzdLYo4Tx9ncTRG2EL1fb6F9mfntcbbZd6HGNTqjbmbxyqLux+zFLAnj1QJgzfHDHXU8JtAXs1iaYUJxf2/ys3oDKbv3yw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fa1640-de78-4bf2-65b7-08df30c70bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:32:36.6554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDBGhdSBvR6hYK87sRahJ49Vz8Hqa+tkwJCXw740LAZdoaRbQKMb4Mj7nW7AcH3K2PZp60nRBKTmulLNFUdGPLelSz9qp5r64LruXigupi6hieu9mUJhZQtmqVPP6vVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF960565C2F
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: 22 October 2026 09:35
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH] drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to =
A-
> step
>=20
> The hardware issue which required us to keep vtotal as 0 has since been f=
ixed
> on B0 well, so applying the workaround there is no longer correct and cau=
ses
> issues on B-stepping.
> Restrict the workaround to A-step only, in both transcoder timing paths a=
nd
> in the crtc_vtotal readout fixup in intel_vrr_get_config().
>=20
> Fixes: a78d11e7859b ("drm/i915/display: Skip TRANS_VTOTAL.Vtotal write on
> NVL pre-C0")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_vrr.c     | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 7602f633f49d..de7168fbb220 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2844,7 +2844,7 @@ void intel_set_transcoder_timings(const struct
> intel_crtc_state *crtc_state,
>  		       HSYNC_END(adjusted_mode->crtc_hsync_end - 1));
>=20
>  	if (display->platform.novalake &&
> -	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
> +	    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
>  		crtc_vtotal =3D 1;
>=20
>  	intel_de_write(display, TRANS_VTOTAL(display, transcoder), @@ -
> 2941,7 +2941,7 @@ void intel_set_transcoder_timings_lrr(const struct
> intel_crtc_state *crtc_state,
>  	 * is the transcoder's undelayed vblank.
>  	 */
>  	if (display->platform.novalake &&
> -	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
> +	    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
>  		crtc_vtotal =3D 1;
>=20
>  	intel_de_write(display, TRANS_VTOTAL(display, transcoder), diff --git
> a/drivers/gpu/drm/i915/display/intel_vrr.c
> b/drivers/gpu/drm/i915/display/intel_vrr.c
> index d43a06907d18..b14750692ae0 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1147,7 +1147,7 @@ void intel_vrr_get_config(struct intel_crtc_state
> *crtc_state)
>  		}
>=20
>  		if (display->platform.novalake &&
> -		    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
> +		    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  			crtc_state->hw.adjusted_mode.crtc_vtotal =3D
>  				intel_vrr_vmin_vtotal(crtc_state);
>=20
> --
> 2.34.1

