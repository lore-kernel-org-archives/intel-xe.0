Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79091C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3267610E1B6;
	Tue, 14 May 2024 06:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGSQ9P3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F61310E13E;
 Tue, 14 May 2024 06:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715667174; x=1747203174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SF+C3CvLscZY3XG1C53/69GLZdpuNjehE8INeW1kXPA=;
 b=cGSQ9P3iC9Huy0UAHkx4FpP8D++rPAuhCHncVCpypAM8tCwF59jik/0m
 HUXZ1CP2Cm3dk25Ft37ly8X5CM52pVIAVsYu6NCCOYD4rf75AxL3F+/US
 4MT931v0wY8OzKZhRAt8JERWFprHUaZCpR2hXXm0nZl7NmdYYSuA41DH4
 tx9yrpWeMsZa9bfpWMunjTRJhaNINNc7iwHPB4FfKbufcY6NPddIL2f2S
 gyCRP7Lijz2hIwguK1QP7HzhC5tD3DhKeqKbE6XGZjCmXXmMTN9G9cG+E
 ytXY57A8rX3lKA6bjK4DDxj8DKZoWm9LSHoLin0OzYndOZS2bKwCgi7qC w==;
X-CSE-ConnectionGUID: YlznJEDIRK+bTJLyKFf6tw==
X-CSE-MsgGUID: b9TppP0FS6eOE3WyWpnDhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11463661"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11463661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:12:54 -0700
X-CSE-ConnectionGUID: sepTt3U2R4+2sh1mX45ZzA==
X-CSE-MsgGUID: QAJo4ewKR4e0OukhfTM0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="68045480"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 23:12:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:12:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:12:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 23:12:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 23:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/QK7HyV1OlKFzJ8F4ivMNxo8caDhPcQgCs4lmdjRjPwOmdZYg8Gw0GnTfFof6EzKWo+ZIjUm9XqcvFQ504gyx289ledAQrIz1evMo6uHsCKCGYizcYQVEIeZlq84mTau078FpD4WLH8UJy3xqm4/iIkA0zvi0QidO6w9NJApXdn1k1z6d4zynPSrFn6aZLdHr/1fydXqJ7WbufciLDnh0gdXjOvuKQj+IcK7aK4jJ5xCQ0XDK6n1E1H37qaRNxrB+WV6ZXPW9b0f+ufT0v+Y6X8Z9Ia0LC5RWwC/FoAsSbFX8iN2zH2sPkucRg92Z/qMYKrgAB4uhIkDkNx8bvA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37+mIYiGoFUtlbKd0TKTVyH8mLwneJJljOMC06dyTic=;
 b=JRwDiDJtf1fzj8AidLLD4U0Mx1CrXH6qMLIaA3s0xTVMIPxawefv1+hwEpypfsuorS5/4LkekHz7/pFf4ZDeBEMocTOMUI6ikLInsq//uahYJDNCUiF6j9I5jOASTGa0xSrVBJap+SRKv80jnANmP8moDJTxP4e5jTyUqPRofH4FCKIHcqSGklBIEZtMum/3TcfUYae88NPv0ugRxWJ+d3ViCec+W6XWKOUThz7xSPZNm+XSKmXVJLJTdt6gHIBrMKqXtARVT3CZ5JLRuVHomLQp43JYsG2LWHWRyzRx2VeyCFNnuoAGZDByW8pbgfYxqDCB0KxbTVuymImjTBhnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 06:12:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 06:12:49 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Thread-Topic: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Thread-Index: AQHapWcv8bOOYZ0vkUqdwXFHK9VJ/LGWQFqA
Date: Tue, 14 May 2024 06:12:49 +0000
Message-ID: <CY5PR11MB6211987D7CD570BBB578B4C695E32@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-3-rodrigo.vivi@intel.com>
In-Reply-To: <20240513185518.772398-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: a8e2ed9a-d923-4be9-dae8-08dc73dce1e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?6KjhrUNSWEc8caIcipOZvlHMzhc2FN1gbu6/C9O9VHqeIBVXP3w2AaGVGZyf?=
 =?us-ascii?Q?28Rm4bVmGKAY8qrXPkF9ikwGWhg8XoWI0EKYQEI8vgOEu7SSmHDPwvDpLOhe?=
 =?us-ascii?Q?gYghvt01nKH7YaIv+kXHCCzGGeQjkXmO42ChgbkHxgt/RiFsQHemNfm/Ydo8?=
 =?us-ascii?Q?h+7kE1sf7tF+ZhEikj+hLVcSGImMDwNsYXWdvtzs1uJOoOhJ01LgHPpJAHVs?=
 =?us-ascii?Q?o6/a2b2N8w+eeH0XwpKN9oxedwQC/cosqK2KmhCJD54m2OshjUb18M45K5WO?=
 =?us-ascii?Q?lh/TXGQtUGsM7NO6v2NInRBNcVkJXW1pB80iJk2193wfiLRGRXgFOV43MBF4?=
 =?us-ascii?Q?MT6ec1zJxxDMFfCVOFIl6hJc103zV6GJZZgZb999zbTqhTrKOBzJjdzawVmj?=
 =?us-ascii?Q?jSFfIWOYiCuyItWqGpjtJPI5Wjfk2cKS+hr+SEseOvPkY+vBk0zYLcUNTJc+?=
 =?us-ascii?Q?EnMsByRMfUoXhxDf7/wxsB97Dj5qiT+yzDRB9NOuBe1NuBsXgMH5r5wdW5Hc?=
 =?us-ascii?Q?dURWv5If/iCAaLKG9m1EglDnQS6rAiUEVbEsaaKLPhAEOiaXoPpr3WuAVwXc?=
 =?us-ascii?Q?LSPQ7DOTfkUztfoM+jwfTFXqJy9OoOZLW5nXYycLjUHtKjK1ztwyOKw0zSZf?=
 =?us-ascii?Q?DcKYyWA1L7eGhrXohrCwLGWmFRUJI3csAxpstGjzV+/65yZy/DBzj+cPdueV?=
 =?us-ascii?Q?t6xwbLEs0UG9PBMV/rC7AXrQBpuIAVBH9WBv61IngX8eDrpIiVFTudTNrN2X?=
 =?us-ascii?Q?ngTBXDva80fePwohU8ONjSw8PboF5VE6quwEHmrZ1PcoNBxbn/xQ55Q/OGJd?=
 =?us-ascii?Q?KNvdSb3tnkXglDBinDGQffke2jpwJQM/jk93jJ/sr6SCMooNhkP8y77c4/TB?=
 =?us-ascii?Q?ektaC2CHu6AXuGg7arbn1jV2ioR4FykUi4bTnks7W+AY27E9nG+Gbb0uScmz?=
 =?us-ascii?Q?3EG8a2PBSgD39CYseAG89J1W+4M1yUMxv2rDP/q+3aSrwWJG6bYhn5bW6aEO?=
 =?us-ascii?Q?+CAx4+Zr1sUXYRLnN94/IvroxL63ihqalXVf8ivj2GcQg8yGBw1q4B9f0Qe3?=
 =?us-ascii?Q?deL6XRIkVahiuEKy+Vc+CsfS2np70oLKr5YrvFXFfaykFNKZAH9NGdc/WPE3?=
 =?us-ascii?Q?7fDaU4RIbtNtaBaUUhF6lT80tWTa3siXIQCYoRxL7tDNo+1M/yh7gkIKSpMW?=
 =?us-ascii?Q?LmqzEX69JBDnU6rfRlcSpNUO1rKyh0oId/jV/03r8lZaDLYxBvimuKRM5wwm?=
 =?us-ascii?Q?YpI+Tb1WTnJDgnKCTCw80IyuqJPvuNmKejTc0OHVM0yV1QTkWTHqxKUA8MY6?=
 =?us-ascii?Q?Rc6vhfgpNIvURNDSzzDW4Rzey2wKbjms6k9RYXH8AnhOdg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w+NhxwA1clOQUZmd7oxV1XB6qeVtlFNrsFOf66ce86m2xsQRv0mvl6vuY1uv?=
 =?us-ascii?Q?+GHFMDjRSLdaGe+vzEgNMy0E0HwAb0D5ccCiwZXDqK8y4g1qI/0/86sSZdbm?=
 =?us-ascii?Q?jylu+ACyODSQj6dHZerTwCdCAX2PekqGcCD5SBQve8yYzvswsKLTFhPSYqi3?=
 =?us-ascii?Q?I4R95e0OEhz26v4WWYUmh53oBAsYuL2TVS3UhBk/MhH9engExGWG/BGTmeDj?=
 =?us-ascii?Q?BTGMTmf+NX9lPqPiKNqRcc7rIdS/DEfkSZCQNme8OLmoBc1tNA72sPG4ErvE?=
 =?us-ascii?Q?GE1+IVy3Q3Lavn8Y7p2FEDxdbgXkVFArrm8IWkMM6d9mRpaoAmPrjaypcJB2?=
 =?us-ascii?Q?xycv6fIcp4wkgKJzsIEkBY0or7JaqJdaIl1e6SluKbqthai3fkms75i7ubNK?=
 =?us-ascii?Q?hS84tOyUulCWXg0sIJyqxrqaAIji67PRQT1nVFF+L4+dV0SRrXicN04loZkO?=
 =?us-ascii?Q?lhp/VJa+rWvMwX2qPIsU2F5EsuLMt/mJB3Yttdl0pCTSk+cKF2jyiBCewqu3?=
 =?us-ascii?Q?kpL799kKutUgDDQPy1pNCksXq7w4MfgZR3d6Lq+f/PLUt02Yz7zCsk5ygUdr?=
 =?us-ascii?Q?01gKQYgqj8SXfl+nbx0ZCZPaMDMMHq5l6qBpZTVSaQ2ZfN08r6q8XgXew6d3?=
 =?us-ascii?Q?yVer6m1POffMa0LlNvpIi7fxyLNmCKL1x9zn+qzGEX+3aYXn7TY/oznGXyfw?=
 =?us-ascii?Q?wyG0FZrF3qqmiI1Pk8FMEdgSYkToUqTisIZ6HIjFhU4icfccmx/RY2NJ9GfY?=
 =?us-ascii?Q?WDO/16yGF96vFO0aAf37N8Nh3gPGVIcjWFHuv/8se7OGroOVDVqLVIEV+NTH?=
 =?us-ascii?Q?rERX16w9C3PWDJdxAVOKyMEV6arqay+KeFq1tQZvFO1E3WI3A4i2DkL1XpAq?=
 =?us-ascii?Q?NoBaGzk4SNd2p0bvU33Bl6sx14rW8jq9d3TEUa/RcPfRmoH6ZFWcu+kKt8At?=
 =?us-ascii?Q?1hC7gQWV+95DmVSicOCl9RDygPDgV70ggaBJKsz7vDVC9+FA39iycL1RIpAj?=
 =?us-ascii?Q?8qBFpHAqYeEnCvYx9CjuqiiahjoWU2C+gCEGr9UxDNJWM2UnyjRbAZReL20U?=
 =?us-ascii?Q?rXdL2BDGX23PutHvHjnxf53PhIKOS3X0ZTfXLTvCVTGKHRqci9lxYR1WUf6J?=
 =?us-ascii?Q?rW0M9+KKcC55/Mf0kmNr+EX8Vbb+ibLAwACVDse7t+388p71JczcM7V8T+Ea?=
 =?us-ascii?Q?W8Rh55e+VbaHG0m0PvYvZyT6IYJrMZ/ZyAscXRUtvr5B9a/f4IGDTZZk9mL7?=
 =?us-ascii?Q?m7BLaEsBHxVKCvX6jZZOLbF3sDvasC72NlmYC7Cs1jqOjKexjVdwDwXiQEk9?=
 =?us-ascii?Q?NFGgPJH+It59l1g6ax7PSqr2sT7Gm5s/l1J0IPNKPMTmbhuyblSksrW54K78?=
 =?us-ascii?Q?Rjr3jPxWJaILqR/wfdVQ9V/C/CaqS6O/Gvi/jNaGfFBFSKc4ZrO8CH82yOyF?=
 =?us-ascii?Q?L+XHaRwluOjttaOArsrFH9qzy/69DH8Lb26NggNk7KzKd8MGD+pBZG333+QN?=
 =?us-ascii?Q?K1NS34yS0qfn3snyFXbvBS9L9q0VgkYjdcmS1Vg4vXBIK72SZxIg37FHZIfx?=
 =?us-ascii?Q?OK7W1AnuxvP9+P2LGpDjTGrqYcibZHdDMY1i1uTz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e2ed9a-d923-4be9-dae8-08dc73dce1e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 06:12:49.9357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q21HdnxNA78x8pSr7v2tFg9p9sDgqeemEQBaQ9Thh1z7V2HLWbHU+CTISmQbiwo7zuwqyJHMCsmMfHiu7WcnBGWp+RdCGb/S+v/TLo/HFQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Tuesday, May 14, 2024 12:25 AM
> To: igt-dev@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>;
> Nilawar, Badal <badal.nilawar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
> mmap_system test
>=20
> If display is enabled, the always-on components will always keeps runtime=
 pm
> references, unless you put DPMS_OFF.
>=20
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Gupta, Anshuman] looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> 3f963bd9b..72d484163 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -780,7 +780,9 @@ igt_main
>  		igt_describe("Validate mmap memory mappings with system
> region,"
>  			     "when device along with parent bridge in d3");
>  		igt_subtest("d3-mmap-system") {
> +			dpms_on_off(device, DRM_MODE_DPMS_OFF);
>  			test_mmap(device, system_memory(device.fd_xe), 0);
> +			dpms_on_off(device, DRM_MODE_DPMS_ON);
>  		}
>=20
>  		igt_describe("Validate mmap memory mappings with vram
> region,"
> --
> 2.44.0

