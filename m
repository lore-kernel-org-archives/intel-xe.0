Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E46DC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 14:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B1010E9A7;
	Thu, 20 Feb 2025 14:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWlCJEYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA7A10E98B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740062215; x=1771598215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0NCaeSmsObhQgH0YwcIPVw2yaZQ6rzMTB2I67D7mzGs=;
 b=dWlCJEYjwleT+p/7TNR29ujKTO1qR82uAhT+pl7EfvtwR99etB7L62Qr
 6wHyh+R5QPUteOxVUzDlUebE+pCu1XSFA12v6QX/Rxsy0PAnR/d8Jjtok
 d4yzJ6GbzlszU/TL1qfHolrrDu5BVEdfP4egKeN7M2bGj7fkqba61yA7A
 FBM8yYRSr3scI3Z60k0v2t8A0cXS4NxM46ZpGP+ep5bKIL0I5Hco/xjty
 fwB+FUYFVlGK9CBe3kqT18R5HcXPMblGvPYAeZXuEOiXbf8yG7y95ST0a
 8YRuNCpOtIP5lY6dFih9fzlzCLMtXPzxsp51hyUqAYxPAPY+br8IyLCQe w==;
X-CSE-ConnectionGUID: X7PHjdEJRh25fCfXgOpIMA==
X-CSE-MsgGUID: 5r8e8VnXSR+74jbmGpefPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40962384"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40962384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:36:54 -0800
X-CSE-ConnectionGUID: JIdm7QD1QjaM32b2YB/crQ==
X-CSE-MsgGUID: pCJ8nZg6Sp+md/odjrc0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="114999905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:36:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 06:36:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 06:36:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 06:36:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uyurr7BNqmoMRmsvBUapFT5SGgidjaTXO3Hh6/Va79EHF4t5bcbDTSV8rrxnMSakgqs3cak2ZeWmj2P4xi2DV4FP2GxMJg9si2CJkbU+8ybN6lRKjVRqXJvgErt/KIEOK15N1o+qlx32aWAIQqV55ps+KZEfOVpESWpnnYclt4Ax31CmT/CmPTnQpIEfU+0J81y69rWusNWgEtKqqs0E2486Lx2GI+rceMAnZ9jQziHrkvWeAFB7Pu7MYeuD5BQ6WLkK+3TYCEGo5+6ItS69RPhIpmRUHLdLfx25YJC7r7XRJkhLxyGID9l9NfTgyg+ryYX1Nh6ZTO1LPvQioGonvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SSD6yiNBBzuWb2OxchIAwXrnW8/troJPFIqR22XVsE=;
 b=xTGIdwCxTO+rjjZL6DrG/Qftet739WjAcE7EQgGjZyFKwrgNZ7XZaSNamjNIiAR4s8Z+imM4ByICdo+pWU4S7zr0Lq3qXRv0/ygk3I64sZwHudS1p5/5opH2J2glvxXHNnlDqBJscsgEUJzawbYBPqhm5kQ/JvaOooQT2hNJj4WQPoUk1ITV3YLNqYJb0wrriomQDgRGs13D+vY8ow+eNd/qPdqi/Bn4xHU1NTQXQlDEt7V+l+kv+t5WbTcEOidGnMeZFr9+dLnq9cotxe1imjTfbHZm3/Y4eccgALP+73MhODJbKaezySDrn2cs5WShc1g46wgypDJrD8D69FaG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 14:36:50 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 14:36:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Thread-Topic: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Thread-Index: AQHbgy1l/EJ4PObGC0uwxrt0KS1vrLNQQyUA
Date: Thu, 20 Feb 2025 14:36:50 +0000
Message-ID: <SJ1PR11MB620482192754484A7169A24E81C42@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
In-Reply-To: <20250220001710.1803749-3-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7909:EE_
x-ms-office365-filtering-correlation-id: 2e97d8e7-6366-423b-8878-08dd51bc0354
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aFl7UZZ66O9Ca4R8t4X8ptWadjuRtX8f4klXbfI9fCnwzTwTFai9AD3hB159?=
 =?us-ascii?Q?eb2miuHAV/r43+gExPIivVDoFeUCS4JFIgsdgPTkorv9k13nO5uKNQBkWkAc?=
 =?us-ascii?Q?atNkPuqEY3EwSK40O+EmTCca+aJq8UR5h0X1WHd73VelvUzC5ub3jA0ZKRwh?=
 =?us-ascii?Q?OY7kJUDCfkD+UnQplH0YTjQxSHiQXDjHGMGs2iqmbryUO1JBo+Idfy9SsbpQ?=
 =?us-ascii?Q?8sd1dyl8nHMn9t36jHT4lUzV94XowneKegHWdNKmP165Xm/c9gNdGVFLimkj?=
 =?us-ascii?Q?ijUNBw7dwjA3+603Iug7h+xLb8+8E3PF/R7Sjl5klR3SMdwuW7R5tNaEf8zP?=
 =?us-ascii?Q?eL8QBgLUVABuvu6envjTIHmhv2dwIQsfdsBjm5+9T2vLI/u5o9043Il4Ah6I?=
 =?us-ascii?Q?wp9Vu23FgWBsW8gWStY75kwrRfrxqQPECvsPyccd2RhAnqTF+UJ7gtzBVDRq?=
 =?us-ascii?Q?IWFYhc9GRZtq6ruQPhETgQ7w2BiwD2d7SKf2fyQ/yDMBuNhFLCwvDfPplOdl?=
 =?us-ascii?Q?DE5oYrvBPSAGA5Xq2zw3SQ4Y2D1UrvtVF+ll9Q++HNyyutlD/JEF701HxRtE?=
 =?us-ascii?Q?VGUCOhTfEdMj7B944mr7qIwgOCvAwWxRWmFbzXQmoHAQoOUPaB2oJYu6+/fo?=
 =?us-ascii?Q?j9fFWf5lAFEDSXtDiK+E9yPOpLmloivoJwKY1JeHoOKosuK7rFIMS1y87My4?=
 =?us-ascii?Q?VBL0ko1gLRneGdWcMGK/BXb+C98Ac6s0u4Obe9E6NjtfJpOEl9YTN4x5YgsM?=
 =?us-ascii?Q?My/g3xYY5Uh59hwt4wJUt8s0lBWnDmsZu3knrdCjpF/TpMcYi8UVZTBiCbIq?=
 =?us-ascii?Q?YxG1jlGk+wmRM1ita9ZroqwREE0apk6UwinKssnA7NP+NXe1B4CpU7yRzIME?=
 =?us-ascii?Q?KX49vmcQ1EGBQBX9ZC37JkntiueSJkpZSX7cOKQNt6j3otB1kzOtiruYzZDw?=
 =?us-ascii?Q?0ELK38wcfKY8rliQRqrd24peYSazXff9TECzz3kr0B2a9OXWQX8kYEeugueP?=
 =?us-ascii?Q?I4KcW+n4z1TTNtMvJsBF7q+erMnbL/w88jNTdWjcEC2B6rpwzJw/Kr+CAtAF?=
 =?us-ascii?Q?p2WPGe1e0kc+/0/GTAW008roxsMGFJ/xhmpgPx1hy/MyIVCr41+uqdBftDx9?=
 =?us-ascii?Q?WHkk97Jv9LRvosyrsFYMem0aoWylpjAwHBu/ISZlP3f8AtntH4sunBgifkXS?=
 =?us-ascii?Q?jN+aW4REW6nEw/GRA+YY+1JoI3eVocS4AiYaATGPpjPLQp0D52UhYK17lIcX?=
 =?us-ascii?Q?P1uIwpHVMBjngow2uFYHy6Kqv91TgVP5UfgGb5lRNSjCFti6afAMlAvGaMfj?=
 =?us-ascii?Q?gb0E8LFYgNvQ0m1XJr/Qrk6rmCAnApoPd2r9gbom2JEQz82hVeTwbEuHRoa2?=
 =?us-ascii?Q?4iW3EdfchkFO4P8XObZJ1PBfPq5Ig8wIDgrEs997XLtxs+8QNt3B9am6OtVe?=
 =?us-ascii?Q?xIxwWt+H+DoWk3Bpq/AFFh2vpUcq7azI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WYxJ9mUx8dFpUanyT3wOBN9AtTbiBSTmpRlwMK1a7dIYtTt52/HV2YQ9pg+7?=
 =?us-ascii?Q?qSUKkHDb6m0r42lGlzAWnM/BEYkLyk/V92zNNLuSfBFhwXFpM79DRNTtiF2O?=
 =?us-ascii?Q?QkkxtfMq2hGeHZadsGPv9c5wonDPX27qcLPSOy0Jf8PdVQutALN47bAHLq3w?=
 =?us-ascii?Q?3Q1StP37y7AhjlpgnGzJNqJqQO37m5q3j2tUSW4dYBXnjtC1a0MrUwJzHsSs?=
 =?us-ascii?Q?OI4OXd/EZGDtHpY9ZCSgEnhODBIVybGxHmcGu/x7s3KREmugNH/aB8gxbaMG?=
 =?us-ascii?Q?iVxHpIhkehJ54g7K5121IGscf718Dd3sIfA/QEyQPkWuXJ2mYOoSRL54F7b1?=
 =?us-ascii?Q?ITp7kLSTKYSO5vyCvCYh86TAY5eT7+pyVJ9AVKtjYPW6ey6t6+bNdKRotWUb?=
 =?us-ascii?Q?06qDMV1k+1INjimM0qIh6Unb9AVm2op6a7MuXTYi8aWNzGQYfK13GqAy/NoB?=
 =?us-ascii?Q?EJLU0DvgtdbgCZ329U/3EUf9JkHmsyFDNWrY76kGqdGf9lJglMmhzRRVIMBv?=
 =?us-ascii?Q?mFUEii0lfIt5UnmIofnHqQN+uLozhSpZbnbhS1eu8kmvbLqbbsxPzMTQ0sim?=
 =?us-ascii?Q?GJinQEbWvN3MyqhgZhCmUQqlR0IyGK2dJACqutKG549k7P9UUcirdlQ+zJAy?=
 =?us-ascii?Q?Yy68cgqX0AekwZV0ALF9KQZz2fBjf6yWOZO9MGfhEMtoxgALYoUXpRwCuaO5?=
 =?us-ascii?Q?3+8XV/WfFjRlLNY6pYdNilHBGJus1c5sPOk/rmI5S53rVtydEcQRvAlGzk1/?=
 =?us-ascii?Q?VxGrjN+0Ed8+S7P/wt6GKojC0UQLFBHV3juxh7cSKGwGEGEDmUwSmibkFZ/v?=
 =?us-ascii?Q?VtsJpUOhtEBvBUR/dlzfSx3I2zu+LKjYDb8t9J44WpjxphKI90m6P/Qndepg?=
 =?us-ascii?Q?q2lLsSfAZj+XSUU9X8M+d31zenoNbXlI95X41O2M1e1zXerf71u8rvAzlbGd?=
 =?us-ascii?Q?rky8tw6e5hRliwzjEk9e8TI72Q+xhxIGRwk5/x1TnsWBgaoBOp3KSAoX2WtD?=
 =?us-ascii?Q?PzjjHyCg51Jx87/OulfVADgZhabiS82VBxHMLAnKZhTVMmB0SPXnjtb8l1DM?=
 =?us-ascii?Q?U/r6ZeUIgl8FEF0X7irCxjV7HMadW0mf9uj8Jn7iJSmV6xEJCYgeq0RTTpOo?=
 =?us-ascii?Q?8+7m/SNdwH3+GKYMk3a18SdERQlWryyJq3N/tuP1MoiXUbLcTvYGzMZNLQ5E?=
 =?us-ascii?Q?eUN0cbJxn/KbucBjVKaGlMnTk3RKP4AazdX2pvCWk9efVueiX08FyxAzMrFP?=
 =?us-ascii?Q?tIkhPGEy5RpdIpE8oFlThyb60NNU9ILAu4pf0mzo8jKdnxQX7Zvapx+VIufl?=
 =?us-ascii?Q?d5vsMjUo+MfBXPV+Iz+aUiGiDP/o4eYf4IKMt6RoyhDegsd1xfLxoqtkSJDd?=
 =?us-ascii?Q?+ZLjeKTfNZiyiPv4CefahHPMimPleQCwLTSvpOt5iurs4E5Ytv3IzPlo351R?=
 =?us-ascii?Q?w7i1WoAmUYPBWfLpbKtExtCVBJMh1lrsnJ9vnYWHGcCeaE10TIZimIHuJWWq?=
 =?us-ascii?Q?6+VZ+9WuDjHkQe+BGPoOKt/7tbohKbjGNeXYnba0GnlwjoYEWbo6yq7ocoud?=
 =?us-ascii?Q?s1vvQKEecnV1IxyuYb51me3RtJCF2S1y0Kwrroz2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e97d8e7-6366-423b-8878-08dd51bc0354
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 14:36:50.7909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0MnkPFPO1iKxDnNsi9GDZG+RQeeEdx00YIR/pB+3t9//LnCsp7NpUsKSnBasv1E5mziPxnk6RgSejKdVK5u6PJMzaYxB8I+tbhvLOJJ3M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Shuicheng Lin
> Sent: Thursday, February 20, 2025 5:47 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL
> check for kzalloc
>=20
> kzalloc returns a valid pointer or NULL if the allocation fails.
> It never returns an error pointer. It is better to check for NULL directl=
y.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 60d15e455017..81b9d9bb3f57 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer *p,
> const char *prefix, char suffi
>  		drm_printf(p, "Offset not word aligned: %zu", offset);
>=20
>  	line_buff =3D kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> -	if (IS_ERR_OR_NULL(line_buff)) {
> -		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
> +	if (!line_buff) {
> +		drm_printf(p, "Failed to allocate line buffer\n");

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  		return;
>  	}
>=20
> --
> 2.25.1

