Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4E5C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760D010E3FB;
	Fri, 17 Jul 2026 04:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWJMoRFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567CB10E350;
 Fri, 17 Jul 2026 04:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784262540; x=1815798540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ZqlJPlMp+1iUnS348tlm9whHk/uTq6Ru6K/o7cN24w=;
 b=iWJMoRFCohIHIG0EN9JBjEdBrCmjbJ6jywRcbzIPYcyhahdvSTGY6I4L
 Mja0TSCh5egtj2zKasYHzdcrnmEny14xyeqyli0Y6PVumfMHbvbzEn6dz
 ARUNbUWCQfFGoyxzvyiGpxNhtGKOPDj03qqM8MjFQ0t6yaNr2YZBK9+AF
 yqSrKBWQ95x9XkzK+PrYCw4imWsqtvb3+HeJbvXl8y/H3mWUlY5go3l68
 LhICXcUnRdBzH4+lVVtjuoWZW3WZ3nMKelRozmJXKcjSbPbsy8wFSdHt4
 XexDXDREg1meJJuadzFV0zDB8DX2Ygv+3eRgfaANXLzRujqyUv8eZME3W w==;
X-CSE-ConnectionGUID: 0Ms8uaubSFG/QQuq4XieiA==
X-CSE-MsgGUID: fWANCjmhSROVnj1in1Vj1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88608157"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="88608157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:28:59 -0700
X-CSE-ConnectionGUID: tB7RHWO1SV2LnFLTFckg0Q==
X-CSE-MsgGUID: nSfls96lTaK1oABPfxVYDA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:28:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 21:28:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 21:28:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 21:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JP9pzl97TGiW3yqzY/hsHl10kAL/eP4szayjzG4YZ635ZooMYkbGf3XF2a2iwmrJZrVcSj8bNGzEHaaPCbkgwXzhmNVs/yNkq3jXsfhnZSO3G81dtTAh3dQkhzrL+b+AebreAozcAlz83jyp2JK3lULdaG+lbrX+OQHlmERQta2MoOsIb+UpbGq1J1+yHw8GpjuE9zFk900Sbdb5gABeHWFhnijNgpTGxh85cCQt68r/sAb/XiPSZxH4cO2wlL92W+xhkJ3ZY+t3SXz6nV+DC0lkiEiO2SJIf2ynWqjyaSuRlb5U/IzoZpCnckqtkLxJgoyWt8/kxFgGRm1xcyI4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X95UB7BXewMtshgvRBXoeQ0CcZHGSfwzhNVJMZrV3U0=;
 b=CSkIbPFI12nzw/ux0QhgvHAYyzyGoMuHjcG0agyISx8AtXGtqkIpzoEbnOZevMe89hxDNWo3+Y83fEYO6fhdurdjOGp8bMOJTHENs3EeUQt5I5zDGdU3wP/kgP27r5N7nporcXrUvDZMhAVjOx//WHy4mUf7Zp/9+ZMJihOu7T93eAmdNgjgj9HueQJm7RtQlwtTFEvzkg5iGbKoLLmbsXg/XkAS+F1eIbMnFk6Rbhz7JjmscBUJkklzVkYkBi24s6P0a+lxpVZdc0kCG+i0VgPvw6LhBZR4PymHJI9vlQN/leYxKJRpsdSNInyT+fh7aWX3ry+7A7V3uprgngXnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Fri, 17 Jul
 2026 04:28:50 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 04:28:49 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
 capable sinks
Thread-Topic: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
 capable sinks
Thread-Index: AQHdD5si5Z188ZJ7IEyYgy4zlg0QibZxKSAA
Date: Fri, 17 Jul 2026 04:28:49 +0000
Message-ID: <PH7PR11MB6053F45F0786D4A5261247C7E7C62@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: 5fe71333-f3f9-4cbf-5301-08dee3bbe679
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|3023799007|4143699003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: +xOMn0gMp+wZIXKibFiZbN8Ojp4QNPD3RgS99SmALQHuKzbczl17MdDGyvikr3HbVJu37scztngs23I5UnzEYHyqjo9D1apg/X8BxfGmi8LMYl0jPcZVn4wkB7vniGcIrCG5z+TW8lEVizbUZqVZl74VSJyL+3u/JlrSHj62T5WCtuF8niz49mIxx8eqFiroWbTmEOvc2FV+y6d6za/So0lShFU6/Gs/w7gFTiBLYl+P5TQ3OKwRaDHqXWeifoEd+6KSYDEClydDHLIbkxABfOcxhVeEkxaM3Y3ynWoR3+fqT6puzhwRI+9flxiI/oKaWtEfmvvvXk+Vy46oqWrrrTuKJQkcw11EhJDc8uwFCG6v6KDI5npAz4GqW09ANSh56GW0KWeMUcfUr7BcZ5T8RPn+x2pymrPHA8NqHUdaj0s7WrD6G3PSN2XWF7NRCmYpTqGpti5QbrONpjE84i89utmqPdNkAefGe4qGB2ihhu4LQTIMzu+3KYaEIRsr7+dOdakUggRw8AngObO5QURPjdxxGiU6zuIcoxo0Gi/upK0vVPTIwBY0AjBKkNjgG5zTSMIBQI5Obf4UVUhsm20exjjmqPWbJuP6Fn4I5cCYyWYSRNvcPb00AnlvokG+QncbmhwfV71FFEd9vzNkPMoeP5m9q3DekZp6n0UxAcRruULD6rwsUh11/RY3iG1KVzDB6OiiZkY2aljeeYbDhEV6tkgI/wL8DuoJE8rW8ibM4ro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(3023799007)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2734fjvwRAHRjjGv9GivaQonFJtl3FO4ZDZim2Pi7l9JNHWPGix/WxhwPI3p?=
 =?us-ascii?Q?0xxlUZaL+POBnq9STrMxWeRalTk/WN74Qo3EdppT7aOgcxXatWkWBjnhYPQ1?=
 =?us-ascii?Q?ObTPnYHA8i5mbXD1hOhrJWEV+q1k3Clrjmk0244vHznFkmQl/wekH68IvFcG?=
 =?us-ascii?Q?vNkkLAUrTTV0j/UAL5XyMZdJCpt2+BMKOeaM402Vwm9l69OjF7sleunQdoDi?=
 =?us-ascii?Q?2xlgHYduE2DZKqsrSTwrE9cJYwSiv0LCMoC05TRE8GuY12MC90wb0D19UcU4?=
 =?us-ascii?Q?2Ig3sNuwPOfCWmTflJO9nyCZYuHucVXF3AIuc1V4KOgukfMxuPRSNlpbMGnb?=
 =?us-ascii?Q?IY05TeLLn5qDdF/4bi8HfKXxQd9y25fDs+kOzxjPwt0B+fOQhux3Jku1Ld5w?=
 =?us-ascii?Q?Emjq0IsejWoxEWq6WD6hp7mP+v9S/SKchsQXcwpiPsxxHsqatPN2b6KEpt6x?=
 =?us-ascii?Q?h0T+2uc2qY/T4WqR3QWLPJdhj0KlnKMAnODI1AsYRR9+2BfDEizviBd+3NQf?=
 =?us-ascii?Q?oMPUP31LHnY3zzsDd8fMtLs+M9jx6eXHrvVjXw6LkS6JhLQtA+qXWWmhPLA9?=
 =?us-ascii?Q?qID6jTB0sbHXVbADOvUiSDZUqJTcADcccArJjyTJu1GrsmkiNswQiu+ZroQg?=
 =?us-ascii?Q?t8LJdcghu2TQgLIyZXuZNu6byY7GjSODtmeJxV90utlzmAlCPbBcQs/70qUX?=
 =?us-ascii?Q?3ved81WmywcmA0PWa/cxFTZB+ioc8l126oUZ3BV4ur8ingE5o+WtH7I8H0NQ?=
 =?us-ascii?Q?1dV/ZKUfOxQgasZ1wBgRyXEhvwKlndf08xbLxN0kbY2aUCfiz4VdEQ8Js/Kv?=
 =?us-ascii?Q?JObdhA7NKHY41HrAtxpTYyN2lwj2G17EFi7RNhUX9XR4F8yOC3RT28FQq4+I?=
 =?us-ascii?Q?xm82U1PNkMT+UDrBULHhFcC/8EPTtzlUAmcy2ul2yg6rxmkbjI30/paVaN/X?=
 =?us-ascii?Q?9QN6Zt//LR9WYRkUjGFOrgnp1NhUj6GiZ/9tza+rdTg8XxemXvFra+VOeBlH?=
 =?us-ascii?Q?QlpX5cTPt+bOAw4m1REN3jutCIOrKLrx7NsOgoSTX9Mex5JcoNsKXO3K9vxh?=
 =?us-ascii?Q?2xbLaLftDhjdYp8DrhSx4LK8f0bs4H03rkbOu8xK3BBSBdaDeaf2E1Aw/G6y?=
 =?us-ascii?Q?C1hz3rMl0o4IQaqHMJyDMGG9alYAjzqAqvnIDnjJPYo8iJ82CzaSeFtaQ3xB?=
 =?us-ascii?Q?lv5XOUblOg04ZFIxmZob0KALnb12QJCq8kuJM1Iocj8UwRgxbq/yGJE9bzlW?=
 =?us-ascii?Q?fwyuuIJwAiAItoyjzb2vHI3935vfoLf7OhhR9FubW5MzEdVz7gdJXF/m02+9?=
 =?us-ascii?Q?O6XcjZTtYNp4P4hHKl8bwymdHWj+ZF0JSyGq5crcERMgaA/4JLdNT0cx80oZ?=
 =?us-ascii?Q?bxxgj9rRE+EH/QHE2UYAeXiw8FKSskkjNdmtm6yObyYJ0YLoxKRUJ1BCopVD?=
 =?us-ascii?Q?pVCMyYBVahtr9auIbH1Z51MNVxvsq84vKzNT7rc7KFaWCiR+kWO/g8frtCaW?=
 =?us-ascii?Q?71JpLWoOGMA2WRMx7ZTMgOMmHhAmw7FSVshaCaqU15zi/LXEop4FKHOSN8jI?=
 =?us-ascii?Q?PKlB7pFG/KZBldzhT25EuxVuIlZcv7UQWSqJHnu55z0fUD55maixnsPZycVq?=
 =?us-ascii?Q?uzKWguuLaecnB7rtReFlX6c/5qD0GdviMbJqWw17XR5Fpq9vPxnVSSI5F3lB?=
 =?us-ascii?Q?Kxpa1BLIHFCTRF6RiWyt/k7+e7D/yJo4U3Gx8qGgnM9WbGTl4luFfj4fXylZ?=
 =?us-ascii?Q?8zaSLOD+zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O5wcaF66VI9mWfrs+/cE8b1wNWL+qF+COO70JE5KkTEF0V2uxrgIgevBCpgUQTMCSxtgXBsOUqIY5T9+H9InrxlJ7/XbrAlAFv1oIQi/BkqNVS1LtFe08TbtBWT4uaeg0y99mevERPVBvctZV83SJGnBei3yFC+Z4OrbP8bxMjcf5DXxPFQiunXskP6iIKWpRsawWkCe0NiaZBJwoyjQxPSkb+NHQXFnfS21y4s2aLCpQbZZbswCHawGDLuxDemX3D/uG8V/WxL2Qys/WzePh1oG3GE73bCxNLBpCnynEyA4k4joO64QrkNJtL+tcqHw/j6SG0L5wOGgRkfy8qgl6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe71333-f3f9-4cbf-5301-08dee3bbe679
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 04:28:49.7981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCaNA+3ve+eNGeejGnBcnvDF5HqOUPeNmnTITYg6iloXbWIGxW6MlgtBuHpLxhVLK5u3yxK+zkBQKAap7NlSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

Hi Chaitanya,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Chaitanya Kumar Borah
> Sent: Thursday, July 9, 2026 5:10 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
> capable sinks
>=20
> Per DP 1.4a section 2.2.4.3, the MSA MISC1 VSC_SDP bit signals that the s=
ink
> should defer colorimetry to the VSC SDP. It should only be set when the s=
ink
> advertises DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED and a VSC SDP
> with pixel encoding/colorimetry payload will actually be sent.
>=20
> Fold the colorimetry_support check into intel_dp_needs_vsc_colorimetry()
> so both intel_ddi_set_dp_msa() and intel_dp_compute_vsc_sdp() share a
> single consistent gate.
>=20
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
> drivers/gpu/drm/i915/display/intel_dp.c  | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index c764472bd69a..13010375e21b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -469,6 +469,8 @@ void intel_ddi_set_dp_msa(const struct
> intel_crtc_state *crtc_state,
>  	 * of Color Encoding Format and Content Color Gamut] while sending
>  	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1
> fields
>  	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
> +	 * Only set the delegation bit when the content needs it and
> +	 * the sink advertises support.
>  	 */
>  	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>  		temp |=3D DP_MSA_MISC_COLOR_VSC_SDP;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 93282694c29b..53688c5bef74 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3163,8 +3163,7 @@ static void intel_dp_compute_vsc_sdp(struct
> intel_dp *intel_dp,  {
>  	struct drm_dp_vsc_sdp *vsc;
>=20
> -	if ((!intel_dp->colorimetry_support ||
> -	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
> +	if (!intel_dp_needs_vsc_colorimetry(crtc_state, conn_state) &&
>  	    !crtc_state->has_psr)
>  		return;
>=20
> @@ -3173,7 +3172,6 @@ static void intel_dp_compute_vsc_sdp(struct
> intel_dp *intel_dp,
>  	crtc_state->infoframes.enable |=3D
> intel_hdmi_infoframe_enable(DP_SDP_VSC);
>  	vsc->sdp_type =3D DP_SDP_VSC;
>=20
> -	/* Needs colorimetry */
>  	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>  		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>  						 vsc);
> @@ -5103,11 +5101,19 @@ bool
>  intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state=
,
>  			       const struct drm_connector_state *conn_state)  {
> +	struct intel_dp *intel_dp =3D
> +		enc_to_intel_dp(to_intel_encoder(conn_state-
> >best_encoder));
> +
>  	/*
>  	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication
>  	 * of Color Encoding Format and Content Color Gamut], in order to
> -	 * sending YCBCR 420 or HDR BT.2020 signals we should use DP VSC
> SDP.
> +	 * send YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
> +	 * Only signal this when the sink advertises VSC SDP colorimetry
> +	 * support.
>  	 */
> +	if (!intel_dp->colorimetry_support)
> +		return false;
> +
>  	if (crtc_state->output_format =3D=3D
> INTEL_OUTPUT_FORMAT_YCBCR420)
>  		return true;
>=20
> --
> 2.25.1

