Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E692C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 15:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE6E10E18D;
	Tue, 29 Sep 2026 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in8UUqnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C310E159;
 Tue, 29 Sep 2026 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790694805; x=1822230805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WkrzymWRH+eFTg4jUXYiUeF1wasHHZNlN3VfHsryKCw=;
 b=in8UUqnpqtvkqD0eup1RiGaXhU2+vCu76Q+Re1zDod/Ko0pdGe2Ekvpu
 nAHERoBp5JtGAT8gstL2hpiPImj8Lo1Vvdu/WS8l5pFeQgo7+CoEQj8M5
 rE0dYXfyMHMQTBdn5IDOovhJZn+ePn9uX5Qhe4MWTEgjgG+17z/RL3YQk
 hSx+s4UAMj5g9Ex5DimfdUnsDaaETOxqEDd59FOUxLL4q34HwcOC9eIoM
 XoKl17NR6jMZlSsy86dDbQ+zg2j0dExWJF5Bf4fMn1y6k50xvuC5a2PAc
 R4c8gko+ew8BY19YnsbM8i+axW/HkGWzd8qNN9koEBg0XSOves8qYQkQd w==;
X-CSE-ConnectionGUID: 7h8tkVCdTlGBf2MHOEdlmQ==
X-CSE-MsgGUID: V25XZ+7jQXqZRFwryz/zeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102791992"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102791992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 08:13:25 -0700
X-CSE-ConnectionGUID: Wo+JvR+kRqCnyouKTKGNVg==
X-CSE-MsgGUID: iu9BpD6HRjua5/OlR6UlGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274944945"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 08:13:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 08:13:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 08:13:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 08:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UurmHjaR7wG/X53iW7O4knuyQTmeddrTbrjC4dtQVEorDqssHRlgJhroOmSKFq4xQtrstuceXhnGrvg1fckE+mIuvYvHYq7e/BvHB72ZbvDaJwxmDFYm0jlH972IRr3u9og8KLS0HjyH/Cd9gekRpcjv4XwEpFbENnKnjMxTFlqmPh5nv1Wj3mnGyldWvU3RXKfPlk8aHRdDt73ESVQe1yH4XFRxXMf9yss4r0kzIXvIYpV4SqOoMefXWbU2oPIGN+IPf6WUvY0G8TTvNGxj5gG1SzPm8hlAW7HH8rhNYOHkUXsUyC8GO8KEcpbDKSexlhgqVVjz3gqaByAwvRJgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ2ABlE3P+9iKgt43WpNAbnXhnHPMQgoz2BtHMDu6kU=;
 b=hrJfriUESXFzdFT+55b4iqATL525NQ6c1bkidWYon4uvPvS0jYfjdYSI9nFwV30irNBRjw270Bas8XH3t0QrWfu1ENBlrtT0upyKFxycTOhNgTXrHL0Jzg2g2x24aDFgw7u1jAqHrKG7Hj0eWxlowbIIHbr1r0K0pTmVfsFX/jJf7Dovu5jy5CsAQN9o5fQLWw22LOEbSFgS6QL8BVl8M7w1F0Qbvht9lx8G5p+PSw5hhu1j0QTtyxbJvFVpHSMoZD88tizG5um9/UX4ufEgRBRj80ywYTAzVlclhYe5KNtgrywnnnn8KaW36QkdjfQuAh1lGIRwmW6f7w61VbHBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3787.namprd11.prod.outlook.com (2603:10b6:5:143::10)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 15:13:22 +0000
Received: from DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc]) by DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 15:13:21 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Topic: [PATCH v4 01/10] drm/i915/display: Add helper to compute link
 M/N ratio for reuse
Thread-Index: AQHdRmKD8qTAzfQ0MESxuXUeHCIGybblup5w
Date: Tue, 29 Sep 2026 15:13:21 +0000
Message-ID: <DM6PR11MB37878651D4BF0086632F96F9B28C2@DM6PR11MB3787.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-2-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3787:EE_|SA0PR11MB4751:EE_
x-ms-office365-filtering-correlation-id: 29250966-2ab2-44bc-4e46-08df1e3c3353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|366016|376014|1800799024|11063799006|56012099006|38070700021|22082099003|4143699003|18002099003|10067099003;
x-microsoft-antispam-message-info: Ol5PmfPfCq/Bry4U6pl4flMnWfxmMR8qWOv+LJ4cNR3sbN/4+Dqty08UgkY/9Pyi6dv0w9aPqIQQLdXYzCYAWetLqK9wKjKQEb6SMsl5VX2OoWqcu7DdJQN/Yw3NAD22MZscOVQ3BpT23+GFTWxfPld4RnKPZQRyS+UZXP7bGMylJmjsbt+3D0VHw1CPxBhB6f7aHuglzLdVLsvqcY3IccbXqVSWDXySpNPgFa0LE4+YmUxYQiFfo5F0JvcKnj68o4WDfZLJ85U3X0W+0YMgUOsph+nLBbRP9YbK4/HaHTtUvd29DeABWzHoUQHuJAhMfcSNcHZ4LHXoTrAtP8F3J/NLRozw8cCvL+bXaX+yPzEx0+RVTS97Ocvrs2fWagW1epsYfi3NbZXUBeBhjq4sWe25G9aWvuYSJcj9MXnqMA/SLuxQFfYkEzuvOfObImXBpleqRDcYeY7LkeBLCr1EIqXr9osj6NnKpVVwkMT0NXHtLWZhhBkyF/FzhSGp4Q0kWo/l2XhJrm2Px/gBj/3E3CrDb4otsg27CfTeSZlBN8F0QeacSI7YLX+ssOlBH1zHCjRWrkVObd2Ag+xTQCDVTqaKOVAC89FMmG5KjMpDzEclmNynnA90vttxTH9EBuBD271hWMObBMW9Bvo06MC4HRP1zN8an9BHlMGIM5x6g2QyQcmedHUS1mBBQ+P++jRgLjhosk95zGExqBFY2Q/OVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(38070700021)(22082099003)(4143699003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jpYkkGgNxiBNhRkqzfjHX6sP/BabiI6mLu82XJUleBJl5RG7NC6vGgoGP/HV?=
 =?us-ascii?Q?y4T+jhFSknl3RrzW+N/PbAKjTdgdWEc57QeUihe4js1MSnXitRvQ4Pv8cXA/?=
 =?us-ascii?Q?3F3mrB/Vl+XSSvhd3crMVwqcQWJEeKA2WoFsIjt75jsQaP7hm6JsidNWVG67?=
 =?us-ascii?Q?SptyBXNbp2iUHuMvx8PHuY/6m/FOl28n0YbMMkPAViTSAY4gjljHheo71Iqc?=
 =?us-ascii?Q?6uiKaUolScBT2gbNdL9zFMqnXqZs3GJ7wcAvPO1mMrREzZIkaiIgY9XKHCtr?=
 =?us-ascii?Q?+NqUv051j5kgkfbleTWeXOmgstyQuJCdCNlY1uPXswunC5kf9WWyFqMq6qsb?=
 =?us-ascii?Q?/NIKx1HLbKw31y0m7TuaCFYXgaaNMSnessPfF2LDNrI2es+v2a7MUbGeU0pF?=
 =?us-ascii?Q?C54y0cpPePA/mumH82LqzmnSKakPBhC2F2Wl155RBn5HX2g88pX/x03ml8CQ?=
 =?us-ascii?Q?tZWPBp/N4mI0gX3oXK53uJ3RiyopZYXEMnM+5cmdKgx87OAEkTvYUDo3tPZe?=
 =?us-ascii?Q?2EEQ3rUi0EKX4tRF4/EiBrduMRnMANq0C9ngKlaHYz6vqUJ/21foJjKDVnAl?=
 =?us-ascii?Q?f4WOWJbUZdMEyOvz6+2VD41Ef2AxeOJ6XxnFE7Cmw/pBzumFiPr+Nw9nIG/S?=
 =?us-ascii?Q?dNdGOKIlR688MSsnZK6EDz1bW9fF2jVKT69Jue0TuIrweOMtdmvkb2oRjGmk?=
 =?us-ascii?Q?lxhvn5TzxYwgDYe5hI5LxNWTEzFKEcLgffTrDzEEmxk1jGIVa8bsaFVl4fHj?=
 =?us-ascii?Q?nknXPOuEkznsiQ/N3+PTgUfxliphVy+F9Ahc1MaYjO7x1gQytsdNqp2Q+JRv?=
 =?us-ascii?Q?JMm8NVNLUFcDZGUVfu+hkfLwCLcmjto3jsdKR2qKrvRgjSccZtsZtR1Ym78Q?=
 =?us-ascii?Q?dsZdit5XPAK/vxncHYuX3qwZLtaZNpZhSFZh7GPBBGnq84NfkgcBKUxoArVY?=
 =?us-ascii?Q?Ym6Xvydy+akRrA+1T9vueBfIYJxH64EAO5kPjpMFl+Uwe2bD9F36lJ6/L0si?=
 =?us-ascii?Q?chTI1c6+vktu3lLReOe8HLBiPa2/E92JOrIXIyGsidqjU8o1qkTMZjUYJBOd?=
 =?us-ascii?Q?3VxY5ne4XGkBTCq8Zf0g7+DQr2zQCIPORrzqdEwguriu9fiIO90w+7yHYql3?=
 =?us-ascii?Q?cPxKGeJvW5yFdATDbwzasFmrG13x2HZhmIno3eeA8015apeKWhivNLiTeJPb?=
 =?us-ascii?Q?VoHzLOfzudVutJUiYgvFZhVZ3wTUT7KWCyegwphVdLTcasNynVJtRL+84vE6?=
 =?us-ascii?Q?NzCNoHQgCxuQauEGhY9P4VWnknrnBKu2CuVwSx7Vchlxn1CYKfsvZ0tnWl/x?=
 =?us-ascii?Q?Je7BVs2TLN42yiZI9DzsFJZHUjt88YNoTViBMbqg7cybY3zhJ5rHDuIIz9be?=
 =?us-ascii?Q?L0FHSA7po9lA7tCyviZ4OchGoeZvKKTxTkU/kJf4pYaE4TuIGep/zNnLCstM?=
 =?us-ascii?Q?mzey/iRqlSvtQynp0X43QgmIxtQ9s06U5meAJUspM0r6pJY3WLSjt8Tvqdyq?=
 =?us-ascii?Q?EivISFYQ8OiTfgT/gowlbK5Ur+iL98B2tFSiL0nt7Kbr1GbYJ7ppEVR62n3f?=
 =?us-ascii?Q?etXxwvHPQzO46cEO+u+DRra0RJiv3iWnJT0LNgmr+bidpXk9JLlyfcED2Dxn?=
 =?us-ascii?Q?ztqvCH2EkbQ9vmq7FixlVW0hy/7cEM+gW+rB0rkLhLBVTNQHBVBL/CRHKs3k?=
 =?us-ascii?Q?tkeztyaV7/+rRXlyb7JUxWdnsInQv1SG1nFH2Ef0yAIp65CEvRx+wJTTVBea?=
 =?us-ascii?Q?rActZLxGX9oqbO+JOScznAZp7Gs4WwYZeB4fU7MB5Xj2psxlBcAfPTKFyrbZ?=
x-ms-exchange-antispam-messagedata-1: BN4pZD5NGw1SaCmK9hLrTbWuvmJL5WpZtIo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ar6NdRLV5U30eu+JAWDIMVto/ZxRVr1JjT3fHzvlHZuzxbngJEQaDC9/9Hp4MNaNkRo6cOsx4NDBcyW/q2rMXG68620GRgWRm5L7ex8Rk0WfzJCzo89REjzKKYTvC42xcWf4zT30krdDKLGoihuKoUWnOqRwlfAiLOhmQXsjs9ghXrOXc53rAElmAnrvKByUx/xeM8UEwzJjaYH3st/oDtDTs0Yrg6Px1XToJ/zo4zDdAf8pTUx/4VYjsVvcjQ2F7rgmU1LhpaqIcD43TxtcelkGVtCKs/nrHjbU13WEZGKO5yeB7Wn7mD5t7nU53qN0fr6sgAbhH4yPOsSAx0/YKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29250966-2ab2-44bc-4e46-08df1e3c3353
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 15:13:21.7301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+ixXe+/VtHo+FmWwZoIYqggNp+tzqvMVN3N4C7Ior9IJdFwuq4wzeusm0Rwrg53oPdZWoy8SvjHvETcmz9UIZatpJhSD7fmTD2StJuuFF3fcABpJVQ7lVEwktTJRxDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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
> Subject: [PATCH v4 01/10] drm/i915/display: Add helper to compute link M/=
N
> ratio for reuse
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Introduce intel_display_compute_link_m_n() to compute the link M/N ratio =
from
> the pixel clock and the link symbol clock. This logic was previously embe=
dded
> within intel_link_compute_m_n().
>=20
> The new helper allows reuse of link M/N computation in other contexts wit=
hout
> requiring the full data M/N calculation.

The commit says this helper is for reuse, but it remains static with no cal=
ler added, please either
explain the intended upcoming user in the commit message or make the helper=
 non-static when
the caller is introduced.

>=20
> No functional changes intended.
>=20
> v2:
> - Rename function (Jani)
> - The link symbol clock is passed in rather than derived here, so that th=
e DP
> specific conversion from the link rate stays with the caller. (Jani)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 9151ea6c15ab..f04a6f97e05a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2641,13 +2641,20 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
>  	intel_reduce_m_n_ratio(ret_m, ret_n);
>  }
>=20
> +static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> +					   int pixel_clock, int link_symbol_clock)
> {
> +	compute_m_n(link_m, link_n,
> +		    pixel_clock, link_symbol_clock,
> +		    0x80000);


Since this helper may be reused elsewhere, please document here that the fi=
xed N is intentional=20
and follows the Windows/BIOS M/N requirement.

> +}
> +
>  void
>  intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
>  		       int pixel_clock, int link_clock,
>  		       int bw_overhead,
>  		       struct intel_link_m_n *m_n)
>  {
> -	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
>  	u32 data_m =3D intel_dp_effective_data_rate(pixel_clock,
> bits_per_pixel_x16,
>  						  bw_overhead);
>  	u32 data_n =3D drm_dp_max_dprx_data_rate(link_clock, nlanes); @@ -
> 2664,9 +2671,9 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlan=
es,
>  		    data_m, data_n,
>  		    0x8000000);
>=20
> -	compute_m_n(&m_n->link_m, &m_n->link_n,
> -		    pixel_clock, link_symbol_clock,
> -		    0x80000);
> +	intel_display_compute_link_m_n(&m_n->link_m, &m_n->link_n,
> +				       pixel_clock,
> +				       intel_dp_link_symbol_clock(link_clock));

With mentioned changes addressed,
LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  }
>=20
>  void intel_panel_sanitize_ssc(struct intel_display *display)
> --
> 2.34.1

