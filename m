Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A877CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 18:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5610E49B;
	Mon, 10 Nov 2025 18:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSgy5YEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC5710E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 18:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762800527; x=1794336527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W8LxXltFagSVbSzO0ovCb+F1Gs4ctHyO3FBL2nROru0=;
 b=FSgy5YEUFFAZEf0Ha2TJxdxPGBmXpgtwbz/nTcYehjZNaIJVpbBl8GUr
 GRsrSIWjcAvK9hT25zFpQiMtt0AP7Yv97mLosLgGMgbPKuYeYGsbSctgs
 4Vb/xpDz+3Ea3wJ/mTVtI9Aipp1JaBq9j+AFNZHkcdY310Y4kCjWAynjo
 3EeDT+SDvnyzfPQ2EZrcEgVq/sxcGpZjH4BwkwoTL+WJGdAk8HEROurVU
 WxA+Eqx5DK5OiggxjHQ9zY8Hq2YoRyUMyKJ5ANslBjBnLPT6/8F5zGRml
 ofZQXXWxP9CoJhGnu6J5lC3auY9S40tMXIt7ZPR2smGMwN4s6MHdjFUEw w==;
X-CSE-ConnectionGUID: mWVSMlDISDCge2OA2Qf0Ww==
X-CSE-MsgGUID: JPD6r7OwSD+DQ7795vvBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76204759"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76204759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:48:46 -0800
X-CSE-ConnectionGUID: 41mCZ6RDSOmUyz/pzYwn3Q==
X-CSE-MsgGUID: ERTbVBT/TuCfStt9XZFYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188001341"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:48:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:48:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:48:45 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:48:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eceTqxNG7K170PIo1+wvrGZ3hOkBrVrEUYp2J5IHwKDgl2KyOOShZzsTXwu/ea9VNNydJxYZa+YM/HPhocfkEGn02VmToceCP7yG2utlbYPPjKxj5zmA30rXfaqWJUnFVsCAKh5qhdpQBlXUnMo2wybM+vQL4sRadQPwwGhSHCY/Z+Jm+w+FuPVY0aeFNprNUcHN5Z9ojR+i8b2KFJm4Jutec/i5tfsUL7K/w3dtaP3/aSeB75vqPsgSDbtq68kZp+BFYWB0l7iUJXT0s3180JMmKLkB/x6cqAaJJn0+XKH4coneLiAAVCQ2NHajBAQKPNlB3CBFl+Lc13B7ZLqykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8LxXltFagSVbSzO0ovCb+F1Gs4ctHyO3FBL2nROru0=;
 b=E3ilSVtM4dRa0H1kIVvuLymJkNsPojRgEf+cTVzRA+ycJCpNyfGiJySMdGH5ObJXyeN5pmK/iVty2TeZz9IqarFsGSyZttX0YTWdZc3A4Yy/VyKpnKs/pkr3qU2c+Wc4poSjLKmlCpeRh7K90jlbvL8aqh3bzu+MTrrXc8xrdqRDepI4/nNN6Xv/R5ZJCtoD3aCOqd4A5PL084Zv7rO89vlAFeoVJGOSUJntRwz11cLZeFoYA/WixjNSBPc2lk7Cb5V4nlx9NPySBhBu7LqS8KhkX6jQn5GLhvSBe/BkX8bAMF1xdEEqnAxvtyw0Ach0gHyXSI4cowQnaws8j3Qvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:48:43 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:48:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 09/12] drm/xe: Add xe_tlb_inval_idle helper
Thread-Topic: [PATCH v2 09/12] drm/xe: Add xe_tlb_inval_idle helper
Thread-Index: AQHcTcUgntLb7SWKgUK+doFkPrV7/7TsSbmA
Date: Mon, 10 Nov 2025 18:48:42 +0000
Message-ID: <2bf02520f70c3068b19fea9bac1bb0a289f965ad.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-10-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4942:EE_
x-ms-office365-filtering-correlation-id: aee6331e-f08c-4f83-53b3-08de2089c57b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bVFTSkdHakxnS0piOXJGQitvRWZINExEbVdZSWJ0bTlhTG5LTkNDd25pRDk4?=
 =?utf-8?B?TTlvdXdOVTBaNWEvZ2xGM3BzbGoxRld6VTJLV09OYmp4LzlQYldxUGFwY1Qy?=
 =?utf-8?B?UFlWQmNnS09VNVY2OXdSVW9CbUl3VDlIVHFuQzROeWh2SDFvQUtHUmd1R2NZ?=
 =?utf-8?B?eDNXL2NlY1dwM2NUVWV3T29kNGkxdVJXQUpyODJDdCtnMjR5VWdLcWxJWWxZ?=
 =?utf-8?B?N3NXR3k2WTlLWXRCRldySW9MamZzTWlCcEs5VlVpUGY5WUxraTdZZ3duL21L?=
 =?utf-8?B?Y0JHSzN1a1RTL3dtWjBzV3IxbGR2TVI0aStDMU9FWGQ5dDJrSS84S1poWllh?=
 =?utf-8?B?UFhnNkdOVjNPNkpMMFRsNmhobGdaYU9JbXdWeDhrK3RUUTdoMFFqbEU0cjhB?=
 =?utf-8?B?VlBXNDZKSUM2aEY4RFRyMXVjTjRKSmJvM3lWUHZKMjMxOWJ5U3MxNDg0K2dY?=
 =?utf-8?B?Sm0zODNHZm1INnJtM0RkSjRuT0tuTXYyMkVCVjZmWDdwMTBCZUU4U0RyN2Vn?=
 =?utf-8?B?QWRlTWx3cEp6NzVieUxLVVV2ZzhldkFCa1ZhSWl1NjF4bVkrTFlFaUZMMDA3?=
 =?utf-8?B?ejdlblJicktDZHRhdVo1OUV4ajR6STQ0QjlEb1ZBb2k5d0ZsV0k0TXEwREhX?=
 =?utf-8?B?TUE3Nkt3a0J2YnJFdjRydjJ0RVlaL3RmNVZyNitkZk1jSFJWS2cvZGt0NVMr?=
 =?utf-8?B?bDNBcFNvNVBVbENQTWtjby82YTlxdlN3NHJzNFBuZVNleU9zaytDYnE3TERY?=
 =?utf-8?B?b1d1OG5MVjVoRDJDNnBoQlkyYVM3RVRTM1J5RFRQTVZ3WVZaVUYxTzNVa0FW?=
 =?utf-8?B?R1dJYW16Rzd3QnpXQXlXeFhBYlFpYUYxeUkraDBXRXVsTmk3Um12MVhPeXUv?=
 =?utf-8?B?elcvVmU5OThseFVGVEFXM3I0OCtXRHAxeTVIRkR4MmJHMDJSSHkzT1ZlT1JO?=
 =?utf-8?B?OGVuUHlxVThhY013a2tjV2twWnBxa3g5M1hJRDdQTy92ZDBMQlBQZHpabngx?=
 =?utf-8?B?V3J0bnkxNWZGdzIzMGJ2aTVHeFBSKzk1THZ2eWN0OFJuNVJFWk5tbnc1dDZW?=
 =?utf-8?B?V3pmQnhyQStrVHJzUHVqdm9Kbjd6SkJXRjFDYXJBZ0pXeVJxZEZvZ3cvM1R1?=
 =?utf-8?B?cllNRnJpV3FudG0wSHB0K0taMHVNcGNoV3E4aDByUkZ2WnViYzQ5SXF5aHMy?=
 =?utf-8?B?UHZnSFAwZm5yL2xzVnVsZFF5UWQzRTQ1Nkt6c21pMlgrZldlYmNaaU5Uc29n?=
 =?utf-8?B?VTdISngxd0ZCc0FQUDZWVkdiQjdxZzJwMDNTYmpZM0hiNG1ZeVVFWHk5WGU4?=
 =?utf-8?B?TXhGSmNMZUFDYithckxNWFVUNE1nbm1BaXduUXd0YXNicW5YZW9Ea2JYcTQ1?=
 =?utf-8?B?a2VEZm1McCsvdmFaVnJrbkRLZUlsL25sdXNIWUlDVlBOZU4rTVdSVnlPT0I1?=
 =?utf-8?B?MjhpZUU2cHBKRWJTZkdKQ2R4Q3BhLzlCaVdlZElpUUdManFKTGJTK1Ayb0Zl?=
 =?utf-8?B?TDZaNG9abDlJM2JlSkExTkxhakNVakRrdzJrQllibXUweU1GejZnOHRzY3lW?=
 =?utf-8?B?MjI5UU1QUFhjbVdrN3N3ZmpqalRQVm1xT1NZQ1owamJuN3J4SVV2L3dDS0Zx?=
 =?utf-8?B?MHJnRG9BdUVydnBVRFBnbVlBdlVYSmRMU05zQ0JaWkIrWVlDUFFQTnBSaGs1?=
 =?utf-8?B?bWYyZjVjTmdod0FGL20zRDlVRjBjcnV1cks3MFpMSjhyZUtqS2FSaExIMExs?=
 =?utf-8?B?aW9CazZWT3JvMVk1UmpPSEM3a3pNSWpSRFB6TDdmRVlEbXVqREtDS1oyaCtP?=
 =?utf-8?B?dUR4OHF1cW16NVc0ZExBOXFqb1Y0TFI5YUhKVVgxZ1dRQm5hN2JHZWIxNWo3?=
 =?utf-8?B?NHdGUWZKdTZkYTZCc2Z3OUxGV0kwZCtGb1FUd1ZYcHlIeUdLczl0NXNQckRS?=
 =?utf-8?B?K1N5T3NOcjNTRHpHZXVPN2JBY2VPeEliampQdmJ5aUdCVU5sYW4yalkzVGhK?=
 =?utf-8?B?Z3JxN3Jna2hpeEhkM1d0dmlId3pmZ01RRTc5L08rNXc4UlpsSFNlU1ZOVkd1?=
 =?utf-8?Q?9OWZ30?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk1DMnZndkx6WFpKRDFSRlZ4NW1TdVZOYldIVWhnUmxBWHRWNER5RCtFU0U3?=
 =?utf-8?B?Q2ltVkJ3UmpoYnplZjF2T0premd4SnNYMDBDVkYweVQ5WlFCb3ZiWHFkZTZp?=
 =?utf-8?B?UlVhbGVvbXEyRjFSUEZYdjZpbUo3OEV2Skd2Znd1aUZNZzd4dWhiMlNJUTFx?=
 =?utf-8?B?VStMdlFLcjI2ODJEMTFaanFWTENRdlhNMzk4MmE2blZyUE1VWUZXeU9pS0VF?=
 =?utf-8?B?RGdrekNVd1RwY0VhbEFuY0lWRERROTdoZ1BxblJSbkhlMTVHT0dRU1l0clhR?=
 =?utf-8?B?cUY2Qk9jcVZqRTlidGtGRk5WR3R3R0RlNm1WV1kxNXI2Z2VzUDQ4Y2pMVWZ4?=
 =?utf-8?B?aUFBTUhTY3BJakZyQkI2T2hHUXZmYVZoMGluSnRLck5ERjlVeVRiTm9tSEoy?=
 =?utf-8?B?eUdtZk1WMldVd1F0aUVPZ0MvOGsrajNQellXeTdFZW1GUFVudUxnNVJWcjZU?=
 =?utf-8?B?R04wWnkzSGJYODBQc0ZNVGIxWEozZmxoREVoNkloMk5kdjZsYW4xSnYzVUlJ?=
 =?utf-8?B?S2hyNGs2TEh0bkxTRURPWGo2YjR3WmNaMGVrakdQY01XdHdtaFIwVS9VbjdX?=
 =?utf-8?B?eW1pZkNoZ3ltSW9pZU5iR3FraHhnOUNyRnJKeHE0b1RIeERLUnpXV1Bud1hk?=
 =?utf-8?B?UUwyYzk3eHA5b0V4NGVVTUFPYnpCUXFVcjRSc05CUm41clYyMkdOUzlZemxS?=
 =?utf-8?B?ZGh5VkxLMTdDb0ZlTmltREZ5bzZkUGpDM2E1MzhWZWxJMGJsT08zVm00SnR1?=
 =?utf-8?B?bVdmb1lYRHZhV1d5TEl3Z2tNaDFLSmNYODl1bVlUS29Jem5tcTBqMmVBUlYr?=
 =?utf-8?B?S1VqVURsRi91VkF6N2IyQit1b1hzTTBacjBCd2s3UVI0OEwraW9yL0psVzdt?=
 =?utf-8?B?TUZjaGJjVFhsd2ZoQnd0ampFOXBuREVjNkdpOVgrZ2pIbHpvejdTSFdaZjg0?=
 =?utf-8?B?aFVDN2xjYlNYZ1Q4NzM5UFExeWhqc1JxVi9acXpWMit6TDRYOEVqZkN2QkVr?=
 =?utf-8?B?enNqZ1QvZFhVUG42ZnVmUzd5am9Ra1Y1cjlpL3ZPYVM5NXJJaXRBNEZFRWxG?=
 =?utf-8?B?SzVBd1Fkc3FrUE5KN1FaNXBqbGhNNDJqYzZ2aHhMNjZYV3BKY2JBNDczMU5P?=
 =?utf-8?B?VFNSVWcxMXNrbTdsbWdQL1NOVlAwZFFWTXZoUnNiQzF0ejNrcjRQTHN4Nnh1?=
 =?utf-8?B?NmpHNCtHSGF6YnpUd0grQzVpK2orSDhYcGFSaXVQSGtpUHBNUkE5QUpvMFIy?=
 =?utf-8?B?NWhCeEFwVWY1RDdLaGwxdHdzdXNOYXUyNVRVWXVvbnBrY3VwYXY5VVI2Wnkr?=
 =?utf-8?B?U0JKVURUejl2LzZ6NTBuVmlYTWFwb2VSNHZwQWordUdHbHJHWElrM3FGZEQz?=
 =?utf-8?B?V2lBMVRPZ0V5MUJsZ2t6NVI0TkxWMVN2MGFzaTl2RUVHSklObVhwbW1JZkhU?=
 =?utf-8?B?S1FGMmF2eW53cXlhZkU2YUJXNktGMVNUR3l0SmNKR0luUWNNUk1IS0oxMmsy?=
 =?utf-8?B?Y3JsNFdnUElmYWU5WTh1VWh5c1RQRnVSczV0QWxZS3JFUXhnN3dMbExiQ2lt?=
 =?utf-8?B?Mm5GeEs4RXNhQW9uSmJ0UktlRnBoNmRBWFhWTFVuZlJqRXQwNGxncEN2blIr?=
 =?utf-8?B?RjFaMDlDQ0hQY1NPenVKN0wrejFrVlp0a0kzSzBuSjI4WDRLV2UrbHp2K3Bu?=
 =?utf-8?B?TDgvSmVsejA0dkZla1pudkZPTnowS2xTUzdQbHdpMi8wMkVjTEN6REhTRHRJ?=
 =?utf-8?B?TUdkbDZVVjR5cko3cDBJOFVuM1d2RUlSaHRhRWRKeFIxRGUyc1c2eXg2b2JI?=
 =?utf-8?B?S1Q1ekxHNVFOdDdBK2JObDF6ZzFnQ0lRQ1NCN0I2N2ZpVUROVzRBd2RFY0VL?=
 =?utf-8?B?THRUbzNTTnJYbGIvZXBCVXA2NlZHbnk4aEFjZld2RmVVMnZqNFVWa3l0a0d1?=
 =?utf-8?B?VG1jWDN2SklEdWdnWFQyV2tWTDRCZjd5UUhlQ09oVlhEV1lhalJBY0ZqSW1j?=
 =?utf-8?B?TmoxL2ZYbXhoVFZrWHgveUR3WVRuaHVLOFZYMk56N2VzbnhveGRvNmVaVWdG?=
 =?utf-8?B?RjVOaGQvOE9Zak1LOFcrVS9wQjNyUWpsNk5OMUdqR21jeVJodC9TUnNtTmc3?=
 =?utf-8?B?NmlxK241WFJvdEJYbFdEUFE0TWNuSlFHVlVNczdQT2gxaWtDMGtrTnFuaWtn?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F85D7AAB95DF4D429EC4A388B1C1DD88@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee6331e-f08c-4f83-53b3-08de2089c57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 18:48:42.8547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOpwemtIajufQes/4jmIYO+T62OY+U3znFxatsMF3snuPzqKWDpnnyYqA/UmHHtSHOZ9aXKN8VU5ZEJFv0I101z22HDlUW581svMUN5zAmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBJbnRyb2R1Y2UgdGhlIHhlX3RsYl9pbnZhbF9pZGxlIGhlbHBlciB0byBkZXRlY3Qgd2hldGhl
ciBhbnkgVExCDQo+IGludmFsaWRhdGlvbnMgYXJlIGN1cnJlbnRseSBpbiBmbGlnaHQuIFRoaXMg
aXMgdXNlZCBpbiBjb250ZXh0LWJhc2VkDQo+IFRMQg0KPiBpbnZhbGlkYXRpb25zIHRvIGRldGVy
bWluZSB3aGV0aGVyIGR1bW15IFRMQiBpbnZhbGlkYXRpb25zIG5lZWQgdG8gYmUNCj4gc2VudCB0
byBtYWludGFpbiBwcm9wZXIgVExCIGludmFsaWRhdGlvbiBmZW5jZSBvcmRlcmluZy4uDQo+IA0K
PiB2MjoNCj4gwqAtIEltcGxlbWVudCB4ZV90bGJfaW52YWxfaWRsZSBiYXNlZCBvbiBwZW5kaW5n
IGxpc3QNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPg0KDQpJIGRvbid0IGhhdmUgYW55IGlzc3VlIHdpdGggdGhpcyBwYXRjaCBvciB0
aGUgbmV4dCBvbmUsIGJ1dCBJIHdhbnQgdG8NCmhvbGQgb24gZnVsbCByZXZpZXcgdW50aWwgd2Ug
aGF2ZSBhIHdvcmtpbmcgc29sdXRpb24gZm9yIHRoZQ0KcmVnaXN0cmF0aW9uL2RlcmVnaXN0cmF0
aW9uIHBsYWNlbWVudCBvZiB0aGlzLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiAtLS0NCj4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmMgfCAyMSArKysrKysrKysrKysrKysrKysr
KysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmggfMKgIDIgKysNCj4gwqAy
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dGxiX2ludmFsLmMNCj4gaW5kZXggN2VlMDgxYjk0ZjkwLi43YWU2YjlmODg0ZTkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmMNCj4gQEAgLTQ0LDExICs0NCwxNCBAQCBzdGF0aWMg
dm9pZCB4ZV90bGJfaW52YWxfZmVuY2VfZmluaShzdHJ1Y3QNCj4geGVfdGxiX2ludmFsX2ZlbmNl
ICpmZW5jZSkNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoHhlX3RsYl9pbnZhbF9mZW5jZV9zaWduYWwo
c3RydWN0IHhlX3RsYl9pbnZhbF9mZW5jZSAqZmVuY2UpDQo+IMKgew0KPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwgPSBmZW5jZS0+dGxiX2ludmFsOw0KPiDC
oMKgwqDCoMKgwqDCoMKgYm9vbCBzdGFjayA9IHRlc3RfYml0KEZFTkNFX1NUQUNLX0JJVCwgJmZl
bmNlLT5iYXNlLmZsYWdzKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0
X2hlbGQoJmZlbmNlLT50bGJfaW52YWwtPnBlbmRpbmdfbG9jayk7DQo+IMKgDQo+IMKgwqDCoMKg
wqDCoMKgwqBsaXN0X2RlbCgmZmVuY2UtPmxpbmspOw0KPiArwqDCoMKgwqDCoMKgwqBpZiAobGlz
dF9lbXB0eSgmdGxiX2ludmFsLT5wZW5kaW5nX2ZlbmNlcykpDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjYW5jZWxfZGVsYXllZF93b3JrKCZ0bGJfaW52YWwtPmZlbmNlX3Rkcik7
DQo+IMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV90bGJfaW52YWxfZmVuY2Vfc2lnbmFsKGZlbmNl
LT50bGJfaW52YWwtPnhlLCBmZW5jZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV90bGJfaW52YWxf
ZmVuY2VfZmluaShmZW5jZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2Vfc2lnbmFsKCZm
ZW5jZS0+YmFzZSk7DQo+IEBAIC00NDMsMyArNDQ2LDIxIEBAIHZvaWQgeGVfdGxiX2ludmFsX2Zl
bmNlX2luaXQoc3RydWN0IHhlX3RsYl9pbnZhbA0KPiAqdGxiX2ludmFsLA0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9mZW5jZV9nZXQoJmZlbmNlLT5iYXNlKTsNCj4gwqDC
oMKgwqDCoMKgwqDCoGZlbmNlLT50bGJfaW52YWwgPSB0bGJfaW52YWw7DQo+IMKgfQ0KPiArDQo+
ICsvKioNCj4gKyAqIHhlX3RsYl9pbnZhbF9pZGxlKCkgLSBJbml0aWFsaXplIFRMQiBpbnZhbGlk
YXRpb24gaXMgaWRsZQ0KPiArICogQHRsYl9pbnZhbDogVExCIGludmFsaWRhdGlvbiBjbGllbnQN
Cj4gKyAqDQo+ICsgKiBDaGVjayB0aGUgVExCIGludmFsaWRhdGlvbiBzZXFubyB0byBkZXRlcm1p
bmUgaWYgaXQgaXMgaWRsZQ0KPiAoaS5lLiwgbm8gVExCDQo+ICsgKiBpbnZhbGlkYXRpb25zIGFy
ZSBpbiBmbGlnaHQpLiBFeHBlY3RlZCB0byBiZSBjYWxsZWQgaW4gdGhlDQo+IGJhY2tlbmQgYWZ0
ZXIgdGhlDQo+ICsgKiBmZW5jZSBoYXMgYmVlbiBhZGRlZCB0byB0aGUgcGVuZGluZyBsaXN0LCBh
bmQgdGFrZXMgdGhpcyBpbnRvDQo+IGFjY291bnQuDQo+ICsgKg0KPiArICogUmV0dXJuOiBUcnVl
IGlmIFRMQiBpbnZhbGlkYXRpb24gY2xpZW50IGlzIGlkbGUsIEZhbHNlIG90aGVyd2lzZQ0KPiAr
ICovDQo+ICtib29sIHhlX3RsYl9pbnZhbF9pZGxlKHN0cnVjdCB4ZV90bGJfaW52YWwgKnRsYl9p
bnZhbCkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGxiX2lu
dmFsLT5zZXFub19sb2NrKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBndWFyZChzcGlubG9ja19p
cnEpKCZ0bGJfaW52YWwtPnBlbmRpbmdfbG9jayk7DQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBs
aXN0X2lzX3Npbmd1bGFyKCZ0bGJfaW52YWwtPnBlbmRpbmdfZmVuY2VzKTsNCj4gK30NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBpbmRleCAwNTYxNDkxNTQ2M2EuLjQ0YTZkOTE3
NzQ4OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBAQCAtNDMsNCArNDMs
NiBAQCB4ZV90bGJfaW52YWxfZmVuY2Vfd2FpdChzdHJ1Y3QgeGVfdGxiX2ludmFsX2ZlbmNlDQo+
ICpmZW5jZSkNCj4gwqANCj4gwqB2b2lkIHhlX3RsYl9pbnZhbF9kb25lX2hhbmRsZXIoc3RydWN0
IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLCBpbnQNCj4gc2Vxbm8pOw0KPiDCoA0KPiArYm9vbCB4
ZV90bGJfaW52YWxfaWRsZShzdHJ1Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwpOw0KPiArDQo+
IMKgI2VuZGlmwqAvKiBfWEVfVExCX0lOVkFMXyAqLw0KDQo=
