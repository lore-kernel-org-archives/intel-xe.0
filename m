Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52878D20690
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 13:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79110E961;
	Thu,  4 Dec 2025 13:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0+2phHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83AC10E961
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764854925; x=1796390925;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7hCvgS09fRByrfDefd5yw4uyZ4tuYHYMyhlfReiBiM=;
 b=c0+2phHEqV4+injSQ7UQcB7YPUKK7MPuhjRzYkWVQvgrz4dg3QFByeqC
 nN/N9CInku/LcITu3R/mE/wf5601sJdAZRvJb55/qGEVDVJIaF+p+V/zG
 lxKe2sIKTeSoijYygq3Q/xliuTBqBFIG1mqidaci0pN0ZjwTWgtiYKv4e
 67XPaHLOm7IAsWxR/58MrF4YXHz9PiM59I7KbGX+xVrBFSCqdEJGpGkVv
 bNYSGXS03KMZAQmR+Nku7TPMrfbiePgyefhvOUFBVZDEEpNr9Natg6CQQ
 Lb3WfgY9JaW3vBOzazOPlBmqRc5u0F0wKqosc5USB8K8/FRpQojN592yk w==;
X-CSE-ConnectionGUID: 1usdSqU+RAWhywZuL4UKpA==
X-CSE-MsgGUID: +Xn+pSi8Q/q09jI6Y5EdEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66948384"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66948384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:28:45 -0800
X-CSE-ConnectionGUID: dR/3HvuhQLO/BMNGgswu5w==
X-CSE-MsgGUID: drw8qBjCSIC95yqE4jk5zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="225947272"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:28:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:28:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 05:28:45 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f18sy84sQRw8kFGZsIe38yVej3puJKT1rjbk62CxvYwR2l++Tyd3cUIYRETOnnmvvSX0QNm4LGSmvbdAQ+iAU/dmgyI0FgrY7l0xFTaK4lIcKMCIA+SrrxYpIzVYnIR3tRz3jzh05Boeu4FWoH8f5blEwGgBmmxK0lY/zRPFPJmpgloW1Oj1y+czn+FbR7O4S/Qw5GcNDEi79/4Zk4YRsdPWYU6llOiKuhvmeBDRpCVagdM6qqmZ+qKirVnrSife5jaJLyVsEOByOiPrZLfTP8UMujFDn1olpXsxMWSarUAiL3+a7G64xw0wFQsAm4whiwP2a+CKOGsuk+FJLJQoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhmemLmTp/0zkib4UvjFPJ0oDhxFAZFXnnBjEontowo=;
 b=eFmC8jmqvc3ZBZuqEyJ5JVPxDQ3bQC/+HAIl5FwU7Ox67+A6mXysrGmEI7HvxM8Q19C/eTtnhmOtfkWw2Bfwfpb+nXFoDlof/JqgJJ6oVpP0lOGUdIutmoGsbcm7DU4BGOcngwK+ZilIrfAKCAT0mDu8Yb/ptnSlLLTa+/pnqzZWHTlfQaASefrovQMKfIL1ynqeb9duAHTrop8TM/ekVz9BrmaL1Hiwcz9DLhE9+6UlnGVgACByg3L3MaLL+JLTREYvd2wZPko8AtaQrmiIPpGBhs6qggQrqKyML+VKAaSNl6b3YausyrRzkz8KfiNCDAzGcZkpy6mTPxXgC0dWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 13:28:42 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 13:28:42 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v4.1 2/2] drm/xe/lnl: Drop pre-production workaround
 support
Thread-Topic: [PATCH v4.1 2/2] drm/xe/lnl: Drop pre-production workaround
 support
Thread-Index: AQHcY7uJWii0cJIEkki1S5qpn+userURfBWA
Date: Thu, 4 Dec 2025 13:28:42 +0000
Message-ID: <IA1PR11MB6266376483D59DABD4A16C9AE2A6A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20251202184256.1718298-3-matthew.d.roper@intel.com>
 <20251202184256.1718298-4-matthew.d.roper@intel.com>
In-Reply-To: <20251202184256.1718298-4-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|BN9PR11MB5225:EE_
x-ms-office365-filtering-correlation-id: 9563b0e7-8dfd-46ad-9946-08de33390ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X+lLJCZ7MCUcR7eWmvZz0Hcz2BClM+XQo/VSL+vholmSF40qlWMSMPfqUuwN?=
 =?us-ascii?Q?2idWTkY3C3Z8wPVFvg2QZCsuj8GTUHL03my/HOJg4bhb47Gfb9HvE1u3tUNI?=
 =?us-ascii?Q?QKqctbiiIX1qf1OOhijBJD8e2kLo9tkm2TfiFUP5xBLwAq+t+pOxRuNpCOlY?=
 =?us-ascii?Q?ubQhzgh8o5a6YRw419hlAAUnfoSRGgJASDPeDfpAdgwQdbl9ESTz2R32u190?=
 =?us-ascii?Q?h9mz0q7SEBMp6u+RkmX1VVWBrfInrDcLBw5VTw2DvyMaLHMtBTZI+hXcy84P?=
 =?us-ascii?Q?WE5LJ5ahp9oIkEIK9Ft+qSHepu5o6HcXVtwiMOPa+nH7aq6gxS9SXJCLaXZU?=
 =?us-ascii?Q?rLhHBJhJpVW0Kp+Apv8K7JHBiRzZg3bIUMZT2JJpdZoMq9Hr2epR26mJFIFy?=
 =?us-ascii?Q?sLUycEAaw0RDTmY3VilVz9wA5fToaYrAaznZhTAnyL1YXAXevQ6rXD9ynji8?=
 =?us-ascii?Q?2/SGsXYY1Eq8xyO04CJLwJ/RiwxHIRhLyJUtwm7sUYRWaS9DB6HFAqy+Dc+d?=
 =?us-ascii?Q?Tn02nZ6cfDWLyX9LbJ56vBjJB9hPX2vIuTHlcY9oGWBm262RZ8ht7Abvt3La?=
 =?us-ascii?Q?NTXTXNQSlHsvI/9pFtKu297dtky8IaGol54ayu47r5QlajhlnDfRQfUyHTw9?=
 =?us-ascii?Q?tiP3B5duYnpag8W38+279dVWmCYsS4ctFKDmJSARORxsAVnnTMVc0bwwgDZN?=
 =?us-ascii?Q?6kGotmFYVfxbOYknKtzugPh1ZPm2RiYObQYY0TKiwZswz/cft1Rh9TXl6HkG?=
 =?us-ascii?Q?sQTtCpi/4nuh5SMWJyuiAqMCjis+8ejx4nzlO/EdKrtubqmcG4Y6p4s1m9lm?=
 =?us-ascii?Q?q/DFFIGQpS7borQvF0cRHpd6rOFNssX66PBNOSZHzdMFu2wp08kvobCD/Nog?=
 =?us-ascii?Q?ZEEmjTrx00kvG37xYj+68MCRCZ1UCEt2LMkq7ZspJcbPKpm02871XIGKgJXJ?=
 =?us-ascii?Q?HLxgnntRpjxTPKKXy78CjK+1aoP68qQl4ro2ljPMulXE8G1nhu8gZQbQGZe4?=
 =?us-ascii?Q?cw4/S9Mu/aSnw5dH51rXQf1ShNzaz+Kb5prq9QBO8MBSU4LK7mJ03aMs8XhO?=
 =?us-ascii?Q?IoSyyt66n/4nj0o7Ya9vFkqQ6RqduQ4sg1fYidjNXYhR6AqenPZf1o1hWNZL?=
 =?us-ascii?Q?oqz0OAroZl3fPhzm7iCyH2vo6Gz2ZTmWbghVZ4ap6PFi+gZ6cH+qUiBf8LcF?=
 =?us-ascii?Q?aMgtHKz4YKloD3JSp/c1fF7NnQ2mcpNPE3vGJ6uyeshe/nVzz1Yl9Ig6W44r?=
 =?us-ascii?Q?SIMLOkRwwBPj1rUB2ANuo8WiMv5FYqFqROu0rstaQR9r4TtjmUcSHniKEqo0?=
 =?us-ascii?Q?8wV7BAEdN1FFLztnqbKZMFBPzf2s2cgAXOdiJxhGVRkiqyXwnWqKI1XAKxx9?=
 =?us-ascii?Q?Fqb6tKBN+VQfynHlZRdJEDbB2T2bGwltDaJvp21OygrLELUngNIJmIDPnOpm?=
 =?us-ascii?Q?msydxgNFflPPST7wL6prsn4ehCtMi10vL0kAGLrJgbjycB13S2bWZ260y6EV?=
 =?us-ascii?Q?D997ijFimNLnv1AFcdGNCPW7miGjRL53688t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tN9CG1RAU3TZwv6Ue7pXc+1kTWUr981xswvtDOrYwtEtLiuu28E1nJ9WJRTz?=
 =?us-ascii?Q?nKC2hk7XxqVuegJUHzWHy/SiPalMbUMh78Ped7tQFb9o4sfDzuM+O0GRsy6/?=
 =?us-ascii?Q?HeQ3p4Oasy4qjCfH49OeEgrGMvG6uFJIZ1Cil8V259m7ESAaJcP4RdT3Nj3k?=
 =?us-ascii?Q?UorUePl6MQPQvycHTMfgHEYLPVFbGCTlK6pTjenfqeeJN5TWhr/OM/45GEmk?=
 =?us-ascii?Q?u2lYBV7Am26ltAqXDq6a2qKwAc0dj46XULk00hgVQE1pu3+CBCoQ6xeIHZLu?=
 =?us-ascii?Q?2HjdqDRVjxdimW8SCXiIduiKZOR+AXAwu+ULl0guiSxSB4pUZC4uMa486uH6?=
 =?us-ascii?Q?voTHszHk7OWayBv+f0vP1FHnIB1x9ID2uy10d5Qih5oJBFqB4EGJK/kbXDIM?=
 =?us-ascii?Q?5DkNi76eBnsVq0CfLe4uk+qJFkBLiwBEPHC33vAhWyBFvENhR82e7TCkXrcA?=
 =?us-ascii?Q?gLtjvsqpKu80xw4XCUrjXpal3UjbzM1YC+kVs6g9ThGM/MjXvsAtdizXtikj?=
 =?us-ascii?Q?afu7dDPtY+hw489Ryu5YF00S7e1H5RTLekYwf68u3kikocU/6G1oZd/akxYH?=
 =?us-ascii?Q?4g2+MKIHn9hhGhBYlV/W4DSqPvFdPdzGwo4B7/UdgtuB8kL4+AJOXRc2UmNZ?=
 =?us-ascii?Q?7eDY0dAcgwlV4ISbXUz8ZhZ9hyReFXWkFKLjAMwg+fotjB22Nr49+r7TyWjO?=
 =?us-ascii?Q?ZoLcM7cbi/GHLlxifT5qDDPtow6xgRLKDgICBTkIOnsoYOzKbdL+X4nFqIOz?=
 =?us-ascii?Q?Xa4hn1lAW6mFyfd5o26yegdvSh+w21i3uVe1czs7vMFzT0P8xPZvYRtpJxlh?=
 =?us-ascii?Q?tJeV/tuG4YaFcjLLH3dP4V6pKKwr6rcfylTuLNFRbEdVk+MrPaM4q17ztnwx?=
 =?us-ascii?Q?+eimNaP6B59QieFv9G9HxQuJ506gTio+saCqGQ4mxzz8ofcnQZSfUDPj/Nk6?=
 =?us-ascii?Q?yMQ2UPuGF1jbN2oZJrxy+aXAJaZL5vNmdAj1u8oShMQ0UshwgrnZ3ZnMeqlR?=
 =?us-ascii?Q?HuuGon5OHWvYf7Vxr3Ap9trE/FhEvLCmKsu/OxBC8SgFPnkcoz7QZvjkqnNU?=
 =?us-ascii?Q?mTHBWmW5BrPmVxHQwgN/hKv3PI81jqW/sosBHjzBRPAGKqb9Y7qrqwk4lm30?=
 =?us-ascii?Q?cfi/zKx9iCcIfXkbG4L6ptoVlX2SCg8KjDgctOnPB2EF2YrzgVIp+Pz97V1E?=
 =?us-ascii?Q?3CSAFbard89VufkNFrW58PmBze/ucXGGDijPUmeFspF0sP0oJKawF7l7Ipgx?=
 =?us-ascii?Q?ERju4V0l7J/Xtb+rV9u1XyBt31qLNu8ZlYXXKvawz3rrGfrEabA282SaLH3n?=
 =?us-ascii?Q?bkzksr6fIssTvHRAgXwMIKERoFKVkWiTccm1z3/x/5yTnAUMjSbdakMF4rYt?=
 =?us-ascii?Q?LZjGN/3n+XAksVHeB9OzKmtvhJzjil1R1P856Y0rFIQnX/H9WlUUjpp1CzPV?=
 =?us-ascii?Q?CtyEWwYPTmZaRhUWujvW7mz4Ohj+i3mpK2rYWK0BRPKtz5dzxmPHb/kajrCe?=
 =?us-ascii?Q?NqymVHNjveZj4O1j/2oeGlTkGF5DvVyAZmlf7Kdp2WRelEtva7AiD1Tifwzz?=
 =?us-ascii?Q?VF9BoHCXyM8P4cfDY8SvgV5A/5rx7NK1y8vYTkjeNg5oESp/B6ruqJmjAuAv?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563b0e7-8dfd-46ad-9946-08de33390ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 13:28:42.1934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYx8aEpHnQUkOicZrRX2cFRGCxC3yQKnMHeKY80fNGFLdiZ+xdW1GUMlWo8+dv/BZ73ZH6nqpnibsvofDnj2JCrcUCF6tYEe09exe5fbKH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Wednesday, December 3, 2025 12:13 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v4.1 2/2] drm/xe/lnl: Drop pre-production workaround
> support
>=20
> LNL has been out long enough that all of our internal usage of pre-produc=
tion
> hardware has been phased out and we no longer need to maintain
> workarounds that were exclusive to pre-production parts.
>=20
> Production LNL hardware always has B0 or later steppings for both graphic=
s
> and media IP.  Eliminate all workarounds that were exclusive to A-step
> hardware and set the 'has_prod_wa_only' device flag for LNL to make sure =
we
> warn and taint if someone tries to load the driver on an old pre-producti=
on
> part.
>=20
> Bspec: 70821
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Dnyaneshwar
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>  drivers/gpu/drm/xe/xe_pci.c        |  1 -
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 14 ----------
>  drivers/gpu/drm/xe/xe_wa.c         | 45 ------------------------------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  6 +---
>  5 files changed, 2 insertions(+), 66 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index bcb85a1bf26d..e06c6aa335bf
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -317,7 +317,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	offset =3D guc_ads_waklv_offset(ads);
>  	remain =3D guc_ads_waklv_size(ads);
>=20
> -	if (XE_GT_WA(gt, 14019882105) || XE_GT_WA(gt, 16021333562))
> +	if (XE_GT_WA(gt, 16021333562))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>=20
> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
>  	if (XE_GT_WA(gt, 18024947630))
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> b37b7e26bd2d..1e7489860e25 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -346,7 +346,6 @@ static const struct xe_device_desc lnl_desc =3D {
>  	.dma_mask_size =3D 46,
>  	.has_display =3D true,
>  	.has_flat_ccs =3D 1,
> -	.has_pre_prod_wa =3D 1,
>  	.has_pxp =3D true,
>  	.has_mem_copy_instr =3D true,
>  	.max_gt_per_tile =3D 2,
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ac0c6dcffe15..2c0ce6b5f9cd 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -201,18 +201,6 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
>  	return emit_pipe_control(dw, i,
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);  }
>=20
> -static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32
> *dw, int i) -{
> -	if (hwe->class !=3D XE_ENGINE_CLASS_RENDER)
> -		return i;
> -
> -	if (XE_GT_WA(hwe->gt, 16020292621))
> -		i =3D emit_pipe_control(dw, i, 0,
> PIPE_CONTROL_LRI_POST_SYNC,
> -				      RING_NOPID(hwe->mmio_base).addr, 0);
> -
> -	return i;
> -}
> -
>  static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 =
*dw,
>  			      int i)
>  {
> @@ -395,8 +383,6 @@ static void __emit_job_gen12_render_compute(struct
> xe_sched_job *job,
>=20
>  	i =3D emit_user_interrupt(dw, i);
>=20
> -	i =3D emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
> -
>  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
>=20
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> d606b058d588..aff7b08395ca 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -217,20 +217,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
>  	},
>=20
> -	/* Xe2_LPG */
> -
> -	{ XE_RTP_NAME("16020975621"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE,
> SBEUNIT_CLKGATE_DIS))
> -	},
> -	{ XE_RTP_NAME("14018157293"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(SET(XEHPC_L3CLOS_MASK(0), ~0),
> -			 SET(XEHPC_L3CLOS_MASK(1), ~0),
> -			 SET(XEHPC_L3CLOS_MASK(2), ~0),
> -			 SET(XEHPC_L3CLOS_MASK(3), ~0))
> -	},
> -
>  	/* Xe2_LPM */
>=20
>  	{ XE_RTP_NAME("14017421178"),
> @@ -509,11 +495,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
> -	{ XE_RTP_NAME("14018957109"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5,
> DISABLE_SAMPLE_G_PERFORMANCE))
> -	},
>  	{ XE_RTP_NAME("14020338487"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3,
> XE2_EUPEND_CHK_FLUSH_DIS)) @@ -523,11 +504,6 @@ static const struct
> xe_rtp_entry_sr engine_was[] =3D {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> -	{ XE_RTP_NAME("14019322943"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
> TGM_WRITE_EOM_FORCE))
> -	},
>  	{ XE_RTP_NAME("14018471104"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> @@ -804,17 +780,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>=20
>  	/* Xe2_LPG */
>=20
> -	{ XE_RTP_NAME("16020518922"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(FF_MODE,
> -			     DIS_TE_AUTOSTRIP |
> -			     DIS_MESH_PARTIAL_AUTOSTRIP |
> -			     DIS_MESH_AUTOSTRIP),
> -			 SET(VFLSKPD,
> -			     DIS_PARTIAL_AUTOSTRIP |
> -			     DIS_AUTOSTRIP))
> -	},
>  	{ XE_RTP_NAME("14019386621"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD,
> XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> @@ -823,20 +788,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>  	},
> -	{ XE_RTP_NAME("14020013138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> HIZ_PLANE_COMPRESSION_DIS))
> -	},
>  	{ XE_RTP_NAME("14019988906"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>  	},
> -	{ XE_RTP_NAME("16020183090"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE),
> ENABLE_SEMAPHORE_POLL_BIT))
> -	},
>  	{ XE_RTP_NAME("18033852989"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 7ca7258eb5d8..5cd7fa6d2a5c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -16,15 +16,11 @@
>  16017236439	PLATFORM(PVC)
>  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>  14015076503	MEDIA_VERSION(1300)
> -16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> -14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> -		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
> -		GRAPHICS_VERSION_RANGE(1270, 1274)
> +14018913170	GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
>  14018094691	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
> -14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>  18024947630	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  		MEDIA_VERSION(2000)
> --
> 2.51.1

