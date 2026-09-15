Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE03AC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5AD10EB94;
	Tue, 15 Sep 2026 09:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGmPB+X3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3B310E90C;
 Tue, 15 Sep 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789463197; x=1820999197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sTAGiWtLLwzZaj6WXoQA2gJG7C80Sj66nxrPM9FzY74=;
 b=MGmPB+X3loB3XApr+z8by/vkLfK1Qn+Uce/iEmewWbi5OB9TefFj1Uvx
 nzmSMdTj8eCyxiNv+5P2v0sEsJR99G3QkVzyYQXBmp8uVew+o7zIBSdrZ
 fNl10g5Vy0E1vhNFMncK3e75AK5jev0fD+uCBSjtO4lCcJ3c5E9qtL6Qe
 M3U2URPvhKH/zibwCKFjc2+6Y5+wehJySXMlkJB62kgyLvAi57FoqEE5R
 MB77HgHRItfA65Zsn8NiTEzYu16jHfq25hsEBvmsIfjpg46CKd9I2PTNt
 wYIr4Oto5SP10J2bXqsLYzio6brz5jVtGwYEdCf8TO6UPhkQpp0bRdV2A w==;
X-CSE-ConnectionGUID: vI0r9+3jRQeOQXx2wgISXg==
X-CSE-MsgGUID: jDZFnsGmTBKDTIMJert/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89760229"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89760229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:06:37 -0700
X-CSE-ConnectionGUID: jQuegBpZS828SlekML8BEg==
X-CSE-MsgGUID: 5ub4mPmnTs+No/MVgykeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270274669"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:06:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:06:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:06:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADEcGV9xUPfSl4hXneGES1paV2iNY5GMcQAl74qTVZ1L9XPHhHnSI7EvEmMoQ8+29E1DUgEpk5+3UzKU9rJMfbei76vBTULv/bCzNsvLWZqZwkLTegx+JJH56ApJgyOM9Dw8lUct5JuGzlH479jR0jvFtFF8ZISvFFgpnCkjaZyCOdYIVN7pbegPbcGrYOB+pH0ulmFREqN6SIpP+a9tPS0IokHanjqIyKLXL7NuPsJqyCEBfgASFFUqULoCKmFlEYZ8bnG9w3XV+VPWzQ69hkz+uzLSymaQanKWpfxHmZSaSra5hela9jsGbf9KdP1HyZsoGw3iQfda/3UCE01Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QesnlrPkR6PyBlr7FOHkxbWRTA0K4Jo0T0zAq83RLJQ=;
 b=O6NV/QyH7l06W5BVWq52ZJx5vBbwSOb8t2q3oCHHT6nj8Tpk7x3Qg/GIA1CBnTyNw9+livRPGmiWy6RBvTBO79luMdQzYDc33uFtC1i/O+eeKa6PWQ5Ns6/TZw/SeVAow2NIdE1su5JBH8aA1/T7SfyUU7QCIiRK/bx1+1R0tDRyZ52NG5MKW00h5zCi136TNxOuFRvwqThn0KgUr7hZZVh9OLsNEpW7iZF+VegGLHAkfPuAcMkSCWMEdZ8nKggka8aCl5WUYahavgLAfS/aqxlrGdrN4f10Wxv8184ZrIFfVEfPlIrw5I9I5WjvO8PA85u30a6kidtPYp60Z7QyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB870554.namprd11.prod.outlook.com
 (2603:10b6:806:510::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 09:06:32 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 09:06:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 06/13] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
Thread-Topic: [PATCH v6 06/13] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
Thread-Index: AQHdQ5J1KOCQEMyJ5UOz+oVEYMak7bbPW5zA
Date: Tue, 15 Sep 2026 09:06:32 +0000
Message-ID: <DS4PPFE901A304FC1972ACCC0C6D85B70D0E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-7-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-7-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB870554:EE_
x-ms-office365-filtering-correlation-id: ab0338d3-7c2c-47ec-7ec3-08df1308a2ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: p+7QUl5h82qeo2tyJ6uvR1bC+HaYJfbymq+2+VGHCk3DVuwOEt4mFqhUb5G3KloD1iZEBOTVC9SQ692dMZ4+UbXIDmmZXPFOTTV/ekYmC5vWrQZtIBJzuKSaQGFYO/liJGnRW3OXo1gmYbJ6qco1+Vt92Uo5sw8jqP3lkRpWYSQ4TNwe+qju4OoPHomQZ+scbB7UtAtsoqcq5mQKMAYIbUwEywty2lzndVy5Jq0OQcTbnOriKvgueX/ebWl8TmlrKmFHcFDNje+2JpcdZ50LSw2K6OdVLEEEFDjs3RllPKvo2AZc6Rw1xhaTS6EN//FvAW/4YhzbtQ5DQuzwxh7utX3yOPO9vpsO1Aj12pkoVEGYD8t/rJ13kSp+a0tWLQgKIS1ypHRPk1+xTInVrujtsREZZl1kRsgz9TCc+X82uTlK6SrO1AFEoVY3cFhw8RXKMofxiZVMlc6bULidKJCytvOJ3l+Elm8ASYuOZBZCU8wyBIr37Hkv54bFocxaLEyrQWE9JDQdXVOByUgnR1Qws6DNCbTxWW0Jj3ZOQY5dyOIce+nUeKoH1UeKlD72/J3Gh82bIcGunQYXiMYGYjOVmREzfLsOa5dBy0hDgoXSkKgHQUc1SGYg86BJFi+MjpEYffFKc2jR0s+NLkuCGo5bYhZPONbNs125qu1f6RJ5hqeGIsk1lzFQjoRGx4TyHCxtm8mA/g0lrM5n3hb8z1cdj3QmY4q1eF+3qr2NaahziTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0WVkUXLyORWoizfjd/XJgpfBCJeJMcwoRFIf8uytDvSfc8kLnivVTPvGECrq?=
 =?us-ascii?Q?pyKM9Q6vt4RS56Y4hW6S2vuLoMWNWyGqglIHor147E3q5P7ZEK6IKc7mEfaS?=
 =?us-ascii?Q?yLafsRxCnBcn2SuBtN2PTzc/sYbT2lU9AadVLchUesR/8aLrUDq/WlX7xYEM?=
 =?us-ascii?Q?8z6OqnkrvIx9kEElgkm9X0DVFhdMPrnxjKcPQZx5cKaYkqTrg0bIOJgHRf6F?=
 =?us-ascii?Q?Pn4qcqg6REC7XoyE8+5Z6+eVSVt/W+YuKccB/sdsEWlDUIWAYa4PploZy5DA?=
 =?us-ascii?Q?pgfHtvBwwwX64SCsCvw7lJo35LrFl6rC11i5mxo65tGBwNpbeTPxs9BnTKOE?=
 =?us-ascii?Q?wRahwuFB1MYZVngKBRNRLOZqLL4t+oQs4kmblK49FTgqxfS5xHrwWrdVFd5K?=
 =?us-ascii?Q?v70vY1k1M06L5CPZT/0yBWFsfPrd4xa4ZORp+K7aSQt2U/0GAH1OKZDPO8FI?=
 =?us-ascii?Q?fj9jwl4+IRZwAFEsJXzEwUKbzG1YJf5za/68eb4vXIwyLgzm4sWrUhFpMiGX?=
 =?us-ascii?Q?7acwUzBGSJv8G2XH0uAiwPdQrM23zXCs384u87WNVSqPiuEQcPhmIgmyBsR4?=
 =?us-ascii?Q?WeXcinf2SOWE0TgjehJJXZzf9fuzm/l+MlQDpEXPIKooOk+0AnXy0rg1E8Jg?=
 =?us-ascii?Q?cdMa2miHocawnaArE8v9d9KhA2nwP/Z1hs8N7ZWMC0aW6uHj5Gj3ocP65mJY?=
 =?us-ascii?Q?G20cYiOrZV7oZwscCYsclvnDHkOq1xHRG5yU/hOloJouR/DJi0ftHRNynJyD?=
 =?us-ascii?Q?geVM5qat7lGFjkMjiVYTbRxiZGEQKeB4YK5LnlLaiwN2LddVtM0J+UVruzmr?=
 =?us-ascii?Q?BK5DAekBzHgn33aOL6PokSPKPlgAq01GKfFg8eVu4jNjkdZ95HQiXTG5XvPJ?=
 =?us-ascii?Q?SpaK7d9mdfNOKOCfPC5jcubhWM5ibTtCXQhJ3fR9cd1F4qaPWAne5cVQyngT?=
 =?us-ascii?Q?Q9v6O+LV7wOZUa4u+8EMGFwzabcd0BAe58gXNr9yA/iU7MAyUaysogZfa8s4?=
 =?us-ascii?Q?IyHVwY63LUVxBcoLZCHToOX0hlRWRhczLI/S/GNeggCgMzIIHTMd2Ff6fvlQ?=
 =?us-ascii?Q?jXxd+uR8D7UOp+YRab9g3slWOTjaZtaer5D+/Meju8COJmg6WzwtrLrX9fKa?=
 =?us-ascii?Q?TWeiNlWbdM9YPpqh0foQIi/6jMrlWNta8G3msmsFd/O9xuCre+LshBGHI7kV?=
 =?us-ascii?Q?PGkRtTfwPxV6A0g/0vA/iSdlQEboHeD+82QR6N1NJ9wYGxfmYHkSmjSQbVc4?=
 =?us-ascii?Q?1u0h77MkHK3aWy9Si2UwO/WoxJac7v1bXZ7Wy10NcdsXMxtp8WHZO0rLod/2?=
 =?us-ascii?Q?SZH494nwYAqozWhAiJULcLvhRqZtvi5ExLSvmozmroOIzEA5QMfe5F7DYunq?=
 =?us-ascii?Q?bJbCIPQujY/ZkTIiYZkLnNG1SjxaGbwu7M4vVbb1A21QWH2hWcUA3qxEjDor?=
 =?us-ascii?Q?3HEjiu0rGuaXychpOoBhEj06KyTsyVchKI+dpURJMh/vcaQt1NiT8tSvrbgw?=
 =?us-ascii?Q?+6nxTcHdg1oRasW4BTe9KlKMtHAsAGFeac5YefH/pjp1ydTgrhsBqST7z+o5?=
 =?us-ascii?Q?ZmkNdnpLUUOBAKTsYMjHqcM5tk9lEKzWnWM+f7gIjwAuc7S2iwr1r/pOdrQi?=
 =?us-ascii?Q?sKfFtmYOnOSir1Wk6o5VCvvLJrKLlfClphqvXfZJYD9X/+heC3VdE9P2AQLc?=
 =?us-ascii?Q?82GTWOmBh1WAo9iJ1UfOFDeyQIEnt8NWccm2y5RncDOrA5LEtYIT8Ji3CMO5?=
 =?us-ascii?Q?yaxfQ+Zeaw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bymapjfVeaAYKRq8wv4wIRjUrjD58NauG24EJS7ua2IOKd+92E52XxFfNaisqyXQnr2xIwu5LajvBHBfwiYrJMUt2fFYa1zyiKfm0EwidPJPL9qWHd68DiR7Tr8rPeijz963WdNRW/Z7APAmzMhiqMRVkO6TEavFtD6F/eev6qv8JKeP6Y7YEarLgtgHgz6orvDoPvfuvznm3Muw+QMOSfx9HBIvQuNcFfzq3TBKXUugY5Lzg30AztZTovhbJ1jQhKp15EyDgtoNm9Qd1f5l8r2MK7c5zHdpFzclzxAfvYnjjrb1WIkXlZy9RAW3uv2WXB2iPzCWpNvXYl1niDHRyQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0338d3-7c2c-47ec-7ec3-08df1308a2ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 09:06:32.4752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72GgRTsnR1pEtQ5kdQbUu1WCqFiphA8EIcVKl+c85+OeZip5XLtGHOjbSPn3Gbwp61HK4Fyz4UMLllUca1s1sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB870554
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

.kandpal@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v6 06/13] drm/i915/dip: Store and use AS SDP transmission
> line from crtc state
>=20
> The driver currently computes the Adaptive Sync SDP transmission line dir=
ectly
> at programming time. Instead, compute and store the AS SDP transmission l=
ine
> in the crtc state and use it when programming the EMP_AS_SDP_TL register.
>=20
> We get the clear picture about the SDPs and guardband only in
> intel_dp_sdp_compute_config_late() therefore we must configure the AS SDP
> transmission line at this point when AS SDP is enabled in crtc_state.
>=20
> This prepares the ground for supporting programmable transmission lines f=
or
> additional DP SDPs.
>=20
> While moving the helper into intel_dip.c, drop the
> intel_crtc_has_dp_encoder() check instead of relocating it. It was needed=
 in
> the old VRR write path shared by other encoderes as well, but
> intel_dip_sdp_tl_compute_config_late() is only reached via DP, so HDMI ne=
ver
> sets crtc_state->dip.emp_as_sdp_tl and it stays 0 by default.
>=20
> v2:
> - Move the helper into intel_dip.c and drop the
>   intel_crtc_has_dp_encoder() check.
> - Drop the redundant checks. (Suraj)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
> drivers/gpu/drm/i915/display/intel_dip.c | 20 +++++++++++---------
> drivers/gpu/drm/i915/display/intel_dip.h |  3 +++
> drivers/gpu/drm/i915/display/intel_dp.c  |  3 +++
>  4 files changed, 19 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 9b3b526e5e55..dacb4b7588a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -49,6 +49,7 @@
>  #include "intel_ddi.h"
>  #include "intel_ddi_buf_trans.h"
>  #include "intel_de.h"
> +#include "intel_dip.h"
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> @@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encod=
er
> *encoder,
>  	intel_read_dp_sdp(encoder, pipe_config,
> HDMI_PACKET_TYPE_GAMUT_METADATA);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
> +	intel_dip_sdp_transmission_line_get_config(pipe_config);
>=20
>  	intel_audio_codec_get_config(encoder, pipe_config);  } diff --git
> a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index 0277b15e1c82..d1acc7eb5a39 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -43,19 +43,21 @@ void intel_dip_write_emp_as_sdp_tl(const struct
> intel_crtc_state *crtc_state)  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> -	u32 transmission_line =3D 0;
>=20
>  	if (!HAS_EMP_AS_SDP_TL(display))
>  		return;
> -	/*
> -	 * Since we currently support VRR only for DP/eDP, program the
> register
> -	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
> -	 * the register is reset to 0.
> -	 */
> -	if (intel_crtc_has_dp_encoder(crtc_state))
> -		transmission_line =3D
> intel_dip_get_as_sdp_transmission_line(crtc_state);
>=20
>  	intel_de_write(display,
>  		       EMP_AS_SDP_TL(display, cpu_transcoder),
> -		       EMP_AS_SDP_DB_TL(transmission_line));
> +		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
> +}
> +
> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state) {
> +	crtc_state->dip.emp_as_sdp_tl =3D
> +intel_dip_get_as_sdp_transmission_line(crtc_state);
> +}
> +
> +void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
> +*crtc_state) {
> +	crtc_state->dip.emp_as_sdp_tl =3D
> +intel_dip_read_emp_as_sdp_tl(crtc_state);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index 25bae4a04d6b..20f9aeb85c39 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -35,4 +35,7 @@ struct intel_crtc_state;
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_sta=
te);
> void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_st=
ate);
>=20
> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state); void intel_dip_sdp_transmission_line_get_config(struct
> +intel_crtc_state *crtc_state);
> +
>  #endif /* __INTEL_DIP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..8c3a324e164e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -61,6 +61,7 @@
>  #include "intel_cx0_phy.h"
>  #include "intel_ddi.h"
>  #include "intel_de.h"
> +#include "intel_dip.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_jiffies.h"
>  #include "intel_display_utils.h"
> @@ -7324,6 +7325,8 @@ int intel_dp_sdp_compute_config_late(struct
> intel_crtc_state *crtc_state)
>  		return -EINVAL;
>  	}
>=20
> +	intel_dip_sdp_tl_compute_config_late(crtc_state);
> +
>  	return 0;
>  }
>=20
> --
> 2.50.1

