Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC9C5516F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CB710E421;
	Mon,  3 Aug 2026 05:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdKYbzoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55810E02F;
 Mon,  3 Aug 2026 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785735590; x=1817271590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7olPIuxUXmaFB7gLim3NGfLUgtzgd/29youngcNB9bI=;
 b=TdKYbzocMp8u7RhejjQpxjdHCbMv9iQsLBDPFcNFY1Q3XYoiBr75QvL7
 6YqKapP/X46Y7oXOfNOFqfSZjlSy9cXFp1aJ2UGJGADPadyINxf2s31Uz
 CgMCvfZN0sPPm0Vhx6eYezQXfgTIaOe8HbNVGWBPcXJFJAC8V5m/UD7yV
 rH8F230IPji03h3FARl0MF5ruvgHXwRSH/Uc/Yrl4lmC+sspY8H++/xl+
 RLEEzAmA7LLs5SaAqhD+O3ZRD5z0N6W25oYYDbvdESfY/ApdWhI4zFGzf
 yfGZKtZpgqLeo46L3vzV+eZTFQ4ZuyJ+GUfdQ520zoT/36T0b4JPOs8tc Q==;
X-CSE-ConnectionGUID: bCPw7NZ6Th+Ul+6OZj1Htw==
X-CSE-MsgGUID: tntnI1aaR5iskBBX3/Zzaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86216131"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="86216131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:39:49 -0700
X-CSE-ConnectionGUID: oCqOKTjUS7yA5Dcaqjiw6A==
X-CSE-MsgGUID: Oz+iEYB8RbiYxEFyJQ4ADg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="285755421"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:39:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:39:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:39:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHZ020LSlAJ2dArS+P8zOLTB+u1b1lXoLhU+pF+3M7gMxvOOaOCDMx0w3FgT6xHQ24bh8/lHPIUqxAZCl10RQjkqg25a85Mm6RMlqb/xv8c0yAGfV2z5AbVxA6DbmX3MU6xNYqps+L9Eu3Cv4RSBMZmMGP6VyOI/c5J95oWOIWfrfcc/PvADp75geVrixz2gkNOTBEJ9Nk9XTM/+PEBvz703Q/ySgvpUiKjsC2PAAuf+euV0iBwUVDPJVCj0XyNn05j8y7b9rk/A1/2JExOkN0GFqFxBZtH4u5fuwrAfWx/jUqCnDnxAbclKzgIzI8fHBU1IGEPzoE6bwXg/QUWMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoVYdEAUEhu6crh1ZwblhPjzVaeTAUYTZN7j+1gYP/w=;
 b=ovAHRI4NkNlMTjbM3PO4srQRtfxHt70Vvdn1Z7fWmZz0npQDZp+Ye7EriQjUmOP56pInVZVPIYQjHbL5yxvoktcV8ItzcIORdNi4YVH2KBljmgg/i0OYbKG4mLwDXqWvqBO5aept+BqRs5bZz8gcElroEREFqJS/ckAe2O7o6eCV5O2x3bDWgxJ9eyoe8iAk/damg8T/La06/ZnDx5BpQ+nt6wtMuipapZ8zOGW39yckc5cRypH0+UMItzl5T6jNLEjCTuO0iqEooLuVIGsG1sSndypdb+nOfA6FhCylyJ+eKZIDa8QyT31mt6C4Af+Mh1TYspaBjUUOchTVNa0Rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MN6PR11MB8103.namprd11.prod.outlook.com
 (2603:10b6:208:473::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:39:45 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:39:45 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 14/14] drm/i915/dp: Use helpers for getting max FRL rate
Thread-Topic: [PATCH 14/14] drm/i915/dp: Use helpers for getting max FRL rate
Thread-Index: AQHdIBaRUSmNKIqK0UGqpslT/hwH4LaL1Kyw
Date: Mon, 3 Aug 2026 05:39:44 +0000
Message-ID: <DS4PPFE901A304F8A9F18BCB37879BE8922E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-15-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-15-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MN6PR11MB8103:EE_
x-ms-office365-filtering-correlation-id: 60829a9e-954b-414e-f46c-08def1219fc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|11063799006|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: eST2X78vwUddTrSAxFbW6E8Ru6vgbFlQyQIpoUxdt3cjVQd7eJ5EQ2CzFo2CLSyZnuZUH8ARa96Jd7ktC9lUtE/Nki434niAHFX38ZmIvgUfv7L460gMsZ4vc+HX7wEHsqEsMDLjJ4MxdLbRbOM5Ho3S7fpIjRwxJnnNfDjTdld170mYHuSMkEmsu/ezRCNY/03N42E0t1gTUe0etdWrPAQFXGj+xl53mkH8OwpMMZqkTrJs3yYJzxJ6N7doX1+XtAI++rKSmimLQxr7VN4JXXTxYH5XjNyLBJdacndKc7Hx3z0x0JJNoeubLiQ8Ne4vKNYzC/zuu+sJP5Z7ZXioo/HFNncCe1x7AVOkt4aW1NPu0GYVrCNh4cm9WAGEade0Erkjg8fLOnLTnLw72tZFHJB08sKduLY7JEiukbdugVVl5kSOsqgR2rGq0ZqgcwDaVq5cvUmR7mfGMEwPLCkhFPdJL2KRF6HQIf4ex+tzqXKE9qyH6HfN3lVaT9QxILar/vB6Bw8P6E9ZlJ3l1WUj9nzeKIhM9CN5M+mZERgAZBvXwhNtegoW6CcQcOd2uD3ty0qWUhT4AfaccGaB1UQfkI5RJhI2YBcSVoRCB8pTBr2GugiQw/YT2p/dGj4GT3fOUd58hP5RSNHHgog18/wkUhKx6/2MIJF4aXRt0XNfZyhxz2Vdm1ocBLv35d5A8wwL85b2Ir6rW/7vvQf1mggycQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OyO7Fe3ksrePQzTwosfArEvz3s9KOxfoMDNvCdRykLiRUb9nEGnaFc1ip8Vj?=
 =?us-ascii?Q?9vJ+nLdVuEUVEs3AVrhqrBJ67kEPee5nGh8XPVxYbv4TZSvICLrtdktWaIEp?=
 =?us-ascii?Q?8sd7te58yIYJnVPAtLPI3HHrs5Gynjo2sJYYfxbh9baTjjwHPmylRNDo49Ri?=
 =?us-ascii?Q?OUuPOM4XNSOK8UW/dHlqdHkfPAHXmxbKxkSCO1hEs6KNPpGZipYsqPESMPdi?=
 =?us-ascii?Q?RFUwcKx7oifISkr2CPGLUzhNOpEV3r4BNKTXiw4yGPRJAD95enDp/lLWn8s2?=
 =?us-ascii?Q?/jJSMXPfyij/MM3WsOYWzadhaME4c18zRhH7TCRyZyLsevHV6pXOSJTSfGdI?=
 =?us-ascii?Q?8CfPxFTHSMbLt1an1qCv91uS1Z3Bkf2CdhDs5e1dEOOrrHKylSpTijvSm9PU?=
 =?us-ascii?Q?rnbEUDwoe5Ee/5pmK2XgziswKe4VEFHl4qI3AGFXYbmRUJ95jI4kKEX9FCh7?=
 =?us-ascii?Q?R5VFEffGr16+B56kylUzOGSpcyB3SYVChH2zoeF2aKNOPbO3BTa7P+Nh2tDv?=
 =?us-ascii?Q?WjngZ5vZrNuShK9m7v2o2hP12Irl4iUEzZVpodxGHpcD7sPoiEVgQNMNAwzB?=
 =?us-ascii?Q?AR8SgUmG0vLCKldqOInB93CnGOpBzlkhJVk1kVp9ZbtFTK+kIvX0XwZUtVbE?=
 =?us-ascii?Q?g+Zw5notjOsBbWYHfN/fWVEJC7GPRtLo+KRTipQKYirKvVB6V3MmN8tFGB/A?=
 =?us-ascii?Q?4EXTyRyB3Dr4XLioUGqQ2HIireaoAggDjzBfi9+q8zXaIbwhNdlq6zsJ7A6f?=
 =?us-ascii?Q?QTcuBRPOeX0SYRKNcSMHggNn2xNqeR3H7D9OJw30kEd5C3CwecexmWFyjsvC?=
 =?us-ascii?Q?NJc31mXUsVMyKh177epqB11H3EJthSQGSmssvRORjVRaRjMvZaILtzPJaycj?=
 =?us-ascii?Q?KlJeYNlHIw7J4WAN6PeyAq5zo6KHexEmByGJdpwuLWB02ctz8E1IN+Nsg+D7?=
 =?us-ascii?Q?WpR3aB1+WJo7lQ5n+BdjEbuoY/iI/qnAJkZAiB50kFXObxQ9+Q06If3tc4Tx?=
 =?us-ascii?Q?HxuLEesi8VD/TW43XqHY/Xr6m3Qv4ClfjXedEkssnPkqwtn6/MIpY/TdvB0U?=
 =?us-ascii?Q?aNeO0jXCvuoL8gNyip6fyAPc+AIJmJF33yamLvEnIAegoUB+bWdnYzrmsAVa?=
 =?us-ascii?Q?/cjQp4HJ5FBaRZkNihBfgeGKxTQUrSsLJx5w7WdkgdCUtbzCeYbX3TPFPT/N?=
 =?us-ascii?Q?2koa+PJZtCVCOC3JgDQjWh+kLdONJBPXLqA2/RzOoTf198GdEvOlFfjXfUQ4?=
 =?us-ascii?Q?ef5/SMYU22yqD+yvDZswvIXy4O+Jq1OWcN9I5wocMemYIaz6jexuvZlHkvsi?=
 =?us-ascii?Q?rAekCLA8abT9O9EirV+ER0ctAupfuhOHeol7MjzhNi3UcDJmfnP/850kbopA?=
 =?us-ascii?Q?Bg8TyhmDtbLYJB8z2fF3CjBYANuv/a2/ZiOBoFRWitJbf0MCtPD68+JbCzyk?=
 =?us-ascii?Q?Zo8dlvxFuozSkL8F+8Wo2RTcHALPkTAs+rSQZpKCqStTD7qbMb/RRL1jUd2e?=
 =?us-ascii?Q?trTGhoPXLfbN/mHsy9f65gSPxtPynKVRAaX4+dupGpI1v6HoMWaNOSUAWdtD?=
 =?us-ascii?Q?u1FxCAFiVnn21jRrD2WIEvvOKtsRpUC36tUFxFO+MU715xNQ9UptSxv2vgMZ?=
 =?us-ascii?Q?oArU/1Ggf+SVaIbqp0lxN7jyo5SP8vVfaWy43UfPYTD8FI5lc7o/94lCooeQ?=
 =?us-ascii?Q?ZB3ICE/aKMHC+5WrvMrKy4c76Ann8GjNMLqjjQlvQ26br52XOX3j7Ztbrl0b?=
 =?us-ascii?Q?iciWZgHXVQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fK6/BfhM+PSB3Wh75iINvuUR7AvCYrxq8KD0ExUUYF33oz2I2IoReSfNjvsHShIGMmcPUypeqjDDsa+ZKiQewIZssFl29PjpsjyIEIvfDz4iStAXatAcyDmJzNREoCaTJ0W2c5JI4XOIRpVyGDecl5JbkX/1LI+5ojGsQF1T5Yw9XwZrL8ebJsJCU/jMRtCIoxKiZ+W1QLvMiJUxwT5mLXqiNw0C7cjI9p3VOc2KC6MtRacmFkIzmn8/9q0MsqERQyZwj8hUCguxt4vpX9WsgNbVRy0aFd2i9iEu7U7MPK4fRiyYg1gHO2u0ZbelLUSJCAi3wsANHS/5EoPR/u3k0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60829a9e-954b-414e-f46c-08def1219fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:39:44.9341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rowNbgXryumvnBM51ZYSKWmxi1++/TJbCCpZvfCMcn+iLYMLgBCgx210VJqouW3y7l6iGpfXIlO9M+4QStiATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

> Subject: [PATCH 14/14] drm/i915/dp: Use helpers for getting max FRL rate
>=20
> Use intel_hdmi_sink_max_frl_rate() and intel_hdmi_sink_dsc_max_frl_rate()
> helpers instead of open-coding the FRL rate calculation.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index c316ff40d22d..db0f829426ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4223,14 +4223,9 @@ static int intel_dp_pcon_set_frl_mask(int max_frl)
> static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)  {
>  	struct intel_connector *connector =3D intel_dp->attached_connector;
> -	const struct drm_display_info *info =3D &connector->base.display_info;
> -	int max_frl_rate;
> -	int max_lanes, rate_per_lane;
> -	int max_dsc_lanes, dsc_rate_per_lane;
> -
> -	max_lanes =3D info->hdmi.max_lanes;
> -	rate_per_lane =3D info->hdmi.max_frl_rate_per_lane;
> -	max_frl_rate =3D max_lanes * rate_per_lane;
> +	struct drm_connector *drm_connector =3D &connector->base;
> +	int max_frl_rate =3D intel_hdmi_sink_max_frl_rate(drm_connector);
> +	int dsc_max_frl_rate =3D
> +intel_hdmi_sink_dsc_max_frl_rate(drm_connector);
>=20
>  	/*
>  	 * The sink's DSC max FRL rate only applies to compressed video @@ -
> 4239,12 +4234,8 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp
> *intel_dp)
>  	 * the regular max FRL rate is the limit.
>  	 */
>  	if (drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) &&
> -	    info->hdmi.dsc_cap.v_1p2) {
> -		max_dsc_lanes =3D info->hdmi.dsc_cap.max_lanes;
> -		dsc_rate_per_lane =3D info-
> >hdmi.dsc_cap.max_frl_rate_per_lane;
> -		if (max_dsc_lanes && dsc_rate_per_lane)
> -			max_frl_rate =3D min(max_frl_rate, max_dsc_lanes *
> dsc_rate_per_lane);
> -	}
> +	    dsc_max_frl_rate)
> +		return min(max_frl_rate, dsc_max_frl_rate);
>=20
>  	return max_frl_rate;
>  }
> --
> 2.50.1

