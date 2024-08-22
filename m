Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946E2C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 14:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610EF10EAF8;
	Thu, 22 Aug 2024 14:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K05RlYtE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69BB10EAF8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724337563; x=1755873563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TZGzfsKkubW9x/q8qpUf0EIoKSq43q1okJGFPP8RNkA=;
 b=K05RlYtEMxx+QXlkju4xUTnAsBsidDVSTxwhnsWV24hllv1s14q9xJgE
 LZPpqwrQ7pu2t88TGX8ZfiT1Io9GiLuDkmTUSFYCfRHyZraagsWcov4yR
 zE2Yz0XJzFhiRth6ktaMby9Oyd9GXSITE6DAeVqDvRjaVldQhs7/PCONG
 6sH+3S8pFBqLe8mis+WDOV3DNWFmAuCN3eMy/6cvcW/JOrjXrPTp678cS
 IFWD0vySFnTi2yMLkyU60T3m8KZ8YoveAb3wZrN6ief3+gOBY4ou6UdxR
 FPu/46mhVA1Wfm5AMTNmPTJhUjMvblxKEzLyZIwz5D6ZjnmENUMi3kRJp A==;
X-CSE-ConnectionGUID: c97I/OVFQSCNDz4OdPggGA==
X-CSE-MsgGUID: 8vr+tpjSTI2MFxM5fyknNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22938692"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22938692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 07:39:23 -0700
X-CSE-ConnectionGUID: HlYQUY0rRgq5k/lNn6PLEw==
X-CSE-MsgGUID: bSJ50NmsQdSja2obNexDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65806269"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 07:39:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 07:39:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 07:39:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 07:39:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 07:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb3PyRzGrbpROeowghe5B/ppSpucDVOJhlH3xuOggddE8YO+ncxIvH9h55oe0lA7yFdat2mmcU+QLSdz3OCUGzBJG+VSVAlRIzHvefGefTij3T0D3CQ+RjAV2BJJ4FpBR0dV06rEuBTOMuvSOt73hYHETdU57PSU+lqgpEe9rAS5dg1YwOhEm7zH82NPSJIjJf2X7FZuCYvoL/VjPyaXA82ZTkrfI8DdFiulCoWh8qTz3ALy/e4qlFmhwDu3FsV8Mz5zGGgKVDqtqkoqKLt3GS/dUuZUNCQyitoYnJw6FBbuMSQThCssJQrQohhXvia93TEgUr44n00UiVfJKTpOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTvNsiJaAact8inajNhuWDxYLSTnqO7Z9D88HAGf/bA=;
 b=DPpzqvkCB+23UHLG8Msvl5GaScVfv6Jo35d+Jamoz9g9EVRowBdvF40vo8B+ChlJGSRaeKYzbjSAWOdJEYtSc53drTd9rmSSBa2ZctssCUiehRawyG8EgfsEYGQG3XK51O/BOvXHkgaHisiIq3Jp/DTTvgsxx5Q57gLbWtFO0YURE+F8IsezsVOi9rRIPya42NkBzAAuzvXi1znNHt8VVTqZVqRURMukp1Jr4BQS/fZ5/qGwI8rev643BvH8frjXjA/UMXKAfjLIqE2XM7Yk6jZ5wLyxb7g1c0u1Gox7NveVP+gLXh8VbSYN9JSTOllBTgS4gCLAUMQGzeyHV53vAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 14:39:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:39:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/5] drm/xe: move memirq out of vf
Thread-Topic: [PATCH 1/5] drm/xe: move memirq out of vf
Thread-Index: AQHa9JR5APh7sju6x0+ARFp394sQT7IzVNvg
Date: Thu, 22 Aug 2024 14:39:16 +0000
Message-ID: <CH0PR11MB5444B23881AE737A1F4638EDE58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
 <20240822130815.1355437-2-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-2-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6442:EE_
x-ms-office365-filtering-correlation-id: 345e0b82-6945-48ae-fea6-08dcc2b83326
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?i+GPsXaqZCa4vFEaPAbWViYICwO6YzNyEm2H2zApDE5+BTqRLxYrKZ3ntAmt?=
 =?us-ascii?Q?/Vlufrqi8yA4K5pN2RM9rHbCsyyY7BKghtkluCYzKiSU7wTPCXTu6c8lAD5Z?=
 =?us-ascii?Q?QehXpBe64r/romfOB16doQU7hi7fGtfyK5YV/wNfR5uk4qFX1zHJPoesXNuH?=
 =?us-ascii?Q?ut/B0AcEABB8sznKdKh6ZvG6nFOTvicHNU8la/dXKKnQLWNNCCYexfy7886P?=
 =?us-ascii?Q?hwbVfPTJYcl4Yt31rSP/rvy2P7idHWs75Ow/D/vdzZT1+EPa/cvWKzsrcPEW?=
 =?us-ascii?Q?bfxt8SSdBqZjH4zHfb2+KwSqfC0ayfmhE+w0gDDfxGr87VslwQLnX5VO6Wz5?=
 =?us-ascii?Q?bck3sy4OV8J1W/HSG6N4VWk+O67f/Fi0FBECvpJ6ZI1nXhHVzQeZAgED1osn?=
 =?us-ascii?Q?FpvJeEtc8Mhrlr+rKiiCGT4HF488mfzOwXr6bGOmNELquJw+o7zWt1Jh7LoK?=
 =?us-ascii?Q?UGVFcpnvkDqtLGDdxdcTiya2KpwXWU2rSZ+2wi2g+Ss2h+zgbgEVjiGlWxlr?=
 =?us-ascii?Q?njUcynHkQBsRXJGY9Z+e7VtxQbIUhxpOO/Ed4ijG4S5Od8l1e/NaJi/pzpSR?=
 =?us-ascii?Q?IdgUVyvTRl9tttklnnNJQiyizYvd7ZKhcmtZPWbBz5WXJQGrsRbj6pyCZ05a?=
 =?us-ascii?Q?DKvzoTtnd9FNgMkLsF6nl5Orh8co7VUI0KylgMcaWI2PK/lBCuWIh10ju2cs?=
 =?us-ascii?Q?YzcvEbOI/QKrfWlgqgr9hUVZm6c1VHOOiu8VaYZRjR2a7W7u/UZP+L0SAeyN?=
 =?us-ascii?Q?oehkmty+3+ttQrhhC3suYsnI3iROXZ2vvc26sTdB/clsfl3AKVjjeVcgnNl2?=
 =?us-ascii?Q?sP08CoK0bQelzgpKTmHdA53u3lQn/2zHSvGiUgGvAUj08RI1IPv24qq0kWyV?=
 =?us-ascii?Q?lgQYAXiKSQp3dWvywYGwVVa7EhfxHhaMVXTw+jV/GooZr6Td/RFJqTG3dG03?=
 =?us-ascii?Q?Zr1jtezxZA9ck3vs3+tKFn7+yWJTxkUIzHWBAjm0YrxcYpdj9FYSZmL5ab6T?=
 =?us-ascii?Q?6GNHWbCpe+JAiyGAPYkt1yvHwJvTK/vakuJ5V+it9KAR39AhqRnUZ04llgGs?=
 =?us-ascii?Q?tmb31BKe0Hx+n4SEeCB1Qr0nA+dydL8j0OFXlC9snvJHpSDfxOVKG3JJya3t?=
 =?us-ascii?Q?pVdtz2OrGu2bvXtVZy5vRr8XJnYTpRr1Ho+uplnkzYc/iZuu8uv2daDhtjDY?=
 =?us-ascii?Q?xcF+LPmYcfgjml2i/1GHT+Ed8BozqbqLf9VN9mnU3Wc+mgFMBb0B106UY5z8?=
 =?us-ascii?Q?NHlc4Amd37F+aRPdnlGbiXUu5Bo/FkO9AnuB6jZna8biSt4mYjdGDQJXO+hS?=
 =?us-ascii?Q?yXQTD2pveu6SaU981EyGsfW/JuoXkcqxpUOl83MbaA8i/1QDFHpaAXN12DbO?=
 =?us-ascii?Q?bvZmp61a0SVPGEKpp7K0muTMVzi+Qe8SH83WzJGDXoKCLVDMJg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n15C9BOwV56cc/agrQuq9wEqUGs1HGJIEWBj4VzotU9q6zYrK0ifgrOau1lH?=
 =?us-ascii?Q?NqmIGPqJ1fYk6Ijo+r+rNvRA4PjWc/F73ZMfXr0flOKW14f2AK0jV6hLs1LU?=
 =?us-ascii?Q?FjINVB7qaEWsEYPgRKENPQSQJI5syWttG09dNU+6FnmzdtMMuAs8Qah5BUcj?=
 =?us-ascii?Q?KlogmGtA5VKHF6ba1niN+xlW0BoH/FIbsR3/4jgbQHN5ViDME2WIYK44v126?=
 =?us-ascii?Q?jd8apj8jz0b9eKFe+HFGPmYQt7yqnBvv5TP05pg71FOPU59c3uMblRpRs9/N?=
 =?us-ascii?Q?hiam4KNYKoL72p8z+hVCD01/bVyFr09FWsobJkviamqYPCNfghpfd5VfSs50?=
 =?us-ascii?Q?wKwU+RxDSgpZzLkEF0t5bv6yShWCgXXxqFQHBseZlv+JnOMyWmNK3zQqvfDS?=
 =?us-ascii?Q?APCJRUC+8vb33bYXyYN/kR5YyupNoFkhvpZRNOU1afA6mvLogNgICwE0+y0H?=
 =?us-ascii?Q?jAWNdPQszYm6mfIcJOiswPgD0DEttQx+mk6wJ0UVi0MqRw2zNs+6DCRBPT+Y?=
 =?us-ascii?Q?R955OomKIoUoSMVJ7YJv9lteD2ciJ1zkUtBlPOesYvpC8Pr54D12KgqO5WlP?=
 =?us-ascii?Q?3KVoIUF7l8/Bxherh/0h5us1gPErpagV4SDdKyHbuU16OyjvZmW2+Qhxqctt?=
 =?us-ascii?Q?mMK/ljXjCQ+p6MRcEKklCQ86l9TdgNDpqYmhKw9xSykGF+0K9rmyKUtd10pi?=
 =?us-ascii?Q?x9ClUdnZCWRs16xYQI/BEZYdRSRU0wIMKn2kXfzIAIsK4AjcxFNsqO0eOSjc?=
 =?us-ascii?Q?gj3WN5n+QqE8P3kaeJxRs+DzzUYsabO5grJ7OEAwu2j/RuAM3oZNu9KCz88X?=
 =?us-ascii?Q?5S5DPfTsCFIsGMlgiItigLkXbT8ik0WQ56VHiYpgkEgZK5U10svUeLu9ILOH?=
 =?us-ascii?Q?+ltRLcBN7oRFPWm8Nh/YDIm+YMNca8vi6grUiYVIR3dXhUI46XLDqXOruOMN?=
 =?us-ascii?Q?xE2+8VrOJdr/3iT23IM//7z4gCgTpwVOEDzL9UeL0eqh7/hXAp91dk+CotIf?=
 =?us-ascii?Q?XU5KczI5T0S2g5pG+uURY8S+yO5uPNVx4uTcUfpffphjeFr3BbVSPzP0yHnv?=
 =?us-ascii?Q?i6RGWCRxqKdIASGFW1CYtcPN/Pb/vKMjUrJyisepRCV2Dsnql/hbmE7/IwGD?=
 =?us-ascii?Q?qbaJ8HV0fCgz/5t9ELaFWo/747vDMO7lPzg2RquL2UOuCBta3f2gC7BIEkrd?=
 =?us-ascii?Q?05OUZ1SEJ5qRtNhnv5G3q5+351ccIMZ4bnqIn1Q0x2LIVQCTl3v2ORctMJwS?=
 =?us-ascii?Q?yPKnbGDJz+5p+MVAHnTGcCSgUkuWXnv445ow9YQ/H45JyGuNrCZPVmYtVITy?=
 =?us-ascii?Q?kKoAHle7v/w5Z9XBzTNJprsSJOr/VmUyvbB5/n0pQWUFWymCU7RryQ2g+S9u?=
 =?us-ascii?Q?v4uYgpbSRzi3FWG0UYRrViP34B6bIVJMxtpI/WQ7hdPDKjZaU5wFDtPw8eld?=
 =?us-ascii?Q?v0IAIya8Co1lOrgKZmyMnzir5+VrfcbkN+G1MYvnjiXx6YpcOkjFPdzrxJBu?=
 =?us-ascii?Q?LJzr6KU0VGwBdUpLbEKJKhQw41R1JZS7CQgLwdJUYIFF7zZN62L/IbrgpGiY?=
 =?us-ascii?Q?DqeTZi2bgd6jsB5+4DuMDAFpaDbDrhVoLRR7bg92?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345e0b82-6945-48ae-fea6-08dcc2b83326
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 14:39:16.7323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KO1EIbOqMOxFqLx9i4SEqLelQkhMOLEiR53pfMKJV5vOoFLYOf1PniDSfILh4BEk1j2iJbm3CwclgoQh6aE85hfm/iVoOIz2dZMVBXDFyhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 6:08 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@i=
ntel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=
; Elbaz, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.c=
om>
Subject: [PATCH 1/5] drm/xe: move memirq out of vf
>=20
> Up until now only VF used Memory Based Interrupts (memirq).
> Moving it out of VF to cater for other usages.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++--
>  drivers/gpu/drm/xe/xe_guc.c          |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c          |  6 ++--
>  drivers/gpu/drm/xe/xe_lrc.c          |  2 +-
>  drivers/gpu/drm/xe/xe_memirq.c       | 46 ++++++++++------------------
>  6 files changed, 26 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index b6db7e082d88..623e4a977ba3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
>  		if (IS_SRIOV_VF(xe)) {
> -			err =3D xe_memirq_init(&tile->sriov.vf.memirq);
> +			err =3D xe_memirq_init(&tile->memirq);
>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 5ed6f5434f42..59e2c8a0af10 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -200,14 +200,14 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.memirq: Memory Based Interrupts. */
> -			struct xe_memirq memirq;
> -
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct drm_mm_node ggtt_balloon[2];
>  		} vf;
>  	} sriov;
> =20
> +	/** @memirq: Memory Based Interrupts. */
> +	struct xe_memirq memirq;
> +
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index de0fe9e65746..513d61c48732 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -863,7 +863,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		struct xe_gt *gt =3D guc_to_gt(guc);
>  		struct xe_tile *tile =3D gt_to_tile(gt);
> =20
> -		err =3D xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> +		err =3D xe_memirq_init_guc(&tile->memirq, guc);
>  		if (err)
>  			return err;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5f2c368c35ad..18a5272d9bb0 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -566,7 +566,7 @@ static void vf_irq_reset(struct xe_device *xe)
> =20
>  	for_each_tile(tile, xe, id) {
>  		if (xe_device_has_memirq(xe))
> -			xe_memirq_reset(&tile->sriov.vf.memirq);
> +			xe_memirq_reset(&tile->memirq);
>  		else
>  			gt_irq_reset(tile);
>  	}
> @@ -609,7 +609,7 @@ static void vf_irq_postinstall(struct xe_device *xe)
> =20
>  	for_each_tile(tile, xe, id)
>  		if (xe_device_has_memirq(xe))
> -			xe_memirq_postinstall(&tile->sriov.vf.memirq);
> +			xe_memirq_postinstall(&tile->memirq);
> =20
>  	if (GRAPHICS_VERx100(xe) < 1210)
>  		xelp_intr_enable(xe, true);
> @@ -652,7 +652,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *=
arg)
>  	spin_unlock(&xe->irq.lock);
> =20
>  	for_each_tile(tile, xe, id)
> -		xe_memirq_handler(&tile->sriov.vf.memirq);
> +		xe_memirq_handler(&tile->memirq);
> =20
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..e70857325429 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -599,7 +599,7 @@ static void set_context_control(u32 *regs, struct xe_=
hw_engine *hwe)
> =20
>  static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  {
> -	struct xe_memirq *memirq =3D &gt_to_tile(hwe->gt)->sriov.vf.memirq;
> +	struct xe_memirq *memirq =3D &gt_to_tile(hwe->gt)->memirq;
>  	struct xe_device *xe =3D gt_to_xe(hwe->gt);
> =20
>  	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 95b6e9d7b7db..0db0726b76f3 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -19,15 +19,13 @@
>  #include "xe_hw_engine.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> -#include "xe_sriov.h"
> -#include "xe_sriov_printk.h"
> =20
>  #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), co=
ndition)
> -#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "=
MEMIRQ: " msg)
> +#define memirq_debug(m, msg...)		drm_dbg(&memirq_to_xe(m)->drm, "MEMIRQ:=
 " msg)
> =20
>  static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
>  {
> -	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
> +	return container_of(memirq, struct xe_tile, memirq);
>  }
> =20
>  static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
> @@ -157,8 +155,8 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
> =20
>  out:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	drm_err(&memirq_to_xe(memirq)->drm,
> +		"Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
>  	return err;
>  }
> =20
> @@ -178,9 +176,7 @@ static void memirq_set_enable(struct xe_memirq *memir=
q, bool enable)
>   *
>   * These allocations are managed and will be implicitly released on unlo=
ad.
>   *
> - * Note: This function shall be called only by the VF driver.
> - *
> - * If this function fails then VF driver won't be able to operate correc=
tly.
> + * If this function fails then the driver won't be able to operate corre=
ctly.
>   * If `Memory Based Interrupts`_ are not used this function will return =
0.
>   *
>   * Return: 0 on success or a negative error code on failure.
> @@ -190,8 +186,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  	struct xe_device *xe =3D memirq_to_xe(memirq);
>  	int err;
> =20
> -	memirq_assert(memirq, IS_SRIOV_VF(xe));

I'm not entirely sure why we're removing so many SRIOV VF checks
from the code as a part of this change.  Though I guess most or all
places we check this also check for the existence of the memirq
itself, which isn't initialized when SRIOV VF is disabled.  So perhaps
the two checks (SRIOV VF and memirq existence) are logically
equivalent?

This is mostly a rhetorical question.  I'm not blocking on this.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> -
>  	if (!xe_device_has_memirq(xe))
>  		return 0;
> =20
> @@ -209,14 +203,13 @@ int xe_memirq_init(struct xe_memirq *memirq)
>   * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Rep=
ort Page`_.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are=
 used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Source Report Page`_.
>   */
>  u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> @@ -227,14 +220,13 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
>   * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Rep=
ort Page`_.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are=
 used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Status Report Page`_.
>   */
>  u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> @@ -245,14 +237,13 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
>   * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask=
.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are=
 used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the Interrupt Enable Mask.
>   */
>  u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> @@ -267,7 +258,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
>   * Register `Interrupt Source Report Page`_ and `Interrupt Status Report=
 Page`_
>   * to be used by the GuC when `Memory Based Interrupts`_ are required.
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are=
 used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: 0 on success or a negative error code on failure.
> @@ -279,7 +270,6 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, stru=
ct xe_guc *guc)
>  	u32 source, status;
>  	int err;
> =20
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> @@ -299,9 +289,9 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, stru=
ct xe_guc *guc)
>  	return 0;
> =20
>  failed:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to setup report pages in %s (%pe)\n",
> -		     guc_name(guc), ERR_PTR(err));
> +	drm_err(&memirq_to_xe(memirq)->drm,
> +		"Failed to setup report pages in %s (%pe)\n",
> +		guc_name(guc), ERR_PTR(err));
>  	return err;
>  }
> =20
> @@ -311,12 +301,11 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, st=
ruct xe_guc *guc)
>   *
>   * This is part of the driver IRQ setup flow.
>   *
> - * This function shall only be used by the VF driver on platforms that u=
se
> + * This function shall only be used on platforms that use
>   * `Memory Based Interrupts`_.
>   */
>  void xe_memirq_reset(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> =20
>  	if (memirq->bo)
> @@ -329,12 +318,11 @@ void xe_memirq_reset(struct xe_memirq *memirq)
>   *
>   * This is part of the driver IRQ setup flow.
>   *
> - * This function shall only be used by the VF driver on platforms that u=
se
> + * This function shall only be used on platforms that use
>   * `Memory Based Interrupts`_.
>   */
>  void xe_memirq_postinstall(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> =20
>  	if (memirq->bo)
> @@ -349,9 +337,9 @@ static bool memirq_received(struct xe_memirq *memirq,=
 struct iosys_map *vector,
>  	value =3D iosys_map_rd(vector, offset, u8);
>  	if (value) {
>  		if (value !=3D 0xff)
> -			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
> -						 "Unexpected memirq value %#x from %s at %u\n",
> -						 value, name, offset);
> +			drm_err_ratelimited(&memirq_to_xe(memirq)->drm,
> +					    "Unexpected memirq value %#x from %s at %u\n",
> +					    value, name, offset);
>  		iosys_map_wr(vector, offset, u8, 0x00);
>  	}
> =20
> --=20
> 2.43.2
>=20
>=20
