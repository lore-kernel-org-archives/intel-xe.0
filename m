Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6BFC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 18:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AB610E7DC;
	Thu, 31 Jul 2025 18:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hqj/ySPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841C410E03E
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753987139; x=1785523139;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aLW7f769CDUqdLUKUDmdm6PCNFUdv2qvxS5pyX6xwEs=;
 b=Hqj/ySPLKwp+QSf3lK28lqELnWfcxEP42wrm2um1WpY2bo9J7iYNHq9V
 zeHSkDkTMdRg+vwha0TrPqeaPEjyDIKcdYuad6pzC2SPUCgntHzcJT0qd
 2y3ZHlEzCK7pwnvz8tB1wBsVseGUIur47/hn+wTHF2lCvlCZ/uZiPpqro
 W4Fuvsqe5GstYFODezAmtE6bOIoEdE9wopjoeSyweiGCGKXP5SrXRtB5m
 p4c90p9pFTOeyTv173A3PDQYNVNYfigWqd+kKTVZnl0HeNVK1AKK0nFd5
 ciYxz4qdSa00LmQQQS/HacNL8vQLkJQfvcgTZiE4JmlMWQdDICO+cXJTo Q==;
X-CSE-ConnectionGUID: G/6+A00CRTih0gmIsyjqkA==
X-CSE-MsgGUID: tr3dKQooRSGKraFBDHErpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56020760"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56020760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 11:38:58 -0700
X-CSE-ConnectionGUID: 9TYd9WBJRQyoySR4ta7A3Q==
X-CSE-MsgGUID: Wl8Cz0vBQEqetozUMic5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167816026"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 11:38:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 11:38:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 11:38:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 11:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxCUEulqnvjCARYNeObTfChRkh11k1B+ykT0XAV+deXXYKG7wPxGrFoLpwdeMAp8Il8UlWxqZ7JcAnYdCImMUasprh0XR+32rxArWhaFnwEt60ZPJ8sG9aDaAf8sEA7NpljTyDlRz2ilPJ9jKwOfOyZhPhTww9BESVCBrv8T8UTmwew4vbdaSbm8jGICQvtG+J61FErbAO1t3MtnoMqXoIQmVMFHU1YBlIAN/9F2afJxRWw6bPh1IOKN12pm9hvFMZIgLz9lmbZ904mlw/6FEqz+khR4nJ23QOyQwh3lQPw0q+EG3CZhravdPMBF4+KpNROai+wkFsaP+ikG36U15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLW7f769CDUqdLUKUDmdm6PCNFUdv2qvxS5pyX6xwEs=;
 b=uGzhCJU2aEz494PDKNU4w0aw7Ii7H8sAwGEXBG6qB/EYCYodDqnbs5Tf1V2pvH0K7ftfrnTCewBmKBasEwqJ1FsAhjZYYZO1v1g8mgs5DzMeBfiJ6Zxt+smWVOCDUrmsgHNjZwDbcJnoTwSngMKoMopNxCplC4HG8/4VlGpj19i+ceQjRHw2qO7XviA4/3VV46yP+GriziwC/LlE5mfELeE7HpWeZ0jy89EqhcaQnUSEVdtDrwXpORBoRjVLN+vyubr1eckxisKw2d4Ak2WXxvMsr+KJEUVP1GJda1dPTJLDwR+oLISMQ32Nmw8QjZZqR1YwU61QABkVgs7RWfjZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 18:38:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 18:38:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Kassabri, Farah"
 <farah.kassabri@intel.com>
Subject: Re: [PATCH 6/8] drm/xe: Prep TLB invalidation fence before sending
Thread-Topic: [PATCH 6/8] drm/xe: Prep TLB invalidation fence before sending
Thread-Index: AQHcAZLtTONMN87amEia6i9CeaKGNrRMkZSA
Date: Thu, 31 Jul 2025 18:38:55 +0000
Message-ID: <05666b5e44e532f4c43d694cb511332685977c3b.camel@intel.com>
References: <20250730204514.76459-1-stuart.summers@intel.com>
 <20250730204514.76459-7-stuart.summers@intel.com>
In-Reply-To: <20250730204514.76459-7-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB7013:EE_
x-ms-office365-filtering-correlation-id: e4478fc9-4d54-424d-0b88-08ddd0618109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OC9zVysrUnRHNThNdnA4UWZtQnVuNHJXNXplYktnMVhqbUNFVkFjVmJlSXRu?=
 =?utf-8?B?bWVjaHVhdXJtMURKYVNsdzBQenpIb2FHQWw3Qm5Vdis5SjNEKzB1REYxVVZH?=
 =?utf-8?B?eDBWNFVjUVFLazVPVi9vTGxxUFZQTVJqVlNRNTBZUjF0M0IzbWhsS1JLcSt5?=
 =?utf-8?B?Rm5CMUtpUG1pZXZ2eTU5MzU2Tzg2YjZuU2FZWmRFTHdTdXRDcHJ0UmxTZXVD?=
 =?utf-8?B?MEgzVWJiOENBd3owODR6MnJxclhnejVHU01QdHdQalpVVWtzSWYwSzRReXlP?=
 =?utf-8?B?dmZVKzJFQ2xPbHRUZ2g3OGFUbDU0b2JnOURPOUpReWV6K1Z1RVF1TkRQU1hB?=
 =?utf-8?B?VnJKNmNIR2hPc1MzZkw3ZGY2YWhCVGp6WCsvK2NlYzBycS9lS0NQZUh4WTQy?=
 =?utf-8?B?SHJxTFIyRENnN2F6eWhUT2hneWxNR2kyZFlEWndBR2VSdVhmSmVEb2FWK1Rz?=
 =?utf-8?B?UlZrcG9xb1hkUUxYSUdpKzlCT2xIRHM2Y083b1hCNEJnUjFreWVFQmRUbDA5?=
 =?utf-8?B?QkU3U09IcDFWTlNRSVZZTzVYVnhMN1NxZTN3TTZRczVxclZXUWRSbHhUOWwx?=
 =?utf-8?B?T2YvQUZIbWlVWUxLaENyN1c3VllQcGRNQWVrc3ErU1dKUXNWQ1h1OXdUZWx6?=
 =?utf-8?B?QnVnMnI4Vm5aQ2hsaGFMbUoyTWtYUlNhQUoyazJMNHR5TkxDWGNGUHB4U2JV?=
 =?utf-8?B?M21LY3pMY0doU0NYZ0tHa01GNTExTDk1dGJyMG1aNVJHQXN6K0pLblJjUWNN?=
 =?utf-8?B?ZzloanVvdGdVVkx6aDJoaVF6Q2xNUVV5NXByQ21IRnV1MHkzSzJ2bHJlaGZW?=
 =?utf-8?B?YzNWd1kzd1dkSFRjY2NuNkRhY0wyb25qWVJtYTBzNmFrWjUzTG1TQ3JhQWIv?=
 =?utf-8?B?a2MwbHRNaXVCTzFzMjhqVGtjZ3JvVGpWb2NXT2hIeS9zYnVkSDdlTzZQZmN6?=
 =?utf-8?B?TitHanFZYVhmd0VJVVNkdEZzR21STFFLeTFjMmFTYzdpRlNUcFBuRkpXN1NE?=
 =?utf-8?B?L3VEeVB4dk9Ba0dRQ0t4M2wzSXJMbHNkWWtHLzFLcFIrT1psZE1ydHd4MWty?=
 =?utf-8?B?V2g4Mks4YjcvZFFNKzZNQ0pSNnljWVJTTC8xWjdQb2VmNkxZeGFzc0FvZ2oy?=
 =?utf-8?B?UWQwd0MvQVlGSUpHZzBKNnNIRzVtZHB4QWx3ci9KNGRUeHhYU2NDTk1VOE1i?=
 =?utf-8?B?WWFwRWJaU2JGeVIreEo4YmdRQXhTb1BHZFMwcFU4RHlaazZnMjBsOStTdm81?=
 =?utf-8?B?YWU5TzVpV0RhdGYrM1Q2a2U3dDd1MjBKSWdiZUhHV3lnMFdVc3BjbXVlNlBu?=
 =?utf-8?B?UWhGQ080UHB2cDhsQm55REpHa1R6enJCUTg1dmN1WDlKSXE0KzBvOFdrZmxt?=
 =?utf-8?B?ampzMzhWTEovU2RkRzZsZ0VsdE94eHNFSmJWV3dwcElEd2wyRTN4WFVsUjZ1?=
 =?utf-8?B?U3U5aHdEVitrL1ROUDR0YXF3aWVRbDZQWkIxalNUblZlUmYyRS9VSkxkcysx?=
 =?utf-8?B?Z0NGZUtSbFZ4WDJKUVllU3ZkWFFReVN1Yi82OHhycXVLVDhrMzQzYXNXNm1n?=
 =?utf-8?B?d1orVlJkc252UTFVUmRNRmVhUmFZS1MrOU1sUkRzMHAxODV5eVdZTlZ2SHll?=
 =?utf-8?B?ZzF1dkc2S0xMREZTaHU3MU5jY25LOGFabnZXSEx4d1g4dERXdXMrTjMrb3dT?=
 =?utf-8?B?bWlXU0M3aXdwTFJPeTY0TzVZZHhJS2JGTU5TSnJSbFFZamwrV1NCUGFpVjlT?=
 =?utf-8?B?anZHWFVzY3Y3aEVPaHdWQmxNWVQwc1MwdFVlWVRIZnpkcTVKUGd3NGQzN0gw?=
 =?utf-8?B?Y3ZWUFJhUzhlb1V2aVh5dXpkSmt4TUJwSm9HS29QREM3VG9TTWVYRXpMM0FO?=
 =?utf-8?B?VUhZODVCd01yWGY3TUE4dFJvM2J4aUtabDNqclUwNGNIWkE3ZjJYK25NYUFq?=
 =?utf-8?B?UjFXNW54eVBWTjJpdVl2RHV4dUxSVEUzNDBYOEVFQmY2UnB1eDFwQSt3dGcv?=
 =?utf-8?B?aXlTdFhRbDJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDM1Zm00bjlhRGxMQnVtQkJ3dERZTDAyb2NBMjZFYkZqZnVKSmJDay96cG0y?=
 =?utf-8?B?Wm1DSHU4QkVpVWpQS0h1YnVaQkp0V2ZVNVBRVzFhS2h6ZXFTMGRHMURRU09r?=
 =?utf-8?B?aGpNa3hSS3FOcTh6L3ArWW1CS2l2TXozekh2Tkt4SkZNNkZiN3Z5aFY5aTdN?=
 =?utf-8?B?Q1pELzVBaXNZVjdKWS9BNjhNVzFMcTFJMWVxaVdHRnZob0p2RTVOVksyWmoy?=
 =?utf-8?B?V2JMdG4wYmVEY1FLK2YvVS9yZmFXREd1UE43aDJrelJVa2RSa2FpS010ajZq?=
 =?utf-8?B?ZmpMOEw0NHlaWHNZa1htTVdUU0RyTmY1MjMrd0J5OVF5d2VQSGFHend6NlJs?=
 =?utf-8?B?TDhSU3NvYnVCZk05TWdLemJIbm41ZWNMWWE1VjVZVThZWHhtU3c1MGU3YkNS?=
 =?utf-8?B?L3RmbVUzcUg0cWNkeDlxUGcyRzYxL0UrMDFwNEFDZlpDeHJhSmF4Tk8xczR0?=
 =?utf-8?B?aEVoYzF6enJhaUp1UC9uM0pqanByRXJrUm9wSGdLMVF2U1VmczU4K2d2T01T?=
 =?utf-8?B?Q3M0aDJOWjdMcUVHekY3SXJKUU1TUnJFWHArUEV2bzhPY1F2SW5mNUlTZVdu?=
 =?utf-8?B?UUhLeEZHMHMzWGJIdDArdXJRbjQ4Q1c2dmdDVEYydFo5RmlRZzdNRHBlVUtx?=
 =?utf-8?B?WTd1dk9rUWxzMm9SU2UzUG15OVJmTjE5RUQ4OTNiYzlQK3dCNWJ4V2hwNkFI?=
 =?utf-8?B?Yld2S2M1SzRIZC9QZmk5eWxPK1BmUURsN2dqV1ZXbUhNdlQwblRHWTdNWjQx?=
 =?utf-8?B?Um5RajdUNm5PZVlYN010MkNkZmp1Q0Q4cmJJajRkeUU1cVplNVpMd3VPUkZQ?=
 =?utf-8?B?T1hkbEYxS0svcFlqOXRubFV2aXVjM2s3OFN2UURNdEx6KzNadVRNSnloUEZv?=
 =?utf-8?B?OHdZYlFDYjJ5L1d6c1kydFJWTzdsWHVnb0NNNWM4NFBuVno0aytOL3BBK3Uw?=
 =?utf-8?B?ejh5M2VOQmF2SWt4ZDZuKzRmeEJQZVlnUFdnZUlCd3pIS05UT1BWVm1ZQzlu?=
 =?utf-8?B?WjR5WjVKYWtuUlgyZTcrOUpBdWhaKzRJaFdna0xBZUMvQ1dybEFzMU1OMndy?=
 =?utf-8?B?d2NOeUNuTlk3dTBNMDVudHRITHBOSXhPQlBaNVplb3JnYnhNcE9XNGUvMitC?=
 =?utf-8?B?RC83UUh6akRjQldmN2hQUUFnTlFyRmpaVDJudVRGU3IvbjJwcWsxc1QzTkNj?=
 =?utf-8?B?NkorclJCL0hpNUxyTFpvbEN5ZTJLMDZWUzczS0p5WFVYRzhqc1ZXK2Y1ZDlS?=
 =?utf-8?B?aFVRdHRTbFdvbUVmeVJodkZnVWhBakw2emFZakxuMFdHUlYvUHY3b2pwMysz?=
 =?utf-8?B?U0VTY3dYQldud29tUSt1ZUpBazdHbzlGTjRheVRSN2M0UkViOVFlLythUHBT?=
 =?utf-8?B?OC9EL2YrSkEyMEQ5K21yNnFWOE5DcFdwb2FBVTlrTzRrM0RUWllZNGdKRjNq?=
 =?utf-8?B?VldaMUJEdzBYMVhnbzRzM1RKNFVnMStVOFEyVGM4amhJSVNhb0pWS1RKZUtq?=
 =?utf-8?B?czlycmJqZ2d4R0V3SUdKOFNMNGJFWitoeHAvK3BKcE95clBvNWQ5RkNaUlQ2?=
 =?utf-8?B?WUVFTWFVREVacFJ5TzBsYjNIVEkvbEx0V0ViRC9WSkxEWXd3ZEh3ZUZkL2Qx?=
 =?utf-8?B?OHUyK0NwcjI4bDFpMlluN2dNRmpPeWYzM0ZvV2VCdFRYcStrOHdKdXhLUCtD?=
 =?utf-8?B?LzBkUWN2UVVwZUk5NDdoWSs0MVdEQWtqc1hkUklIaDE4SDVFWXBQcmFVZG81?=
 =?utf-8?B?Q0dpZG9yamhUWSttRTRtaDZnNHlQWnRmU3l5dnFqeVkzYmRGVkMzMWVsTmQ0?=
 =?utf-8?B?SVlIUVRKNi81eGU0aGJTYUpzVWRvVVZGQk5oUFJVcDdTRFVncXBOQjRXSEEw?=
 =?utf-8?B?NXdmRVkvQjI0WkZsbVlsU1NyV0tpeWVsWUZGT2dDb3NIRU5WekxFN1psRy9K?=
 =?utf-8?B?RmUxd1pLOHFkQ25najdsaUNJcUJ2aEFURVZjd3h2ZkhVaW54aW1BcnZKZ2pH?=
 =?utf-8?B?SXdWcWtFZjBLbTMycjU4RnVhd2FJMVdzcTQwODROeitlWThkVnJ3OGg0ZVBt?=
 =?utf-8?B?TDMxUmI1YWF4M0h5NllzTEpHTHVKb3hCampUSVRXeDF6NHFHMkRONzBJRlRh?=
 =?utf-8?B?bXFMQzJlb2o3UTBVdUFZQkdqS29mcDBRSnpWYWlVdzBzQ1NYendQNTR4RG1y?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5B61E9AE9D5854E84BA6DA0B4CB2AA0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4478fc9-4d54-424d-0b88-08ddd0618109
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 18:38:55.1401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMXuNKJUo7HT+upjLSQ5nG1aQ/ggeKtCBOV9lyRjE59jI0lFeCfy3ruINPH1Uo2dy5hLnaeoMDyLtk63jMcq1zOs+DtkcrFg2Abri46U2gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDIwOjQ1ICswMDAwLCBzdHVhcnRzdW1tZXJzIHdyb3RlOgo+
IEZyb206IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IAo+IEl0IGlz
IGEgYml0IGJhY2t3YXJkcyB0byBhZGQgYSBUTEIgaW52YWxpZGF0aW9uIGZlbmNlIHRvIHRoZSBw
ZW5kaW5nCj4gbGlzdCBhZnRlciBpc3N1aW5nIHRoZSBpbnZhbGlkYXRpb24uIFBlcmZvcm0gdGhp
cyBzdGVwIGJlZm9yZSBpc3N1aW5nCj4gdGhlIFRMQiBpbnZhbGlkYXRpb24gaW4gYSBoZWxwZXIg
ZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmMg
fCAxMDMgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+IC0tCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgNTEgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RsYl9pbnZhbC5jCj4gaW5kZXggMjg4OTYwZWEwY2FhLi4yZmZkNjc3ZWUxODAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jCj4gQEAgLTY1LDE5ICs2NSwxOSBAQCBfX2ludmFsX2Zl
bmNlX3NpZ25hbChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0Cj4geGVfdGxiX2ludmFsX2Zl
bmNlICpmZW5jZSkKPiDCoHN0YXRpYyB2b2lkCj4gwqBpbnZhbF9mZW5jZV9zaWduYWwoc3RydWN0
IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV90bGJfaW52YWxfZmVuY2UKPiAqZmVuY2UpCj4gwqB7
Cj4gK8KgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmZmVuY2UtPnRsYl9pbnZhbC0+
cGVuZGluZ19sb2NrKTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoGxpc3RfZGVsKCZmZW5jZS0+bGlu
ayk7Cj4gwqDCoMKgwqDCoMKgwqDCoF9faW52YWxfZmVuY2Vfc2lnbmFsKHhlLCBmZW5jZSk7Cj4g
wqB9Cj4gwqAKPiAtdm9pZCB4ZV90bGJfaW52YWxfZmVuY2Vfc2lnbmFsKHN0cnVjdCB4ZV90bGJf
aW52YWxfZmVuY2UgKmZlbmNlKQo+ICtzdGF0aWMgdm9pZAo+ICtpbnZhbF9mZW5jZV9zaWduYWxf
dW5sb2NrZWQoc3RydWN0IHhlX2RldmljZSAqeGUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3RsYl9pbnZhbF9mZW5jZSAq
ZmVuY2UpCj4gwqB7Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsKPiAtCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKFdBUk5fT05fT05DRSghZmVuY2UtPnRsYl9pbnZhbCkpCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgZ3Qg
PSBmZW5jZS0+dGxiX2ludmFsLT5wcml2YXRlOwo+IC3CoMKgwqDCoMKgwqDCoF9faW52YWxfZmVu
Y2Vfc2lnbmFsKGd0X3RvX3hlKGd0KSwgZmVuY2UpOwo+ICvCoMKgwqDCoMKgwqDCoHNwaW5fbG9j
a19pcnEoJmZlbmNlLT50bGJfaW52YWwtPnBlbmRpbmdfbG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKg
aW52YWxfZmVuY2Vfc2lnbmFsKHhlLCBmZW5jZSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl91bmxv
Y2tfaXJxKCZmZW5jZS0+dGxiX2ludmFsLT5wZW5kaW5nX2xvY2spOwo+IMKgfQo+IMKgCj4gwqBz
dGF0aWMgdm9pZCB4ZV9ndF90bGJfZmVuY2VfdGltZW91dChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCj4gQEAgLTE5OSwxNCArMTk5LDEwIEBAIHN0YXRpYyBib29sIHRsYl9pbnZhbF9zZXFub19w
YXN0KHN0cnVjdCB4ZV9ndAo+ICpndCwgaW50IHNlcW5vKQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gc2Vxbm9fcmVjdiA+PSBzZXFubzsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgaW50IHNlbmRfdGxi
X2ludmFsKHN0cnVjdCB4ZV9ndWMgKmd1YywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV90bGJfaW52YWxfZmVuY2UgKmZlbmNlLAo+
ICtzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0Cj4g
eGVfdGxiX2ludmFsX2ZlbmNlICpmZW5jZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgKmFjdGlvbiwgaW50IGxlbikKPiDCoHsKPiDCoMKg
wqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGd1Y190b19ndChndWMpOwo+IC3CoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOwo+IC3CoMKgwqDCoMKg
wqDCoGludCBzZXFubzsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHhlX2d0X2Fzc2VydChndCwgZmVuY2UpOwo+IMKgCj4gQEAgLTIxNiw0NSArMjEyLDM2
IEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWwoc3RydWN0IHhlX2d1YyAqZ3VjLAo+IMKgwqDC
oMKgwqDCoMKgwqAgKiBuZWVkIHRvIGJlIHVwZGF0ZWQuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+
IMKgCj4gLcKgwqDCoMKgwqDCoMKgc2Vxbm8gPSBndC0+dGxiX2ludmFsLnNlcW5vOwo+IC3CoMKg
wqDCoMKgwqDCoGZlbmNlLT5zZXFubyA9IHNlcW5vOwo+IC3CoMKgwqDCoMKgwqDCoHRyYWNlX3hl
X3RsYl9pbnZhbF9mZW5jZV9zZW5kKHhlLCBmZW5jZSk7Cj4gLcKgwqDCoMKgwqDCoMKgYWN0aW9u
WzFdID0gc2Vxbm87Cj4gLcKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX2N0X3NlbmQoJmd1Yy0+
Y3QsIGFjdGlvbiwgbGVuLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRzJIX0xFTl9EV19UTEJfSU5WQUxJREFURSwgMSk7Cj4gLcKgwqDC
oMKgwqDCoMKgaWYgKCFyZXQpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bp
bl9sb2NrX2lycSgmZ3QtPnRsYl9pbnZhbC5wZW5kaW5nX2xvY2spOwo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBX
ZSBoYXZlbid0IGFjdHVhbGx5IHB1Ymxpc2hlZCB0aGUgVExCIGZlbmNlIGFzIHBlcgo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBwZW5kaW5nX2ZlbmNlcywgYnV0IGluIHRoZW9y
eSBvdXIgc2Vxbm8gY291bGQgaGF2ZQo+IGFscmVhZHkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogYmVlbiB3cml0dGVuIGFzIHdlIGFjcXVpcmVkIHRoZSBwZW5kaW5nX2xvY2su
IEluCj4gc3VjaCBhIGNhc2UKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogd2Ug
Y2FuIGp1c3QgZ28gYWhlYWQgYW5kIHNpZ25hbCB0aGUgZmVuY2UgaGVyZS4KPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmICh0bGJfaW52YWxfc2Vxbm9fcGFzdChndCwgc2Vxbm8pKSB7Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2ludmFsX2ZlbmNlX3NpZ25hbCh4ZSwg
ZmVuY2UpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmVuY2UtPmludmFsX3Rp
bWUgPSBrdGltZV9nZXQoKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGxpc3RfYWRkX3RhaWwoJmZlbmNlLT5saW5rLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Jmd0LT50bGJfaW52YWwucGVuZGluZ19mZW5jZXMpOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChsaXN0X2lzX3Npbmd1bGFyKCZndC0KPiA+
dGxiX2ludmFsLnBlbmRpbmdfZmVuY2VzKSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxdWV1ZV9kZWxheWVkX3dvcmsoc3lz
dGVtX3dxLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZ3Qt
Cj4gPnRsYl9pbnZhbC5mZW5jZV90ZHIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgCj4gdGxiX3RpbWVvdXRfamlmZmllcyhndCkpOwo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5f
dW5sb2NrX2lycSgmZ3QtPnRsYl9pbnZhbC5wZW5kaW5nX2xvY2spOwo+IC3CoMKgwqDCoMKgwqDC
oH0gZWxzZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9faW52YWxfZmVuY2Vf
c2lnbmFsKHhlLCBmZW5jZSk7Cj4gLcKgwqDCoMKgwqDCoMKgfQo+IC3CoMKgwqDCoMKgwqDCoGlm
ICghcmV0KSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT50bGJfaW52YWwu
c2Vxbm8gPSAoZ3QtPnRsYl9pbnZhbC5zZXFubyArIDEpICUKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFRMQl9JTlZBTElEQVRJT05fU0VRTk9fTUFYOwo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWd0LT50bGJfaW52YWwuc2Vxbm8p
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndC0+dGxi
X2ludmFsLnNlcW5vID0gMTsKPiAtwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoHhl
X2d0X3N0YXRzX2luY3IoZ3QsIFhFX0dUX1NUQVRTX0lEX1RMQl9JTlZBTCwgMSk7Cj4gK8KgwqDC
oMKgwqDCoMKgYWN0aW9uWzFdID0gZmVuY2UtPnNlcW5vOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
cmV0dXJuIHJldDsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4geGVfZ3VjX2N0X3NlbmQoJmd1Yy0+
Y3QsIGFjdGlvbiwgbGVuLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHMkhfTEVOX0RXX1RMQl9JTlZBTElEQVRFLCAxKTsKPiArfQo+
ICsKPiArc3RhdGljIHZvaWQgeGVfdGxiX2ludmFsX2ZlbmNlX3ByZXAoc3RydWN0IHhlX3RsYl9p
bnZhbF9mZW5jZQo+ICpmZW5jZSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90bGJf
aW52YWwgKnRsYl9pbnZhbCA9IGZlbmNlLT50bGJfaW52YWw7Cj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2d0ICpndCA9IHRsYl9pbnZhbC0+cHJpdmF0ZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZmVu
Y2UtPnNlcW5vID0gdGxiX2ludmFsLT5zZXFubzsKPiArwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV90
bGJfaW52YWxfZmVuY2Vfc2VuZCh4ZSwgZmVuY2UpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBzcGlu
X2xvY2tfaXJxKCZ0bGJfaW52YWwtPnBlbmRpbmdfbG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgZmVu
Y2UtPmludmFsX3RpbWUgPSBrdGltZV9nZXQoKTsKPiArwqDCoMKgwqDCoMKgwqBsaXN0X2FkZF90
YWlsKCZmZW5jZS0+bGluaywgJnRsYl9pbnZhbC0+cGVuZGluZ19mZW5jZXMpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAobGlzdF9pc19zaW5ndWxhcigmdGxiX2ludmFsLT5wZW5kaW5nX2ZlbmNl
cykpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF1ZXVlX2RlbGF5ZWRfd29yayhz
eXN0ZW1fd3EsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmdGxiX2ludmFsLT5mZW5jZV90ZHIsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0bGJfdGltZW91dF9qaWZmaWVzKGd0KSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tf
aXJxKCZ0bGJfaW52YWwtPnBlbmRpbmdfbG9jayk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHRsYl9p
bnZhbC0+c2Vxbm8gPSAodGxiX2ludmFsLT5zZXFubyArIDEpICUKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgVExCX0lOVkFMSURBVElPTl9TRVFOT19NQVg7Cj4gK8KgwqDCoMKgwqDC
oMKgaWYgKCF0bGJfaW52YWwtPnNlcW5vKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB0bGJfaW52YWwtPnNlcW5vID0gMTsKPiDCoH0KPiDCoAo+IMKgI2RlZmluZSBNQUtFX0lOVkFM
X09QKHR5cGUpwqDCoMKgwqAoKHR5cGUgPDwKPiBYRV9HVUNfVExCX0lOVkFMX1RZUEVfU0hJRlQp
IHwgXAo+IEBAIC0yODIsNyArMjY5LDEyIEBAIHN0YXRpYyBpbnQgeGVfdGxiX2ludmFsX2d1Yyhz
dHJ1Y3QgeGVfZ3QgKmd0LAo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgwqDCoMKgwqDCoMKgwqBp
bnQgcmV0Owo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgeGVfdGxiX2ludmFsX2ZlbmNlX3ByZXAoZmVu
Y2UpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gc2VuZF90bGJfaW52YWwoJmd0LT51Yy5n
dWMsIGZlbmNlLCBhY3Rpb24sCj4gQVJSQVlfU0laRShhY3Rpb24pKTsKPiArwqDCoMKgwqDCoMKg
wqBpZiAocmV0IDwgMCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW52YWxfZmVu
Y2Vfc2lnbmFsX3VubG9ja2VkKGd0X3RvX3hlKGd0KSwgZmVuY2UpOwo+ICsKPiDCoMKgwqDCoMKg
wqDCoMKgLyoKPiDCoMKgwqDCoMKgwqDCoMKgICogLUVDQU5DRUxFRCBpbmRpY2F0ZXMgdGhlIENU
IGlzIHN0b3BwZWQgZm9yIGEgR1QgcmVzZXQuIFRMQgo+IGNhY2hlcwo+IMKgwqDCoMKgwqDCoMKg
wqAgKsKgIHNob3VsZCBiZSBudWtlZCBvbiBhIEdUIHJlc2V0IHNvIHRoaXMgZXJyb3IgY2FuIGJl
Cj4gaWdub3JlZC4KPiBAQCAtNDA5LDcgKzQwMSw3IEBAIGludCB4ZV90bGJfaW52YWxfcmFuZ2Uo
c3RydWN0IHhlX3RsYl9pbnZhbAo+ICp0bGJfaW52YWwsCj4gwqAjZGVmaW5lIE1BWF9UTEJfSU5W
QUxJREFUSU9OX0xFTsKgwqDCoMKgwqDCoMKgNwo+IMKgwqDCoMKgwqDCoMKgwqB1MzIgYWN0aW9u
W01BWF9UTEJfSU5WQUxJREFUSU9OX0xFTl07Cj4gwqDCoMKgwqDCoMKgwqDCoHU2NCBsZW5ndGgg
PSBlbmQgLSBzdGFydDsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgbGVuID0gMDsKPiArwqDCoMKgwqDC
oMKgwqBpbnQgbGVuID0gMCwgcmV0Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2Vy
dChndCwgZmVuY2UpOwo+IMKgCj4gQEAgLTQ3MCw3ICs0NjIsMTQgQEAgaW50IHhlX3RsYl9pbnZh
bF9yYW5nZShzdHJ1Y3QgeGVfdGxiX2ludmFsCj4gKnRsYl9pbnZhbCwKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndF9hc3NlcnQoZ3QsIGxlbiA8PSBNQVhfVExCX0lOVkFMSURBVElPTl9MRU4p
Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNlbmRfdGxiX2ludmFsKCZndC0+dWMuZ3Vj
LCBmZW5jZSwgYWN0aW9uLCBsZW4pOwo+ICvCoMKgwqDCoMKgwqDCoHhlX3RsYl9pbnZhbF9mZW5j
ZV9wcmVwKGZlbmNlKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gc2VuZF90bGJfaW52YWwo
Jmd0LT51Yy5ndWMsIGZlbmNlLCBhY3Rpb24sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpFKGFjdGlvbikpOwo+ICvCoMKg
wqDCoMKgwqDCoGlmIChyZXQgPCAwKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnZhbF9mZW5jZV9zaWduYWxfdW5sb2NrZWQoeGUsIGZlbmNlKTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgcmV0dXJuIHJldDsKPiDCoH0KPiDCoAo+IMKgLyoqCgo=
