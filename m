Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF89E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 18:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C27C10E3C9;
	Fri, 20 Dec 2024 18:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvmj6YXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796C810E3C9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734718240; x=1766254240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HM4gi3B7SBU3QrTPYUeYOhUJlz/t5C7rCck6/o5QxEQ=;
 b=kvmj6YXphHxYhRUu6uP9eMXBYdzPwSFWnnwhoSTwg4pfAL7JsOa6E/ci
 bxkmZRlpndXGaLR8nlWvbgzPO8RtyRe1bJIc6rarFFVH4TaB3AWtvNc0A
 w5WEkP9LSoAag6aoEolbuHaV87ynNv54TJ612gNPQRQJsVdNlaY4/jzxq
 LMu+b0AUGyad3n+0HcOQ9GWAtJMDJ2XJa42XlreKGsqx8duxjxSwMr6Bo
 T4Z9RZx8aa68CSujkzyvZTN+51PsObFwef6pxB2yZ2a8Js26Q10MaO4ph
 MnQnFfjXVQ+nFB5+x9FXtCi3LhWhf5+Ig4t+vVk70pv7GeTNOty+IWaoF Q==;
X-CSE-ConnectionGUID: vz43b3OeRki+++lGkQupKA==
X-CSE-MsgGUID: 5Xj7AyjFQYelcAxazPGk6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52680399"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52680399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:10:40 -0800
X-CSE-ConnectionGUID: HpMIMFwlRamzowLkyYSgkA==
X-CSE-MsgGUID: miAWpOuLQa2x7nGGTOOaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103651074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:10:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:10:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:10:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:10:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMyD6V2vSLOAF1cZB8tTsdIVPiwZEgSccR8VQH9ZhmxbVcHs1SWOvzOGotwbGJpWGWHX8yP8GYEdVr9Oo6MZCJV5sa4BpVthKsRew4TR7BTi+vF2BOLVHl8HqOOQCwjsMeZXIybpOV07q9/f70PhlYLi5n3uwTQg6AC/5fJVf27chYGa8Teu0Yrm+9Q57yJu+G3zRFUWK20gJBZhbql0gLHw88FfC7ucYWXEmzsNfjRJWW4SjR3e5lGhcCvVXSFsz+2gxH8zPR7QEKz3a5fZCVdP76R+a5bDK5fmJqgsK+rsA0uSxFC37l6hmPMrhYeupbSu0eejon5E0Shq0bkBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZib3gn9MNv91Uxl6tobzifHYyZg2Oc5GtmfVluEVxs=;
 b=YU4nGMO8hoGFNeUmGVjG8BGJW1hnPkEgDwicjApK8JVpktgu0YZJbqQQLpODiBrWElG7ZWfTpXBx3jJrFAnPjXJuFXqsFtTyb45JAiQvc5UE+6mQczYqlQ1ct23CIRo8SGn54VHRW5F9AtOkDtYR9ByckCCNP6NWKpGE6P86IV8+Hal0GRIw7D5v8gJmiYKzEqSJ59Rw2k1vXOpN7ZYY0ke90tg2Ol+/9Lu9BktMtNb6aj6eliXXVT+nOXqKk0Fgwu+SizqLDE6oIFdAL33EcTj5Asmqs5TPOaz7c5IkQxI905V/vEH7E1pRviS3jAV5TUJCfBo4gyLJ1zm/bsnDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 18:09:50 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:09:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 2/2] xe/oa: Drop the unused logic to parse context image
Thread-Topic: [PATCH v5 2/2] xe/oa: Drop the unused logic to parse context
 image
Thread-Index: AQHbUwNf+6rnN/F4CkC7+HqHa++D6rLvbnyg
Date: Fri, 20 Dec 2024 18:09:50 +0000
Message-ID: <BL1PR11MB5445E3AA35568FB112B27618E5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
 <20241220171919.571528-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241220171919.571528-3-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|IA1PR11MB7247:EE_
x-ms-office365-filtering-correlation-id: f33fce3d-85bb-4dc0-3321-08dd21217f0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6Ahd+3uz5I/ReHs0X02AjwAuczbtP6+IR/tkvUucan3OfhxhyQ3FFxias0cF?=
 =?us-ascii?Q?bbNl3v5GcxIlOwfyrGkZtq/1E3sQxbAfBxIk17ItccoW6eUXyHnOaL34qwD7?=
 =?us-ascii?Q?TIL5jM5E1U8tRQOm0cBbA6p+jroWbOZhPMumFFC/nyTDCiDQPyO02nt01b6b?=
 =?us-ascii?Q?mo+/shkQ4z7E3xeoSBawQCB9kxG5klkC5TZZVd5DdIOj2lf1ZaKJ5kv821KG?=
 =?us-ascii?Q?TU2IKSQnbzNe3/LVedNTIIFkvFnxonWatksCb1NF7wsa/96+Qv8uH1tXMqSE?=
 =?us-ascii?Q?8eVB4RCEYOuHxN4lM5Bt3eTauQgtBAWiJrea8PgjpLWxcYlbh6hGe5VkFf0M?=
 =?us-ascii?Q?wT0BG6/+OHAmTHJvR95P95y3J5GjJdkx+YLc/D4sVecyhW34HhBEjBEAzJ/t?=
 =?us-ascii?Q?2e79/E9ZDSlDkD0lT4oxXGley9a6N4AO/2V5pPLL6rUN116B9gMmEzSB55RA?=
 =?us-ascii?Q?trgTBA+DVsO8FVE6qHBVXWLf5m+OGJK22eGUvdgz6Jel5p6alFuaxfXK5eA9?=
 =?us-ascii?Q?qT2FVGxM5zkxUI+knPkcrIs6WiyIxtBOHvSD9kACepEKd4YLvq2Lhc7+NSMd?=
 =?us-ascii?Q?m51z5KCQENpY1bC6Cq9z7XjMGPYikj1XuE4LjvY9+6TkB8CZoCLptIAHslI2?=
 =?us-ascii?Q?ClRMpGUvcn1u5+W2jx2TPvUBgP2O4E2895ecjk+8iJzNl6MPLBeRM7Jgxo1w?=
 =?us-ascii?Q?9ruwwdl/AnioHyoF6+HAWMM1R93fE+icocnisJAXuWJ4cw6F/WryiDDV2i2k?=
 =?us-ascii?Q?fvlPy+06U8tuoYXiz9xGuzMjZYAaAw27D7kEPBYBGqeklXL7VNxHswiKAcM7?=
 =?us-ascii?Q?CtfO9Z9GcX3segX0U8Q/N2ljkNgjAq2b1nXoMBkaUveR1sBM0+UvBKe4FWUa?=
 =?us-ascii?Q?2+OaF80Nh7q8+IargkJG1u1R48A0zW15JhyN4Pt2HyyigNNP45Gz0KdEmzbb?=
 =?us-ascii?Q?rvOu2i8FvHmZti9cUVSEyxgkowTPWjiegXDP+pSawaueUtiknVsoDy5bT7h7?=
 =?us-ascii?Q?DFwuFQplKX6mtcB/5dH+PGnPTyGpM592WgIyTufJxqJYKULMJW2uFLgmv38S?=
 =?us-ascii?Q?khYzngtOSaXcl2Ou7V8Q9knJxp0W8bprRqQXn75LD+my/fZCrhkVb12oWXFZ?=
 =?us-ascii?Q?HdFKwsM/lp/IqlOI5CY/gskbGLghes04mCmFbtyq6uxD9voFsV3Rv82IOPIG?=
 =?us-ascii?Q?tQWjThC8JdRN5IKGbmjRJY6FEVlc4pNucpnOwhxh4B1VdLcyO/p4fzQ4/SNH?=
 =?us-ascii?Q?Zz9vqm6pIJYi2aLd981gOKx3ZZ+LxOaQYNAJ4C4HwBjRcdkyZDLJdbIUduuV?=
 =?us-ascii?Q?70hvOvdshGmJrOqMDXR4LHy1hvrvp1Q/27ghc0dtvSJrYPkG40rHnul6spOl?=
 =?us-ascii?Q?12nH7v9L9TvbtAPFdvWlwN+7B70PyV0KtIF+8nK7pfWmOtaGsuyO7itAAmeI?=
 =?us-ascii?Q?svqUbJuNq7u3a7En+mwJAvjGKBBvQ1ag?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yW4lSnRorppQ1hoyIilv9iaFuaAAZGPPILQZjebdv4LHN7q1DbHHw24Mz1rQ?=
 =?us-ascii?Q?oFyvp0zpVi47NYDE8grYg+RXonXFRZ/rgs4h/80Uk11oXPhy8U3zkaWKTWIP?=
 =?us-ascii?Q?yCUeN6Sndx6hVbUntuBvK1p5mjxRs2L4mcrxEzS3AP/hSGYJpkbiNwDnkuWT?=
 =?us-ascii?Q?COPa97jGWalsMBN9o/WAwhdY0vTW705Gb9ed9rHxFzQ1bjIHThl4yntbVOPM?=
 =?us-ascii?Q?u44kUSwS4esRJ3XPwOpKznlN7ySuvd+m1A+qYAGEqGviD0/beoOTtk/UMRTo?=
 =?us-ascii?Q?gIrt6os1iT+NNgvs2PEdz8ZLSafFOxy13U3iWcPi4885iCaUNw6eI+dy6Yy2?=
 =?us-ascii?Q?1+Z0fHC2ee9CIa71gJ8OBqmgdVwxcx63ZROvqpWwGOM0G6rGceI8PGZSdXsx?=
 =?us-ascii?Q?Ypz+RXp98CZ31EhJNnq3qgG7lb5KRZ+lXZXKeBEfgbcCzgfMH9eUJFHz5Xuc?=
 =?us-ascii?Q?55yjLNQa1I6Z7VBcJBgl4fcuAHE9F0jbVsF6E2JNLwXxeCz5r03Jt/51fr9t?=
 =?us-ascii?Q?ILZFWFyi1FE+RBTUO1XKYu+ILE/Xj31U1G4BArW75kGI1iOrKrQQkCRg8i0I?=
 =?us-ascii?Q?WzKtKVLz+sLpgaHRad3zF+io5A+/8jt+hP9wlFzy/k0AVGQxH5CvncLfcZb/?=
 =?us-ascii?Q?NU5aYXL8VMkIigePkNTELQAmsX8ADWhjFjYgPJpUX/dC6k2IgbMPVPl3Ghnp?=
 =?us-ascii?Q?h3LD+DROzUK2OQUlRNS7yqnZqKpZd3iXIwHsObvz2kQNrBuktry98C6hcD2M?=
 =?us-ascii?Q?xzM7vNeouplq+XpsWq6Pj35/2YEc9zgbwOlmjEDcOVdQoZpV6AdCQvPQN8Z0?=
 =?us-ascii?Q?SSRj123A2YcotTsrk5EQYv1kRn53gmnUmj1iL4/EW55NJbI8bBtyzFECMvoO?=
 =?us-ascii?Q?jXM3fiV2vra7MufZWnbAdzeWfajYrdPwfASiQiyqYzuaHfN19RrlnXj+XlwR?=
 =?us-ascii?Q?KXMYsDH09zCmWRG+qdD77ZEV6ur0LMPrw8HCvoT3RM/w88HeigPF+/6Y6zM7?=
 =?us-ascii?Q?6icrXomjbFR8iM8O2xHpSEwXBflZRmFv8RgkkTS8r2gILIe6WBBXV7P7cdz0?=
 =?us-ascii?Q?upBIx5QDevxPVU75TL8LfnxLd+fuSZW6l24ougUM7S+90+2Z1QauuzkHLMbj?=
 =?us-ascii?Q?SDRUi7lSTnZJtBo7CEkpQV++g0RmG6DR02NRz78nSCF0jZhdylQ45U4i+P8q?=
 =?us-ascii?Q?GmxDv+IUCyEcCuMFYmmLWtOJ2adG0wT2/gJx+r7e1gYktXRp4E5ixiv/bOO2?=
 =?us-ascii?Q?nOUwsW0DSZTUWPhetGrBm7lQpsYpEppJgcuJ1M+nBK8S5NuxQcHmSRsbhdse?=
 =?us-ascii?Q?+SfIQIKt5Yl/QUPCYl52OTw51va4tz466t58Y+KhhEJ66YZ2kfysTlKyip3V?=
 =?us-ascii?Q?cragF4nQkKs4ko6GWdFbvI42uaoW9bSzyph5+xhrJMDdnFBv3yLOQ0Q6w/Vm?=
 =?us-ascii?Q?XdQYhkohW6WBY6XqNeWONbaXO1+zdkbzvewg7vyN88U/x5BITaOhFd685g47?=
 =?us-ascii?Q?23+7TpnJTbrdo9ZXChUvod4DST54nTvbS+DMQz79/JY7gb4o16TBEQTsyCw9?=
 =?us-ascii?Q?d+tIDxC1ECNfn8PMZVriC7HhHStjeBrTCGWzHK2qE1TiZzVADb6EQDvVcGYU?=
 =?us-ascii?Q?Mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33fce3d-85bb-4dc0-3321-08dd21217f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 18:09:50.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2A9RYRLqLAn9UVF9a4vwQKpReV/9E1gfiK+O3lnrH+psVPQbN6oZRowFqKz7+hktaVv/r8RloGDSi/vbWhp4vyMzHO9298F7Oi9zXVHSSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Umesh =
Nerlige Ramappa
Sent: Friday, December 20, 2024 9:19 AM
To: intel-xe@lists.freedesktop.org; Dixit, Ashutosh <ashutosh.dixit@intel.c=
om>
Cc: Souza, Jose <jose.souza@intel.com>
Subject: [PATCH v5 2/2] xe/oa: Drop the unused logic to parse context image
>=20
> Now that all register configurations are using MI_LOAD_REGISTER_IMM,
> drop the logic to parse context image for offset.
>=20
> v2: Remove unused lrc headers (Ashutosh)
>=20
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Sounds good:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 88 --------------------------------
>  drivers/gpu/drm/xe/xe_oa_types.h |  3 --
>  2 files changed, 91 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 9add60097ab5..4e00a77289c5 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -16,7 +16,6 @@
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> -#include "regs/xe_lrc_layout.h"
>  #include "regs/xe_oa_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bb.h"
> @@ -28,7 +27,6 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_pc.h"
> -#include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_oa.h"
> @@ -1673,81 +1671,6 @@ static const struct file_operations xe_oa_fops =3D=
 {
>  	.mmap		=3D xe_oa_mmap,
>  };
> =20
> -static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
> -{
> -	return hwe->class =3D=3D XE_ENGINE_CLASS_RENDER ||
> -		hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE;
> -}
> -
> -static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 =
end)
> -{
> -	u32 idx =3D *offset;
> -	u32 len =3D min(MI_LRI_LEN(state[idx]) + idx, end);
> -	bool found =3D false;
> -
> -	idx++;
> -	for (; idx < len; idx +=3D 2) {
> -		if (state[idx] =3D=3D reg) {
> -			found =3D true;
> -			break;
> -		}
> -	}
> -
> -	*offset =3D idx;
> -	return found;
> -}
> -
> -#define IS_MI_LRI_CMD(x) (REG_FIELD_GET(MI_OPCODE, (x)) =3D=3D \
> -			  REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
> -
> -static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 r=
eg)
> -{
> -	struct xe_lrc *lrc =3D stream->exec_q->lrc[0];
> -	u32 len =3D (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
> -		   lrc->ring.size) / sizeof(u32);
> -	u32 offset =3D xe_lrc_regs_offset(lrc) / sizeof(u32);
> -	u32 *state =3D (u32 *)lrc->bo->vmap.vaddr;
> -
> -	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
> -		return U32_MAX;
> -
> -	for (; offset < len; ) {
> -		if (IS_MI_LRI_CMD(state[offset])) {
> -			/*
> -			 * We expect reg-value pairs in MI_LRI command, so
> -			 * MI_LRI_LEN() should be even
> -			 */
> -			drm_WARN_ON(&stream->oa->xe->drm,
> -				    MI_LRI_LEN(state[offset]) & 0x1);
> -
> -			if (xe_oa_find_reg_in_lri(state, reg, &offset, len))
> -				break;
> -		} else {
> -			offset++;
> -		}
> -	}
> -
> -	return offset < len ? offset : U32_MAX;
> -}
> -
> -static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
> -{
> -	struct xe_reg reg =3D OACTXCONTROL(stream->hwe->mmio_base);
> -	u32 offset =3D stream->oa->ctx_oactxctrl_offset[stream->hwe->class];
> -
> -	/* Do this only once. Failure is stored as offset of U32_MAX */
> -	if (offset)
> -		goto exit;
> -
> -	offset =3D xe_oa_context_image_offset(stream, reg.addr);
> -	stream->oa->ctx_oactxctrl_offset[stream->hwe->class] =3D offset;
> -
> -	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset=
\n",
> -		stream->hwe->name, offset);
> -exit:
> -	return offset && offset !=3D U32_MAX ? 0 : -ENODEV;
> -}
> -
>  static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  			     struct xe_oa_open_param *param)
>  {
> @@ -1785,17 +1708,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *=
stream,
>  	else
>  		stream->oa_buffer.circ_size =3D param->oa_buffer_size;
> =20
> -	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
> -		/* If we don't find the context offset, just return error */
> -		ret =3D xe_oa_set_ctx_ctrl_offset(stream);
> -		if (ret) {
> -			drm_err(&stream->oa->xe->drm,
> -				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
> -				stream->hwe->name);
> -			goto exit;
> -		}
> -	}
> -
>  	stream->oa_config =3D xe_oa_get_oa_config(stream->oa, param->metric_set=
);
>  	if (!stream->oa_config) {
>  		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=3D%i\n", param->me=
tric_set);
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index 2dcd3b9562e9..52e33c37d5ee 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -138,9 +138,6 @@ struct xe_oa {
>  	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) =
*/
>  	struct idr metrics_idr;
> =20
> -	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context i=
mage */
> -	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
> -
>  	/** @oa_formats: tracks all OA formats across platforms */
>  	const struct xe_oa_format *oa_formats;
> =20
> --=20
> 2.34.1
>=20
>=20
