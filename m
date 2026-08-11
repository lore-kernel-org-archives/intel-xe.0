Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1743C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 06:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F8610EA74;
	Tue, 11 Aug 2026 06:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbOQAKLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E9C10EA74;
 Tue, 11 Aug 2026 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786428724; x=1817964724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6yt6L2EPvfKv9ZIHXFhssIyfOvvzzH8WFfMzybZKFx8=;
 b=YbOQAKLsJ9vAn8CT0QWYNuiK21/xAh4gxn50w890DV0gUh2TmHoTMC2U
 Rtriu0iPlnNXRi/IPKAOzSWkCIk0UJ1Cv1jvSpAVcELN8l7yhSVnv4Tlu
 sOdD7Z6XH8niaQjnltRH4zX9nKmoob652ofj1qF6wqCtqrQFh9HnMefnx
 1Q1d7QUCSDa4kpCK4go1hsy+Mm9IB2H6o+euqxWE//FAUD70nIYREjldE
 nc8P0wC6DB/9EtWrb0LRSE/2ON3iNWZb3UdF21AoR+BaA6MNI/Snr5kfN
 +RHCO+yU/YeONNIj29sBXDQsgn3M6Cieg0+7JSVCJlXbRmapqKeaWgzcK g==;
X-CSE-ConnectionGUID: +4xsZqhFS7i7G0PENHhruw==
X-CSE-MsgGUID: H6BTI9eoQCWqy3DyMtTOAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97548499"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="97548499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:12:03 -0700
X-CSE-ConnectionGUID: t027GhhlQbCGuX3Oi6TodQ==
X-CSE-MsgGUID: UkY8fFuzQmuT8Nafk3vYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="260643632"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:12:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:12:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 23:12:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6L7VFIepGl3Wj2c2F8ZWzS/4w7t5H45YNZNRKmKxlAgQ+U467jwe7PRpYkUEX8ZjVyWG5HLFxdLW98QZW31SQnH6Hlf4Uwft+1WRMXGJ5QSozctBcTz2ZJCqKZwj8dBj3bW8WdscjcPDit7z2fUdTFCAeLkhChSLVPi/XgdD8ywuLccyLn74IEFJLtoyT0o6QIwvE+ht1+CZ6tlw3UgeI7Lx5nJuiSbTLudPo0KLNSNGrl8m0A7kQG6qv5OE0wdjGJKXbr29hAmsY10G7EjLKX9FhEgmoXhcYY/yRGzC5LOBgNPHlTL9w+WOP7FrJZQtzIclWlSu4E2weDtreqgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsSgkjcg+PpYHu9eBii4k1naX/eLq8IymfbuAX/pzZs=;
 b=wpYqMiamsCGPkJwFM8vKE1NEUdvVv4W9Iw4ZRNAN71EiR5evXFWgD0BchVb5rZBhdt2ETH7UB8RvuOn6gMaF0eYbE5QUQeXChmz9lSV+NPb0YOfIqhTiRY1EP+VEaXKUkYACiRZEzY+KbmlnS4Phk3KvzQwIm+Q/SYg0gk84qoTZkkjLui2Un8/F/2JcNihimw4BVg7M0EFNm4ZlUH83RTfXArlh8hg1pV61d1UugClzn71INDC5gallik01m68T10l+r+O+9W8zFr4cQDIe8M95JRt2H7Jk5D+nufPwWg9xxDbIDTCmzVbv5GMKP21P92ek8UNyau2S/CSjJ+5+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5251.namprd11.prod.outlook.com
 (2603:10b6:610:e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:11:59 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:11:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
Subject: RE: [PATCH v2 7/8] drm/i915/dp: Allow PCON DSC modes through FRL bw
 check
Thread-Topic: [PATCH v2 7/8] drm/i915/dp: Allow PCON DSC modes through FRL bw
 check
Thread-Index: AQHdKU47rmWfnaN6LEOkMQcIOYvXYbaYXNcw
Date: Tue, 11 Aug 2026 06:11:58 +0000
Message-ID: <DS4PPFE901A304FC112C1673FCCD31ED8E9E3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <20260811044234.593986-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811044234.593986-8-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5251:EE_
x-ms-office365-filtering-correlation-id: 64df4920-dd84-42db-8168-08def76f73cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|5023799004|11063799006|4143699003|38070700021|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: Wmd0sFCzcH4ilIoBZLraCO8qHwoVc5xXiLEgL3ZUA5AvOywHRwYANto4O7hrFfcdly/pcEJaIMTD55ddLIm4rX3zmG1pz8eYwNyNDL7rk2pIjZOJmQRTgnTCdeGLIe97fR1BPKfhKmIS6LnXH2C49oUGoUvredlqg0KrBTtP7BRs6XjjB9iEVKVe8cmbckw9SzJ5VRnAWJ2PZRAZbkUeGL/uBKaDUQpMM4IUYDwydx3agP19LxL2gCemRQ5mcF9GV0atsO05PnBmHReAyoAMPjfJSgwAedycw/iyQKQtvezCLHSQlJOJg85JS961G9rid0yTWKaHNZEs6GKP6J2bAxzLLkFbmV3Esm4O9D9MLcJXUVCZAa53viVh1wKvbDrrsKVx4ARpZngBz+eYXh6jHC1DenLSbuWw8kmBZeEHl9LBzeqe2WBUODP3ZaBsgvf/Ra6X9ObsnoCBsLJAenRte+e0r/eI84VYHD4aMkAYEo6RtDGl4hLAab/ZOACJjOePi/XU+2I2GTkeOCqrL/GUoIlm5BtuRXxGS4O0Tp3NKZKXWFpLToCsa9zMqQWn88T94nHCQHxRMoIpVw05ESSB6OBzNG4xoSZaj7PyjOr9CB06tQT005DCs5Rc0iy1S98CQFDIQEgRNp863jtu+A7MhP9kp/7d+gqtzexT1V0lqezB58R20Xyy2pZx24sWcKwImdkgryfpoWmQQKTNKEpJHjC6CwzeRRP9USjcqnUcbYo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(38070700021)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1GqkFqIK2iAULlyzCZlWNo0Q3AA2Mzup2plaLano2o1uhp2i3CEcdJ6biebj?=
 =?us-ascii?Q?klwuimRu8fOEKCkqck6dTY5fbuM4z5dRFPQhnOCV7QFxwrVzKW3xM8aCilxu?=
 =?us-ascii?Q?NEkPVKxDCtn+QDoldTUQ52Tn19D0VTyC3eO8mOlfM3/FFacC9g9IyKOpO0/M?=
 =?us-ascii?Q?uOgWkg9HGwGehneqFzQRly4Smmj5V+kHfsVlYSKKgvBURnf0jmK3GvBBlJC/?=
 =?us-ascii?Q?YPeY5RvjaFWHWgEGQHDoIS0pln1RJyCHtFkd2m4tj0IDuW2qAewlCtehegS0?=
 =?us-ascii?Q?Z/FfEvlZEAelHv8veVd2WyvfxIoDbW/sfrCQF2Ng19jqB8TiR+Sv+wQSMsOb?=
 =?us-ascii?Q?+K5cbzO6rLA+5c2NnB94PmhNyVFqLRBEi07FZpamXL1uodoJ5Jtq4IPgiXMK?=
 =?us-ascii?Q?D4bvFsov4Okc4bafatOixDzX7eTyULrjyXt1ToXssOV/Yp6TOotYK/BP/Ahr?=
 =?us-ascii?Q?C1X5H0amD2SYoD58JRuraL5tIYCk3UGrdmcs7j6EM2Dez+IMZ4xRSMFKtOWB?=
 =?us-ascii?Q?6WNs7q8xYyrBr2yO3eXoo+QnW43KVIoHaa7JDn17yN5VzRUqQap8ytvtrO/S?=
 =?us-ascii?Q?XbC3TRD9wT66qoBSzO//3ZJlmE43gaHRbTxdqzsw6QGRxNIG935iul765mZw?=
 =?us-ascii?Q?9GpYdaJjO4/lOzPQ2VhmIax/TP3fPyMpn2Dt0oyUdkS4GUuccXnbadwR2slk?=
 =?us-ascii?Q?eOips2sslrJDQcaL1tUNg2cHwvUN62Ngy9nWuoviDDNPq92TopmWEtx4yMqb?=
 =?us-ascii?Q?Me8GADu4slF9+tmPlPU+IF0pbaSNnk8vtava5IHWToFWY2Dk44kmoIjte3wb?=
 =?us-ascii?Q?YY/1xyJYiJ3CZFEQ5UB3TP1MNIQjlSsda0rNZAEh5uXqSCc/U0458uK9TV7O?=
 =?us-ascii?Q?FbI4HHrX0rZmO5IBHxlXHusMKk2YVtPpTZG/WDbs/Z2naLMjOvHckM7zhO7I?=
 =?us-ascii?Q?Guz8mjdakaUw6QeetyaScnsi63sZ5azNUDymLYiOPRqezEJ4wXmTc3TZxckb?=
 =?us-ascii?Q?g1za661d6E+BqhyKreau5lPoZcG/sCf2L6Gekgggr4fSVcwJupmefY6c9yjo?=
 =?us-ascii?Q?BpWLlrZWj6fEfn5RL3oS/Djaosov0zKBUa7jwRozyn0ShLTsdoHvo/OcETRF?=
 =?us-ascii?Q?FD77ZZsFFoJ6wHCiqe2HV8f0FZeBWPGb3Zf8VUhOOol/moZQLsSzOSoKspDO?=
 =?us-ascii?Q?NdvC1lGxcD6GsmVUOaktUzGPq7iB+EpuVjEQfg/ZpwtxIhMj44v5mdoVKzRD?=
 =?us-ascii?Q?zSC3WzKi6Ma5Wp5l4/iCZgVb9Eew5rQRXD8YRZNQ2PwvacYTd6Khy7f80iDI?=
 =?us-ascii?Q?EZxc2kKjCZI+4e+tdoVFlSFWB8J6WvqRYa245ILes9IoD4w6u7OFhV39o5nr?=
 =?us-ascii?Q?0w2SVDKos6wcPWDqFLVTihfD7Nq3X9vYHuTVLHeXTDsnRGZU5IaeK43i5DS6?=
 =?us-ascii?Q?LYA+y8ryqyZQp+bW4FjC94ahU+/EHa+fvBkySjDKWZ3FMp9IqXJ5vVJV86wZ?=
 =?us-ascii?Q?DBLClC63ER37jrI6+almrGUf2wErjq0nAID0fIqiN/IKuJfXKH+Fi71QaIzJ?=
 =?us-ascii?Q?N6DwzDZBdBeOV/iZc+La6YqZavpVSLHJqpJ5Eyr99tyqsO5fjZspMLg4c/5s?=
 =?us-ascii?Q?arB3N5Jts6BYWpalDwrrF2lp0krkDG0cIve/3LgiGpYJipJ4rkL4MZbN7VCf?=
 =?us-ascii?Q?msJqkxtaLK1D2HgwjtzgEtuneNiPJzRCrSyytnKeMhtMZFDM0Yh/rHBRSHDR?=
 =?us-ascii?Q?d2FSN7fgdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DDknA0ctBVsZLqp0a9DXxNo2/Gz3YA+zCM3lNvKdGqGT3HgYHcYgc9/dj9DMHWwXSU/4Av4D9uoCUGubQ+yHWtF/f2HIY7PwDqpNISQU+jezJ3kXUEZ52PoRdOYUcPoidetFThlMLNh1cAEl2JIjkaGmLzRhxoHj2gRyBQmsG4S38Sz7s/yIqdlq9X/LGe36Bw3/OFEAHcRrBILmpjsIDYL6aoRyDRH4wftTExcrWnfPL4sdACaAqZt+7+K7GDVVmLotIgka1+TMaHTI5a1aJW/uFPyAdNctYLRoZ+663mAPgZpTKvKXM/ESRkHyvUNU4q89ilrMKJwH2dht86VS9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64df4920-dd84-42db-8168-08def76f73cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:11:58.9272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLdDvqMTMe7d0wqUKCT+hUTDtNtTu6yyviTo/CoFgdKVy6jUp5PcRsB64z/OYIJsVzzDV2Jd7YOop1L1RU5Ubw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
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

> Subject: [PATCH v2 7/8] drm/i915/dp: Allow PCON DSC modes through FRL bw
> check
>=20
> intel_dp_frl_bw_valid() rejects any mode whose uncompressed FRL bandwidth
> exceeds the PCON/sink max FRL bandwidth, even though we are capable of
> enabling PCON DSC encoding at modeset time. As a result, high-bandwidth
> HDMI2.1 modes (e.g. 4K120, 8K60) get pruned for sinks behind a PCON, desp=
ite
> the PCON + sink being able to carry them with DSC compression.
>=20
> Now, that the HDMI DSC helpers no longer depend on intel_crtc_state, reus=
e
> them from the FRL bandwidth check. When uncompressed transport does not
> fit, compute the lowest compressed bpp allowed for the output format and
> verify it:
>  - fits the sink's per-scanline chunk-bytes limit and
>  - resulets in the required FRL bandwidth within the PCON/sink limits.

* results

With this fixed LGTM

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> This takes care of the existing FIXME in the FRL bandwidth check.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 80 ++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 652215fdb1a7..938e11bc6a46 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -125,6 +125,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>=20
>  static void intel_dp_unset_edid(struct intel_dp *intel_dp);  static int
> intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
>=20
>  /* Is link rate UHBR and thus 128b/132b? */  bool intel_dp_is_uhbr(const=
 struct
> intel_crtc_state *crtc_state) @@ -1179,8 +1180,58 @@ static int
> frl_required_bw(int clock, int bpc,
>  	return clock * bpc * 3;
>  }
>=20
> +static int frl_required_bw_dsc(int target_clock, int comp_bpp_x16) {
> +	return DIV_ROUND_UP(target_clock * comp_bpp_x16, 16); }
> +
> +static bool
> +intel_dp_pcon_dsc_fits_frl_bw(struct intel_dp *intel_dp,
> +			      const struct drm_display_mode *mode,
> +			      int bpc, enum intel_output_format sink_format,
> +			      int max_frl_bw)
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;
> +	int min_dsc_bpp, max_dsc_bpp;
> +	int num_slices, slice_width;
> +	int hdmi_max_chunk_bytes;
> +	int pcon_max_slices, pcon_max_slice_width;
> +
> +	/* PCON and HDMI sink must both support DSC 1.2 */
> +	if (!info->hdmi.dsc_cap.v_1p2 ||
> +	    !drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd))
> +		return false;
> +
> +	pcon_max_slices =3D drm_dp_pcon_dsc_max_slices(intel_dp-
> >pcon_dsc_dpcd);
> +	pcon_max_slice_width =3D
> +drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
> +
> +	num_slices =3D intel_hdmi_dsc_get_num_slices(mode, sink_format,
> +						   pcon_max_slices,
> +						   pcon_max_slice_width,
> +						   info-
> >hdmi.dsc_cap.max_slices,
> +						   info-
> >hdmi.dsc_cap.clk_per_slice);
> +	if (!num_slices)
> +		return false;
> +
> +	slice_width =3D DIV_ROUND_UP(mode->hdisplay, num_slices);
> +
> +	intel_hdmi_dsc_get_min_max_bpp(sink_format, bpc, info-
> >hdmi.dsc_cap.all_bpp,
> +				       &min_dsc_bpp, &max_dsc_bpp);
> +
> +	/* Use the lowest allowed compressed bpp for the best-case bandwidth
> */
> +	hdmi_max_chunk_bytes =3D info->hdmi.dsc_cap.total_chunk_kbytes *
> 1024;
> +	if (!intel_hdmi_dsc_bpp_fits_chunk_bytes(min_dsc_bpp, num_slices,
> slice_width,
> +						 hdmi_max_chunk_bytes))
> +		return false;
> +
> +	return frl_required_bw_dsc(mode->clock, min_dsc_bpp * 16) <=3D
> +max_frl_bw; }
> +
>  static enum drm_mode_status
> -intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
> +intel_dp_frl_bw_valid(struct intel_dp *intel_dp,
> +		      const struct drm_display_mode *mode,
> +		      int target_clock,
>  		      int bpc, enum intel_output_format sink_format,
>  		      bool respect_downstream_limits)  { @@ -1199,11 +1250,19
> @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
>  	/* converting bw from Gbps to Kbps*/
>  	max_frl_bw =3D max_frl_bw * 1000000;
>=20
> -	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink
> support DSC */
> -	if (target_bw > max_frl_bw)
> -		return MODE_CLOCK_HIGH;
> +	if (target_bw <=3D max_frl_bw)
> +		return MODE_OK;
>=20
> -	return MODE_OK;
> +	/*
> +	 * Uncompressed transport doesn't fit; if both PCON and HDMI sink
> +	 * support DSC, check whether DSC compression brings it within limits.
> +	 */
> +	if (intel_dp_is_hdmi_2_1_sink(intel_dp) &&
> +	    intel_dp_pcon_dsc_fits_frl_bw(intel_dp, mode, bpc, sink_format,
> +					  max_frl_bw))
> +		return MODE_OK;
> +
> +	return MODE_CLOCK_HIGH;
>  }
>=20
>  static bool
> @@ -1215,13 +1274,14 @@ intel_dp_pcon_sink_support_frl(struct intel_dp
> *intel_dp)
>=20
>  static enum drm_mode_status
>  intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
> +		       const struct drm_display_mode *mode,
>  		       int target_clock, int bpc,
>  		       enum intel_output_format sink_format,
>  		       bool respect_downstream_limits)  {
>  	if (intel_dp_pcon_sink_support_frl(intel_dp))
> -		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
> -					     sink_format,
> +		return intel_dp_frl_bw_valid(intel_dp, mode,
> +					     target_clock, bpc, sink_format,
>  					     respect_downstream_limits);
>=20
>  	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc,
> sink_format, @@ -1241,7 +1301,8 @@
> intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
>=20
> -	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc,
> sink_format, true);
> +	return intel_dp_hdmi_bw_valid(intel_dp, mode, target_clock, bpc,
> +				      sink_format, true);
>  }
>=20
>  static enum drm_mode_status
> @@ -1661,7 +1722,8 @@ static int intel_dp_hdmi_compute_bpc(struct
> intel_dp *intel_dp,
>  	for (; bpc >=3D 8; bpc -=3D 2) {
>  		if (intel_hdmi_bpc_possible(crtc_state, bpc,
>  					    intel_dp_has_hdmi_sink(intel_dp))
> &&
> -		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state-
> >sink_format,
> +		    intel_dp_hdmi_bw_valid(intel_dp, &crtc_state-
> >hw.adjusted_mode,
> +					   clock, bpc, crtc_state->sink_format,
>  					   respect_downstream_limits) =3D=3D
> MODE_OK)
>  			return bpc;
>  	}
> --
> 2.50.1

