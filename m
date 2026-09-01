Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6105C61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 02:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549910E341;
	Tue,  1 Sep 2026 02:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LojxvEn0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8F10E1A6;
 Tue,  1 Sep 2026 02:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788231342; x=1819767342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zN6hhPtMkJeoXgWQBHIO58mr3J4tGncNERSjUhdnw4Y=;
 b=LojxvEn0zJdZH5CHLmzu458xPYZ8fVYi3j7QAwNwyd4g+CSrNoPLsRb5
 jgm9opCRcDhaHKe5mJdE4jDPbHX9R1n5A79XQIjKMuHMFiNfptm2shKp4
 Y5VedL1+gZdKkOZi2NYxrZnWEVTgHs3s6SO0O6QJs8jkhdHrb5S3UGEpT
 agF66Emuj7CB3Mlx2w4HajLoL+RwZz087Foo3GCYHnJqADSp2bQV0bPsm
 s7o+2v4gpsl4RJ51fz+im7ACAYxorLzBuhLRrF6gRdujp1oaW4s2zH7Gu
 8fVI6u3/rU8D8lOdNuv5f3f8C+S2v+xueEeWINaOZEn6E6/j0LylDMFx0 Q==;
X-CSE-ConnectionGUID: YbRyHKkGTHyJGW+5ZKEbqw==
X-CSE-MsgGUID: ThBOTApjQEioxjkmHCyRYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="76196551"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="76196551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 19:55:41 -0700
X-CSE-ConnectionGUID: QQK5OCO7R2+xkAcTgaqsIw==
X-CSE-MsgGUID: MujmZobLTb6uhdMf0j2i5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272743919"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 19:55:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 19:55:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 19:55:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 19:55:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXmmT9mtmmL5VbBE9RLigCrZXA0jOXYRzOeHkVaf0OOuQ6PYqB32x+TKRe9KVQA7IgyEwz0+aIJzT3Vm6gpLKud/jRQtMk2nj5qAv0Grh2nopZV3FKy7GDQjtH6pYoczom7YC685qc05Y6joZAr3wJkholWZNuHdNCA9JIRu2hBAkBYhNgHcz4CLQLC1u5XLmBPkPLeal0yt6A8mEPiM+cTn5wCZ14Yxx7q+bntQzcgn3iriRDGQav+V+tULMCbN9Z6FZnAM81etG+plGsxMTqz/xf8CG8xpY4Ruw8S2xfkbDdnI4Oj66ptZ7vXImpycl0TQy/OqjiSCApd+XoMmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PZjuDwzlNPCO956ZHa8EjtkFH1wfCv1AMEklKNGfLk=;
 b=dXg8wn8FySMdu0J52bpaYc5on8Whr0cIqx3JbFxuIpoe7/ahfFYN5g8VgZdFx/mpdvKJWEF2XkaLEFuydZW+Z2iBo7y6PgmwR7Dal65ObhidpOhUysWk+LVeE43TbM09nLCL0bWXc9IRbdWwT6CwaUWsdQIyu2TOnc1coummBvtiSu4f/11XBJPyJhZNIp1ulXJzPpPYTKj86SdU9lAuAc6vOFdwRibLQaJRsI5iobzcr/vIg86G7n0dgiqD2iukG+/XUbA0hEUR62roLwnbrJ3HehAuU7LudORY831Df1jU3c2N+z+5DsZiqivvzJ9VX3y1HZwGRJ71ZCPkJSipIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB7585.namprd11.prod.outlook.com
 (2603:10b6:510:28f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 02:55:37 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 02:55:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 04/12] drm/i915/dp: Add helper to get AS SDP
 Transmission Line
Thread-Topic: [PATCH v4 04/12] drm/i915/dp: Add helper to get AS SDP
 Transmission Line
Thread-Index: AQHc+Xcb2A8daDDCoUeS2PNCfHhKHba5h6pg
Date: Tue, 1 Sep 2026 02:55:37 +0000
Message-ID: <DS4PPFE901A304F2A5435228E8A3E92591AE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-5-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-5-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB7585:EE_
x-ms-office365-filtering-correlation-id: f8b3f268-2c7a-41e7-c1ef-08df07d48038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: YNQRzG68P4ctcaaDlJ1mGAVwZZEXULO2ZfxSX9D9ct+EXqkpW7QBgAjMFm/XwJpFTUwjWGfO1JkRgJW7AhB8vK2xYUT+DzEtvviM4YnPOnDtsDaR0cO50o2hE80jRkMB0m2Y757XSHqv2oKqDmRpYsPUSjhQroyMMHsbaPJpcmy++NtGPk/GO5CCuOTq/4Sb2Xbq0pYFqcUKM4S6Y6gWqnmOolR0Mssy2EEegsQuIPOMCQsUFMFGsTyNiXDaBP355vkM8p6H6IPvdiM3ZmgvkVNZR7Fxw16N9RBQqtGGFKjiZm6wpcr0wbSqYuQhlZjLoaoI8WaM0dggNmEG5+Qsy9GkihLtgf48Zn3Ux/Hcyoq//MH1QfPjY46jxjOCe77MLK7O5JrUMfHIIjtvRYUaTCb59G+Ig1P9iHU7OG2JDwEHhrt6VFJtsm5ilFYh7loXtYipoUohAwOdTaz4GmxTtOcB1C9X/0xh7ZdHVcK6b1Ycm5vWK8EiL8zKa8xdac4sWZkyXCKv24299CYFnL3dLf7DbrV+B6AxL87+1L5EgEznNJ+JTPnX5ssTB47UohmxmFK+g81Hg7Im+JEHxVem2/LGgUkkol8xMZDXNodjlHuB0efk7vFMF2R7X7/4OVpucJzp67N24XsJ8KH0gw0KXGj8uRIoyaCjR1BhVq/d2ZJ6wDPtuCEXKjEQGmgxUbGBi5tRud7WR7FY6sl9WI1wIwu5EAyWcTtbJt1+53/f3k8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GLcggKJm4mgjUkqrHCwacCzaPqxhfoBVYKG6oo3AumH0G3nrD/jjydAF3F28?=
 =?us-ascii?Q?GywkFukmrLwGTbwWQLi4GopW/vSKivYQas9lBhR3ITQjYD50oK22tQQeeLg6?=
 =?us-ascii?Q?j3u3uly5xkT7FsqeZ6oTU6RemqnrkfOYbAib2DfkXBkv87RffLIjdFS6CfFA?=
 =?us-ascii?Q?H8slTrQ6q+5maozbSqUHGllVoJNutHgm7ox9kONUUxpvkJMNQbATO20zZD+5?=
 =?us-ascii?Q?fHxqvOe82H/rOId3IcOH3RspAK1bUcrwRAc6UcCG2847SZJQXZc8M/xOG32F?=
 =?us-ascii?Q?S9xN/PBmF1Vsr5/DptANaDUKAtfUasUXLKxgCJFa5oXLTfJPc4XkOgbHfQnF?=
 =?us-ascii?Q?FHKkVUi0eBx3pJ6XwLMszfYhKxPqOuHVeefc5Mr8EPCIudMPQmavWcUj0wP9?=
 =?us-ascii?Q?MKgicKmORiCf8y2/LuE6nmsr5IJzXl7vYDYFXuB7eEuy8q9LKxC7i725T9j8?=
 =?us-ascii?Q?56cpMkR1+DlSdrAe+zwtavMjNapzIvp/yj+fAHQmxcvCxHviRZOeVUeP+Acj?=
 =?us-ascii?Q?RAuFoyIKRx0A/ZEXyciNm5RqFBlJy8iiUbvrU69qEvkQ5Po+j3sBABWJNGJs?=
 =?us-ascii?Q?4Vtz6OCrxb4ckKXjNAdHxWXu59zIDXg4EwW7syXc6KXkff9klUcrtL/bW1NX?=
 =?us-ascii?Q?ovsk6RXolEoN7PkpyFiN71qoDdnbYP5D57ipuXoHJ/n90F/2YcCCR4H32NiU?=
 =?us-ascii?Q?BLdcgzFXfhhblObDwCjWm+tTc4cdekGthIFDga+CQ1ooeBjUhVLsdo1qpXxB?=
 =?us-ascii?Q?6LEIzzXyVdfI+TtGvWL6LynhppMqgJtVMgzjDOQ9ZbTPfYGFwWEqLcSlEd1w?=
 =?us-ascii?Q?DY/duZqx2cPfUEfdI9mPF/3HrhqbwOiFpsoIieJRNiAVyZnLQzT/q6np8KqO?=
 =?us-ascii?Q?ZqflI2Zw2CV9GNl8n8BGxBzWoP48Hqyu0S/UP4Ksv5iocQMR9UQSpBp6XQRz?=
 =?us-ascii?Q?S6IRsIuiWvEicX8BKks5FkJVPPFZa5dO1YQnaE217HtNRNDDqhDFyh5wvsHG?=
 =?us-ascii?Q?ZA7rZ2fFNlfmlcAUb1Zyp596wXt7g9tfQJhsk/a5gghpS23NgGOedGlWM8HH?=
 =?us-ascii?Q?HfuF4kV1GqFlPK4qYxbBPmbkAEgZRIvB5nzQ8LXZQanNw2TSoEYA9PZ4LyUz?=
 =?us-ascii?Q?hFxEt9lVjrrLYgFKPbS0FOi2M46KW0GkrtyENRI88inWbD8DDOuOi6sob9Bj?=
 =?us-ascii?Q?FG/9VZoVv0KOX6ebVj1l6Qaf6fepn8X0tSEsx8uaQsM9QezkpRaZi1xwJ2Q5?=
 =?us-ascii?Q?mVt/qiWjj4UfV3ULaJOxoJNKd1u8ph+8HC+mn2+bL/JeCfvoSIdaAO5PHeel?=
 =?us-ascii?Q?XvLnmEuoNmmZ9Z9Sk2+rqay9ukwhnGlWoQ4Zu6gSIHJv1STIaXUfv8E/tbXI?=
 =?us-ascii?Q?qtKS3RWA5bcm9UhYf8a/Vx4zJ/ivFs1ycjID6MAY9kOv1pdtuD4ZJgGyceML?=
 =?us-ascii?Q?ZPwBWaa/cTBUYunZfVcbCCfBMKXbrXk2CMw1eQMjW8Wz2BPtVI7REZUBUJVR?=
 =?us-ascii?Q?UxwJWOdd7dD6VUYGUMGFfMj7hRggiPzmaNsGE6naWZgNqmbDA6pbHFjUyPst?=
 =?us-ascii?Q?UrHULndP+ykGIJ8cB+XBTLl7gxBi8tVIMDLFkgBbNs/7T+FbudjwYCrPOmdi?=
 =?us-ascii?Q?CCGcPejvM4CeMFxEx5W6WYLyUl0RU4XLTmiSyxoUcq6Gn5j4XBpi3m3HEqbg?=
 =?us-ascii?Q?zMUrwXskfvbjSuSkPu3dydHVNam5k5LSJcuGZzskzBNaCgmavEiMjggqLNFm?=
 =?us-ascii?Q?js4+mUqb4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ShffswXVv05q1rRE0ZOQQ07BPtHc1VlOig+RPxHGsaYBVgOjPxdWoZhHSEbH65qyIJE+XHdD0byAzapyB0nl5Ux0tpw7NmlQkoLZ9BPkyIH/dV6kgB57T04UnKeWobBi6r2Yw/LQrAptcy8bfTGpvmVYqB3J2BMRfSncKpsc1reBaIZ+uXw1dZ/YlANugujtJzuBW/CJhGfKEvetv1yWTZcjLOMPeUq2bqf2g0nLAGnhCqkptDPa0OTVW5PBZ/Rg3VrstPjK2bzN0/pQ0aKy6xWR1L+uII96KXs37ygLAQ79AWdIphcHyXr70Cl05kYjl1uX0yeC/pTNav/v2UZryA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3f268-2c7a-41e7-c1ef-08df07d48038
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 02:55:37.5105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHaeJcIkjotWGA/ksRaKwUaPelCkEKCe61dq0bucNvPYgzejSzQaQTrZLSSvh6ykxD7ZhVFFvN9Vo8WVvutUgA==
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

> Subject: [PATCH v4 04/12] drm/i915/dp: Add helper to get AS SDP Transmiss=
ion
> Line
>=20
> Introduce a DP helper to compute the Adaptive Sync SDP transmission line =
and
> use it when programming the EMP_AS_SDP_TL register.
>=20
> Currently the AS SDP transmission line is programmed to the T1 position.
> This can be extended in the future to support programming the T2 position=
 as
> well.
>=20
> While at it, improve the documentation: the AS SDP transmission line
> corresponds to the T1 position, which maps to the start of the VSYNC puls=
e.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dip.c |  7 ++++---
> drivers/gpu/drm/i915/display/intel_dp.c  | 12 ++++++++++++
> drivers/gpu/drm/i915/display/intel_dp.h  |  1 +
>  3 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index 450a599b5053..504a2edadd0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -8,6 +8,7 @@
>  #include "intel_dip.h"
>  #include "intel_dip_regs.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
>=20
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_sta=
te)  {
> @@ -32,11 +33,11 @@ void intel_dip_write_emp_as_sdp_tl(const struct
> intel_crtc_state *crtc_state)
>  		return;
>  	/*
>  	 * Since currently we support VRR only for DP/eDP, program the register
> -	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
> -	 * the register is reset to 0.
> +	 * for Adaptive Sync SDP. For non-DP encoders, the register is reset
> +	 * to 0.
>  	 */
>  	if (intel_crtc_has_dp_encoder(crtc_state))
> -		transmission_line =3D crtc_state->vrr.vsync_start;
> +		transmission_line =3D
> +intel_dp_get_as_sdp_transmission_line(crtc_state);
>=20
>  	intel_de_write(display,
>  		       EMP_AS_SDP_TL(display, cpu_transcoder), diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 3569e61e7fee..f54f7faf878f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7465,3 +7465,15 @@ void intel_dp_link_cleanup(struct intel_dp
> *intel_dp)  {
>  	intel_dp_link_training_cleanup(intel_dp->link.training);
>  }
> +
> +int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state
> +*crtc_state) {
> +	/*
> +	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
> +	 * Transmission Line, which corresponds to the start of the
> +	 * VSYNC pulse.
> +	 *
> +	 * Use the T1 position for now.
> +	 */
> +	return crtc_state->vrr.vsync_start;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 92ce04852326..fc80b5b64785 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -238,6 +238,7 @@ bool intel_dp_joiner_candidate_valid(struct
> intel_connector *connector,
>  		for_each_if(intel_dp_joiner_candidate_valid(__connector,
> (__mode)->hdisplay, __num_joined_pipes))
>=20
>  u8 intel_dp_as_sdp_transmission_time(void);
> +int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state
> +*crtc_state);
>=20
>  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
> --
> 2.45.2

