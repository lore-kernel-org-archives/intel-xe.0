Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F51606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnuMjOgA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE357112AD6;
	Fri, 23 Oct 2026 13:15:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24041112AD6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792761294; x=1824297294;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l43Ajnx1xBeViPyDBFyevtUw+0CA88MmNZ1uihECiII=;
 b=UnuMjOgAoFfJjYY8Tqk00v/2hLu2knY8e+TUy5SKvI/IWxN698FlkDnt
 Fv22V/84xufelenyfSaVM4eJCqEqSemKx75PKugOJHQWfpUg1HSvOOEsc
 xCO8JIKEatIJeaJVGbvT2EuYn4Mhe5C9SgjV+v/VooIGvqOYMH4s/i1tH
 LqhHtCBhFleFGK4LK/pcBu3SKCGqHQ5+8xQm+cNoxcXkHsErP1gbRrcTR
 2a2KKkIatVz6azCXnp/V3cLInU6zqGDPB0HDWmwXeDfRO8W0pG/icWn76
 0umbQfS9OlUg2IRGrT7hFRpFK/ecTwUcCC7n/ro3FmT6Czui+r/r1ibCP w==;
X-CSE-ConnectionGUID: dtMbBGEpTwKa4A/FvXcLxw==
X-CSE-MsgGUID: ukNbJqUCQ2SdxFKI6G38+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1422002"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1422002"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:14:53 -0700
X-CSE-ConnectionGUID: VTa7NcJnSsexPZQjwCudsw==
X-CSE-MsgGUID: tbTHKEOyTBug0tnsl44RgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3739109"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:14:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 06:14:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 06:14:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 06:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNQIwVxzsEfkipZGy/C0Elc25vvXWvZK0U7a4GqNjikWZbxY8ZUz92uP04bZJENFtyDllpsA/gd1UJA1K5MffVzKhXG46LZwcY4jdcGiM1mVZCq3tMdfEQZeEx5cXA+WJLMSkIemamWg9/cWGfnThxwSTPCn99xfUZFr666PLC5CjddunawjEJGlyon2RstdR+VAPK8w0S3UclUhfniFFBedyG4WggyUQbAoI3soIg5vzXYs1LB2huFSy4lklZCD3otgAiy2EMhv2Bs5zDifVnK6XcvlRa5HhIfULbE37l9nd0/Ufr8gzB6PODNJhL3V/Ewvg9xatm63GLSPhTi+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlrxWDY0Fwn7m+1goIo16chRvZ9f9Hsv9/97fEDcYZM=;
 b=AeKTliN8RjMDzdEqXREU8kTGUNYFEzCQcW9K2C+uKrAk2FdEz9lipAHDIo1VWC+F3E6Bd8D2/FFTvhR/5/qasW768FxwmtY18P6vDH14JUY+1XnxNuqEOxRL+HO+JW0OF7ijXHD8UcqTybDuRcRTB2wEPQdhKzefXoo7lTGlKRB1f5mVEpKou7MVH/y5RJtTPtHUi3oooW/3zPeeVWevhJ6jJCssR7w6FSrwYGgXPwmo9aeNUGdc0T0OQwU1tO2UHbj30BLer8h3Xa7uaSUE35Z9VrfjnWSdkn05SJoaZPAG3xc+2Y/kwCsUwPM7ADx2GaWeBWRH7ntw659ylO1+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 13:14:50 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 13:14:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Thread-Topic: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Thread-Index: AQHdYrTxRqOXPSsYn0SHbZzmgAT5o7cLGz4Q
Date: Fri, 23 Oct 2026 13:14:49 +0000
Message-ID: <DS0PR11MB8718763A6481BC7B3E2AC45281642@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-4-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-4-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB8860:EE_
x-ms-office365-filtering-correlation-id: c336d663-4946-4172-ca9e-08df31079df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003|10067099003|261009223027099003|261021123027099003|261022075727099003|261022105027099003|261021121427099003|3023799007;
x-microsoft-antispam-message-info: URqNG349CA+Wn/WoI7OyYKDMDzXtfhjEWnuwd2WxOyw0qzeUo21zCePUd6Tp4TW7iSXKZtRtxoj1SmyPs50vwfBPn+e3RZF4dITwUODsvHSEkRpcDRIoMGDO44khZHpxTBDW6AfDjx86/Ug97pU9G1oXqLPAiB+Ug0Ucjn50n3CSbUJdSePSH2RENW0GTkgtlzvpb8+6koxQPpwVAh7CfVjfedxPdF3lqofA8HtZpnJwLSzNeBoQVx3CQHcWCH7UO7L19W+VwrANmFrmSJ9QYbNmqAKbbjYSRmpyPvnHA69CI2LngAreIHR3S0GE8EsQYMvl58lAvFg9XOiFnmJYc8vr9JZuEYpRWLMHEHVr7CFhs5Yh1X2CwWcXDSx9clYQfLzsMoc9vAJ0WRdXZf3xK1vUKGuYdm0wJD40uzhtgLYpD0aez0pJ5rej/PrrKNv5V6hGm68s/PdMLwveNb0Ene9s9IDLsG48FdJxamDs6+NY9j3SaUDmkE5rN3YS9RBSTm0mHBHvYaUNSxMaL+EnC3hW0Ei2bAEyTTVMg2SHarQKTcwUx2A9Pzts8OZ0j+BUym40UWoOPHnm9jJ68yF3CfHdCjKh1mMrIeYTVp5YLSA5ptWpH5WMECw+aW+mJmQH6L+3oXwofAJ7IjYDTUsWOxd6tl3GjdlFoS40j6MwjRUQdZ9OGrVUH/Q6ryuzqXb8z3CmW2znoG25bITbrBW2vHzTXvK9O3teSxLvY+f6uEE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003)(261021123027099003)(261022075727099003)(261022105027099003)(261021121427099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r0hvYbQ4JLu2zvwehbC7LVqXyfql34vVH+573y40cI5C3w3YLG/Php4ax1Vs?=
 =?us-ascii?Q?ZG2TpfxHjd0Y/2uzW9QVnQvPvM8iWzG5TJdBivml9jBTbHFDtCUegMB63dHV?=
 =?us-ascii?Q?1AsIVG6ZE2UtQxul9L2BZIRBTHrSFg6FTDRisYi0yNCGnWwQEEym/ISCMFR+?=
 =?us-ascii?Q?UrgwgH6sZI8uSba49HCLU5KwA9+U8hxrh8DH0+ELJBXYodPcHtCN9q53cu8U?=
 =?us-ascii?Q?czCbEo8S7p0W7c88Ut9rFlO4NouPydJoL6V7Tr8naqyrc62jNI7nsR6gxBvJ?=
 =?us-ascii?Q?8cxGcMdEUrSYv/mSreUNhz1Gkei7RO9BOHz5GHh6QY66Bnd1PYDG3wcINbTk?=
 =?us-ascii?Q?fR3FdsoMnbK/RoKLu9V9ygyS1PzjPPGz7FLBIwZ2DPBZDqXgyB4wtRnC1jPf?=
 =?us-ascii?Q?c+DQnq3dINIRrJ1IgyCybgRgjlxye8U4Ev76cf755IPrvxrwDaoIi7osIhZ9?=
 =?us-ascii?Q?xKGI2nO1RhF9Jnoe4zvrnaKFe9m9TTE1WgrEHX+2xaTac7fJSJaw162v5u2B?=
 =?us-ascii?Q?tkwJvZGzsohzLZfPFKXz8x4a/8DeU22oPRllPZ8hmKfDDVjm2DsYjwGRaYi4?=
 =?us-ascii?Q?YM+IavJSnSHWBD+Bi3Axh6rXgeRLkmeBxTnSN2/qNfHWeivQ1PO1sn+m7QGX?=
 =?us-ascii?Q?VaHK13Ilsh6yOFWBl4OPMjOrMqL3oVHba6Mz2cKjevAXRtJ99fObOD+f2886?=
 =?us-ascii?Q?vpxSUOA9YiD8bBeUSBhRGyViA/LQQlWaZCVD0r8T45VOXR178uQZ2/fnPFGY?=
 =?us-ascii?Q?2K5YXn3cYhDieGFW6sEZhyF8b40Ugu8znKGCiNcgmYDi4EZ9FrYS04xtfCyD?=
 =?us-ascii?Q?IA0GKIF5Q9JuryyXcp5w3LlEmWGr9CBzt/7WuUaIOLSz3PdQIE3sU2m5WZ9t?=
 =?us-ascii?Q?zdoyiA5LtN9SzqFuNhWw45tyHQZ56exVBKcPkWrno5DzzOMw4pSzYt+r1YBU?=
 =?us-ascii?Q?7tTvWJEPt+QzbT52ahzdBOt3B2uXjkIav3xxEbBz5wcoYTsHJkvwcryIbyqI?=
 =?us-ascii?Q?r7FSXJT5cIbX2NQFIhkozhT4+54Mr1CRS+JW1UZirD3f4RoIsoLb5mYPXrtm?=
 =?us-ascii?Q?YqaM3R0VmWpLyd2Oq8t8cmTxO9b6z0hKpfaYBS35EYpxstug+nZZT3NtB7e4?=
 =?us-ascii?Q?hZx2cThKQL6ZGF76FNaWIMovyADFI+RVbtN9E0HIQ9LFt6bjm/oaf7a0h0tK?=
 =?us-ascii?Q?lzrKO0+N2NWsDekCNc0/P/a/7e81Ez9LAtGE4kdoFHX+BdbgNt3VgWjzGmQS?=
 =?us-ascii?Q?XwZaLkJ4JdXYNPKIYP0c+aAtPqCY2JdwsKpERQlScYkVnrjnnMsj0mNCpbSb?=
 =?us-ascii?Q?XVldo8nHlJ7dtkwRM9EcWkFJol/uuGWU/szzGcvbtbYJov3dNXW8mwPsbYB4?=
 =?us-ascii?Q?/Od2GPN5z5pabMH8nvCgx5c2ViVazigwqN/beZ0tL7zSVvTCN/mUKjCRMGpJ?=
 =?us-ascii?Q?wkBLPTjB4Q9ZTHqmQmt4VdbcxOP1bJ02WiPD7KmLKftAF7sIxGCn6nEBrP5c?=
 =?us-ascii?Q?RXYTxgSjN1FXrAb/PDvfUh0RPDFj9mn3gLf+17M3Nj7aEuYdBxfPQm2jMGlm?=
 =?us-ascii?Q?CGQReqJ4deqGgfMtGhrEy4DdZUZueQ6k+kaF6chbACXJhp2855YTgQ3azszs?=
 =?us-ascii?Q?6PV0Rh+fcs2frVrjH9Oz5VIw6WvWcAnXoNuRZ05i3YEHL529HFSHIVqAUjq3?=
 =?us-ascii?Q?ZM1LnWz6PmK6GnIAyCSTC0YDDf12nmiRYA6qfkWzRGMvkTh8KDjfCEpwGvM1?=
 =?us-ascii?Q?7BQvQsdc7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xIA8WEsQtzMfMmDLzMdQ8X4wMOR4/5UWpWT7OmC/nDX/GrG1M4b+iYWzdlR9nxK6tG2eBpHb3x+339AXhkGCBW+sYasMfWBOyVNDzXblMfI2nsMFURHUjxwSpMOciLK1OxESE0ILuFmTR0YYnrtOujgxuFWlmePmOlBKpwnti2P0Sq2oGLsFHIV+zhykV3EhfXbarJ2j2yNoLjnPxGfRWGMsVaGYNJC/ZkLt+DnxG8pjDSa2NECZxZ6DsxmRKbmQg5hhga6hs1dsFhHO5jUDnzG8zBfSVLl0G5gpoR1p+qonpMXbYDfA0B8KYD0kraXmvlGgtiBsnHqgrV24XN1QDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c336d663-4946-4172-ca9e-08df31079df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 13:14:49.4409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4di4mlNk5s9+2oHNW+szcETMNL5x26J42XHJgpCyYXqaVzHcl2G00eJvPqqA3nGi/xD5j7RMgMqqnP6gFwCcrhFwLFeLXpKlrtKaU6WfyD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 3/7] drm/xe/guc: Print register addresses in capture
> snapshot output
>=20
> Include register offsets in GuC capture snapshot print output for both 32=
-bit
> and 64-bit registers.
>=20
> When dumping captured engine register state, print each register name
> alongside its MMIO offset to make the snapshot output easier to cross-
> reference with register definitions and hardware debug documentation.
>=20
> This improves postmortem analysis without changing capture contents.
>=20
> v2:(Sashiko)
> - Ensure lower DWORD prints
>=20
> v3:(Sashiko)
> - Use the LOW_DW MMIO offset(capture in last_address)  when combined
> 64bit
>   register values in the dump instead of HI_SW offset
> - preserve existing coredump register-name format and append register
>   address as trailing metadata as a debug info and avoids disrupting
>   existing format
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 5a4d085660a2..3e99aef53b46 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1716,6 +1716,7 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  	struct xe_devcoredump_snapshot *devcore_snapshot =3D
> &devcoredump->snapshot;
>  	struct gcap_reg_list_info *reginfo =3D NULL;
>  	u32 i, last_value =3D 0;
> +	u32 last_address =3D 0;
>  	bool low32_ready =3D false;
>=20
>  	if (!list || !list->list || list->num_regs =3D=3D 0) @@ -1743,6 +1744,7=
 @@
> snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot,
> struct drm_
>  		switch (reg_desc->data_type) {
>  		case REG_64BIT_LOW_DW:
>  			last_value =3D value;
> +			last_address =3D reg_desc->reg.addr;
>=20
>  			/*
>  			 * A 64 bit register define requires 2 consecutive @@ -
> 1774,7 +1776,11 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  			XE_WARN_ON(!low32_ready);
>  			low32_ready =3D false;
>=20
> -			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc-
> >regname, value_qw);
> +			drm_printf(p, "\t%s: 0x%016llx [addr=3D0x%x]\n",
> +				   reg_desc->regname,
> +				   value_qw,
> +				   last_address);
> +
>  			break;
>  		}
>=20
> @@ -1788,10 +1794,14 @@ snapshot_print_by_list_order(struct
> xe_hw_engine_snapshot *snapshot, struct drm_
>  			XE_WARN_ON(low32_ready);
>=20
>  			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED,
> reg_desc->flags))
> -				drm_printf(p, "\t%s[%u]: 0x%08x\n",
> reg_desc->regname,
> -					   reg_desc->dss_id, value);
> +				drm_printf(p, "\t%s[%u]: 0x%08x
> [addr=3D0x%x]\n",
> +					   reg_desc->regname,
> +					   reg_desc->dss_id, value, reg_desc-
> >reg.addr);
> +
>  			else
> -				drm_printf(p, "\t%s: 0x%08x\n", reg_desc-
> >regname, value);
> +				drm_printf(p, "\t%s: 0x%08x [addr=3D0x%x]\n",
> +					   reg_desc->regname, value,
> reg_desc->reg.addr);
> +

Extra newline? With that fixed,
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  			break;
>  		}
> --
> 2.43.0

