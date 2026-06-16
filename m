Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA82CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9410E78D;
	Tue, 16 Jun 2026 14:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Meyt+k69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D516710E78D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781619198; x=1813155198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=73eXltGPtl4bhtjEMsIXyv/YhcPrFP+T2wBZ9sxWbAQ=;
 b=Meyt+k691ZnL4e/UrzJ6r/PS8U65JFOdsaE+rVrCRORgjvuhzp/iP/PB
 dmTZ2m4P/ftNMl5T57VQAq7IPyR3XmWhapWCBBuZhQq48jGU51lYEo+Uh
 9VUG8MwWLlUTUIuTbcoqYtSrWgM3JPiO+eU3wJGHZigHWe3Mz5yXQcT03
 2lJStosJ3g/+YMFPX30GGcmBHR8yJMR8t1lfDyUP4hQDBeRKahW7pe8/I
 Nj0ox7sL4WjEw4kcC6fzyYfhvsDILlUhqBx9Q+wh+VPEwlVy1Ckl34SVH
 IWUkXdDB+26+5SQfT0J3PxVPSN/Q+O0EhDWtzz3m8BatRTnSJYdN0ll7f w==;
X-CSE-ConnectionGUID: SYq5EwYERlydcRZnDSi58A==
X-CSE-MsgGUID: Q8ZjYXCBRyqqqeZbOyxp/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82449353"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82449353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:13:18 -0700
X-CSE-ConnectionGUID: Aco6v6ybQEG+OkzJ8Yax0w==
X-CSE-MsgGUID: HQOjya0xQNKaFc4cvrjAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="249677100"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:13:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 07:13:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 07:13:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 07:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8iXWTa7VAGK5yuVrt/Ela7AkUdKtDcBHq5Kx30YeQ/YSqQbz5Qv96+wh09pgI1QlIgcozEzW5AU3n+f32ydTaO4rGv4pOULIucE2z7nNu8Wq3mNfJQnNHeGUdYhafuh5Ugc/pQ0UisL30a7SQGX5JUi9DYqYQv8J/jL77RWMWzVijGPewlHJlXU2Ar7aSghgnF/1xwaDQRRfjL9balEMO1MZuu0rRMgJQ6t4uZp5tQ/9W3wABbfiZe2q9IdBZcJRgzGFH3KXpEUZS1vjIMzBumoaCA+1ufF6iYc759PNRf0L0ZczGyoVYOQuyaYaE5cfZBbrQZDEG7xxbXyAJjDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73eXltGPtl4bhtjEMsIXyv/YhcPrFP+T2wBZ9sxWbAQ=;
 b=Foja6/cBIgvs70WQVYwXVxEieM9tPH4ATLuqJWSDoz0j1GLILJClVfdAzPQoZMcMURKS7AGCzOqMnaDI7TvVedCwcqrzXeJpMx7Xl4xhybCxXPJVrRbOFLyVowBRZPfd9hyH28Mi130C4Sd+cn3Bdedb3Zdp8SZj0o5YbdvGZJ5fV67BB0J6mp0gjoTAZrvbIGwWJ2t7UKGrQsDaHLk9MKZx5ascK/S2JhDwa81wWPz/RV3epsyDWu0DXkwkpx9YMGkTMYTSLtuNarXdteuOph2NObc+bjrRhgCXQ+L71e+7xawMfwARP4BVL0tx6Zhx3XWRGCFiPWMWQBuDanlZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 14:13:13 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:13:13 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Topic: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Index: AQHc9Ohd4aB147kVh0i5geXs1PiRQLY0tXIAgACxLoCAAndIAIAAFI2AgAFFfACAADsSgIAGAZ+AgABF9ICAAAcPgIABiQBw
Date: Tue, 16 Jun 2026 14:13:13 +0000
Message-ID: <DS7PR11MB6271B548BC3BE5041AF386B9E7E52@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
 <aidgZ1zsihvCPGqq@intel.com>
 <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aimDM0CpapzxZP9n@intel.com>
 <DS0PR11MB871835057D993500ABBB8412811B2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <00f176c3886372ae78dee4e9afaf381d807e59e5.camel@intel.com>
 <DS0PR11MB8718748EA1D0F6FF531D469481E62@DS0PR11MB8718.namprd11.prod.outlook.com>
 <d7458e26ae9c92dc28224050d33e805b15261c67.camel@intel.com>
 <DS0PR11MB8718E4F20D772229A3A1156481E62@DS0PR11MB8718.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB8718E4F20D772229A3A1156481E62@DS0PR11MB8718.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|SN7PR11MB6827:EE_
x-ms-office365-filtering-correlation-id: df79cd7a-60a1-43a1-2395-08decbb16757
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: LlX37CfJeTruaDWpw7/wxIa2O2G73UZlSOn1jSEy2sDGHBeEUgfrcsHzoGjud2n6oTAti6FeuY8L7ZICvDgviXb62uUqTRbhWZ1vP9EaaRHhx/U5yWYT4Q2ubM5gwdGSnUHoh2PbOPHiehXosWgdSnK51qeh4yjEdoOs3Kif3a4nKCvPvW1d6uz1+wT0Wnh3RUlCO8BfMGW2sW6FSbxXbgqXtsWiZOoINYIg9yCn0i9lwZzN7oP1PgrSlEFenHZCm8JTOKhE6ylD6JDGMR/hc5P1QSDTaw4de8eIJntmWBv8sGgvXmGG6Bec8i6WPqAxCoToSc44DXyrsmN2zXFFQM1xbgwC1x9hddyXzFSQVV7HMMfN+mio9uLw2k6K4tXizkyUpRNd0RLu1r1w2QiPQo/WMgDu6mqfN8ypkzjT+hwZZ8GA4SeCcgHzmTsH1aHkfATeq9Gzgz+pl/bhV4ix9OhOx675YxitsN4cb3Ba3du1MKsvYW+ReHgnFdPPZybsS2cwrm0KHhcKWlNlYyNX5r1lPbv5XD6SOsxHqm69z2jueKWa6C2u28QqZhi+vrkcDHPNJkflCUQSmJtBlMeXjU5ToxXc+yrBONaybmiMDC0ZSvxP9f/9wYM/eH4fPVHM58sVFu2/nwvg79HD8THYk3Nx7YZ9+2zd+mjWU2a4UWIwt4JvyMjoHT7PApT2fu+KwFP67GvDJjEjU+OC6rOQoPxxnPrzX9eAIVEWagkmQkUOe3CzoTwqGPrRkXUJ6fT9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bytEZ1ZSTXZrK1FXVis2ZTBpUWxHZHZVWi9lOCs1elFHNXRTMXEvN3ZtR2Jq?=
 =?utf-8?B?enNwT2ZjKzNkTUFKSXlEZ3VhdWJNZTkxdDMrSENpZEdycm5iZ0gwd2swVE52?=
 =?utf-8?B?SXEwNEp3Um5VbXVReEc0U2g0QXhQMzlWQmV1MU4vMGhPeVZmNGdIbzRmYmpE?=
 =?utf-8?B?MkJqd3MvYjVETUxYT1NSUS92MHRjejZwQXY3UnVmMys2TitNR3Rueis5eVl1?=
 =?utf-8?B?K2dpVHR5SmgwblVPV2pnbnVtV0ttU0svNmY3MStrbjBxTlBETjllWEUzT3cr?=
 =?utf-8?B?YTN2YmhWN1N0bDV1UVB3SmxlelVTaFN2OFAwUEVqSUszSXR2Q3lWUWNXb005?=
 =?utf-8?B?dGxtc1VmV2JmNGhsZDNkWkxDUnRWV3Z4Mnh0aTByRDJBckNWUWxvcUo4Skpl?=
 =?utf-8?B?YVQxTW5tSGh5SHkyUWtHVUh2eXNtYzlZcEsxZmNFZnN6VWlIalEwZlR2VTQy?=
 =?utf-8?B?c1htbUlINkZaZ2FzeDNpT1A0ZXpXOHJnYkxJYVlkT3c4ZWdoditkdHRIQjQ0?=
 =?utf-8?B?SGo0WUZoSi9aYTFoTE9OSk1xOVV4ZjZXN3pBNGtyd1NPNkJMTWdXNkJmMnU4?=
 =?utf-8?B?WHJIU0JzQ2NBVXNvN09vckc3b0tkRW5QSEZHVTY1NnZNRHExTExjbEJIR1JR?=
 =?utf-8?B?VWVadXNXOS91SUtFSlZaWW5zZmhYOVF5STJ6OEUzTU5UT1ZqdFpJN2R3Tjhp?=
 =?utf-8?B?WXYzZkw1Z1dhSFNmOVMvbGdsL0IvaXpRcVY3QllZME9XL1NqRjdSUmZLNmUr?=
 =?utf-8?B?WWRkek1nZG5HZDRvejNsdWNQa3FTRFo3QkNWNE9ESmtIZVQ1V1FTTmFQalVX?=
 =?utf-8?B?UjBHRUNkOFBnV3Y3NVh1ZXJBWlNYTmdXa1VMazZ0bWx6YURNeDIwMjNlN3Ur?=
 =?utf-8?B?SlF1RURNdlZPOFBCYUh1RTcrbXcxZVpWUkdvaE93VXJEd3JaMjFEWnZIQXVR?=
 =?utf-8?B?WW55RWNFb0hPSkJVdktCVytiZWlaN3dmQUZYNm5ORko1K05jRmVzSTJrcE1k?=
 =?utf-8?B?MWRkVG91NzZQUUMxLzg2SUw1QWdIZ1Y0ZEZMUXJudzBiSjh5ZFdCSFdNeElm?=
 =?utf-8?B?Z0FSdXN2R2tIbEdqQXo0cGI0ZDJ3L3VQV0JlcUhLRGU5Ty9KZEN3a2NrS25K?=
 =?utf-8?B?RzBZVlVJdDZaNWNlbkovSWVIZThrWUdoNjhHN0pWMnNFYy8xTTBPV3c0eEdD?=
 =?utf-8?B?QjFsWG83bzVURWFYeFd0QlFpbDk0cFNCTUw0M2JrSnNLR3hlT1NQcDEvaFdB?=
 =?utf-8?B?OUFjejc5MSs5Y0R0WTRtVnVBKytnMmpkeXlTckYrTytqdFoyeXBEL1RHOUNs?=
 =?utf-8?B?ZXZrYVoxd3ZDSzBYMmpGSXZMSDFZdXhnK3lQaFQxOHd4YkZKMm04MzdTdFlq?=
 =?utf-8?B?YWNOY09ja2QxR3pGdklQU05KQVlIV0JhSDFvbitrZWxOd2dkRXlpa2FaK1J1?=
 =?utf-8?B?Ym56YzF5S0REYzZESGtCRWdxOVdFeVFwNXh4NHdObmFya2FLcnhCSjF2SnlN?=
 =?utf-8?B?WUlqOVJ0VWxxNkx1bStiUGY4S2JhcHN3TTI4Z0FMVE1FZjN5aFlTSXZLcWp5?=
 =?utf-8?B?SENPVGI0bGNJVCsxMWpzL3RQWE5ZV3YxcjlGSzl5OXhIYStvZUx3dGlEK2Jv?=
 =?utf-8?B?emNRQ1dJb0pWd05USWlCek1GeGxMWnJLb1hBTWtZdHFvenE4SmRPK1ZPVjNl?=
 =?utf-8?B?NWN5YWE3Z2Nyelo0SDRxUUVZaGxYOUQyZkc5VWc0MDBYbmpJa2JMTzluTURX?=
 =?utf-8?B?bDY3QlJndFFJWE1taXY1MThQQ1VxeHk2RmFMS1NwcDJ5dWM5VXdLeVpZbDJs?=
 =?utf-8?B?QUpoZ3lxdHozVmdBdVVKM0hZYTQ2TGpHK1RBUjRoYmNha21iTFlJa3BOVEkz?=
 =?utf-8?B?OTV2Z3lJVUhuZ3FrQ3ZtbS9KOFNiUU9sYVB4SnFXdWQrYXRIeUJ6Z3Jtc1hw?=
 =?utf-8?B?QVZwZ3V4R2N2dmd0RCtRRFBPV2lUS2JXT3hyUllEV2ltQXJGbzZ4MkcrZGN2?=
 =?utf-8?B?VUQvd3FyQ3A4bVBlN2NsNzRJN0hlZlh4TmRLeVA3ZmNTREViNys0QWpEVTRn?=
 =?utf-8?B?emYrTE5NUVhnS0pnVGZVYXNtNnovNnlVbXRhL3ErZllFMHltcm1zS0VrWUg4?=
 =?utf-8?B?WXBuazExOUpZR2s4ZDlnYTZTaXN6eWhjcHEwaVJSSk5xc250aGx4NmhwbTNk?=
 =?utf-8?B?cWFnT2lNRXNScVZBNnR6ekJrL2hjUzZwTFFuYzlZdG9PTHNsZS85ZjFUYjRN?=
 =?utf-8?B?ajY1R1Rzd3IxVXM4Q0hQdXRmMW1rRXZMeHJMUElIbVNxcUtHWFBsT3FDN1ox?=
 =?utf-8?B?UTZQendDYWpWVU5qSkM1U1JEQTdRdDVkN1ZSTTZDTXkrbFF6UGQrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fXTvdLLP1e8yIp8ROEM2dcHkejJ/NcxS5rz8YQ+AQ1hRWZA7mz6ff0Q8LUZ5nk6JhnuR6Ks4E87QE6nmCmqnwhJ9nGaJ1Qe1SlPr7lmIClQT6PN1oJjQ8xFLX04Dl4akxOm2LiOml3qlpB5XanRI66aHv0lY0qiGCDtrWCR7mcxRQyAy50tfRHt1qrOTJEJ2z16zE/bzzDRsITHgiDJvXPA0vhWbJFkuYBRbYSx/lmx96x+u39mHU1/glV9Z4U5Tvu6DP+kFCjfhYLKvfBv/h+6Um0IkjW3bp7pDqURMVZIXcOHBVt7dz60rRC1WSvFGye7FSZ8ASfnC9i7y+jiYNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df79cd7a-60a1-43a1-2395-08decbb16757
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 14:13:13.6053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJbYtH75ZpezQr8EMyss2HbQNjaSbbfjhk5hywWT9ABOGS5o+gx/vQ+JtE5g1UbNe6SN4zgUJnpXN3U+T6UEjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

QWNrZWQtYnk6IE1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29tPg0K
