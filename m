Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5541DC982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811410F14D;
	Fri, 18 Sep 2026 03:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFAu6aq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39C10F14D;
 Fri, 18 Sep 2026 03:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789700758; x=1821236758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+NwGLGHiZE9sgI9JbC4XjCl/nIthEFiaOtsn5WugJt0=;
 b=PFAu6aq27rc7OuXcZSdNLFvV1FckE+/IsdNOx1nUQRY3R6FgRytmUsov
 Z8LXWCJ4P/nEwyz08KuGLiOaovAbFe1xaQlMHf4ucUvVCllXwMaYasJh9
 RGoxKN5Y8xc5xoxME6mDBZrsb2Y18Dwoar8wAJ/gBWx7X38oS/S6yqWyA
 7YJ7EcZOb4PGtjV6XAJzHCuwbDc5uHuFue7svIthquyAcmd5oTbLZVVJ3
 t+Pk1+iFw13j6QIkemu3xiqR3LuxOMvop4hhOMdkUGsoZpOukqoEP7YtK
 +3K5K9mqH16EKX1XEIK5Ow8rDttRzVWE5JGcCq4g0lmXGLyCPsugPf+LK w==;
X-CSE-ConnectionGUID: Q9DFZCFkSJmBgCrD8nRIlQ==
X-CSE-MsgGUID: eb87ncy9TTGL2NPetJNhFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90197878"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90197878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:05:57 -0700
X-CSE-ConnectionGUID: GPPkTF+6TtOPW7DCANTuZA==
X-CSE-MsgGUID: FrvflaNtShOYOOXuRyif+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="299257664"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:05:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:05:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:05:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:05:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgC69+ImMZuX0ulPK3h87wdfmPCbGg1N3/WgdNL6Q2XH5SJHoCZuObzjle7WdXuORybU37c4T1iXBDZjxCe6V3JbhzsKz4cm8UoSOkPtKv9PBe1RPK6OOUrq0W6GGPL8Bd/yFEwPbqxEkV32D7adSaIskdLvH5Oe8XcawlQYHnswvkyqdEyHyrqXjrTJplucrGO2TAD4tzBQ/Yl4xH1M+XrmPRBlcOQzuBmKoCAMrJmiaqFf37KlBRcJX34v3e/F1vyK9jNz7wPzfd5InAnphFzwpyeyVxCBioiQ2ZWxiuEHAXCFesJwz75nIa9Gk+tPAbzmd33fMJ+zcrU8DnlZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wvjNe/dTdsbXOwzlo4XW6/HcIQtpBYiDlZxjyGII4k=;
 b=Dm9ARWQK8WRliKCPvS9ye4HjQTfUVgN7vAFxqmj4gNspJxzgS84D8r9OQg0WEWb/x8iH9JqS8G4Fx1nZ7w9S7DNHJSQAQ5HP9Y9UCblGOxlooHE0xP4SPdJcnuvay3udR5s/BqeDmCG9fBX05ySr3Fi04KLHuRGVeN7AvsYk+GbTj+F1U0hKE1itlrIgJ87ACY0Msy7RgY0hWFQzTLVg3Nq9SL/LsyLrtS35dcwPneCjDL0tFJoBIKxbHHDW4T+8RojthdMaAvAd6MYEGrknV7SP5JxEe5sO6xffHTzt8D4H641ne/YgJNpQfkes0MPtXCicSR071vvVKGnMP49fVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 (2603:10b6:518:1::d58) by CY5PR11MB6140.namprd11.prod.outlook.com
 (2603:10b6:930:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 03:05:53 +0000
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b]) by PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:05:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 04/11] drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
Thread-Topic: [PATCH 04/11] drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
Thread-Index: AQHdRbWkAF+JCbjS1EqB5agKCd7DArbTqaxg
Date: Fri, 18 Sep 2026 03:05:53 +0000
Message-ID: <PH3PPFE26A71A1E631B458206DDE0BC0DFEE3872@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <f0652fabfd6143680decd826ec74cd5d1116195f.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <f0652fabfd6143680decd826ec74cd5d1116195f.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE26A71A1E:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: b4d53111-071b-4b36-502d-08df1531c03f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info: L0MY1N+50Um3KocmksgMVpm5FWLvMlnwxCMqmgRxj5MdHsmtFiFdxBsYeTxfZd7CSI8RLFLI5MywCr1p9pet7xQHRzvYq6XeRBH4x9QjDb2pJtVkwPZcaR88+0g8UN3N1EwCMzoaDwUO0sX5meTPFNj/1L/5uAzqSFTinI1K/SnX5YjBSZytggTITTww2a5+BAj/4taSj7CT5WWuuZezXvLSj6GQbJq+rERsco6n3NAS4ia+wHMts9Ubp/8+hfg5Jt7d6MfPaV1MOs0KaISTUuDQBA/NBDygYf4ld0o6m4r6xBzZ1jRvmoN11JYVEJCoTxE6Pk6dISjd4Bon7QpdarFnkY2YysRYWvOUBPk196lFPkVppmzDYq10jlcC5hrOw72aABCVHeCoo7Vdr8ieaur9PzteHe51V1eo8FHiHb3QDwBWTDzWQ/i/Aqy+UoemI4hHBNdTml0VodYEL5hFyF1j+fuW/+TJvXGfi25lUKrUT+XFzgFtG2pWgs66kj30brZYnC7Y4cS5Tz9YNUdW91N49jej1zMl93pU3RhoGOW/ncE0HlQyHK/xOPmvyy4MnTVkxrbSlEHObHWghDZOp/qN00iIE/eRtDgBTh9gLX/J0WpsXbbVmwH93dsCEm9oQdnA6DhPdbtAkPTX85fVYxyazwWOjnLMxGbnGyRD5s9GPU6aurCZ+aqU3p4JzPN/2Mo61JYHKC572x3+9RRUPQcBk9qJ89nSdUFB3f8jZm4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFE26A71A1E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OismA/AG8r2a7AxJ3Jf9+v6/wWdMiV6EwpGg+0xsKwXOcD/DdsVCKnRpbqTl?=
 =?us-ascii?Q?MIQN1ftQz59/TDvbcXePlpI5khCx0t3eT3tKIDSYc2VU+yJ8NDtplCjPLhw+?=
 =?us-ascii?Q?1mYVEJ1Do6ryEM7CEqWmX6vaS05aVHQY+SX+bsnl8R+sTKVIWNJB9Ug8I764?=
 =?us-ascii?Q?MGA/KhoVMWiAZeilhc8mw67JXaKE2P00NhTeX8tF/6fHf0yNtT8sfgGQhRBe?=
 =?us-ascii?Q?wRmitgVfz+c6hCsXGXo3nbZPUj0E8j9Wv6g3hVWotViG+gOBE4D0EECYqhmX?=
 =?us-ascii?Q?j/tvOzIfMYXLUWqvMosNDBwRgusI+YMHwKuYRLvHoz+jg3aZm3iUzYh3Bbe6?=
 =?us-ascii?Q?iKh7GE8orvR6yFSmr5xIhDZPlBg7S1uPKX6HJTuv/9qTs3r2iaCg7BCbsMrj?=
 =?us-ascii?Q?c+NVHqK8TImezlFJdcivASJHmGq/5ZMDpBbL/MTAE5GSQbwJc8PJJeFZ3Zfu?=
 =?us-ascii?Q?8NFLm00opgB/RwtyLrEspJJZvukzBmPATQqEpPswMjZHUh1eVonYBcmPYIf7?=
 =?us-ascii?Q?h4VPIbu+zX/XEiILLqAP5ctkamdN/ROKy5pOrUxu4sFl9cyTkQYHHHzBu80M?=
 =?us-ascii?Q?MtsU2TR+0WQkUktjJbwqJmcMKG/knFilh7JRONaXVoc9E9DuArO9Y93ZTSlO?=
 =?us-ascii?Q?FL48mGSvs5G4EVmgiO32w4eggTAjWs5tK+V9UD9ZVjLF+F0pW3DGD31qFjuN?=
 =?us-ascii?Q?jNTjqLWeFx4zY1UiQ2CE2seNoCDf+PMmPQAwyhHj6X/uQw9qXlhVE3LamHSG?=
 =?us-ascii?Q?35biPx3Okrwzi95oETOfUKEW7F9la6Dgvu08tgzoA+hhpDrD5Cm6JpzhbRK+?=
 =?us-ascii?Q?gldjZxOqGxvxndu4RfnWuEOQMz8Lmw4Bhe7LHfpxZ+AqELkH5nea+uMX024u?=
 =?us-ascii?Q?bT0dJjCt7Y007HMSVoVtiC2cEx5rGjTrLbFl50EG+TiJtwjdU2PQUDOu51lF?=
 =?us-ascii?Q?rQ4rzAMVbU0ulIFmPOCs0ly/Cpwl6/VBOc+AGfiJQQHSa55n3FNHFl5tqliI?=
 =?us-ascii?Q?+dR9eI/oT7YXTqm40w5goI3at3IWzw2ZFGrr2I2rq1jpPlnkMkq1rBU5IYwO?=
 =?us-ascii?Q?JTtf7WhxdSNb5c9d5I5e1V2SfrJe40zTk9x8Z+MC8dgTpxpCLIj9FiBXDr5Q?=
 =?us-ascii?Q?3XxVdBJs6UdlU5B9eMHwMNj1+VkEnBz22EwxT9v0/RoKxVI9XQTw/ZFbGiSX?=
 =?us-ascii?Q?vP5jNlarmVtJbZNfDfzJM0IsDAQQZAP6JS4WPAxDAGqi2fiJtnAcg/bwzhSS?=
 =?us-ascii?Q?vftVxWtmBW2vDF8RwuQKDPYJjPlZytrKaYJvNHxqv9ABNAcSdUZZu53P5hmw?=
 =?us-ascii?Q?QMTL96ufEAA22G03gaYSWmc9yYk9NU9zHRYOL8UFRbJ78K2LHXKhAPrd2CsL?=
 =?us-ascii?Q?oJViMMxbXxsXKNIZa3ldWMSOAhNcAgEwq262jPeylVlq3ZhWbHM6rV44lDgf?=
 =?us-ascii?Q?IYUoZavaMqzFaxDB/cpvdnJpTFLuCDt/UP7FrlZ8v7IJjzonL8Sw1kclJFxG?=
 =?us-ascii?Q?4+f94emGvSpw+tpdzG4pZ2lwLyhE6jOh7KzbtX7+tw4nCCeIOxAnns/Ee32R?=
 =?us-ascii?Q?AMBE0XsJtnPkM/e5OPgt1eOVMfTaqjFR7zePFZIW72p3VmGHWuZZlkZhrtbj?=
 =?us-ascii?Q?IVFDMcRdW3awnQ/mVo7GE1Bln+suO6YqtJcIeC/JMWumFPPlwwHew+OxO7gr?=
 =?us-ascii?Q?LoiHxDzOdLJiIJxX1bH8wQ+Z8rBOAoAkLVZfMPt8IJoFWmeTtoOhYMrIKRyl?=
 =?us-ascii?Q?ngwQRXV3lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4+sSRcAS5WgtLrZkamGJUJIxFLWgKfs4n2GgWIxV0dVSV122Ya8ij9BYnyx8PtTrhfPIslO98ijwtLo+Ghin84eVHzHbj8LBFyfvteQZOtaUm3pTjM+/V6IIw08rPB+uTw4rC3qyM89+ywaVPVhSwmdd+SJ6hBoRb/EBm+xxr8i4qXHP05HgyPMeZq7QSTzQwbze2eD1nYVXjuxC1QJDdz5qABu2AyQnDzVRSfNiWcFhkpC/foFRZINj8greDpBhEbicaNbY2L9BpR1if1XkjByfCcd7/zCFpJOS2PaMsMkSOngULlPJ9ZbcQYKkQOYSeBJ1FHmz+fE4vOquiOVZzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE26A71A1E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d53111-071b-4b36-502d-08df1531c03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:05:53.2651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrJ8FPgRBqe4wIZ/yO+ZLkNacu5l5tHIAFwXc63M9SYjkeTmQ4dATebCPXSdMWZIjDwLvu5/QroKbEMqxEKywQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

> Subject: [PATCH 04/11] drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Use local ret variables for the return value instead of checking inline w=
here
> sensible. This improves clarity.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 9b3b526e5e55..fbf485a54dda 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2331,12 +2331,14 @@ static void
> intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
>  							  bool enable)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int ret;
>=20
>  	if (!crtc_state->vrr.enable)
>  		return;
>=20
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_DOWNSPREAD_CTRL,
> -			       enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0)
> <=3D 0)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_DOWNSPREAD_CTRL,
> +				     enable ?
> DP_MSA_TIMING_PAR_IGNORE_EN : 0);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Failed to %s MSA_TIMING_PAR_IGNORE in the
> sink\n",
>  			    str_enable_disable(enable));
> @@ -2347,18 +2349,20 @@ static void intel_dp_sink_set_fec_ready(struct
> intel_dp *intel_dp,
>  					bool enable)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int ret;
>=20
>  	if (!crtc_state->fec_enable)
>  		return;
>=20
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
> -			       enable ? DP_FEC_READY : 0) <=3D 0)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_FEC_CONFIGURATION,
> +				     enable ? DP_FEC_READY : 0);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in
> the sink\n",
>  			    str_enabled_disabled(enable));
>=20
>  	if (enable &&
> -	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,
> -			       DP_FEC_DECODE_EN_DETECTED |
> DP_FEC_DECODE_DIS_DETECTED) <=3D 0)
> +	    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_STATUS,
> +				   DP_FEC_DECODE_EN_DETECTED |
> DP_FEC_DECODE_DIS_DETECTED) < 0)
>  		drm_dbg_kms(display->drm, "Failed to clear FEC detected
> flags\n");  }
>=20
> --
> 2.47.3

