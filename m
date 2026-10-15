Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C52CC6B2F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 04:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354E10E762;
	Thu, 15 Oct 2026 04:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916CB10E762;
 Thu, 15 Oct 2026 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792038410; x=1823574410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0OGae/Z7fJGuBX2M9HfDXuWZ15rnpsevEtqRNPIcSfo=;
 b=R2S7BrVkO7OUgKyl4PAZaRq112eYO7YnK3viWyxb0SX5/O88IJbqArGS
 7sJQJ5/zofQyGTsISJ0UPvCP2CKSZvCrpJQl5dBSrLgQyo81cpOt78gFW
 xcB98GmQcpQT78nUPGXa37rjCc91b+TmPBH3ZqFOU78b1s86xxlQL5TEi
 YQ7xvWnj/jeucBimHU9e10qa5hGvjZSq0lUUh8wACZ+LHupvAGB1c5aYh
 GcHPXBjfd5IUzKXR+hRNL8h/N5mWtFacpuS+cJ89t/P0ztqnqcR0DKl7+
 lqERHjy55OrfHOjMy3dOv7OHUoCymFRJH/zYU3wJ5xyFdXKEbHFQ6HCF6 w==;
X-CSE-ConnectionGUID: ATNy0D7bT+WAJAS37x6jdw==
X-CSE-MsgGUID: 0f1EgZptQw+5XzjBOu7kTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="673150"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="673150"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:26:50 -0700
X-CSE-ConnectionGUID: Drur/Z0CSAq/gmSXXgLNcw==
X-CSE-MsgGUID: MsbW/VsfSYq+Icailig9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3434211"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:26:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:26:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 21:26:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIm6MeWPsgDGlKN1fAh8imUAcVQ20qLsvou/PWQAOZZRAFT1LVk630hL0L7FmTZE2tXLD9zctQhiFP5vynXrExAXhJSPYjz4RGqpEwY/JIiQ1R61mvjpuvjBVWUnjHYfmmcyqQbVz/ZHJsuci6fbFuu7khjgDanezBHGzY9DPzvIvN+P89rp4196XJymTB9RozGWXTxjCojlCGTonCU8FDILVxWaEiiShSCbgIifetlbeDOYgE+8WM/0FWU9xpcxwL7EowVsHU4z0heH/xPaKQ5/865quEnOMYjbxe4HR+8hcgcmAuJrMojORswiY3QbKDm4QJ7JxJACN/wnbZz8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqRJneXVvlKZkNjOl7UIzUxMvO78+UdkEyD9/4YN460=;
 b=J8aDPBl9uFo1O0bxg+oGGuoujWl1wCkH2OXNv6Jf1tFWIR2k+f4qBGhrI6s2LHuS3oS9/z7VxNrtX1ohFRa6gI+ny6AeG+TptV7y4nNE3busDTGm4lI0PFzM0npyaZBHMpxVPmlyKmpra4jBA5fTgZ+PfoHEbGYyu2SIngr3vT7j57SV7ZfcjfQQi8kBelTMdxYa1yk6L3c+bf23RfOTkhc8gw9IYXVOuzjr80jK1sWOIodXvva0FA9xFJHTMbDmD1AfrlwUl63KJJXXT04xJJVdeRH7DBjXm1KC+grpiEN0jPElVEkXLyjnk7lZ+2yTCPfKtG6xqYWh6nMhtH2ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA1PR11MB6968.namprd11.prod.outlook.com
 (2603:10b6:806:2be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 04:26:40 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 04:26:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Kahola, Mika" <mika.kahola@intel.com>
Subject: RE: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Topic: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Index: AQHdW8zR4JTj0HEgLUWULyc88m8D9bb9DRiAgAD1JnA=
Date: Thu, 15 Oct 2026 04:26:40 +0000
Message-ID: <DS4PPFE901A304F7183CAB8F9D03B7CD119E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261014105306.2761683-5-mika.kahola@intel.com>
 <20261014134601.2846027-1-mika.kahola@intel.com>
In-Reply-To: <20261014134601.2846027-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA1PR11MB6968:EE_
x-ms-office365-filtering-correlation-id: d9e6b777-e986-420d-7383-08df2a748275
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|260925021311599003|260925021911599003|260925022911599003|10067099003|261009223027099003|38070700021|4143699003|11063799006|5023799004|18002099003|56012099006|22082099003;
x-microsoft-antispam-message-info: nKvTufUq1XE4l2HFcYVGA4I2GWkVenCFplfjPPbkWXISwTkWGM3ELob0b8Vp1coXIeWyrO42OaaSGozpa43H1VqotAPnF/oyqANcwzp7ZX6kDxs8Z72j6KlPd9RldjWeNi11DYGRw+4rOj8fKbEJRlsPmUem8g8oA44N4KmTuT5Ew6FG3ZQCB1ecrTGPUQDDmkLGZPENFTX/LGOkOIMy0mphYX98bsfUDGpryw8AWYq3rU/6FZAZd6JTR09i8ujI7+fjEhgvtdgfF5+QqZJ/YBubQ4/y6MOwZxk2IWLQWCnYmLqjW6BGHqruCEmbfeIGqrM17vlfHBCIJRAkfvcCJO0HKAUq8rUboK/cWUnfORFSNYDi+lB96dHZKm/J5xvM1/byPppjid2BZt4Xt0JcgbRqPhIUIUsPzGKN/D4Kr8uPrkHne/H+Dm/SpxDoErkAoA+Z3TACJu4WLI7nS7JosFyUR9tsxv7BzGSb+R1AS6C/4KbT7r28VXKv7D7jRsbKMlBujFCVtHYRsHHdkDtPTgrgWgteG3QyEvmm3WSXAUo5K2ULKNjdWu4gAYf6TnwVHrkyetdiJiXjwOX+gU3/axoPq4yhqAg8yAUUd1sUniNWIRikVER6K5E2P8GTnXWTRQ9UilVVxCyFM0OxG6SwG63zHK/r/H06ExvuBvS1x7k0fn4dOef5lNiJ2liYaW54df5VzANKrRdnmL+vuetDTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(261009223027099003)(38070700021)(4143699003)(11063799006)(5023799004)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xg2uUrv+Ayu1qwXrZ7ObJY8/1UlZXMWiIJRoypccaA896qa2tcKtPps7z9Jn?=
 =?us-ascii?Q?QyI8lJungbimCP6T+Zw3Ost6/qxS2XnTISJLrvzWoNfvUrAMyrMt1xI3Jszq?=
 =?us-ascii?Q?7j8Z5zIPhWe/Hn3he6r50TYqYe2MKVhbCSF0BSfkXGsZYbZIVT+40B3VvTPQ?=
 =?us-ascii?Q?v1m82JEYHL0CnMiZ8UWu5uK/tfIWu4gJP7ECX672tRSuIz1rVhc0TrUrO7X7?=
 =?us-ascii?Q?F6Uc+OJIZSzOtOlqCyMn/9Cg5KQLeWr6qRY2mYstCJNpDyjQ3xgd46xvF9ud?=
 =?us-ascii?Q?CiOdtT2xvg44VQI9eCh5bKDA1GAJgnRR3xIbps8ZnGrRMXnAYJpF5VRH5LEr?=
 =?us-ascii?Q?qM96zjq7d2vhLeLsW08pFBU47FC5AzqhOJRsI8zkD63EmDmxcm5iFN2SUqlc?=
 =?us-ascii?Q?ln9dATFlhIpD536Ua+Vw5D47CcVwydEzHv0raAcXf8mWdOH3T4E64BZPYORy?=
 =?us-ascii?Q?Uuxb9QevK0brikqQfcfuEeRKgMjeLuGG6EWNGy1bKaY1Az8x9wkCTYXh9Uf3?=
 =?us-ascii?Q?NsHSj4sMk/LyWiFqE931vS8IilgZeoEzwl6Vk77O3RnDV97DPXSXOSDXevLy?=
 =?us-ascii?Q?Fxwoktf8n49XUSUcAcRdgnjYcF+vnyE59aR9l4yWmQJbBQNTDfdqc35kMyfZ?=
 =?us-ascii?Q?f4zTpcHTLnv0zUuyBlZhHq7spSh+RgsEVqSqJwZTBQED/5Km06ke8JLjfl9X?=
 =?us-ascii?Q?t8it1tn+2CKXBMd5qcTC5NHyufntkBVuiNuBymuDxTbO60aLxhJIHNqvn1/o?=
 =?us-ascii?Q?rIqsIj9O6jL5uXfEO8PZCEolcSv5kO84Dutb8HhSxW78HKzzxw9f4QhKKB67?=
 =?us-ascii?Q?AbnNL6xdgqMImlRlPlAFULw+LKd/5MAMQZARawk9//bG8YzOybboV062h/k1?=
 =?us-ascii?Q?OZOEqMoN56jYooxxqVGhcBCPzzSl8/pIpqH/K7MkCrlYX+KhYfiEW48taxd2?=
 =?us-ascii?Q?gz0iroq/EepvE5qHVkj/GXriab4ddtbkw4JaAenjsQpXJqxEVUJdDy4OPsS1?=
 =?us-ascii?Q?ahWr4Tmylz0X8Cu+mgHQEnIBGDnqArqOmlUL6na2Imn+0evgBaMEicXFTcuX?=
 =?us-ascii?Q?UhtxoTzHlZqaabSPMtCXy2vuL59cGHsxg5mckRr6p8Z3EJHfqR8wghODgndA?=
 =?us-ascii?Q?e9z/ts4xfwwk5DAdiyKKmD+EWeJh0mJ0HvGlX5SP8G1rEe8OlD1vbILUchUd?=
 =?us-ascii?Q?7NLHGxYAKNafrcHTpca/rRiIzZhGr9rA9PKFao9wJbtcaL3281gbcKlHiejJ?=
 =?us-ascii?Q?EiA4axrYwO+cTURl3P7Jq7A2CjEG5NUF3SL1l/u0dTvNmz+rcRKJuc4m5ir3?=
 =?us-ascii?Q?/5plrcFtDIxf16wSDtyatAoc3JpIzdqmxf0E0P5rygthP/6cH4LI6MHjfXhN?=
 =?us-ascii?Q?5jiVxqHDyz1DAF1bmgv7QX7KstLwwkV6PCXYD7MVQ2zC4sjGoq0jgip2MGK0?=
 =?us-ascii?Q?qZLlV4Q9I6u/laEUE1Y+Akz7MDltC/NaCSV8bLZU89la58oImA0HT553/5SP?=
 =?us-ascii?Q?gZfrk9SEdd/SAYyxySVeqpaHFhG7dsDfZJoOPwKkLAU2yCgRT2B36JlTLPSV?=
 =?us-ascii?Q?Axd8zSXk6U/v7AnSeqlyOVN9UXD5NLumRoVgpKTYvk3Nxt2sryadm20iIpWo?=
 =?us-ascii?Q?QSrajYib+kZcTA9zNWhgY6vEVmkn68+0xlOk4PtHubhdkQ8VssFQCyaGdsAX?=
 =?us-ascii?Q?oA12xVufFkEHmQnQIzdmd8SVgeFD5PodEAk6frUib1yXWGAH/CUsm9gdyKbu?=
 =?us-ascii?Q?Uv0L3tOLZg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0LEL9aqinhjiMhdQMkVTX9dK3hxWzNbYYe/3SlHdLWUb+ay2ESMYOHg3iXp8Q17tPVjd2dBw8tlYrYH9ClY3XKan+sbFF6agqcD5VumzUg9cgU+nD+KpNS6V2rR+PqugH9SwAXqQbRNnmY+KatMS0gyChwRpwZ+y5SeZ3FkNOQK06RnSOfhfWK551Rgeb5RVGeN0G2RHzPlU09vh9/0Vao/pbIZ9ar6Iw90zZ5Vmu/0ZR16BwS+wrGW4UizsSHy60mV6S8Nup2pStyFQymh3NAcN8OKRdNb/tcQBFvxQrl4JbMeLR8SbT9yMZ4yA+sjv6AAHRGFGX680HrbMtpwy4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e6b777-e986-420d-7383-08df2a748275
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 04:26:40.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RtJVnHJhykw9oOp1BXFkI7NZhB+t+gTs2Xdy2dvxXXbpVywLD3kIukkR1dfDOLg8+3QFUVgQQe706yza1U3mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

> Subject: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on =
LT
> PHY platforms
>=20
> W/A 14022081154 covers PTL+, but only the C10 PHY sequence was ever
> implemented. Port A is an LT PHY on display ver 35, so
> intel_dpll_power_save_wa() had nothing to run there and the PHY was left =
in
> the reset power state that blocks S0ix.
>=20
> Add the LT PHY sequence and dispatch on the PHY type. The PLL state is
> calculated from the eDP tables at RBR as the C10 sequence does, so the
> throwaway state it brings the PLL up with is marked as eDP.
>=20
> BSpec: 74151

So this bspec directs us to Xe2_LPD WA's but 35 is Xe3p_LPD and on that pag=
e this WA is not reiterated.
So what I am confused about is if this is actually required for 35 or is th=
is just Bspec not updating Xe2_LPD WA to PTL,WCL only.
Because the PHY altogether changed from NVL and this issue was actually see=
n on SNPS PHY. We will need more clarification on this.

Also FYI I think patchwork messed up or patch ordering for some reason.

Regards,
Suraj Kandpal

> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  5 +++-
>  drivers/gpu/drm/i915/display/intel_lt_phy.c   | 29 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_lt_phy.h   |  1 +
>  3 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 65cc028a90da..df416a05e66d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -5248,7 +5248,10 @@ void intel_dpll_power_save_wa(struct intel_display
> *display)
>  		if (!intel_encoder_is_c10phy(encoder))
>  			continue;
>=20
> -		intel_cx0_pll_power_save_wa(encoder);
> +		if (HAS_LT_PHY(display))
> +			intel_lt_phy_pll_power_save_wa(encoder);
> +		else
> +			intel_cx0_pll_power_save_wa(encoder);
>  	}
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index e05fd23b8a65..d286d33a03ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -2313,6 +2313,35 @@ void intel_xe3plpd_pll_disable(struct intel_encode=
r
> *encoder)
>=20
>  }
>=20
> +/*
> + * WA 14022081154
> + * LT PHY part of the sequence, see intel_dpll_power_save_wa().
> + */
> +void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder) {
> +	struct intel_display *display =3D to_intel_display(encoder);
> +	struct intel_dpll_hw_state hw_state =3D {};
> +	int port_clock =3D 162000;
> +	int lane_count =3D 4;
> +	int err;
> +
> +	if (intel_lt_phy_pll_is_enabled(encoder))
> +		return;
> +
> +	err =3D intel_lt_phy_pll_calc_state_from_table(encoder,
> xe3plpd_lt_edp_tables,
> +						     true, true, port_clock,
> lane_count,
> +						     &hw_state.ltpll);
> +	if (drm_WARN_ON(display->drm, err))
> +		return;
> +
> +	drm_dbg_kms(display->drm,
> +		    "[ENCODER:%d:%s] Applying power saving workaround on
> disabled PLL\n",
> +		    encoder->base.base.id, encoder->base.name);
> +
> +	intel_lt_phy_pll_enable(encoder, &hw_state);
> +	intel_lt_phy_pll_disable(encoder);
> +}
> +
>  static void intel_lt_phy_pll_verify_clock(struct intel_display *display,
>  					  int precomputed_clock,
>  					  const char *pll_state_name,
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h
> b/drivers/gpu/drm/i915/display/intel_lt_phy.h
> index 368ceedb1e0a..a918012b71e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
> @@ -47,6 +47,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder
> *encoder,
>  			      struct intel_dpll *pll,
>  			      const struct intel_dpll_hw_state *dpll_hw_state);
> void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
> +void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder);
>  void intel_lt_phy_verify_plls(struct intel_display *display);
>=20
>  #endif /* __INTEL_LT_PHY_H__ */
> --
> 2.43.0

