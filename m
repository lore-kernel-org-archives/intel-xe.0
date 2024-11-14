Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C80D65C57
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 08:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BA10E7B0;
	Thu, 14 Nov 2024 08:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfkbOuC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C410E7B0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731574255; x=1763110255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jTqNx4LIxtRQhtGriQTN6MDk8WxkFBUEwIqcYaK9ot0=;
 b=AfkbOuC5Fts+envkQR2wXFELtpIlkXFzHXLgAAcaXA/B51qTFuVunoUO
 sxBYvepTiW94Rm8j0am38UA0i+3Ypu6hPpkw0LeP9hCw4VURFLtRI7dov
 5G4iJ1DbXYj8M95XokuML2a1rAl3m1xbkZvw01ugg0c/030x19q2fNsAT
 /pbo9F1m2qI0mlRtaNvMAReVwab46eHecgt4ZfOoLIE5djLZaAayi575T
 SXfxz7GkizzxkmbGgwud+u2SBErBgXtOju00Wc+HxtcCfNl+2x8+h/xOf
 e0a4bPNjnoEiKdef4YjZWKOeXkW8YNUr/kcejno4Z9mFVjASH3clVzVE8 w==;
X-CSE-ConnectionGUID: U2Fgxo2ASrSXExIVlmw8Ow==
X-CSE-MsgGUID: ERsMN0IdSXmmpXcqIPzSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31282514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31282514"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 00:50:54 -0800
X-CSE-ConnectionGUID: UbaQ91cGSjW5eUigfvXVdA==
X-CSE-MsgGUID: yqCQ+P57RfGQTCYbe03R/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87890098"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 00:50:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 00:50:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 00:50:52 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 00:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNRHflFMlkVzOq4D1uNdRpauvnfnxrhg0A9udQgvdwYZHUHFDXK71AipVadZEXfyUm6IcvBg8Xf7O+JXjJK/OAlWETtgHUPnDVJ5tO2zrvW6pN9BXT+l1nLU1cKnF5euDMj6U1MIY/Yhfs93SWgHe0b0pVuZdXF/p0InBOvn4ktbVfTHCE7EcDHTspfl6TziUQsEWRbaCBzJR17Cc0+Ae1kKjZeW3VHHJFWXYA6XRlTuN0aC7V13An4/A4KvwDKIlFjzhGprr6N4wOtz2eIbQMv8wPRcflBaZjf2Em+tuoxuU5P+n3JvcW3vpeVuT7J4PRlBgMYaGJTCLWNzp748ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1jsgdKQQUIDuxiOkr31GMUm+wB6ClNS0bNL5L0OXpA=;
 b=L5gsmWhDc0KEvnRdRDtaKuz0+vW7ydKpEYK0npa6uqM5KP5WNv5DvuagA2x0AwtOrsumTl9DMxyxH/rtadBNQRZki28uSRC8xjrDGJ4Vx3bpfBZojaF7j5jZGlOqMyw1AemxNZbqxZiJGsrQB9AMTf4c0xQsDVF7T0k1IRbGQiwVQ4L5Pm8s/opqCRwXDsn/RAlpGKM9kXlLcfUCvBbBLfbaWtcPZovx0fFBuEJF5jUNOmshUkbMoLrWkzP5aJnpsiVYaKrLOy+0279I+Oy7MuW83qJ0jkrpbwV30q8BCeubQh1wLWiFEKOTUaHlqCFrYEqSdBulup27Yo34VertMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.30; Thu, 14 Nov
 2024 08:50:49 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 08:50:48 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: RE: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbJs1Z9CgXn/xug0OnrMYEe+6a4rK2lsYg
Date: Thu, 14 Nov 2024 08:50:48 +0000
Message-ID: <SJ1PR11MB6204271995164F13540EB694815B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW3PR11MB4538:EE_
x-ms-office365-filtering-correlation-id: b4a87615-f82e-4c2c-e49f-08dd04896fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xQWVLgmKP4r5bJ1yL9rI3ep1OThz6IsLXqSunMj5WqQ6p7OmGwK18h7+ENF8?=
 =?us-ascii?Q?mGQVf5OTYvJbOwjKUZm4INnOl5CMLaasP6dEJvRxHoGXeAy3XunMjIpWsqIC?=
 =?us-ascii?Q?TGin70TZHXXLkqXe/+A9tCVHFNj9Hw7tPu7NC0TLGAVgdVtmNhC6XcoXQqo+?=
 =?us-ascii?Q?UTROjy4kJUFbA4DRwhQlHOygALKQ6qc+FjAc+gHBu8J5QZdgdN7GOj6LpLfc?=
 =?us-ascii?Q?f5U41AgFeLkJ2xPY1mZ6whg6uICisKtikAJbUKDo6KHPGHFJAPaLq7G3rVOA?=
 =?us-ascii?Q?mdpCkvYTxZyjJLMhGQTA7dscaDGlwDhINY1pmmHdhLJkCgKL53MZyiLdofJH?=
 =?us-ascii?Q?YCO0Pn9B70TgBrbK+SLuzC2JY4tp2e1+Q/f8UDe0HDgCePRv6IRu9YFSWu/z?=
 =?us-ascii?Q?JIGpXRq7+hki0TSZMygERocQ7Zms+DSF45Z5dJ7DnhF4NJJjVREOYCdi/CF/?=
 =?us-ascii?Q?PPkiluS/p7I/nT3HoWveSDFE8LvWKjkF1IyaPM3luUjyVGX+aQ19bmLy8vOu?=
 =?us-ascii?Q?kGVWV/S4OvVeb17OgkbnOQCXvGOlJJlOZbOOO1U5q9avjV9/PieXLhGHf1lI?=
 =?us-ascii?Q?wBI9BNveYjw66gFtbThT22q4/sfBvGEG433Wvv/NdjbT7g2BSdYvoPYa5MTl?=
 =?us-ascii?Q?rBFJMOdRI2gNOEFoSQVVbjdBh9ZXGQGcBMSaCum5ZE0xaQdC2dOHp5V9WNUX?=
 =?us-ascii?Q?ab0awJIXqHPbvx2K0XZ1JV3hV4nVOrYKs97jGsXsnkWKhpJbLZ7L2uMHsiJq?=
 =?us-ascii?Q?cVJ92evR8uStco2t0EOK6BrZ/s+jZwigB9+Tqv8DLe0e3Xql++6MphKojaEU?=
 =?us-ascii?Q?alHM5VHhtpp1WEJaj9I//LHj9/BCgNvdRy3Z4YoIfpExUaVtWmSlGasPzFbB?=
 =?us-ascii?Q?ARJ5w5dDUcnJAU/PY90PkEhlgGH7BfZEBhDkE/VQDxwOOBtlIWD55Bnz19XW?=
 =?us-ascii?Q?Ln8OiZRdplKHhIuHh+9AQfEbqGDbyiRFk9ZadQCeqIEnYpCQC58tlJ1trV/K?=
 =?us-ascii?Q?lPArpPzxSo4EED0FLBf2WoyEPqVU5TqFqBKYDuzxsXZgFpsFsWt+9QFCKRXu?=
 =?us-ascii?Q?PBgHpbDhqn1sBCspZTphuPJQF8y6+PGg+1LorV0gsHdb0sdJYwM0uwBtpEYx?=
 =?us-ascii?Q?P94oIkIZ28W9rRNFHcUxEYN2wgL/G0v/80o13/XpzY1RpV7s8354CBwgcES3?=
 =?us-ascii?Q?jpRzaAtVhzX2IzEmFg4l65wMSGNlhaTDXsjXBFM7X2Iewhgnh10GerE6kfnh?=
 =?us-ascii?Q?Ozc8X0sH/tuuOiADXxV45l8tcUGEAmPQewE1vOWbPW2rtpIRt6zJ/ElhHmix?=
 =?us-ascii?Q?ZtziO/n4nxKYeNeZsRA9iWJlJeweZQqvCR5Zl/hfsz5UJg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RvxT0Ht/V8xwYohdPrbwOJ7dm/5hxc5/ld0j4wF3jBzhEaUhEMTswr89pKC/?=
 =?us-ascii?Q?kHNuvzQ3qZwnVnhXrYgPZBJWTKIaOkMH2tfrqFn8+cpznfSC+mbgDQ9BB6K5?=
 =?us-ascii?Q?R1sbyvNtZTaVp4XA4V58YR91WYVhsMXJkpJwOB1st9eyJl8IUwRg3OtKkbic?=
 =?us-ascii?Q?mDGFCvtXtexoFnGjvw5+MIq8NE45wBwhkNzqLyi2QqH4XG5AJmhHbBpbEBYI?=
 =?us-ascii?Q?xeN1TpHpTs8GPepQUR0hR/3SzsAeTQUFsn3Fz/9OfcmvsraYQobMWzRSjTXR?=
 =?us-ascii?Q?f4VAq0jlESaVnLiy1ig7HiiCZlMjZ2Q3guJdz5PzUVFkVavjdodje0GB5ZZc?=
 =?us-ascii?Q?RtWzHF0Hsw1wslndezEXyCpRVTRw/YPboXqvh5Kx5uVS1IDrKdGrrFZmFDqe?=
 =?us-ascii?Q?h71rgh34lof5LtUAOZMKWJOWZYlzOQZKCvQos2bfjdPQbXe60hypY4Zv30ia?=
 =?us-ascii?Q?nadeT7+9nvR/JWpCtOGZFMelkXnYSuo4+sFkRtsWs3tuGR0TAvWovAAanU80?=
 =?us-ascii?Q?WDDlBpjEyTqwbDOvB3CAKtaFHOktbEHzthsYcqGRjAz8Ah3a6LvwUEOI4OK4?=
 =?us-ascii?Q?eDPYLvwIF1UWrGjO0Q1UV2VPG6QZhQ0bJ6IgPNmORkbEPCiQ/KhA3BHinDQx?=
 =?us-ascii?Q?iysoXb28/Dlv7tqC2Dsr71OIW2SHGCdwHmmDl+TEn78mLYLMr7f/ZcgllM1L?=
 =?us-ascii?Q?yaT3AaCSlfqiLSI7O5vYBWV2HY3KbtOrYfjpo1YbkrASKwjWfDZ1RDypPVPQ?=
 =?us-ascii?Q?Mq94MgT9tNTEgIATXslgyesgysciONe9DfNvad7arLxBf/vRORrYK5XryBZt?=
 =?us-ascii?Q?uXAmjHlYfPAMUsaXLgUpiazm98/cY5g/83TjR+2rBxo3UnrfD6hiUorGwAU4?=
 =?us-ascii?Q?aHvcVbigfwrJ7Z446Rz9LXFLvXt/VkNhHVVybVOEStFSgcIiC3rkFNwOJCXq?=
 =?us-ascii?Q?VelUqwCLzCRlpQ53I9Eexy9mKD3KBJe5V2+0zlo2HM/deqs1JSSyPuAODJOG?=
 =?us-ascii?Q?4kaWuKPqvPujUG+VCsF/S/g/doUEctwt9LuaxcwQrPjiXDsjr3mF930khsGF?=
 =?us-ascii?Q?a4e1DCy61cSdn4XVq1vhFiKnhzvuFVPSnSzWGrSvrxk59HZkj1sOs3HMnfcN?=
 =?us-ascii?Q?ZoIs6Qpfg9tz6ou3A3/1kjFujHW+iTkUw3ESVOERmfr6K5eKqW6902miUMFB?=
 =?us-ascii?Q?QOsJxkH48NHL/w8b14265UC6QsM4f3gsU0D+FUwO7wiNLlKbyffmkioCJFv/?=
 =?us-ascii?Q?oNHR0Do8XjiXgpSI5SvZYFhCqUmxaezrSRDdWgDqxXYVqU5dKsRjTj5wqyfd?=
 =?us-ascii?Q?NARQKmLWnae9Fe/3ytyLj3V6pjzZN4yTFYPV4iGrDy0JzMThdAfv0CiG8igJ?=
 =?us-ascii?Q?oJqXsymv0/zTvzd3SxpW0m8NW8J3Axq3VNhJc3T5G3dvRsbtSL6PMDc5T5TM?=
 =?us-ascii?Q?TxwODuwje8ZiWczjHE47oWk9x7AUbgCw6f+TLUQEGxzzxrVrthfs+9IYEQt3?=
 =?us-ascii?Q?mqPW9uCynqonquTqAv0H2TBuCaZEstxXQ52ZKQZxa1VT3FyuNAftOQqEpjQN?=
 =?us-ascii?Q?P30ZwA5TvEvNVzoHO2vZSalCK15+vwQi5HMRDQ/w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a87615-f82e-4c2c-e49f-08dd04896fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 08:50:48.8195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: velDIX5aga6oDTpLstFku14SadZAqviHdvN7Crpcc9FTBX3JTTbXEvjPqiZyb4PRcpBdQPaE+zyPxRh1tpaMhf8GFzJ7OAOA1JhO6XpfIBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Friday, October 25, 2024 4:35 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>
> Subject: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory
> barrier
>=20
> In order to avoid having userspace to use MI_MEM_FENCE, we are adding a
> mechanism for userspace to generate a PCI memory barrier with low
> overhead (avoiding IOCTL call as well as writing to VRAM will adds some
> overhead).
>=20
> This is implemented by memory-mapping a page as uncached that is backed
> by MMIO on the dGPU and thus allowing userspace to do memory write to
> the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from the PCI bus s=
o that
> the MMIO writes themselves are ignored, but the PCI memory barrier will s=
till
> take action as the MMIO filtering will happen after the memory barrier ef=
fect.
>=20
> When we detect special defined offset in mmap(), We are mapping 4K page
> which contains the last of page of doorbell MMIO range to userspace for
> same purpose.
>=20
> For user to query special offset we are adding special flag in mmap_offse=
t
> ioctl which needs to be passed as follows, struct drm_xe_gem_mmap_offset
> mmo =3D {
>         .handle =3D 0, /* this must be 0 */
>         .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo); map =3D
> mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>=20
> Note: Test coverage for this is added by IGT
>       https://patchwork.freedesktop.org/series/140368/  here.
>       UMD implementing test, once PR is ready will attach with
>       this patch.
>=20
> V6(MAuld)
>   - Move physical mmap to fault handler
>   - Modify kernel-doc and attach UMD PR when ready
> V5(MAuld)
>   - Return invalid early in case of non 4K PAGE_SIZE
>   - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> V4(MAuld)
>   - Add kernel-doc for uapi change
>   - Restrict page size to 4K
> V3(MAuld)
>   - Remove offset defination from UAPI to be able to change later
>   - Edit commit message for special flag addition
> V2(MAuld)
>   - Add fault handler with dummy page to handle unplug device
>   - Add Build check for special offset to be below normal start page
>   - Test d3hot, mapping seems to be valid in d3hot as well
>   - Add more info to commit message
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

UMD upstream PR to consume this https://github.com/intel/compute-runtime/pu=
ll/772/commits/34acf33a10f4ed15d13be9062b246ef085888973

Tejas
> ---
>  drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
>  drivers/gpu/drm/xe/xe_bo.h     |   2 +
>  drivers/gpu/drm/xe/xe_device.c | 103
> ++++++++++++++++++++++++++++++++-
>  include/uapi/drm/xe_drm.h      |  29 +++++++++-
>  4 files changed, 147 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x
> d5d30a0ff1e7..953c8cfffb77 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2132,9 +2132,23 @@ int xe_gem_mmap_offset_ioctl(struct drm_device
> *dev, void *data,
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, args->flags))
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
>  		return -EINVAL;
>=20
> +	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		if (XE_IOCTL_DBG(xe, args->handle))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> +			return -EINVAL;
> +
> +		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >>
> XE_PTE_SHIFT) +
> +			      SZ_4K) >=3D DRM_FILE_PAGE_OFFSET_START);
> +		args->offset =3D XE_PCI_BARRIER_MMAP_OFFSET;
> +		return 0;
> +	}
> +
>  	gem_obj =3D drm_gem_object_lookup(file, args->handle);
>  	if (XE_IOCTL_DBG(xe, !gem_obj))
>  		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h inde=
x
> 41624159a291..b36d1fba54c1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -63,6 +63,8 @@
>=20
>  #define XE_BO_PROPS_INVALID	(-1)
>=20
> +#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
> +
>  struct sg_table;
>=20
>  struct xe_bo *xe_bo_alloc(void);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 2da4affe4dfd..4c0e765988a9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -239,12 +239,113 @@ static long xe_drm_compat_ioctl(struct file *file,
> unsigned int cmd, unsigned lo  #define xe_drm_compat_ioctl NULL  #endif
>=20
> +static void barrier_open(struct vm_area_struct *vma) {
> +	drm_dev_get(vma->vm_private_data);
> +}
> +
> +static void barrier_close(struct vm_area_struct *vma) {
> +	drm_dev_put(vma->vm_private_data);
> +}
> +
> +static void barrier_release_dummy_page(struct drm_device *dev, void
> +*res) {
> +	struct page *dummy_page =3D (struct page *)res;
> +
> +	__free_page(dummy_page);
> +}
> +
> +static vm_fault_t barrier_fault(struct vm_fault *vmf) {
> +	struct drm_device *dev =3D vmf->vma->vm_private_data;
> +	struct vm_area_struct *vma =3D vmf->vma;
> +	vm_fault_t ret =3D VM_FAULT_NOPAGE;
> +	pgprot_t prot;
> +	int idx;
> +
> +	prot =3D vm_get_page_prot(vma->vm_flags);
> +
> +	if (drm_dev_enter(dev, &idx)) {
> +		unsigned long pfn;
> +
> +#define LAST_DB_PAGE_OFFSET 0x7ff001
> +		pfn =3D PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0)
> +
> +				LAST_DB_PAGE_OFFSET);
> +		ret =3D vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> +					  pgprot_noncached(prot));
> +		drm_dev_exit(idx);
> +	} else {
> +		struct page *page;
> +
> +		/* Allocate new dummy page to map all the VA range in this
> VMA to it*/
> +		page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!page)
> +			return VM_FAULT_OOM;
> +
> +		/* Set the page to be freed using drmm release action */
> +		if (drmm_add_action_or_reset(dev,
> barrier_release_dummy_page, page))
> +			return VM_FAULT_OOM;
> +
> +		ret =3D vmf_insert_pfn_prot(vma, vma->vm_start,
> page_to_pfn(page),
> +					  prot);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct vm_ops_barrier =3D {
> +	.open =3D barrier_open,
> +	.close =3D barrier_close,
> +	.fault =3D barrier_fault,
> +};
> +
> +static int xe_pci_barrier_mmap(struct file *filp,
> +			       struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv =3D filp->private_data;
> +	struct drm_device *dev =3D priv->minor->dev;
> +
> +	if (vma->vm_end - vma->vm_start > SZ_4K)
> +		return -EINVAL;
> +
> +	if (is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;
> +
> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
> +		return -EINVAL;
> +
> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP | VM_IO);
> +	vma->vm_ops =3D &vm_ops_barrier;
> +	vma->vm_private_data =3D dev;
> +	drm_dev_get(vma->vm_private_data);
> +
> +	return 0;
> +}
> +
> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma) {
> +	struct drm_file *priv =3D filp->private_data;
> +	struct drm_device *dev =3D priv->minor->dev;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	switch (vma->vm_pgoff) {
> +	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> +		return xe_pci_barrier_mmap(filp, vma);
> +	}
> +
> +	return drm_gem_mmap(filp, vma);
> +}
> +
>  static const struct file_operations xe_driver_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D drm_open,
>  	.release =3D drm_release_noglobal,
>  	.unlocked_ioctl =3D xe_drm_ioctl,
> -	.mmap =3D drm_gem_mmap,
> +	.mmap =3D xe_mmap,
>  	.poll =3D drm_poll,
>  	.read =3D drm_read,
>  	.compat_ioctl =3D xe_drm_compat_ioctl,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> 4a8a4a63e99c..6490b16b1217 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -811,6 +811,32 @@ struct drm_xe_gem_create {
>=20
>  /**
>   * struct drm_xe_gem_mmap_offset - Input of
> &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + *
> + * The @flags can be:
> + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query
> special
> + offset
> + *  for use in mmap ioctl. Writing to the returned mmap address will
> + generate a
> + *  PCI memory barrier with low overhead (avoiding IOCTL call as well
> + as writing
> + *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *  instruction.
> + *
> + *  Note: The mmap size can be at most 4K, due to HW limitations. As a
> + result
> + *  this interface is only supported on CPU architectures that support
> + 4K page
> + *  size. The mmap_offset ioctl will detect this and gracefully return
> + an
> + *  error, where userspace is expected to have a different fallback
> + method for
> + *  triggering a barrier.
> + *
> + *  Roughly the usage would be as follows:
> + *
> + *  .. code-block:: C
> + *
> + *  struct drm_xe_gem_mmap_offset mmo =3D {
> + *	.handle =3D 0, // must be set to 0
> + *	.flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *  };
> + *
> + *  err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *  map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *  map[i] =3D 0xdeadbeaf; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */ @@ -
> 819,7 +845,8 @@ struct drm_xe_gem_mmap_offset {
>  	/** @handle: Handle for the object being mapped. */
>  	__u32 handle;
>=20
> -	/** @flags: Must be zero */
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flags */
>  	__u32 flags;
>=20
>  	/** @offset: The fake offset to use for subsequent mmap call */
> --
> 2.34.1

