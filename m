Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80282C55162
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9F610E42F;
	Mon,  3 Aug 2026 05:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1eZmZ8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791410E2E9;
 Mon,  3 Aug 2026 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785735023; x=1817271023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1qZPSUqaA3rfN6sKy+xXXveJp2cKBMfgdDrAb+ZqGtw=;
 b=b1eZmZ8Tm3jKqIwJ9VcNcg+aNqu9g7FnvQ8W5WCEntf0YOYzapshMyJ6
 7srOMG5T8dQJNfAV66I9Ri8CPdwG4Yiz61E03Atu+5attn5gkgN2Svk7+
 k4h2XLApd4VqLPp7d5YhuN3GGr15i4Vu0AJwhIJMPzw6eufez89oVRzzX
 yXvKEtVPuxQT1o3gDyzZ+kDVeoDCzGU86BbOH39S7eCo94tCzwNH5igQK
 pHR14XfSxUMn4mpNHeCBD1dOWhB9NE3y+Tbbe9JgwHpUny2DtMbHd4MLS
 7RjgMhkPMo3Sdh1kQoz50+vda+um0ey9QUwWgkbKYDZ0AsLCJLI751+Tl g==;
X-CSE-ConnectionGUID: Kanq8PanQvyTs8g04HwxgA==
X-CSE-MsgGUID: 4eyGT5ARQ8eXd92VyICqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103803848"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="103803848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:30:22 -0700
X-CSE-ConnectionGUID: ccYclrEhTUKKOGxnvNXPew==
X-CSE-MsgGUID: /0YfQYQRQlCh6Jm32QH0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="257210771"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:30:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:30:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:30:22 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnCd3sqFZizDghU7WgIh5SaSpyfR3jCJ+BGuH7AsdBr5W1/PItH+TqHOVQt/FTgyZFfS2AN0aQSs3su05WyQdIbrXTczkjJSEokbsFN89c7F+geRU3Y+FnflgDKphwpcblip8cexWu4RxontsZhUXPUBbJyRIqUhf+wWW6TUF34xNTiU6HGQVjhwOHvI8wHjAjHM8mjRY5RGSIdrObTOyry0n+eqaIgtwt2i+lziBO1D4saCayA0ZADchxRsY2CvAHy+nFlSjdcWRSt/Gg+pk1nT2Lt7jW4gwWPyITWeIJUvj1CecNJMEETEbwIn8X1ld6D1UV+mPWCNABT3H7HvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKkNMN+8xBht3/xTHaRpBGBzd+yHUpRxRz7mDrarXlc=;
 b=gH9xExMe6ujiQVzVQzb+DU4f8LRLPFvu5j/3VQCA+9psXNgG5oEvhaH0XjqvFwf4dBrXg+ulBmc8rsXYtv/QUrSpkuLotbTx0D1dH3TX66nSJCDQULRzh5WsauQ91CeJS9KzTEKt6irbwTWBZoGeJfFGIcLvqm62l2+s/5CYYZ6D35SUZrD+nxA0nOHbVDOXnVUr7XkIPJxS2J2yd6SrHWaTCGXl2w/8tLZKqzk/bYiSRiy7hchglCTwoh1ISgQcY4uy7YkHiC0dfiNqGuelWOKm2+bWWBtyJt2tDt7RyLZ5TD55EKSSv113EtYOcGK3NyzfRhEr3BHKeZ574Sk/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LV0PR11MB9789.namprd11.prod.outlook.com
 (2603:10b6:408:385::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 05:30:20 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:30:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 13/14] drm/i915/hdmi: Add helper to get max FRL rate for
 an HDMI sink
Thread-Topic: [PATCH 13/14] drm/i915/hdmi: Add helper to get max FRL rate for
 an HDMI sink
Thread-Index: AQHdIBlaUGvqusoW90uXZZhvEmYoqraL0gcw
Date: Mon, 3 Aug 2026 05:30:20 +0000
Message-ID: <DS4PPFE901A304F48B11578AA8B8DDBFDD2E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-14-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-14-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LV0PR11MB9789:EE_
x-ms-office365-filtering-correlation-id: b5dba69d-ff54-41a5-f1f5-08def1204f5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: PNUc9cUnRUshEDq6TkgM7AqoYvUEqOgSB9grIH1gnxr+V24hiLRNppZ9fXZeDaHD1hde7YDlzcEXA9XsCyC9I9SOyVyjqkxRw5CNVtXaEUluBST4HtbyCSFjfUb9giUGUwJAuTzB4Sr9vXSyKm/w4X9WHPxA9fteoLjBNKnLUqHt++Bt5EmaBJCf0lMkHj//2jjvqc5zoJMMwhgQS2SUewZGZrKZgV6WSuf7KSvq3Y3t5CDtlI1uQzaIUBXWQvYkMPm4fLZFz7+qtoqie/IBuiuAAP4BUKnZ9UVMSYU69TGG7IfLAHDNGgQCVuZB14jQd3/8u1EVpOHRvpQiiglAnAHTQ+hRbhNjHInr+0UlaULUf0nIXjSu1EONo6Kj7s5r/VKNPhWifq5mu972qCqtzBTXRzrbi3D8SZYT1WL7PF8W9FWahQ7Es3HIRzk8a879KknG3ZmSD1gL7QV1sFsaBmT1kaJPuT1nZk7sBEL447byST4yQebR2fa5L1LE0QCbipSZUfBkzdtbXI952JWDrjBcuXpdrzgIZEtIIAuXQj5GfR7jVrO5ol8WkRcHhzR1xAECw9Xv2uUxKgrOcUOXGUcwxz7I+AHt/vCTtYXmWsGufVgvxPpH6OASif7JDXqcf2ZQTURb2beNehwP9FNIROqMjzLXBYKHWFBKO23InpHcFuB7WLWoi2LluqU8Z+fqN/hK2QEOtLTpHGzNE6+4leTQVV8y8Pw1ELX0c2LGoBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ZTCBM9+6VNQhIuFiOjWKnwRL33LgZ+FAlSSMcXphwKdfl9TG5y97tjQIGWO?=
 =?us-ascii?Q?RX3hUTJFMry8+EvQFeC7LwmJjYk4ZDeI1OI9yQ1TkN6e7giwmjtXeaCa4qOb?=
 =?us-ascii?Q?zVRYOdnms4tyH4MIhzfiCNHfldAZ5kpE7EzxjC0WaAUtmAKQv2okN4kRUMO1?=
 =?us-ascii?Q?fWI1LCKfKPSroF3cfYAcqXh/xDeibU0L95QguGYq9uAGIVJdVGQl7ukgYSQH?=
 =?us-ascii?Q?Q6Q0zQsHm6hjzONYitsVkej0AOa4bYZzQDHoFcxV8lRFwfqCjqsnQcFZF9bw?=
 =?us-ascii?Q?I00CYxeGXV9HmxS1UpDp2prupSbMbaVLT9KWiUksikrACJA3lY5eBk41hwif?=
 =?us-ascii?Q?ePvV1ezBUfnkHgkTYnt+F2Ujx37enul9g3LNeD7zt61BQoALBQx5tHzMTXF5?=
 =?us-ascii?Q?g04I5SjeZilnoXoUXDhkfL1+3qfb5TRRIeFGvIzV09aHMRjmVPjjgjrRPOST?=
 =?us-ascii?Q?wSu15HmpSP5Dh7AUYk8+MRT2FjuPagf0enKsdHoKpcgpts75E12DAgvUTl3f?=
 =?us-ascii?Q?XHekmpZTjohZqGOudMvVT6SZTcNpqcPxeT9jRcEyhqs0/b5ASXc4UYfyC1Eu?=
 =?us-ascii?Q?rh0fcSjt2Px4tfyIzX3/DtSOE1mt4jqfAiiDydkeX45Sg+RNSbsd7hU6jGGg?=
 =?us-ascii?Q?bEGEo6RdOHFsjsO7JAzmHbC32bMt3/2lGyTsPrFB18FI5+ikcmaQ4erw1nvR?=
 =?us-ascii?Q?chdjWZvCKWdD2/ChS4KBlUIlOWnDlZhrJNCv1UvbOiVAryiB0vBd8DfaKaip?=
 =?us-ascii?Q?sWdPrjskjmuhR4iDik7eg9EQsYmDzHQlcfGumFpSGbFdKSV9KdP4bTPeR5qf?=
 =?us-ascii?Q?WB6qiM+bujfARZi6RRL1J7SEJZAsB0Fzk9MCyEcv2kJh4sl08RgBlNqSE1ir?=
 =?us-ascii?Q?uP1ZF6nB+44BKhrjmkj4MPn0aD/Gz1Vg7AFKyPCpbHrNe1gWDI/E6VjrXFT/?=
 =?us-ascii?Q?UlJW/AAq5eyPF4CFTv9bWmzDwaMbi8lEbo6nR0wQsdxgwxlYXC1jb92mehUu?=
 =?us-ascii?Q?GJAoOhcH5np9jdNX/KqBXvAGRniq6DniS15UqgZHjPNadqEy5+GgSIDQ/NzS?=
 =?us-ascii?Q?UWsNhJqgIZOB89TP+DtTtEyhN1GYFX2f5mLSRZ2Z2sK0HbfIAaGmVuP441rv?=
 =?us-ascii?Q?OEQNbkQ9GeiY+06Oj310FLuL9icqoArIVO7mk//ul7ixMn63RIt88CKMFWpT?=
 =?us-ascii?Q?/VTRQv2ouO1Okm00TzwNH+L9IDlMf48Q2coAnhDWBDPLJByDRC0KNZkWytBy?=
 =?us-ascii?Q?27zaIHqSoPpw6z6dvSe4onkUNo63nEuKZB3gLtQNw8tqvhyGsFS09Zuji+VK?=
 =?us-ascii?Q?QIBG8lIXvh8d815bkdhFmTjeRu0rv+4cmMhMK/SQA6S9vKrxzI3vDOV8dSJd?=
 =?us-ascii?Q?EriM39sIHuGEIZoJ9OAY8Q1cse6E1keJePG6tEZlAtJwoWN0bUwhmHFFdmX9?=
 =?us-ascii?Q?NwW5VaYiM683tuy/mrpyxoDFRipLxtATNKeZ2F+EmQeZgAnSIAeyAFe9SqYA?=
 =?us-ascii?Q?+p6U5vyY4caSNiGZ1bSwV+Yso4DdK8vWeKtzTuCXsrXyMN+kgfb5YEuUl3pg?=
 =?us-ascii?Q?0bQLiGW5Ab7o1acXPffBUo7I9Cu41PFb1706gMw6w0oM+f7dmBoaMfIT/Ule?=
 =?us-ascii?Q?nhQJTyq5AdZZVb0Phss3g9zJ3iQ3aTkrWuV6qKTfM55HLmFmVVczaj/YXf9t?=
 =?us-ascii?Q?cM8xzy4l13sIiOArLRjXXFSi3JuXvTtlR3lD//f/90JaWKPAoInWN8AyMJzr?=
 =?us-ascii?Q?mevIZMC8Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cbnTbkL38hMvcoh3h2sRMneLOKJtalTjFuys910HWanbMpha6VT7AygJiLBBJDxAJbImMTN83zTfab707jmR8F2UPq4lyr9+s9TeETPJ7NiGp7MuiGBcxgYUBC2ppfsZlCM/Pr0opEVVo+maNjRsXlsLBaEzF5gVvshDMO367KsG78x3/P0kyPAkC3T/hbeWPZp7PxDP5tZeXKldAtNDI9pSHL2vPkh6mvf7oQQUn9xs4cnFdEgrS0WaAHbpxQKJJcLjVGq2AyHu4Sd0EsYMD/4GU0zwgQ1jV8Yt+bZFF/tqJsD0FEMEJ2F5Tm6W673s9EW/gtmcSCCqfCFAb2/1MQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dba69d-ff54-41a5-f1f5-08def1204f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:30:20.5732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t59uze/dAgIle6CsED9hNv7nOssORHbGqJdk7e2P+xLEujn/VAZAdaME8BHA2uK0REfsNrnxC+2ICY28q56xAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9789
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

> Subject: [PATCH 13/14] drm/i915/hdmi: Add helper to get max FRL rate for =
an
> HDMI sink
>=20
> Add the helpers for getting the max FRL rate with and without DSC for an =
HDMI
> sink.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 19 +++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_hdmi.h |  3 +++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 95393ec5d561..352a315b0fb0 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3479,3 +3479,22 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width, int num_slices,
>=20
>  	return dsc_bpp_x16;
>  }
> +
> +int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector) {
> +	int max_lanes =3D connector->display_info.hdmi.max_lanes;
> +	int rate_per_lane =3D
> +connector->display_info.hdmi.max_frl_rate_per_lane;
> +
> +	return max_lanes * rate_per_lane;
> +}
> +
> +int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector) {
> +	int max_lanes =3D connector->display_info.hdmi.dsc_cap.max_lanes;
> +	int rate_per_lane =3D
> +connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
> +
> +	if (!max_lanes || !rate_per_lane)
> +		return 0;
> +
> +	return max_lanes * rate_per_lane;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index 072c8d228697..f7a494df19e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -80,4 +80,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
> void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state
> *crtc_state,
>  					   struct drm_connector *_connector);
>=20
> +int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector); int
> +intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
> +
>  #endif /* __INTEL_HDMI_H__ */
> --
> 2.50.1

