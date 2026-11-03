Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301DC606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLin/Uws
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED41E10E22B;
	Tue,  3 Nov 2026 04:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B649610E196;
 Tue,  3 Nov 2026 04:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793679651; x=1825215651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tMABkdH3p+j/tXUyzcWSBIbIkQwVM4Uv+8K4j6iL7z0=;
 b=iLin/UwsdvYj9ZLHH/YtKRo7lxTiT/38qo3rJKzz1jonpSyhfZUBaRL1
 0uOUxpb0wGslrg5QxV8vx0l3t+eJFKADLNnARs9Qx2pliDP7/V8aR68JO
 H3nTZP5JW9wCi1CJwvajqyppfvjPbtBSJfYkCeJ9CPsTp3Uebw6BGM4b2
 +T6XJa06PyQmIn/TAnR7o7A/9s92gKmkRznRfMCLikICMVzxWUWUW95bs
 yraRJtIoMrlaQua/MngXCUAaSSxSa/LbE0wJlwLR/2Y+G3Xl319d6/pYw
 ZKZdbQshg7F8L09gsCxkuI07gqjrzDz5li9vlS0HwWpdIRn4hih0hUvQC w==;
X-CSE-ConnectionGUID: CH7XsBbPQLSQu1mQsJcNyw==
X-CSE-MsgGUID: GKRaa1D0THuiqhpvCqn0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2270335"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2270335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:20:44 -0800
X-CSE-ConnectionGUID: 0birWlvZTZq9xb/6/s3KPw==
X-CSE-MsgGUID: iJ3JxhM4SxmX8DU6zgoLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6312821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:20:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:20:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 20:20:36 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1VSvHL8xRW0IJbOd08qgQr0cqvOtTsXtW3erH+t/1eEv9T6kRjp5FZVzCyTYViMces3Xm2oAzjNRFY1kVpxzF0F3r4QMYa97u3VxKHuwvilwNW/ZSo4U5154J4lxsLRu248KzEmFKk5muP83r4d7JBB5mt5rrIrWFxLko2voxSDFCaY8vj/nt6SZxxfwXx0xgSzo3TWGLWjhO2knmzyYtqC/r09JEnxuwmZ+6aAaLld1Dh9OZ5bzpiUAQ+mZpw99gGO1FeL0mwFvRjmPiWpzw8dqVD71H72FbfzWzve3So0bA2LeWy/Sn+L+pLxdySS9LN0hHwpSbzEYB5PXpsKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMABkdH3p+j/tXUyzcWSBIbIkQwVM4Uv+8K4j6iL7z0=;
 b=tHjKPhSzJ3TnH2TD4WcyCC9gV54CloT5pl3GobWUOf5IhEhHS/25UPBPgRFo1NRTz32VR3oxrJXhm2mz7ENtzaK8I6eLKLLu+HhseYsOgeCJxEvKcFTdPTGWTZqVs7f/CuCCFFRtz3Le5WQ0hGw7dMJatyC8JZ+QXLqlayE/m5DJHv1qX6k4t7IrIQFUese97D36HEz0/TfVFBMZgu3l2Zkmq1dgXIeb9BGvO4f9FVxHijqU6b5O4Gwb1igda7RgxfapkLi2DXjaJ6TaIibSXmzZ17W9YQjYWw0kDW6szUlgZSj5x1CUjNzSxhdF5RpczFAyYbeFMKeSdBgpKgqBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LY0PR11MB527130.namprd11.prod.outlook.com
 (2603:10b6:404:232::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:20:29 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 04:20:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 07/10] drm/i915: Reduce the sleep inside
 pipe_scanline_is_moving()
Thread-Topic: [PATCH 07/10] drm/i915: Reduce the sleep inside
 pipe_scanline_is_moving()
Thread-Index: AQHdaJMwN523HIrYHk+QFYz8ALVsu7cbw/Bg
Date: Tue, 3 Nov 2026 04:20:29 +0000
Message-ID: <DS4PPFE901A304F22E15624358E23FD67A2E3692@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-8-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LY0PR11MB527130:EE_
x-ms-office365-filtering-correlation-id: 0f82f32e-738f-4d8d-dbc8-08df3961cb5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|22082099003|18002099003|261102123227099003|38070700021|56012099006|4143699003|11063799006|261022075727099003|261009223027099003|261021121427099003|261021123027099003|260925021311599003|260925022911599003|260925021911599003;
x-microsoft-antispam-message-info: Df0NAUMRsQA0RvKPCXWBut7HNLZpjhg6Ak6vuh97MkuSdherzvgZBnJV+3vZqXy8mEs3YtFOZdjMBFl73pGszjyeJNhy5y5z3dOFGlg+BwU/AuZ+mR7qjbyWHZ6dDl7xIXyng8klK1xWOy/s/I/tdZj+e+YbUgPZwRDWfM4cXpmXrofffhGugwxMZyU74Zsl+Je2YA2xNIPbsDirHTS8DhVP+4GN7Y9OYd2RTgtoHineMpRnbEui8E6DMfgbddE7ngWhKim5QuK3Ciem00Tf2RSjcYXf+uz27p8ak4jDeXGXATZcbOuo/+Ex1xFqhS4jqRH2GUzIfTGjF19naJbNwpzLWgVYKSlhEYzWU0K5vBrPQ3XRgSZAayck1JX3D9M8V/WEAReA1Jb4NyIi+ZagHQc/HTfVjXF7YzXXsENHl+OFueYtSZoVfLJHv6KM7R6/yk8lgsaAyrc+8B0OMYS5EIiUINwtDQRjmTJuRd6Rts1j6sQYqpz+iSY1Kx+Y+msxV3IAuPQIYUGpcEG0tAXv45p/6K2tfTpwDVV/UCYfZdgrvaxV9nbKn2Og/XKeseERPk5hsyk88wQL2+gVwJZsuClnvAYaTMlAxswlte6PkKIFY2by3KXBg8obu/AK2hF/l1tyAMuZbvhO9ydvJoPi4YvnoPS1TVxV28+3zwqIdXAgrRs+AzRr384rtD1jSk4qbJ+y/Lc+8hTYCJfKLKu/mUWkGRdfWb/JKF3NuwzJv/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(261102123227099003)(38070700021)(56012099006)(4143699003)(11063799006)(261022075727099003)(261009223027099003)(261021121427099003)(261021123027099003)(260925021311599003)(260925022911599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmppRUhNTm5lL05Ga3E5QUNzb1pqZ1V1aGV2aXhnRC96M0dHNS9YZUlvdTdG?=
 =?utf-8?B?ZndXbkViZVZjTzJZc0RWd1NnQnZBUUVab1JiRlhJMUkvSjFvV2NOQmpJeWhs?=
 =?utf-8?B?WUg0eW1HNCt5MW5CTzJNU3VFa3hpQk1SQkd3Tlpmdmdka094MVpRYkZSUnQz?=
 =?utf-8?B?Q3g2UjdzM2RmME92MFplZU8wUm83a25ta1ZkZ1JqbHNFVjhkdUJzaTY2WlRu?=
 =?utf-8?B?MEtFVGVlaXJwZHZQQ2IvSnRuYVprbmxVNjcyZk5FSDNpMWtNMzNoN0J1NUh2?=
 =?utf-8?B?d2Q2WDQ5V1Zpd01mZi85azZLQTJPYUZ2TU00bS9sVUVlOW9QMmVnYm5rQ0hi?=
 =?utf-8?B?UzRCWk5KbkdUL096OG45M1ZlSENXc3ljRVZMYVBLM0MyclZaSEswMnVQZWUz?=
 =?utf-8?B?Q0hEQnRGQzlERW9BZjdoNTBoRjkrSng3MTA3ZUNNWEtWbDRPZFRhcEVHK0s3?=
 =?utf-8?B?LzZobXVlcVZtN1hTcENscXZFY2s0K1V4RG9aN01sWTVscnVIK1NzSDJZT0wy?=
 =?utf-8?B?Yy9Qb0E2QzIxdWx1d3FsZUl1Ukt5eHN0YWVEMG42TlQ0Q0Y3cmpodE5FM1F0?=
 =?utf-8?B?Yi9jWFg3UU5lOUt1TlhxWC85blhHVVhGQXo1ODNYODlJelFPMHUwVDA4ZVpx?=
 =?utf-8?B?WXJBRGdiT2JpSHlwSnMwUmFidHlLUHZJeXl5cWJ6UVFLN1cydlFnSzlrRmFB?=
 =?utf-8?B?a2pRU3FxZGFmeWlMK29CRXJYMkwvN3dVRjAzSlpyeWcwNTRKUDJubkdPLzlG?=
 =?utf-8?B?RmtCV2xPSjg1QlpLNXhCcjBOTkczS1NTVHlSWXZRaDVURkdTOUxuMUo4RGs5?=
 =?utf-8?B?UnR1dTNqUm1xMEJIMVltQVJRejJRRVRFQjVOTG0zVXpEM2tISGlNb1pVUHhi?=
 =?utf-8?B?RndyeTdyMEZOOHIrdFRuZUplZ0lReHRiQzljTU9aQ2lXYzl5cDFMUXgxTjJ4?=
 =?utf-8?B?UldPQTA3WVRmS2NIZXdPQW5oczB5Lzh3RjczemovQlVJRVN3TDNUZXFsSjc4?=
 =?utf-8?B?TUhaMEIyVEZ1Q1Y0OUFGVXNwWEN5aG5qNUNZMjBnSjR3QndNNktiRGdHek54?=
 =?utf-8?B?Y1Q3SS9HYTlNS3lWRGd5MkFKZE5VdWs0cEQwUGpZcXhQVllxUzRJaTJuTmFj?=
 =?utf-8?B?Sk9RM29WNWRBNlpXVFphdVpCc2VzTzRqSFRNMVFBMnI1enowSHFBNnZwVmVJ?=
 =?utf-8?B?UUU2Q3dUVE5ucm9SOUUvUGhXMmVrYWxMNU4yTHk4UHE4SlliVkZERFFheEZN?=
 =?utf-8?B?aFJBWFdQV0JYbDArR2dqQ1llUDg5WW43TklYQWovd1hJQkMxKzg4QU1rQTBN?=
 =?utf-8?B?bVpvOURzQTNJL3lOMUVzK0hHTUMrMWtONzMrVzdTK245TG82bkNlL3R3em9T?=
 =?utf-8?B?cXhxVUg4RWVqRXNFcHkybjBpQlpaV2NLR2hZait0WThrUUtMQ0VRaWlEb2V5?=
 =?utf-8?B?TXVObmpZSjE2RG5pNFRRMUpOTTI4S0tvNzRWL0d3WmFxNFUzNUI1c0hQSTdk?=
 =?utf-8?B?SWoyaC80L1hvdGIybnRnalU4amRsLzIrVjRrQkJUcy9tVmpOU1hQQklBNk5a?=
 =?utf-8?B?aS9RUW1qUjBUMENxNm1UazBySGRvbzhNREV6MXdrQmRUNnNxbW5sdFk4clFF?=
 =?utf-8?B?RjJta3RtRjRYVGpmOWcyR0hjQkNFRURJK3loNERKQUk3b1ZENmw3MEsvcUto?=
 =?utf-8?B?T0hqTEF6MnhCMTFka1VybElKSTd0RE5GNGtCVjZOanJFQitLNE5ybm9wa2pI?=
 =?utf-8?B?RDNQRVhKdjN4cXdoRktGU0FlOEtTN0RHUmhsdmpjZnVUZFZjQ2s2KzBobENy?=
 =?utf-8?B?QnJqSm9tRG5oSFNXcWU5TUh2SVdJa1hQcWdsV2JlN1Bkdmd4eWNmOHpWSDB4?=
 =?utf-8?B?SHdhcndWd2JGMzJpbzdDRFZLRjFKSy9zV1Qrd2twRjJLMDNpOVpOcC9ENXlu?=
 =?utf-8?B?UzhYNHZyR0M5VXpzM0ZFTWN0eEhlc1lxRzFCbE50Q21WWGlFT2trR1Yxdmsy?=
 =?utf-8?B?cW5CSmF6UnAzZXpaRUdlSXJvOWU3VkxwUlBYWmhlcThvVXp3Rlp5TTdGclky?=
 =?utf-8?B?N3E3MHZoWVo3c2Nxb3Bkc09jdDYxU3RuWW5DZWl6b0NJODJyL2RZQ2IzZVps?=
 =?utf-8?B?Nm9mUkgxWkVjNzA2cTJkNEYvZ1AwN214SU9FVVhRY2VEQk1tN3FzeURXTDhL?=
 =?utf-8?B?UmlZQVE4Z01TZW4wVUdvaTliNDkzbm9MYkYvMkhRRndwTlBjRGVvYzV6cG9v?=
 =?utf-8?B?bzcwdmphcXZhTkZFbUlwU05rdTk1dWo1ODFrVVhMdEo5WXE3Rk5aSm5UdVNN?=
 =?utf-8?B?WHR6OGp2WUpMcUxhSGhjL21FNFJmYm1MMGhHVWM1OTI2c29jaTNTUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pHtwbQ/fFQXFrEL+CapWHtF8FtNt/sM3oERz8yXVmeccAfqNdNP+Uq5S3p7ogWTCzkzSHwECPgB2szxh96AkL0izexvkck2O7e2MsDKcqbnV8D20c1kFVSb+yr5XQMGTWQOlEgHT9ahAwJTUFknVnSS/Llt9hB7x2F/122NsRcPjiwRGC3ZKQGOo2K25TATN3ABWD8o4168vMYKPcon9K3qhdjeEPF12bG3gygRm1632fM1J0zKW25dU0ONOisA4h4jcdosgU8mLba+kbfRl3ttBaI/t6W+u0HwOvx3gn4WYSOOTB3S6EFoTj3hq5IhxCMMEGMuNuAb2AMqlcTv9Ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f82f32e-738f-4d8d-dbc8-08df3961cb5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 04:20:29.6079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnhZKCO2AspUG6dAKhVVV9Sl9Uj/KuH4G07MB6DcYsroEv4qzjUyGih5LWuB4jYcm+zT3IBIrOXf4fd3far+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB527130
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggMDcvMTBdIGRybS9pOTE1OiBSZWR1Y2UgdGhlIHNsZWVwIGluc2lk
ZQ0KPiBwaXBlX3NjYW5saW5lX2lzX21vdmluZygpDQo+IA0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gVGhlIG1zbGVlcCg1KSBp
bnNpZGUgcGlwZV9zY2FubGluZV9pc19tb3ZpbmcoKSBzZWVtcyByYXRoZXIgZXhjZXNzaXZlLiBT
bGVlcGluZw0KPiBmb3IgdG9vIGxvbmcgbWlnaHQgaW4gZmFjdCBiZSBoYXJtZnVsIGFzIGl0IG1h
eSBldmVuIGluY3JlYXNlIHRoZSBjaGFuY2UgdGhhdCB3ZQ0KPiBlbmQgdXAgc2FtcGxpbmcgdGhl
IHNjYW5saW5lIGF0IHRoZSBzYW1lIHNwb3QgYmV0d2VlbiB0d28gY29tcGxldGVseSBkaWZmZXJl
bnQNCj4gZnJhbWVzLiBXaXRoIGhpZ2ggcmVmcmVzaCByYXRlIGRpc3BsYXkgZnJhbWUgZHVyYXRp
b25zIGFyZSBub3cgaW4gdGhlIGZldw0KPiBtaWxsaXNlY29uZCByYW5nZS4NCj4gDQo+IExldCdz
IHVzZSBhIDI1MC01MDAgdXNlYyBzbGVlcCBpbnN0ZWFkLCB3aGljaCBtb3JlIG9yIGxlc3MgbWF0
Y2hlcyB3aGF0IHRoZQ0KPiBwb2xsX3RpbWVvdXRfdXMoKSB1c2VzIGZvciB0aGUgc2xlZXAgZHVy
YXRpb24gYmV0d2VlbiB0aGUgc2FtcGxpbmdzLiBXZSByZWplY3QNCj4gYW55IG1vZGUgd2hvc2Ug
bGluZSB0aW1lIGV4Y2VlcyA2NCB1c2VjLCBzbyB0aGF0IG51bWJlciBzaG91bGQgZ3VhcmFudGVl
DQoNCipleGNlZWRzDQoNCk90aGVyd2lzZQ0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5k
cGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiB0aGF0IGF0IGxlYXN0IGEgZmV3IHNj
YW5saW5lcyB3aWxsIGhhdmUgZWxhcHNlZCwgYnV0IG5vdCBhIHdob2xlIGZyYW1lLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZibGFu
ay5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF92YmxhbmsuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmJsYW5r
LmMNCj4gaW5kZXggMWQ0NzUzNjA1Njc1Li43NDk2NDAwMDcxNDAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmJsYW5rLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YmxhbmsuYw0KPiBAQCAtNDc3LDcgKzQ3Nyw3
IEBAIHN0YXRpYyBib29sIHBpcGVfc2NhbmxpbmVfaXNfbW92aW5nKHN0cnVjdCBpbnRlbF9kaXNw
bGF5DQo+ICpkaXNwbGF5LA0KPiAgCXUzMiBsaW5lMSwgbGluZTI7DQo+IA0KPiAgCWxpbmUxID0g
aW50ZWxfZGVfcmVhZChkaXNwbGF5LCByZWcpICYgUElQRURTTF9MSU5FX01BU0s7DQo+IC0JbXNs
ZWVwKDUpOw0KPiArCXVzbGVlcF9yYW5nZSgyNTAsIDUwMCk7DQo+ICAJbGluZTIgPSBpbnRlbF9k
ZV9yZWFkKGRpc3BsYXksIHJlZykgJiBQSVBFRFNMX0xJTkVfTUFTSzsNCj4gDQo+ICAJcmV0dXJu
IGxpbmUxICE9IGxpbmUyOw0KPiAtLQ0KPiAyLjU1LjANCg0K
