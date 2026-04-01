Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92FA10FCAD2
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E2D10EEC8;
	Wed,  1 Apr 2026 22:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWnXvQNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FD910EEC8
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775083209; x=1806619209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iKKXSlA94dSTJENsSjMAkr0pOxXoSV4QX7F/t6ixNYM=;
 b=MWnXvQNVCcttA/t6OGH4cAjtit+Bz/DmEf1U1bYBb51xFS32UnjIk2lG
 1mcKXEQUVYCjHvaLGCxTJYOVG3v+o/gG7GybNy8kFj8yLK3x7E5h4hpX0
 UdTT5pD5YesH94e3sz3KxF4DMUUnzeElMxKPNWbCSFqCyPdaR9DgGfPJh
 s0WRsiknhBSIVJzTHbMMqJ2jjqanXbKOfo4/f8PZ0hu5fSjvb58mfY0/M
 zHT4bEQVkRs5xrBivUTlARwI1Mn0s0rb7vXOqxy7LDvrsR6NOi/Vfhnfw
 ho86zZDjzrBI2+PsJvcVA2DRsJwCp5HEMbHhwYwLU4hf5AGP9A3VQnJre w==;
X-CSE-ConnectionGUID: vQaVy8kOR7OF8GGDkC0nBg==
X-CSE-MsgGUID: GqP7ySNVRliOdjE5bLE2rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75855002"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75855002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:40:08 -0700
X-CSE-ConnectionGUID: ha3FprSRTU6QU+mxWxYJ/g==
X-CSE-MsgGUID: WEnTJvoIRlOLPqD8yc0XMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="250016121"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:40:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:40:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:40:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO5fv4hZZ4544twoojKy39aUdSHVq3YahF77BRuIiqb256OwdY0T8MbgKRDVAEdkrXP82EFla65DhFSY1cml5S/aDYUsSQWtVqUnDMe5xJRRDzBc031Mzj+oWB9fGrL3xmeEksdFyzAWLUwFiitxazy4L7X4k7Dmp+L2xM41X4ED9HtPFU2WdWv0kI7XlXlIQgUdvSaNbPqTpPliWjVjlHEUMvP8VmkH9sMQ8ZTwFgvFjXnDhlYWqRV9aJrbKu0FpF5kIDJXIPVVVbzcE+D+JK+TbnV6Gg8SOZTV1fAwshieCdulApSsshEkZ1DtDZwvANDsrf9m5GkHSFrkqMUbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKKXSlA94dSTJENsSjMAkr0pOxXoSV4QX7F/t6ixNYM=;
 b=RgAJDR4StFNNNgrA/EKyZ4Dwm2CJCAsRsmNdetya67ezEis8ZzJBi3ECmVOsdLIDJ8yrWOHMIcYy1FZUUIKBQ+z3V0yoGxsrQE8nMx24/hlFfMEboTMKSjn7ePRju2ZWoa2zRpla/qeWAyt2q8VOSOnCFjhqI5zMNdLGWfcyAW9mFNj9TFN62NjnSUz7nMiP0gOKZGC2eiUVouODKSwHjWO2D1RJvPPXc9MKvMZ/mZ7YMA6bO5lGjjWl5uh6aBvvhrTpI5O3fulfcPDDmEYaJNytSzgncCcP8pqKzKUf3Lv41HrjMRPItj0raohLBPKjM1K6i3eVJzvjen6N1R/Xaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:39:57 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:39:57 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Dave Airlie <airlied@redhat.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Drop redundant rtp entries for Wa_14019988906 &
 Wa_14019877138
Thread-Topic: [PATCH] drm/xe: Drop redundant rtp entries for Wa_14019988906 &
 Wa_14019877138
Thread-Index: AQHcwhQ1+nScgGePdEuACVzIaPWUMLXKy+2A
Date: Wed, 1 Apr 2026 22:39:56 +0000
Message-ID: <DM4PR11MB545600F30B6D92E5A04F8F1BEA50A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
In-Reply-To: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7988:EE_
x-ms-office365-filtering-correlation-id: a492be21-35b6-4d27-dae9-08de903f99c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 3w/5YtCP8WB6iCxNdyYUkuMtY48qmJTZvrEsTDNzEW6Od16fMVeMEIDlO7svNBHyE2ZtWacfZqhh8OU8Gjpy9GiYFFFL7j3vsY1uIWPYFWAPTZ6YodalIdfHebl2sDQjt5Swp25IBrZp+AMgdtBAa/fyCwL2orySYG8Qq6BHpw8F4w/Pgq91uiygFjU8GDcx3xql6pFJwbqgEj/2w+bg009UkwAsYhF1RoJa1dfBNL30SwxMDKWlsumTUZW4fONtA5d8yApkpexBzomhOxeIp7GQCNcZO7Zs1Y01pWnjCIs1Be8rumizoQqYE7Qxj7Vm3oNacG+BUZO6IfYUXfiXiBOiLhT/lkEntTKJAdVZk2MiTIw1xs8kqJWqXE2nAsRDD6sh+iyTNuwjPer48yyi5rB8yEWJurruenZzWuuqWmiSz03aCerN7W/cZtV0czA3SocCta8ZrLZM4++Jbn6LEWvpQAufoZHTwcp8YA7kPxNYKhKsjO1meX45bMggHJzwiTNdVeftuhw05rRiRPQWCoJzLvym+FvuubRXaiVXNOxdLtAtSr00C5ooZBG1c3DC3HMma+NHSN1PjcLPhenNncnAHlTXDQUN7D1A9m88TR8MJ/6P6PtUiOyOpWsJt0p/C7HK/pgDFgwa5MQhmDU4O3B4krZ2Q8H69IJsuXepFsE6ducjIK43laSeraxn62Vh7JHY2WKswap2cAHshv2+6RmdIAIBwZEuwMqcjesWMuNcixt50fOg3Fp3e6WMBXYK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2NlWk9ETUlBNzNXVVJ1M0xwZVFsUVo4V0V3OUJDRmU4dTF4MDFreHUvWUxV?=
 =?utf-8?B?SDVwaXl6eHB4QU42dWdzUExBRjBQQ3BOaGgwRmU4aEFMdFF6cU8vdGxXOFI5?=
 =?utf-8?B?ZENtOW9mM3JSbGxCZHA1elF6c3JjUllIbk1wMXFmb05yVUdNZzUwbDR5Ynli?=
 =?utf-8?B?cWkyeTZvM1JQeFA3Rkd4cVBvTE12dHh3Q3lqNnZ6ZUhaazlyMWJOalhJVkxC?=
 =?utf-8?B?UkdwazI5TENFcmY2VG50TnExdHpJY3A1cUtZVjMvcllrUGIwNXFVRkNRbzRr?=
 =?utf-8?B?Y2VMWGpsOHo4c0o0YXo5N1F5SVVDdTNZZGFrOXlFSHdheS9QZklMaXA0Y3Ri?=
 =?utf-8?B?QVhqeEdaRTVwdVFHYU9lM2VrUS9nMyt2NW5uckhWREJQNk15WVhuNFJqOG91?=
 =?utf-8?B?RVZScnhFamhHaWcyMWVCeWpwSnBMcUwwaDdxajVlSEpUQklYQjVLSjR6Y2d3?=
 =?utf-8?B?RDBZRlRQSE84VG8vS1pjQ0ljN2pwM0tLd0c0ZVBiRGluUFBERVE4L3A4Q25t?=
 =?utf-8?B?WGRFRHcyUGlYNmcyRUdqVmRjRWNtMDJpcVpZcWRyeFhvcjExWlJBaDJxcWdG?=
 =?utf-8?B?bVRNUmNNRjkxbWFrZktUZGJibFloL25pM1dsbmgzaWlITXdUQWN4YnlMODJp?=
 =?utf-8?B?bmRQUExFRHVMak9CSGFHOU9pTW1aQnY2Ulp3STJrdEpuQk5wM0FxNkw0NXhk?=
 =?utf-8?B?MEZyYXd0UzJYOE9vWnRxNGNmQWU1alZxaUYzankvK2pybnBaNUxCVjgxZldB?=
 =?utf-8?B?Mkc1MU5VdGh1SHdvNGFHYkFmTElCM1lXakZGUVFsQ080V2loanpUS3d1UXBs?=
 =?utf-8?B?eHJTeTlYeTRRRzFBNVFHejUzd2g3MTRVOTRXdU9ha3lrejcrMUovN0lhQUkx?=
 =?utf-8?B?N2ErWC9XNXB1eXg3amttdlVHeExVZDRpSWkvUHk0bWYzS1J1M3hxaVYyc1Iv?=
 =?utf-8?B?cDBsOTYvdzdGWFFoaFNLcXFJbVlxK0VCTnY3YUUraXVUYkRPRzhGL29XblpQ?=
 =?utf-8?B?N0xVSmN6eitNOXA1QkExVUtVN0dET1AzNUtGdzl0RnZNVXBDakJRT3pwV0wr?=
 =?utf-8?B?UDlwcG5NbUpNREpYYWRIRHdVYWhWOFVCMVppZnpZbmEyeENLSDlNdGduVzNJ?=
 =?utf-8?B?YWp1UHRiM0RCVmRNT2lDMG4zdCs5Y0tLRHpOWkVKUE5jRW1uT3JHdGZISG1z?=
 =?utf-8?B?eHdvTHAvb3ZpUHdYWlVYNFh3Lzd2cVUxREdhUTUyYTFoM1cvQlppMGhreEpP?=
 =?utf-8?B?MjZwbnlkSWU5a0liUjhUVDlQaVVmNW5PSHFZdVdXdDVBSWZsbzk2Y290cEFT?=
 =?utf-8?B?N1IwVFhuZlcrY2svcndNWWNnV0VKUXc1SU95UEJpbW9xdjJZMGhOelA4SDAr?=
 =?utf-8?B?WWw4NXBoZGRVYTVBZ1pvUVZCTWF0QTg2R1ViNjdxam9TOERoNDFUOWJCZE54?=
 =?utf-8?B?R1phc1RBNXJWYitDbmxZWmFDeFk4bFVYa2ZVekQ4RVFFc25qWFRUMnBEV3Bm?=
 =?utf-8?B?OUl2V0pCUDlFSkZQQ1R5Z1B0bzI3eHcxRjVNTGZlTHY0ZEVFdzNBL1FQWkl5?=
 =?utf-8?B?WWRXUmRFZnFuSW0zOUhTdWdLTDVINWJLbHZraEduQk53dy9jOVJ3NkVZbWhs?=
 =?utf-8?B?czVUU3ZtNEJ5cGJ4ZmcwV3Rlay8vZDNJSUcvY01hVnl3R0RiU2NLbDhRNVRx?=
 =?utf-8?B?aW1NcVcybVlwbzgvNWQ0VUVtVndlU1g1L3pOejRZMDROU0d6a1M5Y1pPN0dv?=
 =?utf-8?B?QnhCZks1ZDd3MzhUMzM2WWtmOXRzRGdzSU5PNllMWVpXdi9FQ05RVUFiZ0gw?=
 =?utf-8?B?T3BuMnV1R0d2M0NHNzVOeGYzdWZNNS8rMGhSOTcyMUc2bCtRSUNobkpkcU9C?=
 =?utf-8?B?Nm9HdDRhTGFSVWU3ai9tT25TU1gwbFFMVi92eEozcExJQmlMVzJIVXI1V1Ax?=
 =?utf-8?B?RXBLcWFjZVhIdW4zYmdZNXlaSStmaitCNWVhbGo5VytQSXpBV01tYmZRUUlu?=
 =?utf-8?B?ZHFtT2lnRFBaeDZwb3pGSW92bHVyUytuV1BlcGlzaW1tNlJJOXRMKzBiRXpQ?=
 =?utf-8?B?eHhzdE13RHgwOGpTTDZFMyt5cFBoVE5QOFp2dnZBejhjUE5uSm94Zm40U0c3?=
 =?utf-8?B?dkNnbmRyeE5FU1BDUGMxL2lHcEJzbzloSE1xc01DOGV1d1dXYzlibTZRSDBs?=
 =?utf-8?B?NlVERWNhWDIvOUNOUmwyZUVWZEVyTlNBYkxIZ3BWblE1OSt5RjJmT3lHN2py?=
 =?utf-8?B?aGRGOXA4bUtxR2FzMXdSSlcyMEdoUTRRQkQ3VW5RTmRHamRodGZpemoybWVB?=
 =?utf-8?B?OG1GaHFCRWRHSCtXdjI3M0pHOExJNklobnE4cExZTklaeG9qWDlPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: STWH6q3r6BTR93uBcjAKNn8p43qtODB/5ZGdQh0dTfqrLcQlJDuEoFUp+Xs3V3CGPAPuoq1H81nUfPGfIS9iAdLCc7f77ch0sfS7Hn8fhV9aiDb7IC7Vz8jad/tBh6G8SrFKh5RIu5s2F6kbSiVC92uptJRe3KxaSk6SLOrQH8kx1VBE4j81kagtcZ2+iWQhmlEbWK0fD+vfZRLsTb6Gx7I5XSW0EDa1+0VnHHNTzEtvHFpEolnZSfmHoKziMKI6ZRkBd0TSnCDo2Mx6GyqKaShuaUcyiOg4jStD1v70f4QiFYn+KIcAHYvbTbMKlAudRecaC8q2XBkttANVH/7s7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a492be21-35b6-4d27-dae9-08de903f99c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 22:39:57.0127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MhT7fBIQV/8U1MAtZU5tQIX2eyVlDaK5c9hoM2gug9hxKUKXuh0yUYV2zkJFP+b5EaOzoyLvvDk0TI2Uq43djQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
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

T24gV2VkLCBBcHIgMSwgMjAyNiAxOjEzIFBNIE1hdHQgUm9wZXIgd3JvdGU6DQo+IFRoZXJlIGFw
cGVhcnMgdG8gaGF2ZSBiZWVuIGEgc2lsZW50IG1lcmdlIGNvbmZsaWN0IGJldHdlZW4gc29tZSBj
b21taXRzDQo+IHVwZGF0aW5nIHRoZSB3b3JrYXJvdW5kIHRhYmxlcyBvbiBYZSdzIC1maXhlcyBh
bmQgLW5leHQgYnJhbmNoZXM6DQo+IA0KPiAgLSBDb21taXQgYmM2Mzg3YTJlMGMxICgiZHJtL3hl
L3hlMl9ocGc6IEZpeCBoYW5kbGluZyBvZg0KPiBXYV8xNDAxOTk4ODkwNg0KPiAgICAmIFdhXzE0
MDE5ODc3MTM4IikgZnJvbSB0aGUgZml4ZXMgYnJhbmNoIG1vdmVkIHRoZSBYZTJfSFBHIGluc3Rh
bmNlDQo+ICAgIG9mIHR3byB3b3JrYXJvdW5kcyB0b3VjaGluZyB0aGUgUFNTX0NISUNLRU4gcmVn
aXN0ZXIgZnJvbSB0aGUNCj4gICAgZW5naW5lX3dhc1tdIHRhYmxlIHRvIHRoZSBscmNfd2FzW10g
dGFibGU7IHRoZSBlcXVpdmFsZW50DQo+ICAgIGltcGxlbWVudGF0aW9uIGZvciBhbGwgb3RoZXIg
cGxhdGZvcm1zL0lQcyB3ZXJlIGFscmVhZHkgcHJvcGVybHkNCj4gICAgbG9jYXRlZCBvbiBscmNf
d2FzW10uICBUaGlzIGNvbW1pdCBvbiB0aGUgZml4ZXMgYnJhbmNoIGlzIGENCj4gICAgY2hlcnJ5
LXBpY2sgb2YgY29tbWl0IGUwNGM2MDllZWRmNCAoImRybS94ZS94ZTJfaHBnOiBGaXggaGFuZGxp
bmcgb2YNCj4gICAgV2FfMTQwMTk5ODg5MDYgJiBXYV8xNDAxOTg3NzEzOCIpIHRoYXQgYWxyZWFk
eSBleGlzdGVkIG9uIHRoZSBuZXh0DQo+ICAgIGJyYW5jaC4NCj4gDQo+ICAtIENvbW1pdCA1NWIx
OWFiYjZjNDQgKCJkcm0veGU6IENvbnNvbGlkYXRlIHdvcmthcm91bmQgZW50cmllcyBmb3INCj4g
ICAgV2FfMTQwMTk4NzcxMzgiKSBhbmQgY29tbWl0IGMyMTQyYTFhODQxNSAoImRybS94ZTogQ29u
c29saWRhdGUNCj4gICAgd29ya2Fyb3VuZCBlbnRyaWVzIGZvciBXYV8xNDAxOTk4ODkwNiIpIGNv
bnNvbGlkYXRlZCB0aGUgaW5kaXZpZHVhbA0KPiAgICBlbnRyaWVzIHBlciBJUCBnZW5lcmF0aW9u
IGZvciBlYWNoIHdvcmthcm91bmQgaW50byBzaW5nbGUsIGxhcmdlcg0KPiAgICByYW5nZS1iYXNl
ZCBlbnRyaWVzLg0KPiANCj4gRHVyaW5nIG1lcmdlIGNvbmZsaWN0IHJlc29sdXRpb24gdGhlIFhl
Ml9IUEctc3BlY2lmaWMgZW50cmllcyAoaS5lLiwgdGhvc2Ugd2l0aA0KPiBydWxlICJHUkFQSElD
U19WRVJTSU9OX1JBTkdFKDIwMDEsIDIwMDIpIikgd2VyZSBhY2NpZGVudGFsbHkNCj4gcmVzdXJy
ZWN0ZWQsIGV2ZW4gdGhvdWdoIHRoZSB0YWJsZSBhbHJlYWR5IGNvbnRhaW5zIHRoZSBjb25zb2xp
ZGF0ZWQgZW50cmllcw0KPiB0aGF0IG1hdGNoIGEgc3VwZXJzZXQgb2YgdGhzZSByYW5nZXMuICBU
aGVzZSByZWR1bmRhbnQgZW50cmllcyBkb24ndCBjYXVzZQ0KDQpzL3Roc2UvdGhlc2UNCg0KPiBh
bnkgYnVpbGQgZmFpbHVyZXMgYnV0IGRvIHRyaWdnZXIgYSBkbWVzZyBlcnJvciBkdXJpbmcgcHJv
YmUgb24gQk1HLUcyMQ0KPiBkZXZpY2VzOg0KPiANCj4gICB4ZSAwMDAwOjAzOjAwLjA6IFtkcm1d
ICpFUlJPUiogVGlsZTA6IEdUMDogZGlzY2FyZGluZyBzYXZlLXJlc3RvcmUgcmVnDQo+IDcwNDQg
KGNsZWFyOiAwMDAwMDQwMCwgc2V0OiAwMDAwMDQwMCwgbWFza2VkOiB5ZXMsIG1jcjogeWVzKTog
cmV0PS0yMg0KPiAgIHhlIDAwMDA6MDM6MDAuMDogW2RybV0gKkVSUk9SKiBUaWxlMDogR1QwOiBk
aXNjYXJkaW5nIHNhdmUtcmVzdG9yZSByZWcNCj4gNzA0NCAoY2xlYXI6IDAwMDAwMDIwLCBzZXQ6
IDAwMDAwMDIwLCBtYXNrZWQ6IHllcywgbWNyOiB5ZXMpOiByZXQ9LTIyDQo+IA0KPiBSZS1kcm9w
IHRoZSBYZTJfSFBHLXNwZWNpZmljIHRhYmxlIGVudHJpZXMgdG8gZWxpbWluYXRlIHRoZSBlcnJv
ci4NCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9r
ZXJuZWwvLS93b3JrX2l0ZW1zLzc0MzMNCj4gRml4ZXM6IDE3Yjk1Mjc4YWU2YSAoIk1lcmdlIHRh
ZyAnZHJtLXhlLW5leHQtMjAyNi0wMy0wMicgb2YNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS94ZS9rZXJuZWwgaW50byBkcm0tbmV4dCIpDQo+IENjOiBEYXZlIEFpcmxpZSA8
YWlybGllZEByZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPg0KDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWljaGVuZyBMaW4g
PHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3dhLmMgfCA4IC0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV93YS5jIGluZGV4DQo+IGMzZmVmOGZkNzNmN2I4YzA2NGRjYWI3OTIzNWEw
ZTRlNGQ0ZGMwODYuLjJlYzcwYmU3OGJmOTBhMjUyZTc1MDMNCj4gYmVjMjE5NTQ0Mjk3MjM4NGMy
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiBAQCAtNzUxLDE0ICs3NTEsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVM
RVMoR1JBUEhJQ1NfVkVSU0lPTigyMDAxKSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAg
CSAgWEVfUlRQX0FDVElPTlMoU0VUKFdNX0NISUNLRU4zLA0KPiBISVpfUExBTkVfQ09NUFJFU1NJ
T05fRElTKSkNCj4gIAl9LA0KPiAtCXsgWEVfUlRQX05BTUUoIjE0MDE5OTg4OTA2IiksDQo+IC0J
ICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAyMDAyKSwNCj4gRU5H
SU5FX0NMQVNTKFJFTkRFUikpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFhFSFBfUFNTX0NI
SUNLRU4sIEZMU0hfSUdOT1JFU19QU0QpKQ0KPiAtCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgiMTQw
MTk4NzcxMzgiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIw
MDEsIDIwMDIpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9O
UyhTRVQoWEVIUF9QU1NfQ0hJQ0tFTiwgRkRfRU5EX0NPTExFQ1QpKQ0KPiAtCX0sDQo+ICAJeyBY
RV9SVFBfTkFNRSgiMTQwMjE0OTAwNTIiKSwNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19W
RVJTSU9OKDIwMDEpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+ICAJICBYRV9SVFBfQUNU
SU9OUyhTRVQoRkZfTU9ERSwNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMzVkYWQ4OTJlYzg3
ZDQ0ODM4NGY0OTJiYTA2MWQwZGE3ZTM3MTBhNQ0KPiBjaGFuZ2UtaWQ6IDIwMjYwNDAxLXdhX21l
cmdlX2NvbmZsaWN0LWNmZWE1ZGNjMjdiMA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBN
YXR0IFJvcGVyDQo+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+IExpbnV4IEdQVSBQbGF0
Zm9ybSBFbmFibGVtZW50DQo+IEludGVsIENvcnBvcmF0aW9uDQoNCg==
