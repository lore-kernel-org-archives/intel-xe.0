Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152A606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4INrm4x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B568C1123A9;
	Thu, 22 Oct 2026 07:39:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C6910E3CE;
 Thu, 22 Oct 2026 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792654774; x=1824190774;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qVeAqPPv2ctyUSjBKBN7WFA7gwHO0JoznK3LBVj0gMo=;
 b=a4INrm4xTyoQhuXhE7jfrSAaAEWZvYId9fpBX1CYnUd5NfjLnKJ30MX+
 Xl2iGTwS+Dojjgr48HEWT6/YHJY8EF2o5o5wKpgQq0X0aAm7XD6tYUnxh
 zWEa1cQ1Y5lJAYwCgvDZ8toyfG3jNPJdPJptmtr+g7BQSqEB04BAKxpVN
 yCRe4vBX+3CWatFVQdKDrkLajWuXMBE6TuMEdKbOH3OtNnQPv8X2D8yPy
 W5VYzQXHcyF78grqLfJefcWUFNDf+4eRL+xjLkje70gFbVBONOBg9LLZf
 mKAMuoYMOItk8n4jlu0xxRj0kMUlsFIM5m9DdeayeHgDmbqjRkD0aZGwT Q==;
X-CSE-ConnectionGUID: X/5Yvb4aSFyxStkGizjQLg==
X-CSE-MsgGUID: hNal45tBQ3uwgiSfrJppMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1405323"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1405323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:39:34 -0700
X-CSE-ConnectionGUID: ZSieZKUHTBiSTY6vjOSt1g==
X-CSE-MsgGUID: s3QfsrXqQuuK7kRCQzGBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3652041"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:39:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:39:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 00:39:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq9/vpInZAaTXZ7iEYMAPkLQmiRQxFs7Nbvjb3wiupgsZo0biFaq2Pm2Sv3tbnXPT6U7C3LTCc7PPgmwzZZOMjbz4fFUwg6cuhRlkVvsZV2iFXGztj2qJlAJdEkyrnSdu+PIwv3AjSMHlZnc69R7U0P7J+fg2UMSwAURB9RpQ5I3qYRu5Z9DNy+nSEU1xyF3VZJ4GfyAQV5eDl3LLOZkj8mCmiDlR0+nFVcLDZ1JJJYKf+fYdx6yv4wAeqgIZCs5KPaokf1nY/MhvZq3AfC4QinmC5UfKxpyRZ68HoTOq6rHhhQfmkUTEuxdDK1h/HAZNw4Xy6DViWDRYP0uI5mNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxg0S8HDzXj4/kSoHzbjMfuMvwvWQfbpoOQQFSWZijY=;
 b=DEJgJwUCqcQmYhFgTozoDzDv2k5Dw5rJz8zT9F6NDwn7DsYgV/tc9YXrxSrcR03Upd03qFZS6gEnNN6lZov7AQmSa1Wt80yNTfjIvuAlhVQXB3hyuF2IN3t+5uA/HJLIRAdWRY2GXHfUSSeb5fI6baaQ437oWzvdVI1tP4jyNH8muzPXh62dUebIyTUg2adaNLvnxvtSzF0rCAA+Iqq7BWfmhDFU/yD0yab8qGkupeGBQShyqDDWBHgAfAb/GjvlkA0eC//dvsXFjgyGeX3im1SN3aE2ofivhSpvf7pFLvL+difFdywjOyrd4mimrnCTkWFT144GfJCx3BC3vr4W+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 07:38:24 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 07:38:23 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 10/13] drm/i915/display: Dump bypass_m_n_ratio_limit in
 the crtc state dump
Thread-Topic: [PATCH v7 10/13] drm/i915/display: Dump bypass_m_n_ratio_limit
 in the crtc state dump
Thread-Index: AQHdYdSwwUEIv+KfGku+BRG1YaFz1rcJDFWg
Date: Thu, 22 Oct 2026 07:38:23 +0000
Message-ID: <BYAPR11MB378345ADDD6799FC5B2CDE78B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-11-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-11-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA1PR11MB8812:EE_
x-ms-office365-filtering-correlation-id: 8c847ec1-2ecc-45f0-45b7-08df300f73cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|22082099003|261021121427099003|261021123027099003|4143699003|260925021911599003|11063799006|260925022911599003|260925021311599003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: Q3T0LoU/a2sjuIBM+XHwTiNpFkguZmbqIHCUmWHNSCTNIVKjfIvknt+PTNtg8eaKfWwJwhSesZ5Y+dGEbDMNxgH3Zyn5qEEBOnIPES6o27C1Y7ylhfaqKXTZXJQylNBcc6nLMzcoXa4wWHrXD1MHv0rIrIJmmXCcPR7HUH/gH3OzKfokqhg5BGt2I67ekaPtlaPq25VhztBCBrZw2FXWGSbTdCPZY3VlgQCCYSMh4MYEU8dDp5e3ViX5XN7mBYs8Gv3vz9x4qwqm/1PlSNyqlO3Ft+ci7ia5GH7nT2BI0ilBQ92R1qB/X4/XhqJlKLDuMMa45lpX7HW2Bd4M8+RTIg+beVsZrlDRtfanE7o5f2PVLWAysEVmEari16GJcIccA4DLUfo+RfDRoKSnn8S3HJbE6a3EafnbZymiKsobhzbibGqW3+vQADi2kKsGUpcCzuzCFrXrN3mJ6aKKAknivqfFC24uv50xyjxFy9JcHeaI/JoOmCLM+u1+zOIXMs9vLPmO9HeZBQnNqzPleOS0Wij67jUcAzpkIsC2c7Ksf4yokKWPJ5hwpOsQD19lMBJZrTENtps96+UfiOV7Se/M4EUy/1Wxaycl4Ezd5P/7hGBRVFFQjLK3fyIMl7lphTjH7teJtOkOlVWD2tq2YJspifgPc5XXjAyQMEl9HLK4tCAW8+g/EU349mzkRsoHCL5J6Cy3/mJ1QLnSCqtbULPy4IUx1lwu3i6NY2EMHO9e1sA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(261021121427099003)(261021123027099003)(4143699003)(260925021911599003)(11063799006)(260925022911599003)(260925021311599003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a0c33bXarp1UMrTQ26G236rY3WqtHb4+KgFCWSMPLYV3vUflx9RbxO1vOcHv?=
 =?us-ascii?Q?P+BtiN6VTtDA9FWe4tBLzKNy3fYpf3klOTHY/7fkKAirJk8JNyqEf+WofTvR?=
 =?us-ascii?Q?3doArr9Sf+aC8IW3HKvq1Km6V+RtP2mK3VpV4+rauRL4RQx5DnDl4Olwuupm?=
 =?us-ascii?Q?yS/NFKlmjN6cmfpCdWHojAYPxOq0E9n6VnRMd4j5fJot6gdtQGmHpYnV9Mjz?=
 =?us-ascii?Q?EBTZ4+oW4MzPcO01d50IfE/5ySvFoJgxOG91jba9CPgOboxT1/7AqqtC6sZ0?=
 =?us-ascii?Q?d+bS7UnAcrmoVk1z+PmXz3ophr5poQwZJAxscQ8O3G9pGyKkL9YUPpuy1wwY?=
 =?us-ascii?Q?mwehuuv66XdrC+OBnXad3lIZ7c74mjaQ+EqBp3g9jT8VcNV4R5YQGyf/OxLv?=
 =?us-ascii?Q?gOP5p5PZmr8hG4OAmg8VlgDfMykf++edyJY6zAtlRBkA3nMnUSFqLEvFrvZH?=
 =?us-ascii?Q?5DMks4AEns2BKFZBpBeZzLO8kdnxMjtys10clexuJnEvn935a3gYBf9yeQ1n?=
 =?us-ascii?Q?CPrYKiQubRdq7V6B1bnK1eR2VvDwbXx8o8o0ytkZ3/83ODnLSVd6TlKgxtGV?=
 =?us-ascii?Q?rJs3NfptyrxPASxEvfJbb6t1cW9eLXz9DXx/H1u/CuEB5AEoB5jKOo9y3Qdp?=
 =?us-ascii?Q?anbVxD6EhAovJo7A/iN76n7hmSgzpqvi4fUhBAdzXu93wJKKOj9ZUR1gK/h1?=
 =?us-ascii?Q?tpUdca6vCP9JdC0DX9jTeJ+HOF2LjQNS7h/JIQmntChcKJSqOzG6OJ2syhYc?=
 =?us-ascii?Q?ZeY9j0yIZsT6AnJMJZyBkyDxIhQf0SGKxn/NI5zKpNimQ1xGYNeNESBpg8Ls?=
 =?us-ascii?Q?G4R+maHapYxnS9Rkhk76VHWVqwJhCPuhQ73KvexFkie466TwIeIoxvPm8IW7?=
 =?us-ascii?Q?AoJEDJBzbmddn1qtYMG24BzYEVmTcFecPXf/YYZihoQf94FG1P+73DrGBE7S?=
 =?us-ascii?Q?TW8wn9sH1zrlDa19EKBr82Ywt4WlTqMHPUXkT2+IR8WT/sF0XgvFkL1emOQJ?=
 =?us-ascii?Q?ygncBlxk5RZRe0XiVF3Wn1MJVtbUXN4K3iN86R7jRJMD2r/8eMDXRFKIXUz4?=
 =?us-ascii?Q?UMWTxl301A/m8+NvQ6wKTYKwDb0A2mcHvPwfaTiYyzqYV5AAF1ikgumQzvPn?=
 =?us-ascii?Q?qAC9tm8y1W34pa/Yvht11+rakd0ry4RTOdexvH2gWQKa/EQxtjE33x/2DkKO?=
 =?us-ascii?Q?D7wFidBwFhdmjycmWDhEeYJY1cRjokd0kM2RFkxCiTBI5Ac2KpofzTeeZQOH?=
 =?us-ascii?Q?TfC9hfuQrkOTYXAz6H6Wc1WMqdCrhTLbQ9YLwwh0Frn25YM0snkJUJ/Scvb9?=
 =?us-ascii?Q?MkdjNHXHRAskeNZa3QNdhJPtgnc2WQA70Ho8u00RHGYT5F437ZGs752ELvGt?=
 =?us-ascii?Q?E+P11wK1PeM88ctU62KkbTeUk8oo+39n8jcVyDkH4KTJd/PjbHqL4Dzz9zzY?=
 =?us-ascii?Q?FNs8aJvUIFn90MfzTxudEkauXJQzGi5H1lvhs7PEciZeFBNuCy2syZPc8GvA?=
 =?us-ascii?Q?V05MKkCAJtaFwVp7vPk5yfWH/7/ckQlS+Xx+WyfsyGT6cHN4VIr2NCgaGOFb?=
 =?us-ascii?Q?A3CqHxko8Vv9MGXodFA8Q01MUOWWrFRyj16eFZA4kFiyODAlLYEgY5q+FRsZ?=
 =?us-ascii?Q?UgbeTwVYX4pMLKU8d22vY6bytRQLMkRdOHisgX03kxU0nmOchF6rHyZ98qGu?=
 =?us-ascii?Q?CWkdZufJ63D2CK2fENoNhBdJb/jJEQSUmgnsFJOeYXtmJUYL+DlRgjnX8zUJ?=
 =?us-ascii?Q?Nw9XNcEQ6mSoIniApq2MCMNPGSmy8xI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IyEYahz4M8TIBaGsQlHNzvEK/OzNBNUCw6VjRrqXJNZiVBEvWcQd38qD+M/ItjZhJ/HuiK2VGpXQcReq66d6lmHY7wsEPxJITIypcD5yu4qhsiTexoiWaMuC6/kPv/ZYMtcqLkPKT9NkrqDWDNrSzfj0oVWKr9sG+WgZ+UfDzypqTTgGVKDlinvkceh/DPRDgnwsRqIGEgWIdYFIJQzo9eSLC9nBzy/EgMTgx0T2LNVWsPfGBwcw8AgkDKgQp9wyqo3hLH22rrkGSeY5RyLCm+d98oGLwfIqSWxd4DWcGz461xZQwJm7aXiJ65H+Bt+sPpu1gEMETgLfgjkvE/Yffw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c847ec1-2ecc-45f0-45b7-08df300f73cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 07:38:23.5080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqkWZbTcDox1SCqZoM6A1rzhHck/agU+pbza29DwRgzk/l+2h5zOjLB09cxBKuLglF+SwY1F8HxphFkGaYdH26b37iE3X5eV41INso6eQrwEklRhBU9iupT8azxyrymo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 22 October 2026 08:53
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v7 10/13] drm/i915/display: Dump bypass_m_n_ratio_limit
> in the crtc state dump
>=20
> Dump whether the Link M/N ratio limit is bypassed with Wa_14021768792
> along with the rest of the M/N values in the crtc state dump.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 92675a88b969..c51b21222dc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -36,10 +36,12 @@ intel_dump_m_n_config(struct drm_printer *p,
>  		      const char *id, unsigned int lane_count,
>  		      const struct intel_link_m_n *m_n)  {
> -	drm_printf(p, "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u,
> link_n: %u, tu: %u\n",
> +	drm_printf(p,
> +		   "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n:
> %u,
> +tu: %u, bypass_m_n_ratio_limit: %s\n",
>  		   id, lane_count,
>  		   m_n->data_m, m_n->data_n,
> -		   m_n->link_m, m_n->link_n, m_n->tu);
> +		   m_n->link_m, m_n->link_n, m_n->tu,
> +		   str_yes_no(m_n->bypass_m_n_ratio_limit));
>  }

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>=20
>  static void
> --
> 2.34.1

