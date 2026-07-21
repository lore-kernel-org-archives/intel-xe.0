Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4CEC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BFF10E760;
	Tue, 21 Jul 2026 09:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4rQvKPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C990810E492;
 Tue, 21 Jul 2026 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784627246; x=1816163246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tYbceuhkWdiiuu5ynY4b1FBKfT8X7fjaM5hDXy9gDms=;
 b=U4rQvKPHBgxXpniU3gj9dTZjXj3tTxtONr/dEXLxDYxzq5e5KNRSD+2O
 Exe/CHQn6rFh9hh/WY43rHyWibYhCYzzNdwvJnrqju6P7yJdiMdoX/vQ6
 Xs6yg/Q/+y4j8GNow7xeIISkJyjbjjgMHIY3VgV7ulKR//WHYBOY2Y/0+
 gpip1ybQJij1c5QlQCPyIYhSMyFul/Pez/PWqHYApZkZiFFd3n217Gafq
 JlqDrzkOf4i05mylSyYKhYBtc7WJSx7WShF5GFoXmFzh/RE/lnosjvzQp
 sRAcpQ8TEUutdZH8FXMmiaWxZPmLdLlWrhKDvXH3LHkEwPH1/gH0XkPBR Q==;
X-CSE-ConnectionGUID: Xmf0b+tnSAaE9sauhXm3qg==
X-CSE-MsgGUID: nVVKIb1yQse+i0DL2RmPkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95872673"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="95872673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:47:24 -0700
X-CSE-ConnectionGUID: bLhpAeFLQ4mXubybsRXhyQ==
X-CSE-MsgGUID: JionqsiRQZ6QC18T1LRYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="256514038"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:47:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:47:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:47:23 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh7XBlM4rLH8pYKlvXgYtHEFvPqWaTz6eDPgKd+0WCJDiV/hX/y9Isr9OvuEsh9YXGxIfFocHD4COvuIQ3ZnmZ0KwSGot1vdbOzVDL141Lkcf3TMQNP08N29vQyc23qxU9P+V0pIDVdAYR4CvOVceWAoHGQdKnJHVKpDsMZcbDI4e6udSNuA0oQYV4yfa2hojZFKVrF4kinPks2FcDYtVFRTEhKy0rAVYc+HEgvPGNbBFx6jScgU+dNo0243gw07sfsjALDUKe667vxqMr31vsggZAualtaHjyfSt+df1AELVzS59b/FdPJqiJYTISp0zuciDTeA2X+OENihG24gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYbceuhkWdiiuu5ynY4b1FBKfT8X7fjaM5hDXy9gDms=;
 b=y1mE1I/C/1dJwh0+Z9uNvqhDV0qgilTUBREZGi4tHp39p0HbZdVcimBIcbIVwgmcwOTWRZsJ5260Ahp237P2JquKi+m7ICP/z1WSdN4fKSP4hE5TPb4LHowaokufotDzOMgR58Cimle3+SJFYaZLNWntKoupLyuPjt2YhO24iQY20c55jfxmmGX1c8sqmDM1mx7NjDv6wGLeqLubk6fTuE89TpB4caWMopIj7l88H+xrbN8mQMLGfcIMwSHTvXj2aMxD5FaHI1CGVP7WrILY8+uT7pKSB8o+iw/gjqdVsiDYuGQtavDz3KRFGxzQHJtngEn+xkSgMDK3Mg0cX2Mm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:47:15 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:47:14 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Topic: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Index: AQHdFXbygQsSN1dcMEq25My4sO+tVLZ3tCKAgAAMvgA=
Date: Tue, 21 Jul 2026 09:47:14 +0000
Message-ID: <9f270f8a27ac8d13648ab07621fd4fe609eadf45.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-4-vinod.govindapillai@intel.com>
 <0206cb61e7e0a4746b1ca561ba9123ef85d097e5.camel@intel.com>
In-Reply-To: <0206cb61e7e0a4746b1ca561ba9123ef85d097e5.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|LV8PR11MB8769:EE_
x-ms-office365-filtering-correlation-id: 3692c57a-1e7f-47c9-03b3-08dee70d0b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|38070700021|5023799004|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: r3Sj5kKy2hfhQKzhvHTMf0XAUdZb9vJkh47fLce2b7lAZYD7e5LRa28TK4nlCRgxZlt6B/akOVnfeLlXJP9G0WiVkyeimEHyKW7NMbI0LvbfCk6o8l9tFwm/kjNISf1uB8pK4W5E5sSJFZW81xAnQbTv8avweaGTyzmRXBscedjDA/rdcN9yVGdfFb49JSQVO8M41GF3We569MQSF1hsU9FHzGajD8qsT1YVzW01aAe+ZUNaXUk4rS9j8JMo9jE75QrYVi2U7yuMSztHGMO6gX6njrhd7mB5biSEsW6YvsMtnD8Rt3Agix48UAnAI94SqHbnPArl520a8tdxDB1jEzC4UUf2wyV3BPlGnccu+PT50bNaSNAIrpppARSKMp+KfMURteo8zVkl2gjdnuob3hVWy1Yk7cvdXjfv+T39HZ6k8VLyfi75THcWXbRnPsRH+FJsXAvmS5+YZp+XpcwhkXhxSCGNfLqVcGdsO8ajvchbGEBcHLg0pU/xr6pOCapahcbCFXSPqfFoGy3udCimhaQD3XknA19w6yoH3iuvTTND8sNzTnPxOQ+pGw0jhfUTO22z4F/Yp7MRWuU5XMOc7y63mmtHsCKmquqZtUF39nydv/yiVR5lYdr2LWS0PH4KqcQzHa4PyPsAx65+3+pzusCeAGKWTzLmtQwpLPGi4DEGLf52+LHBFzini312znUxxAjHJBiCE8lS0MdBiewa4+vzoPN5pk9rZsqz9854lq0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(38070700021)(5023799004)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTc1UnNvUjFwYUxmOE1PRFZQZWpMOWhJYmcvZUJnMTNCcEZJZGJ6aHVvQ0Rv?=
 =?utf-8?B?dGh2azREU203VzRZaTZiS0s4ak1kTjUvQjc2clkwZW5JY3J1dlZEdUVJeUpF?=
 =?utf-8?B?WGg0SitiTDZXRkJ4eGNHOFhEUldKOVJ2bTNnVmpEWEZOTUxKUFVha1NTYzlW?=
 =?utf-8?B?dHpZNWpyNDRMZCtnV1lESm9xdzhPQ1NXS3p5NHE5aXp4d0g3cnZrNStFa2tG?=
 =?utf-8?B?YkNLZUxkUTVwdkt3cVdSUThnWXIwRVVvOFV3ZnhXYzdWTnB3OHFkUGU2cEww?=
 =?utf-8?B?UGoyZHdWNGlUbmthaWZXVjZpVjFIMS9wbnV5Y3dHMEVlWVFjN0ZVak9OWmho?=
 =?utf-8?B?K1NQanB4TmZBV0pjSmRKdHlkUHRGazBWcnFPNWtNbko0SzVocytMbndhMDJL?=
 =?utf-8?B?UXFNekZiWVkvQ3VYNkhPR1RsSjI0WHJleDgrWWRVRVBEK1dyUitNZGJkejBk?=
 =?utf-8?B?Y2l4QW9CMVhoVkZXeUQ2eHE2eEZOU1F0ZGlBTlA1cnE1cGlQWjVhUlBYVUNW?=
 =?utf-8?B?TXlqdFUwRFl4QXArMFRvRC84R2NqQllkQ0tyVk4vU1A2MGRxUWJqRXlOLzZi?=
 =?utf-8?B?WWNsajBvaG9tejhjQ3IyYk1HOE9PTkRjQ3l5emRjaU1YeUQwS0VUMFNqc0dO?=
 =?utf-8?B?QVRSVHRoa2V1RlBYdStYSHpteTV2a0VhSmMzR2pZVXgrbGZLNmtvclpNdHV2?=
 =?utf-8?B?YWowakRReWFpVG51Qm5vVWhqdGUzQW51bkEzSlVicVZLWmdXcmw2Y2VJb1Av?=
 =?utf-8?B?SWttcXd3cURLQWZPbjYzTFZrSWhvSW9QUThGM1h6N1VFdHV5VEpoTUNhTERr?=
 =?utf-8?B?RlF2YzduRDZqZ0l3VFE0K2JoYnJVV21FblV5dDUwN1FYR0hjVXZtdHVFaUZq?=
 =?utf-8?B?WUtXQTVuSmlXbm8yemVyc1M2R1p3TFVHOFZnd2hxODVLMHdLS3daSWUxZjBC?=
 =?utf-8?B?dHhjL0VNMWtEakJZcElsT0NkWmd4Z3FXRkY1Qzh0OXdVU1RtUDlKaXBXaHRh?=
 =?utf-8?B?bDdLWlFCMVI3Ly93ZStnTExQRWtCS0ZyQm1MOW1ySjFkajlGSUwrdkJqTzlV?=
 =?utf-8?B?YU1SM2VZS2FCZ1ZGZEQyWEd3MTY3Mk1rZ3Rmb0hHSS9NdExXa0xoWWpWN0Nr?=
 =?utf-8?B?NkxtYXN0QXVWaDVORDQ3RTVRZVBla3lFUEFZaUNXL1NTOGRKcUtuSVhJeVR3?=
 =?utf-8?B?M1o4cUFONnh4dmw1Z2JRS3JFcWZXYUlVMFhVWFpVU3ZBK0MwQkcvdTdnb1gz?=
 =?utf-8?B?SHNYekxPalF1dUExMkkxTFJEMXJyeEsvdURpNitQSGNya2tDcDVjaU5tSCtP?=
 =?utf-8?B?S01qZUtJcWhBSzY5bU8xeG1jZEJRdlpuMGxsNkwwdGExZXNoaHBSQ0pYU1dz?=
 =?utf-8?B?UFc1UWZtbEJjM3UrVVF5TFNvVStmTHRYSzNkM3FUTGVYcVJpV05KQVpva25F?=
 =?utf-8?B?aEpDVUE0WlBNR2w4UWFyRUk0ZWVyRHh3MW5EMS84RzVEazk5OC8zQ3ZjeVRu?=
 =?utf-8?B?VXdLQWMxNWZ3MEQ4ejZ3eE9yVjU2SlRKM0RPVlNSQ1UzRmxaTkNRbzNKQjJ2?=
 =?utf-8?B?Ylo0c0xKTW9UdTFTSEw4WXFrZXF1WDlucW15bkU0eE1xanN0Tmx6bEZIeExH?=
 =?utf-8?B?akJ1STBQSmJiZnZvNm52MTErN1NPcVMwd3BFOHFwQjh1UWxoblBHMy9mdy9p?=
 =?utf-8?B?dzA4eE1WWE9VYTFWRXV3Ym5DcjVhbDZ4YUFMemJrM1dPbXFmWWYvZXEwQUUz?=
 =?utf-8?B?WEQ2OThiV3Q4WnhJa041SHVWSjludi84eE90Z3dHdE5Sak1rbTVoNUkyUFp2?=
 =?utf-8?B?Rm8rR0tQbk55dU94RUoyWDVBVEdMcVBpRXRuYnc4SnRKYmpDQWRJdlZRbnJr?=
 =?utf-8?B?NmZCZFBES2lEMndnblpPdDc2MHRYSGo2bmZmWGhVWDhudW9IVGVwU29QenB6?=
 =?utf-8?B?cjUvWWRBV2xQQUxMdkVHTmF0dktUUnJEUS85SXFybzNnNVdoV2o3ZFpWOU5i?=
 =?utf-8?B?YjJ0N2JvMnBTVXdvOWNnNGFjYmZ2OStGZFRmYVZXQmI4ZFpnUVNqY2hFem51?=
 =?utf-8?B?Z0Nqdy9GRnJxZSs1RllhM2hITGhWMElTZXNxODlOZ2VSbFJlMjdBazl3NW5T?=
 =?utf-8?B?QllsVkptVTk0Um1pZWFxRWdOenFEWElOZWIxWUdkSWxBd0lWQkZmUmlzYWtD?=
 =?utf-8?B?aUQvV2RNZC81VFNySlZaWE13enMvQkt5allEMmM4VlJkNlA5akNCOHRPVld1?=
 =?utf-8?B?VFc4cC8vcWNwMWREcGdUK09xc2wzUHVVejVaZmRqQVVnL2cwZnRLcWtsUm1P?=
 =?utf-8?B?Wkc2VWJHSDh2SkhXNGdQa2VacmRLelJzVEp4bHhHUncrUnFlQnUreUZMT0ht?=
 =?utf-8?Q?vyW0ZqJPl32WrxdCGUuDEL3YmxIkUIpp8TjL2dCQOTKWT?=
x-ms-exchange-antispam-messagedata-1: Rmi9jmYje8Z7Q/Vmr8m05nq9TvXIRjWxKpL8LZDPPhfQ0E2iQaoDN7oK
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FD936A8A8C5824984DCCDD7658B0C41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fac8QB38MyzPl9NOFoKW58HzVX2/H5bQGoa9rMTwc7X+U9oo5/FDuc5f73bT0DpVrZ1MrFxHDvLPHmLVAhA4nJ9OSPBU6fgVFrrCXQGoJsxZ/QMUuqOpFdEh9aSKWIzJ5iNEYcevDn+aZBn4l3uPIjx50alZp4ploELvVGYQURUCm6ZyOhZ3VvgM/lWE4tTUXr3kacLfEJPUtGWnJNrpp1nftFJKAxP+dEdhmdHOCRpjV+Hg+7uqdqSG3nlf1kSad1twM2eRCKe38VcN8Ci+xpnKgrrq3Zq+hSaQMWz1Dm9MNlXvrijdIdSZoMZKwLPIlNF4LCRpC/agvv1N+esjqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3692c57a-1e7f-47c9-03b3-08dee70d0b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:47:14.7241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2bn2XrRzlfd/YC/D4Ga/YSLYyu8EUrNmeG2zbHeK7TGS83kTGFq2CKhRiOX+PAelmnTTv40m2fw3I/LZz/TKjU6RQYVoXHE5RscSA25ECU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
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

T24gVHVlLCAyMDI2LTA3LTIxIGF0IDA5OjAxICswMDAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIEZyaSwgMjAyNi0wNy0xNyBhdCAwMTo1OSArMDMwMCwgVmlub2QgR292aW5kYXBpbGxh
aSB3cm90ZToNCj4gPiBJbiB4ZTJfbHBkKyBwbGF0Zm9ybXMsIHRoZXJlIGFyZSBubyByZXN0cmlj
dGlvbnMgdG8gZW5hYmxlIEZCQw0KPiA+IG9uIHBsYW5lcyB3aXRoIHJlc3BlY3QgdG8gdGhlIHBs
YW5lIHdpZHRoIC0gd2lkdGggY2FuIGJlIGFzIHBlcg0KPiA+IHRoZSBwbGF0Zm9ybSdzIG1heGlt
dW0gc3VwcG9ydGVkIHJlc29sdXRpb24uDQo+IA0KPiBJIHdvdWxkIHN0aWNrIGluIGRpc3BsYXkg
dmVyc2lvbi4gWGUyX2xwZCsgc2F5cyBub3RoaW5nIHRvIG1lLg0KDQpPay4NCj4gDQo+ID4gDQo+
ID4gQnNwZWM6IDY5NTYwDQo+ID4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8
dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jIHwgOSArKysrKysrKy0NCj4gPiDCoDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGluZGV4IDc4MjI4
YTVlNzY1Zi4uMjBmMDJlZjkzODdhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiYy5jDQo+ID4gQEAgLTU5LDYgKzU5LDcgQEANCj4gPiDCoCNpbmNsdWRl
ICJpbnRlbF9mYmNfcmVncy5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2Zyb250YnVmZmVyLmgi
DQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfcGFyZW50LmgiDQo+ID4gKyNpbmNsdWRlICJza2xfdW5p
dmVyc2FsX3BsYW5lLmgiDQo+ID4gwqANCj4gPiDCoCNkZWZpbmUgZm9yX2VhY2hfZmJjX2lkKF9f
ZGlzcGxheSwgX19mYmNfaWQpIFwNCj4gPiDCoAlmb3IgKChfX2ZiY19pZCkgPSBJTlRFTF9GQkNf
QTsgKF9fZmJjX2lkKSA8IEk5MTVfTUFYX0ZCQ1M7DQo+ID4gKF9fZmJjX2lkKSsrKSBcDQo+ID4g
QEAgLTEzMTksOCArMTMyMCwxNCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9mYmNfbWF4X3BsYW5lX3Np
emUoY29uc3QNCj4gPiBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlDQo+ID4g
wqAJCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50ICp3LCB1bnNpZ25lZCBpbnQNCj4gPiAqaCkNCj4g
PiDCoHsNCj4gPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9DQo+ID4gdG9faW50
ZWxfZGlzcGxheShwbGFuZV9zdGF0ZSk7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5l
ID0gdG9faW50ZWxfcGxhbmUocGxhbmVfc3RhdGUtDQo+ID4gPiB1YXBpLnBsYW5lKTsNCj4gPiAr
CWNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmh3LmZiOw0K
PiA+ICsJdW5zaWduZWQgaW50IHJvdGF0aW9uID0gcGxhbmVfc3RhdGUtPmh3LnJvdGF0aW9uOw0K
PiA+IMKgDQo+ID4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTApIHsNCj4gPiArCWlm
IChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAyMCkgew0KPiA+ICsJCSp3ID0gaW50ZWxfcGxhbmVf
bWF4X3dpZHRoKHBsYW5lLCBmYiwgMCwNCj4gPiByb3RhdGlvbik7DQo+ID4gKwkJKmggPSA0MDk2
Ow0KPiANCj4gQnNwZWMgc2F5cyA0MDg4Lg0KDQpZZWFoLiBJIGhhZCB0aGUgc2FtZSBxdWVzdGlv
bi4gQWNjb3JkaW5nIHRvIEhBUywgdGhlc2UgbGluZXMgbGltaXRzDQpleGlzdHMgYmVjYXVzZSBv
ZiBudW1iZXIgb2YgYml0cyBhbGxvY2F0ZWQgdG8gYSBmYWN0b3IgdHJhY2tlZCBieSB0aGUNCmh3
LsKgDQoNCkFuZCB3aHkgSSBrZXB0LCB0aGUgbGluZXMgYXMgNDA5NiwgYmVjYXVzZSBvZiB0aGUg
aGlzdG9yeSBvZiB0aGF0IHZhbHVlDQpiZWluZyB1c2VkIGluIG90aGVyIHBsYXRmb3JtcyBldmVu
IHRob3VnaCBic3BlYyBoYXMgNDA4OC4gVGhpcyBzcGVjaWZpYw0KcGF0Y2ggaXMgbWFpbmx5IGFi
b3V0IHRoZSBob3Jpem9udGFsIHNpemUsIEZCQyBjYW4gbm93IHN1cHBvcnQgdXAgdG8NCnRoZSBt
YXhpbXVtIHdpZHRoIGEgcGxhdGZvcm0gc3VwcG9ydHMuIFRoZSB2ZXJ0aWNhbCBsaW5lcyByZXN0
cmljdGlvbg0Kc3RpbGwgaG9sZHMgYXMgaW4gdGhlIHByZXZpb3VzIHBsYXRmb3Jtcy4gSGlzdG9y
aWNhbGx5IGl0IGhhcyBiZWVuIHNldA0KYXQgNDA5NiBpbiB0aGUgZHJpdmVyLiBTbyBJIGRpZG4n
dCB3YW50IHRvIGNoYW5nZSB0aGF0LiBNeSBhc3N1bXB0aW9uLA0Kd2h5IGl0IHdhcyBrZXB0IGxp
a2UgdGhhdCBpbiB0aGUgZHJpdmVyIGNvdWxkIGJlIHRoYXQsIHRoaXMgaXMgdGhlDQpsaW5lcyBG
QkMgY2FuIGNvbXByZXNzLCBiZXlvbmQgdGhhdCBsaW5lcyB3b250IGJlIGNvbXByZXNzZWQgYnV0
IHN0aWxsDQpGQkMgaXMgdXNlZnVsLiBPdGhlcndpc2Ugd2UgbWlnaHQgYmUgcmVmdXNpbmcgdG8g
ZW5hYmxlIEZCQyBpbiBjb21tb25seQ0KdXNlZCBtb2Rlcy4gQmFzaWNhbGx5IEkganVzdCBzdGlj
ayB0byB0aGUgaGlzdG9yaWMgdmFsdWUgYmVpbmcgdXNlZC4NCg0KQlINClZpbm9kIA0KDQo+IA0K
PiBCUiwNCj4gSm91bmkgSMO2Z2FuZGVyDQo+IA0KPiA+ICsJfSBlbHNlIGlmIChESVNQTEFZX1ZF
UihkaXNwbGF5KSA+PSAxMCkgew0KPiA+IMKgCQkqdyA9IDUxMjA7DQo+ID4gwqAJCSpoID0gNDA5
NjsNCj4gPiDCoAl9IGVsc2UgaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDggfHwgZGlzcGxh
eS0NCj4gPiA+IHBsYXRmb3JtLmhhc3dlbGwpIHsNCj4gDQoNCg==
