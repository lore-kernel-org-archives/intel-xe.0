Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D0EC88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467810F15A;
	Fri, 18 Sep 2026 03:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaIH5dJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97D310F15A;
 Fri, 18 Sep 2026 03:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789702729; x=1821238729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0kyThf1cXSBgvHkvNKhvMxa4VUX8CSbyy1HOaWi0ltY=;
 b=CaIH5dJNDP65JrQZ8xAm2OJJCqxUiNmQSTgmgeD9XmLIwCbYRAsFHzUM
 Pz5eO0T+ZGGJvGVc7h+Hsqm7AGjqy/H1b1cqwW7/FTQzYHN25m45tVK9e
 1itSJgtfwZunBSL+RsumF2kXo+ZpZmFt+vZ0mrtrga50kNBQZ5nQVxN/2
 BgotUm+Y52w1qS2E38j8kU3uaS2YQNgV7uPeNRQabZ39t4fIXHbMfI7OP
 N8Q5bGxOC4gjiTARalauZ9HHvsL2Efv83EYsuVoYsE8FDJIwH7BFf2g5m
 FH8bjyWrMMbcP0sn2kp/yNO7P8HUo5EvQXUkX6PYWTf97xoiXYppOKCgy g==;
X-CSE-ConnectionGUID: 50gNddWcQzGQaRAVKRuTbQ==
X-CSE-MsgGUID: +OThdCuhSHm5bgDOM1aHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92693636"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92693636"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:38:48 -0700
X-CSE-ConnectionGUID: 1YlhX7fVTjmJdCfiFAM8qA==
X-CSE-MsgGUID: Qd5SsTlhT8q9YCGY6Mzz7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2374374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:38:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:38:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:38:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRO/YejC8KBJcO5UghS8ScgJp2wNjaOK5w5SySyx4uIlkSncUXCaj8hqYaA8fdSKXNrWuo8FAcH5YMq9O+9OlsbPu+CCgKvZZ3iOocb2rUYZTwh8wPcrae9LWkRCl+2legiYSQx8mbg4301wiRBkmS7Gbl4AlLvfkx4DW9TO5384+RuQ6iMfTq+uhB+gNldudjGZhemXeUOsSKXAxhjrf082yDs56+BuKrSyf0c2f5lSAfMwBaQZvXSENm021WlOcogd0fmIoKY4oGzB6QzFxjeYxNWGCbp950AjHW868ZZxLoams7YHfjeAqX+oPBGRlq6S9eMcLhd7IKx/fO0Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcOyccoh0fOPnNnlvbyN1WEDa88AkEN2YYJK08dry/s=;
 b=lX+Rpzkd3rphSagkGAdpUyZbgGuUjihRRjILKyi3X/ioKuXVdsnk4+nQdw8msPjgHpQ2S/DPEuYnEL0P5n0kTWtCw3gPyYg4lgN0yI+uaGLvzl+4GpUkWatJaaNDMdnSJLDf483O6h9QK9rKBbqG+EQ5z9vDh2BNqNlswHQ6S/eWrpx9+81pVUyt8/VFAKVpm0N785PtuRUzmU/8oxAnCy6X17Gqq7QgvyfEHHQOuuLC1qmBc9LZbiOQDzAXglvVb8bf2cWebCmhgu+fCGs0kJ3HIm0FQiRIXjqz7aCznBKVEYHk+07S2yw+KO08kJOMbWcYvyMkNYVDg+GEjxMiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5109.namprd11.prod.outlook.com
 (2603:10b6:510:3e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:38:44 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:38:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 10/11] drm/i915/dp-test: switch to drm_dp_dpcd_{read_byte, 
 read_data, write_byte, write_data}()
Thread-Topic: [PATCH 10/11] drm/i915/dp-test: switch to
 drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
Thread-Index: AQHdRbaLByMYu8ptDEaZDAmgFRmmNLbTst3Q
Date: Fri, 18 Sep 2026 03:38:44 +0000
Message-ID: <DS4PPFE901A304F1E704054B811C5D3A6EEE3872@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <ddf90aeb0dae3779d92381f550d95111398e7e02.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <ddf90aeb0dae3779d92381f550d95111398e7e02.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5109:EE_
x-ms-office365-filtering-correlation-id: fcabd2b7-4093-416f-b37e-08df153656fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: jxglVV6uWSs1dQQy/yYL+8dDfmMEFHyBlEeDnO5vSYl9/miN4PU02bg9htaskpt42tLSyNnRIadwpa7YE/buUYGlM8nKoPDW7RuHePmXQorTB+ZEpSuOgDPMopNJtc9cDITEGLipVqoYeqH2cKvCPWCbCZ+MOB21Q9Dx0skvs93JGX+i9b54I08lEI/UNbTMkoeaWDRYQPT6SODFaTNk6bivdArPlTWLuVsUEiODvumZ72MG78c75Foaji+PzlpRLzt7IzFYPocCmo0HZPM10A3YvKYJtMOyx7KbgSMlB1nQR6U5K4WIi7/o0ktW+E3S/rEEOcHKfPwXGkWt2GznlWC7dHLbdJ0DOmtf75QAU9y0KR1RNlrX/AH3va6Iix7foJsKHShQz3jMrpKlq03GDiCwR9bocwvuAnoegzBzvSGPNuFytjSNcwCBcD9TTPwzOnZAF2a0n4wk1q4Mxhb80TKQdwoEzllOUm2pBDV0dIxene5/ytgOQIfH8joky0dCcL37vjfxMAmSbAwHCsNEdSbXMiPXFB3h++c85VTOEsAZtQVVm89QMNtpUsWm4VwXCOeRxnFyAtnhZw3xMqo/eY6JmElzq7VNcT6+0hz8ifp7UCqYz3kiPx7P0nmtE0DgS9e1dM3p8NQIKalXEuHgjc/t0kK5KPwRa+2NYIR6bPdZZOlQ7h/sYf+2u8veTndbeTfEB0/Ef8q2QhtxXA/faA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SlV2sUJTGObMHQ2updSYi/U0G8AMejw5tp7I2iFlTSR0S9AX7FvCYm4wkF8S?=
 =?us-ascii?Q?x30ZJXMN8Ed93XNOPSgRheoEUYSMIGTbSNeE+t26L85VvbiO2i+KTSa5l13H?=
 =?us-ascii?Q?mQzG5A/VTxas4H2Y2K3dCD7nl8J9hFxnARo0fZU9MbhP5vUzxYKfdCdD5Sl3?=
 =?us-ascii?Q?3I9OOfc/CQ26RuHAS5jdqpih+gmvyiu8JYLNp3MJX9Av38AjCD2Obyj2qB/0?=
 =?us-ascii?Q?SPL/aNglD76aaWJ5nD1LLdS8ogg7flDeNtpvA4epmxh/0XT3QfaOz7+otHSd?=
 =?us-ascii?Q?dXZ/UCuFMy0YTbJNJV+CJz+WZ3U4MDWr+p1WLRSdABUObDedyJPMERWUhQfs?=
 =?us-ascii?Q?vCNan+nLjs5JMKrX1GQBbqSjQgbwoLpLggqhzvEbVBHCOea2b6kW+LnPNzRL?=
 =?us-ascii?Q?Vh7cNKfm33461lyNcZjfihJ2bHkuhn7MYrqvOH0ccyBRvfnyp6kPqYYqf9Ic?=
 =?us-ascii?Q?spd9pnJ/7WExGocUBQZSfxUE2e7ijovV6Xxlq9EQUsUqi/v3KbAGZ2BlChB1?=
 =?us-ascii?Q?rMlo4RlBAZFHD1boXg0geV5LEdxXyHYzK32o5RvD/JmwoZD7ltFQOQNm2gXH?=
 =?us-ascii?Q?MGGOVyLcmYYM0M21Rws0iULjIdQ3nQhMSIz8tyqiZNMVnCPWqXXXz6EJ1fEH?=
 =?us-ascii?Q?mB4Mm/XhhckNqiTmJW5Rtkfh3BsrmhMYBVoR8YACkPbWBkz+BS4BWWZy3XAX?=
 =?us-ascii?Q?yQhmzESUsRNi0xUNt90sDx7D9VUMNOorVXCWS/IKgIObFsdA8S4E9CUZRBsp?=
 =?us-ascii?Q?ZjtedtwKAGDPt+MJIAAGA0mSMsLsH8qzeYZEUnepQsffWkVBA65/7p7YjmmZ?=
 =?us-ascii?Q?3uu6BAjoieBoQgf/Cfsgfmtb5VqqYMlFq9x1XSpyyajYHpTapbuta2iaMikB?=
 =?us-ascii?Q?+dMNLgEhsNJOtEWa3bmd9MuejZgDmDzVRkB1dr7aN0XQ1ltxW+qdQ6BKtveM?=
 =?us-ascii?Q?suSKlCrjtQSal5lG6dWefNMvIQ80tIH671BDgaWH0m8UzZAUBRx6KsvpMUpa?=
 =?us-ascii?Q?UtZFCeOzapHp2jMg1YkynYa1QygdW173iqa8D3koTi981iKQrCZc8SmnWIgU?=
 =?us-ascii?Q?nPlpQ9U8T9HTulIyBngCNfbxK9iMXdi2wyQOy6dNCL/iM5tP/Dw34gAS9G6R?=
 =?us-ascii?Q?lmWX5ANz1j3cFrRt+Ev6Ds0QTLY1hQr2P8biUZNZYNYfjUjwfxnYzLTs2nfv?=
 =?us-ascii?Q?YVKlIp+66gjEHviFLgVIPh+4HHlUbBBKvUsemkh3cIJ8FQUaF+bGLyyY4Zja?=
 =?us-ascii?Q?RLpK+4plS/aUIhgTJCku6RKX25jBrZ8ztPnwdZmeVnSzyFoce2ywDPtgQzmk?=
 =?us-ascii?Q?R35AICt94wXwh+BLqYzz8uK2DbKV9Ps4rwMsVVhQTZfGdNEzG08Xzhp97S7W?=
 =?us-ascii?Q?VHjGYIX9rSKzBSVE+gp6GBrJWql5NuAH6L8+OZmvbs0qYZrbfOkbHuZVfe0w?=
 =?us-ascii?Q?5vZybSfrTbs12sa3/vBkwShafUpruXGtqz/tUdKGfTTEv7xiKZ9prRDI+Ovz?=
 =?us-ascii?Q?zpw3rqGQv95kCBUrvBfeWVOWKY09xvCQ1gcF8VpV0FgywAJ3FGmFdAWrN20+?=
 =?us-ascii?Q?SXpgIHX6VJsnYuEefKjsedTuP2TwfItJRRd7FLnlZlmng6V9PoD7Rl5nZOVL?=
 =?us-ascii?Q?cY7CgzfQT93mgArAwPvXZNMz4Bn9dos06MO5TRBRl/Y7I70EUHcdVe4WUjz+?=
 =?us-ascii?Q?SJl+OOITS0A8x5474+zxk6tBHYKS8e7mbs2zGC6+FfQC5rIt7+CK0c4dQE+Z?=
 =?us-ascii?Q?9R8EZZb4bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IOadpxULkuXD65sUQVz4Hb6qNZdag8wKOW3AeCxSWCS6R7gqk3c23wZ8RfuZv2MeBHkEnHZepd3zXYIfQ+qbWJQSn1gv0v8daPFNW5J2IqG+SNkYJH8UweYQsA8M9G1W6kety0KSHiPXOpkPSGMGk3f4JZSdPSb8eE1iSjLnsN8D+pLfk8uCauK9mlVHCHzntANpsxTEd59NczRNgyvCK60dvb5TR4CNUzhZlP7cQwMjI5D4+lhBUdCJMdx4oSxGQNO+5VXvy9pufUv5bs068tXIuJhhh8vK9EcGWnRd8gXgdgsvCPFOo3ahzEI7fjSjTeac0bcfrf2NfQYL2Q1XKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcabd2b7-4093-416f-b37e-08df153656fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:38:44.1207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8Z/KODUhNNxfcxXAvubD5xrcnciGKqigvmxqGp41zduaIpSIwNmQIQubGRDGjJPc1amErt4d4wSZXbPvHKUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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

> Subject: [PATCH 10/11] drm/i915/dp-test: switch to drm_dp_dpcd_{read_byte=
,
> read_data, write_byte, write_data}()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> This flags incomplete reads, and simplifies error handling all over the p=
lace.
> Rename local int status to ret for clarity and consistency.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_test.c | 57 ++++++++++----------
>  1 file changed, 27 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c
> b/drivers/gpu/drm/i915/display/intel_dp_test.c
> index 0551a1ce60d3..424183a65155 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_test.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
> @@ -147,25 +147,24 @@ bool intel_dp_test_compute_config(struct
> intel_connector *connector,  static u8 intel_dp_autotest_link_training(st=
ruct
> intel_dp *intel_dp)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> -	int status =3D 0;
> +	int ret;
>  	int test_link_rate;
>  	u8 test_lane_count, test_link_bw;
>  	/* (DP CTS 1.2)
>  	 * 4.3.1.11
>  	 */
>  	/* Read the TEST_LANE_COUNT and TEST_LINK_RTAE fields (DP CTS
> 3.1.4) */
> -	status =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_LANE_COUNT,
> -				   &test_lane_count);
> -
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LANE_COUNT,
> +				    &test_lane_count);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Lane count read failed\n");
>  		return DP_TEST_NAK;
>  	}
>  	test_lane_count &=3D DP_MAX_LANE_COUNT_MASK;
>=20
> -	status =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_LINK_RATE,
> -				   &test_link_bw);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LINK_RATE,
> +				    &test_link_bw);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Link Rate read failed\n");
>  		return DP_TEST_NAK;
>  	}
> @@ -188,35 +187,33 @@ static u8 intel_dp_autotest_video_pattern(struct
> intel_dp *intel_dp)
>  	u8 test_pattern;
>  	u8 test_misc;
>  	__be16 h_width, v_height;
> -	int status =3D 0;
> +	int ret;
>=20
>  	/* Read the TEST_PATTERN (DP CTS 3.1.5) */
> -	status =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_PATTERN,
> -				   &test_pattern);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_PATTERN,
> +				    &test_pattern);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Test pattern read failed\n");
>  		return DP_TEST_NAK;
>  	}
>  	if (test_pattern !=3D DP_COLOR_RAMP)
>  		return DP_TEST_NAK;
>=20
> -	status =3D drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_H_WIDTH_HI,
> -				  &h_width, 2);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_TEST_H_WIDTH_HI,
> &h_width, 2);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "H Width read failed\n");
>  		return DP_TEST_NAK;
>  	}
>=20
> -	status =3D drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_V_HEIGHT_HI,
> -				  &v_height, 2);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_TEST_V_HEIGHT_HI,
> +				    &v_height, 2);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "V Height read failed\n");
>  		return DP_TEST_NAK;
>  	}
>=20
> -	status =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_MISC0,
> -				   &test_misc);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_MISC0,
> &test_misc);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "TEST MISC read failed\n");
>  		return DP_TEST_NAK;
>  	}
> @@ -274,8 +271,8 @@ static u8 intel_dp_autotest_edid(struct intel_dp
> *intel_dp)
>  		/* We have to write the checksum of the last block read */
>  		block +=3D block->extensions;
>=20
> -		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_TEST_EDID_CHECKSUM,
> -				       block->checksum) <=3D 0)
> +		if (drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_TEST_EDID_CHECKSUM,
> +					   block->checksum) < 0)
>  			drm_dbg_kms(display->drm,
>  				    "Failed to write EDID checksum\n");
>=20
> @@ -397,8 +394,8 @@ static void intel_dp_process_phy_request(struct
> intel_dp *intel_dp,
>=20
>  	intel_dp_phy_pattern_update(intel_dp, crtc_state);
>=20
> -	drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_LANE0_SET,
> -			  intel_dp->train_set, crtc_state->lane_count);
> +	drm_dp_dpcd_write_data(&intel_dp->aux, DP_TRAINING_LANE0_SET,
> +			       intel_dp->train_set, crtc_state->lane_count);
>=20
>  	drm_dp_set_phy_test_pattern(&intel_dp->aux, data,
>  				    intel_dp->dpcd[DP_DPCD_REV]);
> @@ -427,10 +424,10 @@ void intel_dp_test_request(struct intel_dp *intel_d=
p)
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	u8 response =3D DP_TEST_NAK;
>  	u8 request =3D 0;
> -	int status;
> +	int ret;
>=20
> -	status =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_REQUEST,
> &request);
> -	if (status <=3D 0) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_REQUEST,
> &request);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
>  			    "Could not read test request from sink\n");
>  		goto update_status;
> @@ -463,8 +460,8 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
>  		intel_dp->compliance.test_type =3D request;
>=20
>  update_status:
> -	status =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_RESPONSE,
> response);
> -	if (status <=3D 0)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_RESPONSE,
> response);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Could not write test response to sink\n");  }
> --
> 2.47.3

