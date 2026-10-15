Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81850CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97010E290;
	Thu, 15 Oct 2026 19:40:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524210E290;
 Thu, 15 Oct 2026 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792093241; x=1823629241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GL3ajDy7v1TaArmmkkfJz9HZdkx8vwLo4ssq/EINgew=;
 b=VLJB1LHt5qwJn40XGKO0/37aQVxaX6xget1bsQbWnPS7DwFV7x3OYwAb
 xnFusajX1cOpk0gynRbcEu+/XXOGtxJSpZNg/6LCN1RZY6mqGtzgEJoU+
 tU2xCKHzIymiMuDzoX3o3yHggCiaPjHR2g4oqk3RAzdf3fdH7k+t/6Oap
 8x/jm+UVrJeS52Ds/ch4ahT2oDBOPOW1lxfG9sL2wKioZsNjQ/57prYzp
 6pSRkMkm4u1zEgE/Sd9AvF+Yy3LNIClfsnhVT+dhWmK7FO2UoQymOxddG
 bcRFZHUm8gh8B7a7ZWhI9OKIbnlMllop+RZAQqZrPfpKHBC0o82BeLeUM A==;
X-CSE-ConnectionGUID: sfDvpTcNRQOnuxHL+rZKWg==
X-CSE-MsgGUID: +SUZwgiASwyiKBr11QL48A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="758100"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="758100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:40:40 -0700
X-CSE-ConnectionGUID: RvSBh9qCR4SBKJfk0tHh4w==
X-CSE-MsgGUID: jEP30uG+QLidWw7SiOvgRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1739674"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:40:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 12:40:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 12:40:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 12:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQh6d1NsTfEBbeE3ycGGa8M/MlzitbolP+6OgqD+WDhYCq6ZSaUK53RIvdvnvLQxaiEJygV2f7E6TJGDPERviJceN+8WkebMy9lXSGolj4s6vLvKPdQXMP1bbUmQvwQDAtOpghaYC2ng2zH+r3Jd84QUgeenMV1utGN7ezuZaEfXMkrPgPTrvg8H+E1RlAf0d3VtHAkLqjPVUEc2vVHTa5o+iHkjT4HduM2ZTGRykdv4+KUYZNGotMmWWDJOYdtS9nA3m+0vg2W4ORCT69hnfbLHg1dGn7t9SV53LuxHaj+rjHXEpWFcZsbr+5s85vcGNjc8L2xT1fuCjWI+Yu8ObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpCHJtzXzQ9/AfRUHH3YY3vHLCc89BbXmoZkZhbRpd8=;
 b=ZrEStjl+hSsGMqeQ70UzAm9d+1Hoxye1UiXt9rm+1OieB2iQ+0hvB51FBqMq6XfH40jr9wBRaP8kCHmtywrBxYZdYqn6pSw47jMXiE24rVE2BLEH2Hj9mZHfDMwQdV45U3W8JfeDGVWVuilwZMjMuFoPZGFjWrPObjFlRWLmbawHG+15f/0zMJk0wK7FyHr42qEc60DTDFWvyoAOe7DzvTRJgPXZ8eQEW+4GSljcxq17HQ2vhOIqko6uNwVhl5/MyB9gTnRESzD4qSGyVKdnO9yPegvfhQLb1PIJyRoUlCsjeqZPvLinWM/WfZsk9kHPnjEa9jyTR8FeMqAxu5BETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 19:40:36 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 19:40:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 06/10] drm/i915/display_wa: Add support for
 Wa_14021768792
Thread-Topic: [PATCH v4 06/10] drm/i915/display_wa: Add support for
 Wa_14021768792
Thread-Index: AQHdRmKJm0HL1aLLpkWWMmrQq0NAKbb/LRPg
Date: Thu, 15 Oct 2026 19:40:35 +0000
Message-ID: <BYAPR11MB378321928483694DDF009636B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-7-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-7-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|IA0PR11MB8418:EE_
x-ms-office365-filtering-correlation-id: 9ce3740c-34ae-404b-5a6f-08df2af42f13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|23010399003|366016|6133799003|260925022911599003|10067099003|18002099003|260925021911599003|22082099003|260925021311599003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 9T4SJ9MBuqP1xhbJ/U7tND41L+UveOwLyRU3p50IAd1OxLUxwV7rkqezixV/d3ZDLV8wWBY5MdElbLrv+FhBG/S7AVloEJgLnAjZvKIaub07opAz3Hw6QhsgXP+bxOyn3l2c4LHyd1kXs3RCwILJMKB6Iz34qnsQ2Cwm67xFhsVPbL6DHKxOdM2Aw7tKlzocI3vAMdGXtsBK3wdr8Vi77pvapHdPGE/E4C4pfqd/rrRrAcPuRLDCVnG42Mt4beAVNG97emqjEvGTRtElUaXIW50kNXlyCTgQzJ8LG6dTUG5t8Uya99w4zKCcNrO6RBsu72sjBNG/JQE7f9tdce8M9W8YCEZPjhE99iHybsmUywAf/0Stpg6NeyiAZUUM0oaG6LJ7utGjpScMODXeskXIJgvowNB3lc+Eu2YgsrMJbdaHEq5DTOXXoYW7z+j7Ii0CdykKJFLaluNd+Ly5rN/bL1qrQAF4xpg/GltjZam6nItXUoDQYeHtaBnVtAcVhS7ZGQz1Qk/9KbXDRpSG9amD3Mp6lKPXMEKxfPW1hTw10xVJJV5uwOkBU9JUFv2Ia23LYpCb0dyl9s3QEFOh/mUjXcI7OM136dy3YDWzeYWSNTfiJIBtPPoMqKgXG0rFhq6sM+f5n7JTcikIcp2wdvwXmuMmGE6GPirEuJs3j9Zn4X/L90ANk6Yn/OEjdefWUL35SKEtnJBDgpbYFOXXQaB19w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(6133799003)(260925022911599003)(10067099003)(18002099003)(260925021911599003)(22082099003)(260925021311599003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/B5TVnvIypyA7kl6oxTagCKxCdC1F53JNpHSPLhpahutJMS6HvAFFbYKv585?=
 =?us-ascii?Q?/HhiQiNyQAjMYMDo5b8NGwY/in5pz6gP5g1TrG3NCnqlnwFJjCwQwXQvbukA?=
 =?us-ascii?Q?9Ii8WKUON6f17OA6K6fVzBT5deXEyOxq1p2bXCxjwT7LtDi8bqTfNAfxP6zO?=
 =?us-ascii?Q?0P2W5851oTT7ydFWkDff8eKyduyLC2oW63wUFqlKAs/n/aX7Bc4LtpzB+Ph+?=
 =?us-ascii?Q?eHCZuRnlqGTU2z1wPFsgtx4BBPafYEkLjV8VFVGD32mVFHfT2wxeyMAv0og0?=
 =?us-ascii?Q?Wnw49P+ToBU1qm5GOivxLLUKXYfgMLldySk0OcYYYLb63jR1pD3lMhpiYHmQ?=
 =?us-ascii?Q?VF4iy2yme0OekznzVbF1Jq1hHAj/nKZ7GGnEXh/glyer8Z/Wi2mmn/PWvOVR?=
 =?us-ascii?Q?RDUGQwDu4+k4JQoDWEKaOAMa6qs8Vu4gikvMLwHaE6AV6ydOBMNfKYoPM6JL?=
 =?us-ascii?Q?wpT2VIAPwHNVWpNwWMNAzcv3FMi6rPGsxU+EDG5YZBzvhnxqLbd3vut4f55m?=
 =?us-ascii?Q?65ngC+wqYl3ErsevLinD0W24pkb5bb+730nXYdFK6KyG6gmFNUiTZd2xpBpZ?=
 =?us-ascii?Q?xdWeN69FezKTtdHxTTNknJh6vs7C6fPSmGcDWtFlw2FuY7Sx2rOIprWE+aNg?=
 =?us-ascii?Q?heN/L+AKXZcoBXEnsj7kwz5Db5AZnX+e2Rljl6V4RAuoxOf2kp7FsvkfF2Zu?=
 =?us-ascii?Q?bdxf6VLysM8NI2w72p1ju2kFEyXMTeNbiZ+SXrePTFkVyauUbf/NFsr/tDkP?=
 =?us-ascii?Q?f7BleppFWyYyLBO8rw66BJnGnja3wQzQl8jyKB1KsXrlvq+2gCgyUVSN/MUL?=
 =?us-ascii?Q?mNOB674e3WtXI7HKr/o1bXRDGy4BU5+tPrJDCvU9tn5MKnwm1IdydMVTN5zX?=
 =?us-ascii?Q?1E1YlURcFyXru5a/cZBJKBKdjZBK7K5oneURIm98TP7Cd+oQ4KJ/0QO8n5mX?=
 =?us-ascii?Q?F+N37uY2iREW2ZyUKchxCvnA2YjEVgUlh706q4x3rtaGBfkl9iOVLHu5a3J7?=
 =?us-ascii?Q?qq99HLI0Ag0UJfq+rxD0/vtTGg1T99FA4EzvET6pbgmYZ9GgxXsO4lb7yWCG?=
 =?us-ascii?Q?hYyAY2V1mX9iNfZTVseVBet7Z5qpFVfvbDiJOOqF1obc8SMq0wO22jWYv8eX?=
 =?us-ascii?Q?lPdHA6sYQujV+ctQ2C4Bw9LpNX6FxbZ8S0gh3/yp3fW4V0zWcNKYPtlWLxin?=
 =?us-ascii?Q?i/cCOm2WhmhKc0TPtOVAiQOj7cdc4RRzDNlSwwlwp45xUGMTprsAUW8SUX9t?=
 =?us-ascii?Q?SobWiG01AlklW45m9wkbNJC0PWppbs1mNUFBfJ0Ss2PGXkpLD4wUBdQsr29E?=
 =?us-ascii?Q?AeSs8G3g16g7Yc4uB1IbjXYsg4uaFhlihLYD0JjnjS+zORrBHSNd0ig1wyIF?=
 =?us-ascii?Q?cYJRX5lnr26RYZkBMopqAHielCavH2y5W85I4eD8LuJip56qIsSouJhw5MJJ?=
 =?us-ascii?Q?8e16mzuT1FAfN15aPtO6X6V0UxAOjMdEk3vEFOwUayKKaxneNg9dUkqLUEi2?=
 =?us-ascii?Q?NMcanBpGLRtQzPZleJs66Q777s/L2vwcOtrXmiBGFj4BGMo9Rog+Af3JJkvB?=
 =?us-ascii?Q?yTFbFweBGkoA3ZJazugGNQj0dHFKQqyAf4HcL966ANZTrNOj9PzZoOIyaoNK?=
 =?us-ascii?Q?0ZMDFpa4FDe5I8z1+R1/w4fk/8pZnQlIKJIjcDididJGztaYrnlsWjQSOb+B?=
 =?us-ascii?Q?cIpaolYuGr1g2lQ10J8ed/oQQnJSFgRswusnYeZK86ZZKfZE+O+DVFrUiM1j?=
 =?us-ascii?Q?8sFdZtt4kynUMMvMePyF1vWDK8CT4Axyz1oa0v1nAp8l/GD3VDWrvzNiIu5h?=
x-ms-exchange-antispam-messagedata-1: SAEiTUPd9M+jI8GfmAHGOpr5mvn0M69bVHQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Cf6330zm6mu83fYLVxSXgmkKRVgxq+WSPSIweRlvVPpCbIT3PnH2mDock8tqShVpttVtPipYJ525e0+QYaBZdDgfZ7TiaJoIcaDFGEGcBhzpf0mcsMYMXlJs9WtOeNobJVL3LCbulcdR50kkvtlxQNskMqLqp28guisAJSA8tdhTpFVKN7E62uF+WyvSx9gMWLRtgcUEz+LC+P/xB5CcJlbm35HfqsLqicNdqf56ElsEd9stbml2Du/LP0J3DN/7p+mskCrIZkyS6CTo2WwmBwo/jQiyzor48icJXIVKgABOmQ/0E/4gJnAhTka2N2kqs4aayR51ordcL9+IAUz+lg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce3740c-34ae-404b-5a6f-08df2af42f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 19:40:35.9904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TN65akIu5W5YxatkFzA9+W7H2OPYwa/VrhXL8Fr3nn7wNHG4p+fif4KvV+ymcEvM6tHmzJGUN8CQeymQsMb6SHPt30LmzNT7byVvbEBKJFLP1+3YBnl70oul+2kxzKd0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: 17 September 2026 10:37
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v4 06/10] drm/i915/display_wa: Add support for
> Wa_14021768792
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Some BMG ultrajoiner configurations require support for Link M/N ratios
> between 10.0 and 15.0. This range is not natively supported and requires =
a
> workaround.
>=20
> Wa_14021768792 enables this support by utilizing HDMI_EMP_DATA,
> CHICKEN_TRANS and the extended bits in the LINK_N register.
>=20
> Add the necessary logic to enable the workaround on applicable platforms.
> The underlying mechanism comes from the display C0, so it is gated on
> display stepping C0 and later.
>=20
> v2:
> -Don't include i915_drv.h and don't use struct drm_i915_private under
> display/. Use display->platform.battlemage, which names the affected
> platform directly, instead of IS_DGFX() combined with a display version c=
heck.
> (Jani) -Rebase on the reworked display WA framework, where the condition
> goes directly into the __intel_display_wa() switch.
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_wa.c | 9 +++++++++
> drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 888676693f5e..7456194216be 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -111,6 +111,15 @@ bool __intel_display_wa(struct intel_display
> *display, enum intel_display_wa wa,
>  		return DISPLAY_VERx100(display) =3D=3D 3000 ||
>  			DISPLAY_VERx100(display) =3D=3D 2000 ||
>  			DISPLAY_VERx100(display) =3D=3D 1401;
> +	/*
> +	 * Wa_14021768792:
> +	 * Fixes: Limitation of Link M/N ratio > 10 for specific Xe2HPD
> platforms.
> +	 * Workaround: Use HDMI_EMP_DATA, CHICKEN_BITs and extended
> bits in LINK_N
> +	 * registers to support LINK M/N ratios from > 10 but < 15.
> +	 */
> +	case INTEL_DISPLAY_WA_14021768792:
> +		return display->platform.battlemage &&
> +			IS_DISPLAY_STEP(display, STEP_C0, STEP_FOREVER);
>  	case INTEL_DISPLAY_WA_14025769978:
>  		return DISPLAY_VER(display) =3D=3D 35;
>  	case INTEL_DISPLAY_WA_14026643300:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 425a300840aa..b8f2f9363498 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -33,6 +33,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_14014143976,
>  	INTEL_DISPLAY_WA_14016740474,
>  	INTEL_DISPLAY_WA_14020863754,
> +	INTEL_DISPLAY_WA_14021768792,

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  	INTEL_DISPLAY_WA_14025769978,
>  	INTEL_DISPLAY_WA_14026643300,
>  	INTEL_DISPLAY_WA_15013987218,
> --
> 2.34.1

