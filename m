Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD22EC982DF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 03:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625A10EB55;
	Tue, 22 Sep 2026 03:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luyBHgkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D4410EB55;
 Tue, 22 Sep 2026 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790048350; x=1821584350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rq5ucdNVqk1ocVizpJYwg6qZCoXQgECwAuQ6xnRYQf0=;
 b=luyBHgkZahWW8U5klRK0zYX5093qKB/u2aJ/tp8Q/rLD0h+01tjLcJQG
 HEGITDqE1fyLpQrXhdsG3IbFTEnJOwzCbz1LX85MI+pfiY2VOQAiqcdkK
 aYWGpQTdnjluumrMfKjKJJcYnrRtURoiIAjW576aI85MsNc5BccdR+sGn
 tazZXr1tA5yFjpNnX8eQ/KByMrXol6GebH8UKz+8Nuz2TxhtQUYk6E49E
 8LkR4NQnK4E9QAQkgUvGKFx7DWDk1oJCfMfshn9lqL28EKqcGjUA/QOmo
 +R4lfYcS2/u4Kw7uCswApqi4kKx2pQ+zqUtr1gXlfDmk8Dprh8+b/FSOH Q==;
X-CSE-ConnectionGUID: l6stAQY/R9yliYLKDyT+Vw==
X-CSE-MsgGUID: 6JfXlZouQzyEx5NYxX3YxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78169914"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="78169914"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 20:39:09 -0700
X-CSE-ConnectionGUID: pusNg1q5T1C4IXpLizkPKg==
X-CSE-MsgGUID: LFfPOzbtTq+6G2J25t7KrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4040106"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 20:39:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 20:39:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 20:39:09 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 20:39:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z34QX5gT+9O0tVjfA+nnd+03O6QkJ+0yESG03LhD3L03NMhZJj4yuKeSXzLFy5xlzc0LlD7wh5QYJCcmK1EHrmOgzmBwdgg7227AgViLmNZCXdAVDmE6nHXCikbmYeawv/aJtn31lOaLb94RnxyU4+yg6YnkbIdgMpw+7aHT3KjNtNeTlgtXi9GBX1KvDA9rfVHZYljeF4EhklqPmEVwe//ip1jG6ShjHgvqdqMc0IbML+kzPYELbBvev85C+Z6AU5uqXRUaExXXkUyAU9yWc+tBa995pa95Ka6IXvfy0k+nT73BiCfjaV5JJwcyrjDXgzawhTsg1C7Gv3dKj46+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWvjVAniFpFZe46FAF1GmVHpRElMoaJYUhE/3Exr02E=;
 b=wd3phwYDWFhCGunFSHQPMMQpzcOVDo+OsLi75D/YTJVO190ivMfAigNzgzRToeGRB3fMaR77T1hJPx4UQuQU65YnzmPpZYK2SCqARKtd5Jg2SxWxNPEEVdmPfcZxqTV7Sr2gG8vITNtUs1lrw+FJGEq7ydTS63dxEbI5mglgAntoVBGzbG5NVsMQeZzx5yLXJpn/5/0JRob5Tbd+GemEPjgMacc9eu69GRKPs8eNzazWOkLNT3O2JmDOsg+myLFT6D0vefdBVCabZD7zJNePKA/n5QBoQdIxVZ9zyuiXFHxLV1qKJS6TSjxP9mBV0AVT74uNW/oazfA+xIzFO7WsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Tue, 22 Sep
 2026 03:39:02 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 03:39:01 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
Thread-Topic: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
Thread-Index: AQHdSW/U0xMilEauD0iP+qeqs7awIbbZ9JZw
Date: Tue, 22 Sep 2026 03:39:01 +0000
Message-ID: <IA0PR11MB730779686E1E5BF0D1DB7442BA832@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260921022016.1525322-1-suraj.kandpal@intel.com>
In-Reply-To: <20260921022016.1525322-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM6PR11MB4754:EE_
x-ms-office365-filtering-correlation-id: f49f4c15-fe78-48e3-ea5d-08df185b0b2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|4143699003|10067099003|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: u2ukNlBgY3fwlM+w8bFLW+mG0s7RRqElT+UQurIcxrWbOaxEm5bf7QyzwuR+VdoohhEAaNCG5qzwEN73ZZz+SFlO1bJDV5xxjiobW4sF20KbUMNFtaRSawRanZsB0DvpdV5RkvytXs2huC0kcfrFX2nyMhFOIOdDXQfLuKj4lJ5sEHr54hKSVZrMRzC2XUz7efycQxuGZoeZWvsCx4qK5Ywg1ODjrIkzRQwXmU1cxE2aCub8k0hnHFC6/MWIyeed3e05j+Iz/YqlF1IvB+N5ohy806fqNZqRjgL88PhRaKpnBn3XRoMi0SRyBRfHWRcfdXAxCH2qLsFkRVAzfWKkl3xh0977RbGTh24TU6jil2KQuTJWsE33cboBTMPFL9IrmmDmVuGjANhDz+jffNAZL5Y4BtzcshdJR7+/ZSzJMuLicDxAGZ0cp9eitdVTeT+GkU1TOM4zCuThhyGI6003/NSuPNuUhCpeNW+C3+IIguH1FtM3kO8h2rzur7mPK1zL3fU2BGc95kBYzz3UjN2X0wsAn8buXUyXm+0jtqIi6/ZYCPzJamOfRF1+jg1YzEPZvD3yzJFa0lmtlaLbLTjkSGsAdIwCyMkgnV/xO2k5uoeJ4bIPN57f419dj3AWPXR8yjwvEJEpjxG6xNXSFP0NO9fI9KatXyvDNsUrIopEQzGxItW5Ku3NmlsAtK0ZUOiAd1foqc3HIx+JS0ASAy8IcMQ764wM9PO3fwMyWpttzzg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(10067099003)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?40/ubLkYrlwya8ewx17NoHHIeEXxG+dbQqjim4gaPy/Z98djk+H8f5/HhHRa?=
 =?us-ascii?Q?TUDCU4x7U2QdCJvf66YkQ+hdwk1Mo0vfpDlemK+D+sSJ2PJ0CNJUYTMwMMo/?=
 =?us-ascii?Q?0Ua8eAtcpRGFq4rdD1xCOELzpEj3uu2EfzSU+BKMsTgbnJ3rS1L6vAVWGqmI?=
 =?us-ascii?Q?GXG84Ig3GNKOqYegbqbE7VBmn5HTCR5EhVECc3NTHx21clj80hZ686k32p5k?=
 =?us-ascii?Q?IO81FH2THE5uom7c1DZNkQTGS+K5AP0jxV5oTcrSsBr2Fkwqd45KY6mSaFmc?=
 =?us-ascii?Q?oC8+Oj/zV4TtcVmpjyupq/kMhAElTQQtv6GvugHA2ZSnt8y9jOoDrpC1ApkH?=
 =?us-ascii?Q?8kkCy7C9QC3XjewowJ8jwUK0XqWi8SLodcnwwupqfuiuqXqR8hThr9fEHSXh?=
 =?us-ascii?Q?N7BOiMinJPH9Rnl7l2VvUYE6/iD1lmyre39jU8eU8FKV/VIu8EuVcSmb2fAS?=
 =?us-ascii?Q?o87W0tkWhh9ofT64ZxYi6S0UTlhx3lDQxxEFTLBAC4KULyrokEK6k/Pyhbin?=
 =?us-ascii?Q?9esSK70BVs4dPVTLITlJD3OvMTNtlGO2vl4VXzoR42dIuGZxDMiBTTpCwFcj?=
 =?us-ascii?Q?/QOUu4qHxjuiGU7hJm0n18UzRUywElnoy927m1Pg23iIFqET5TSAzyNA5SX6?=
 =?us-ascii?Q?1AQTVmxt8DzKSP2tcng6DbQ9aZzVc3mjyzI6jmctFTXDyCFb9NSdyC46f47S?=
 =?us-ascii?Q?Yt6442xL473ZTDeW+1m/zRshKnQguKG1sYCQyO40XKuzu2as0RD38GSmmItE?=
 =?us-ascii?Q?Xvhj3x7934Za8EQI1JbIaOdiof8W2J2cKMTIo+U0ivSXay1EenLTx3FVGaT6?=
 =?us-ascii?Q?uIJIp2Cik0AoobA5NxAnpHR1ipvrubT0uIuyJhFTV8VFAeN80yCPmLna4FYn?=
 =?us-ascii?Q?vQCnGRZgbFw3wZm47nmtFoobt6xh9YqTqeA22SiCcfBTQyD8YEu6fUm4zTgD?=
 =?us-ascii?Q?5V8BqVqAn8kz6265ubTELgiVzhfc3j/5pytEUyf18E0AOaWm3m015moEOADz?=
 =?us-ascii?Q?wYMbyzVBqixiBQ8bCsr9c4D9uLKlK2vjwwCf/20IgTwCdMB6hdkcxonSUIa8?=
 =?us-ascii?Q?QLXuSQ2AgY5mdOt+4OAjriLSxVYTxE5uWY0TKWV2lyErbfZ32LLGB2BcXqv1?=
 =?us-ascii?Q?ta2ZMbmnDUyrKd6Pmw6A40jgJYWiVhJrTfbbaiAP5aRfeJK7m8VvDK8mN7vW?=
 =?us-ascii?Q?BJfwVLkuuaPErpqZd7pJnwaV0lSjf5tfgiWVlfdM55O6zj4NWtfu6L1LHaBN?=
 =?us-ascii?Q?z3PXM1JUzvlEDju/zD7B/gwFR1ahyLVRWx+i8wJyYT+TAAEhJI2Zv/5m4DYF?=
 =?us-ascii?Q?v8qqy/6vnbJLxJmUfA66mQzqGheWzqomoXRXoN36+Xuc4Z3wQKko8jYL7pIt?=
 =?us-ascii?Q?6yRyOECkaMc0DKtKlxwXgQjpa0D1w30t1GMhc2/wFEv2N7uCyeCMzMfHB2kU?=
 =?us-ascii?Q?onTE2mgh3jyPwGpQi5UOUgiluafcfbO1pZeoz/2bV1JUyCK1Gm97swKSWiRZ?=
 =?us-ascii?Q?5GivfF877x0lt6Vgpa4emEf612SLNi0qQOy4+qDfYbrFSIpxjkGJJmbldeQF?=
 =?us-ascii?Q?4SvL2EN+8DTd8+oi0WRDWRaur2cgtt3LflItlN6JJ1m1heOzSDM98b+NCgI7?=
 =?us-ascii?Q?JwRhV4Rsj6jhiejM1jqzt556GbT9X5nZayW6b4e9AoWco9AGrUG9h78E5x8Z?=
 =?us-ascii?Q?o2N1W8pTsZv1tgirIKFuLbx5FIwhuFb3XyuMIcnq5DP5DL7srXUJfINnMCCT?=
 =?us-ascii?Q?bSloDJfkcA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Fokct3HMA23P7iGy4LEqjWP3FTHN0DC9XsBQazMGP8hIz3XF80greq1ujMC16b1t2XEch1+B+wR6YRd4XEwhixefU2U38NI04uMMduKz8YqsXy/SdB7+2jN7i8o4i8lWB20pBB1zx3gwTdizpc29WyjI+JOcKNXbSPcBSB+Ba7m99kg5488gFXQoTI7ZY6WykcHTKMYmziS+pS/sWLLHXzHceolPLXst5h/g3LNN3k32o+STeaeYrxPOSSlLxVc1OmkFN/RWKvelmaIGwizmEly2ybjVjKnm/Yd/v2RR0cAHoCYvjEIq1uQ31/29bZzbipYy5FN9BstHmhqkMdJmrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49f4c15-fe78-48e3-ea5d-08df185b0b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 03:39:01.7256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GdL7DwmeiEwK5JX2mEywVRx/r48pfqdG2DWU3J8eVfgGBNGAcHfAYiqxi7xhdHevkc7MoR0kXxDQo4lRWN8Gyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, September 21, 2026 7:50 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Deak, Imre <imre.deak@intel.com>; Naladala,
> Ramanaidu <ramanaidu.naladala@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>
> Subject: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
>=20
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec for
> SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced which
> powers down the PHY. Which means we need to make sure "Disable DC5/6" of
> AUX Programming sequence is honored.
> Add the AUX power domains to the DC_off power well on Xe3p_LPD+, so that
> DC5/6 stays disabled for as long as an AUX power domain is held.
>=20
> Bspec: 68851, 68967
> Suggested-by: Imre Deak <imre.deak@intel.com>
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
Reviewed-by:  holds good for this patch as well.

Thanks and Regards,
Arun R Murthy
--------------------
>  .../i915/display/intel_display_power_map.c    | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> index 3400080d78d2..e18eb49983fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> @@ -1759,6 +1759,44 @@ static const struct i915_power_well_desc_list
> wcl_power_wells[] =3D {
>  	I915_PW_DESCRIPTORS(wcl_power_wells_aux),
>  };
>=20
> +I915_DECL_PW_DOMAINS(xe3plpd_pwdoms_dc_off,
> +	POWER_DOMAIN_DC_OFF,
> +	XE3LPD_PW_2_POWER_DOMAINS,
> +	XE3LPD_PW_C_POWER_DOMAINS,
> +	XE3LPD_PW_D_POWER_DOMAINS,
> +	POWER_DOMAIN_AUDIO_MMIO,
> +	POWER_DOMAIN_AUDIO_PLAYBACK,
> +	POWER_DOMAIN_AUX_A,
> +	POWER_DOMAIN_AUX_B,
> +	POWER_DOMAIN_AUX_USBC1,
> +	POWER_DOMAIN_AUX_USBC2,
> +	POWER_DOMAIN_AUX_USBC3,
> +	POWER_DOMAIN_AUX_USBC4,
> +	POWER_DOMAIN_AUX_TBT1,
> +	POWER_DOMAIN_AUX_TBT2,
> +	POWER_DOMAIN_AUX_TBT3,
> +	POWER_DOMAIN_AUX_TBT4,
> +	POWER_DOMAIN_INIT);
> +
> +static const struct i915_power_well_desc xe3plpd_power_wells_dcoff[] =3D=
 {
> +	{
> +		.instances =3D &I915_PW_INSTANCES(
> +			I915_PW("DC_off", &xe3plpd_pwdoms_dc_off,
> +				.id =3D SKL_DISP_DC_OFF),
> +		),
> +		.ops =3D &gen9_dc_off_power_well_ops,
> +	},
> +};
> +
> +static const struct i915_power_well_desc_list xe3plpd_power_wells[] =3D =
{
> +	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
> +	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
> +	I915_PW_DESCRIPTORS(xe3plpd_power_wells_dcoff),
> +	I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
> +	I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
> +	I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
> +};
> +
>  static void init_power_well_domains(const struct i915_power_well_instanc=
e
> *inst,
>  				    struct i915_power_well *power_well)  { @@
> -1865,7 +1903,9 @@ int intel_display_power_map_init(struct
> i915_power_domains *power_domains)
>  		return 0;
>  	}
>=20
> -	if (DISPLAY_VERx100(display) =3D=3D 3002)
> +	if (DISPLAY_VER(display) >=3D 35)
> +		return set_power_wells(power_domains,
> xe3plpd_power_wells);
> +	else if (DISPLAY_VERx100(display) =3D=3D 3002)
>  		return set_power_wells(power_domains, wcl_power_wells);
>  	else if (DISPLAY_VER(display) >=3D 30)
>  		return set_power_wells(power_domains, xe3lpd_power_wells);
> --
> 2.34.1

