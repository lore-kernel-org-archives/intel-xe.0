Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E31BC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 12:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D910E93E;
	Thu, 30 Jan 2025 12:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mx6rrwL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30A10E93E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738238717; x=1769774717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xIQ9X1UQ/s+R1kRP8fOPely0n+3lQP0s5vKtViU7Xr8=;
 b=mx6rrwL/iqIipGVFV1K4k0GAtKM/o5VOEXpsZ8rD7aULWTh7lNMrVf0r
 CEIw0q+hR50udA3PLN3EWpY1oV/HpcirW01L+rKyA6tfE+QH6rUeTmXtu
 /kRJD+9k1FxqXq0ElFeSCst2Mfjuyj20OSEiTtrDTHTrPdMSIxnBdCN1a
 EDkcgD8JWvowYFldI8HkjO9E9GidkzHkIVady7C4+GT4/2Kf+21eLM4q7
 P+QTlS4ibDqQ1emb86dFjT+yHcQ83BF4dzB+8Jeem5MBuZxAZpoLCiNtD
 7rsGsKnaofMgoTSFYQ5ScgTB4CbdYgC38gIl8IgSE/vvSvSmAF8X2Zdog g==;
X-CSE-ConnectionGUID: eIKfpPn0SQ6syHCG9WcKQg==
X-CSE-MsgGUID: dpZYoRUeSoqvvyqd5YiDgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50161616"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="50161616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:05:16 -0800
X-CSE-ConnectionGUID: LTc/7OWcQF+4DwaTGsmy4Q==
X-CSE-MsgGUID: jlPUU9sGSX6YUJgCSP4wAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109213674"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 04:05:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 04:05:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 04:05:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 04:05:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uux4EcxAw/MBwmjrbngZ1P5TI2wraMfPEKQzhpV4Z1dmOMwQ64u9mTVP1p7Z+ErGlhLO8geEEaCWReBU1X5j/Fu0SFLo1jCA+iudFE727Lk2wLBiiDKTJlGv74JrKbcD12iGc0lzEjWDAi0jAj/7TCVa4PQGl2ad+c2UPNUllUCRiz9CO8AXsGKAuhJri4oQoMnsX45SZtaDf6VbDwfdNP3wsKdguHL81k2HqTQ9zWPa9/n5D5HHwca9p4pLpDztzLSaIGTobwPJP7kzPYVdq21zadFkPSFHUWqEzHNgD4V5RYy/2mpCF8rVyon3pgCMXns3I59VcJS73ioG1QyZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukwC8RRiYh29h6Q9rmsjCe5drKu6EtYuqBFM7ZBqsVk=;
 b=R2GhWRq01tANsAmPEigFdieZ/alpmEHOnV4HQ3KcrLl/ptzVTC2211zRP4QKeuTR/d0TdxkfolpHi0GZ2B5Zi/I03ZFZ/2gdMRY6jU6ZJNJyqDJUWKC+jvjiJaQHoerefO+iREZuRD0944Rh5z7owBOCW8MQT5TB5E2huwkvS4wtBHYz6sJdA07w/STQQHt/isa1DebolTaLvmV5LvtZNzBZnZp9rr+m7AbXuaTnh5UCwQxX3xq3ZxZft1MmlU+knqgRjqfhfHNcvhdlObR76dJfxA3dppMFrXqCi0lASMtGfjGANxNm4mnGoeNze8sw8g0Hl3uUOVqoEHXAzwLGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 12:04:32 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 12:04:32 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
Thread-Topic: [PATCH v4 1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
Thread-Index: AQHbctw0jb999VRIVEiUUD2QxT8OYbMvNcSQ
Date: Thu, 30 Jan 2025 12:04:32 +0000
Message-ID: <SJ1PR11MB6204EEB707B57175A962606581E92@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250130055939.282988-1-aradhya.bhatia@intel.com>
 <20250130055939.282988-2-aradhya.bhatia@intel.com>
In-Reply-To: <20250130055939.282988-2-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BN9PR11MB5244:EE_
x-ms-office365-filtering-correlation-id: 4302d0fa-c17c-4d4b-035c-08dd412641c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D2ZlxZDPyxTdgJjRHUX05l8eZOOcxuTq1LoZZKbOtdVBzQP4lxUmQwEW9bop?=
 =?us-ascii?Q?NYZpEHpevVKlDkZyA+Ztz302WhkuNOrx6cPJovM/epRl6Da4I2YvgraN4+7v?=
 =?us-ascii?Q?q0kmE2Aofa4VXOZ9TGXJ8m56sx5v338CF+upRppS9wtDnP4r2ocK24plRwFN?=
 =?us-ascii?Q?esItQAi2lxQ3925lIPwE/ZezPVb40P9/okVWOEa86zsmCc5IBRyaF9To6s5y?=
 =?us-ascii?Q?w3A4X/bs8Y5UN4teY89JAxXBkm7SGWZvBwNypq5z9nHq5ObVbqEA9NkDaGX6?=
 =?us-ascii?Q?TDVsXG3caOvtBcTxnvuxNhjo99/R8rSq5qDnpluigmYE1qMgKQTUXae4G8/I?=
 =?us-ascii?Q?M+jQzpKJ6v6Mhe6xJw5CHagRvcuTjivm3HoXCykNsxfjf/b84SSABTIKjJFP?=
 =?us-ascii?Q?Ia+Wx6AyXxvi+KlG9QGe/IGHY3Xbzbq28Xbt55p7dXLjeEAR21LsUBdeTf39?=
 =?us-ascii?Q?MMHjwkgf78dDJfowPfJSDxFELeVSfDm+WD+lxw+343s+60ZCtETpowsuACNe?=
 =?us-ascii?Q?PJThOJ5+GEyFVYXC3VNNChsWW1ekZmDJ46Tn291ISaAfkBUVDE+/B6SPEQpN?=
 =?us-ascii?Q?PituXJqZY+X3AkkpFrnypxoKmdR2kl17ljRh5AvP+Wn2BWGy2YBec+9nicEt?=
 =?us-ascii?Q?ULY2KUmSORck6oxvs+9icovnQuAPWGz/z60XzuNxEOns7LcQWNQ5OGxLtgM0?=
 =?us-ascii?Q?r1HTQLoA61QSI1/RGqUXktxj6dUg4rUVOYQlSV5fw5jQxoif0DwxcmVmtXES?=
 =?us-ascii?Q?r77kSvDAqLb+xPQ5bPJNx9dDQl8/VWnRdPBJXglBD44ExK7frdXVlWpg0D54?=
 =?us-ascii?Q?sfXhHBXg5e2XBBSUNYxXRg5/MyL6YmE0jC00wstOTEkMdZZv1m4KTaIkkTD6?=
 =?us-ascii?Q?5V9aC6SIQJDWCX1hoVqcOMVam4GcdiF5qugCBMF+Q0oYMViX3OgR4ihZI3rg?=
 =?us-ascii?Q?0O9o2fx9N3pDk03S/O0PClHuXng5LJM8gLNBs+TgobMBLuXf08iWk89+aDMV?=
 =?us-ascii?Q?F3Sd2bpZK49erX340r1SV5UyJmTOmqmg7HpEfak3O5Q4QV7Vlz6AMs+bgp2G?=
 =?us-ascii?Q?h8BjEB96+JblL2mFWNNYWXjG1jMsL2v8ZwDcYVsMUdfr1AjS5K5N3hE3aYKh?=
 =?us-ascii?Q?lyBA3ec4OKwlTx19vHyS1niTqN7QrzGub+FxcUh36xgbiDt/hVVf97kBGQmR?=
 =?us-ascii?Q?tWznmctCx4BMILpEqtPkzRiH8uXPG9qPoAnI826BNgUgMSmCPByF35P1ZpeG?=
 =?us-ascii?Q?AvnIN65eFRo65+HJxGGchzU9gxBNDYCZGb26H6R3JK2NpQeY114tIjN7vjx/?=
 =?us-ascii?Q?staN573QXvsYOVpC1AuachpEuPkBqGFsiNEYuVuW26TgktfCMQQ3UoZwLxhP?=
 =?us-ascii?Q?Tm3DXbxSU7MknlM0YzAmOKWGd5tAFNEfJilwBEVVUhBB+JuNjfkkvShMfa7m?=
 =?us-ascii?Q?BUT8VcyvhSFOWVgs/brBGBEbTnjmpjmm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?scsyTSo7VtvQEqdiS200B72bJbLab1Pc09V9VMtf41NZGW61DcXYLrl3CEDY?=
 =?us-ascii?Q?ASy8tOcIyuKWFZh1V4QBVE8DOQ9qC3oyiTw16CQFRf73nSumQ9f5gj3fMD0n?=
 =?us-ascii?Q?jfb9ofAMBvXT1DfMy5ZjF0ukpJ4daou34oBkkSEhTLXDMtkS5vhF0fV7gJax?=
 =?us-ascii?Q?V0GR1sHe1RcGNUFMc5X6aSkDL+Lurw5/z6aX2PJcMETYxCGgioR3AvvBSzf3?=
 =?us-ascii?Q?Q04S+6MGmU9XVc43VmJrexeKVaNulcG6csK0SCYwYR7V/seaEXUSp02wDZAz?=
 =?us-ascii?Q?cKDyLHND3YFlp+2d7lAljox/duiZtLG3+JryAAyvK+CwbyJHTeLN4vjK4l7K?=
 =?us-ascii?Q?iUV4w4VZsACXUkD0tM3Ej8BUjMleZz6SyEiHD9TP19cS8BeepXJ/a70z3U6/?=
 =?us-ascii?Q?InbvpDhUdyiAmIM+RoYdUSdDo0xccxsvciWE91Abj4jWVnRvjZaj3GDwT45i?=
 =?us-ascii?Q?2G+cYR00T3iqp1+UoHB6UesC9NZANKfQNRYCx8xqQbpuce3iPpxp0PiX8sxu?=
 =?us-ascii?Q?cVH6CapMXUuH8c1Fy9XSAKQZuPK5QSzAwVvwkIIfvbxOGGS/GPUIvMyk4HPf?=
 =?us-ascii?Q?eZTmAws8ivLSlmS3vdUIfnCV67szrrZClxiNnakI2gcqZSlv8tDG2A9RezCD?=
 =?us-ascii?Q?XOhv5Lj133S0V6z/p3ZI8diF5ElKTeGzhWuMghXdRnWPu1TePzcjtwovCpTE?=
 =?us-ascii?Q?3Nw761QjCGPbEECdL+XkDUAIjva+z2y7VgWjZLOw4BAn+GAJDEN6uu0c8D2p?=
 =?us-ascii?Q?Uped6IqQKJXsM7kI3544XMPhTtoaS92Z5vQ4zoaC4Xs2kBZBlfXjqF1JW8FG?=
 =?us-ascii?Q?w3eoX/GZbE9bH8fAhuq41JoeB+SWwIY0nERlWG4dWUi1PjTkcSHy6RRLpivZ?=
 =?us-ascii?Q?M8T1ZuN0R8fF0LWCKzswQfS0LO95/d5xaAZ+hQhiag08QYoVGrvZMbAmpFYE?=
 =?us-ascii?Q?aPDnmhV3SJNIADsEkISe60VVTXfC7ryClVnL64a67XarqzvNFrfrIt2Okyc5?=
 =?us-ascii?Q?89mhAN0pRN9gyLQGebJQgGb5AZS+3KYbJa5gKu5iy9rPQhzGQ5nrcUKFZOVT?=
 =?us-ascii?Q?0WSnyzI/Kkp5s+cqigML70wY4rEuICODaUJ0h3VdlHXzpQKnoZ3fE1iKP8Sx?=
 =?us-ascii?Q?pCmvGdd6pZzWWgD2fTumhqNlP/bFz1XUDVTJ1uDIK7q6YGmnpI6rIRhdvDsr?=
 =?us-ascii?Q?LHVk1sPRR8O4U2wdzdz50Z+UYePB2/3y9LewaLOzJ0MGnwbsLw0FKKVvhQ1f?=
 =?us-ascii?Q?eLmU3W7Iczl0wZc6tpNVgrmyq44l2BgHOKkhGtLHtb7Vz8L0x490D688Wm+Z?=
 =?us-ascii?Q?7lDPuDBjN/QyG/4hwYi9h1dZhQdrauoDGn8qYN0Wqrt/9U2Iqe5EnfM3n2fd?=
 =?us-ascii?Q?+g7WBHW9rPyKOtj/C5JTqww04LhoaFBIxu5KW1OggLYGIyHcO3QzO3vakXmE?=
 =?us-ascii?Q?JXDHRKpDYmLPX4c4mbhzaSbf7ge/DHWBh1TV2GC9850Gv7g/l7C0VoePDemR?=
 =?us-ascii?Q?BZ55JFqJt8qgQhI/yPGS5xDjl6N3C0ius+f+Ww8/Y1TMf8oXErdnv80mYawN?=
 =?us-ascii?Q?I7nriABM8dBbL/zTm77QDZY3Etg8JDKgYMMJmket?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4302d0fa-c17c-4d4b-035c-08dd412641c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 12:04:32.4082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyxLyEzygBb05xX5VbaBvHhkIoyQ0/ZPEFeTjl+FXlmHX/sOEXfFsPsQ+kIPODwIkXuUcJzZaojwI0lj8PkaMFF2IeTAEsNgKZPp4wV0FCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Thursday, January 30, 2025 11:30 AM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH v4 1/2] drm/xe: Add Wa_16021333562 and
> Wa_14016712196
>=20
> Wa_16021333562 and Wa_14016712196 are permanent workarounds that
> apply to multiple platforms. Wa_16021333562 applies to platforms ranging
> from TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2
> (12.55) to Xe_LPG (12.74).
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    | 2 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>  3 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index fab259adc380..e7c9e095a19f
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -342,7 +342,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	offset =3D guc_ads_waklv_offset(ads);
>  	remain =3D guc_ads_waklv_size(ads);
>=20
> -	if (XE_WA(gt, 14019882105))
> +	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
>  		guc_waklv_enable_simple(ads,
>=20
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOC
> KED,
>  					&offset, &remain);
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 9f327f27c072..29cd7b548493 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -192,6 +192,10 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
>  	else if (job->q->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
>  		flags &=3D ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>=20
> +	if (XE_WA(gt, 14016712196))
> +		i =3D emit_pipe_control(dw, i, 0,
> PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> +				      LRC_PPHWSP_SCRATCH_ADDR, 0);
> +=09

Looks like we have single emit func for all flushes, so LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  	return emit_pipe_control(dw, i,
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 228436532282..ea72bcc02e1e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -43,3 +43,7 @@
>  no_media_l3	MEDIA_VERSION(3000)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
> +		MEDIA_VERSION(1300)
> +14016712196	GRAPHICS_VERSION(1255)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> --
> 2.45.2

