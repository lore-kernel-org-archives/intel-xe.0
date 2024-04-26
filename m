Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA69C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 13:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8A31123F3;
	Fri, 26 Apr 2024 13:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qy2Idm5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBF51123F2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714139190; x=1745675190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=muWbpydmSrZQPx0PA3dFWXgVsyKrQ7oY6S6WBvboAr0=;
 b=Qy2Idm5MfMQeVVnyH+1YqhqOkt729YmK2nXe5S32rU48u2Do6bJEK27Q
 XsZjxUX2XB407tWFOSHZwUvsa36TtSJERZ4gzPsvDrh4KmnrjIl0dEOYD
 W3PnAR57cnNsYcToWvNJlg7lkiRxlOeYmBhHSO7B0tb2+m1xt5pq6Peg6
 RamVK8oqTGDwb9KG81dOWtA5zKnHHQyLylJ1w0OFYebiIw1J94MAjkUN2
 azPm5Vwxh3QpBjP8s1W+oJi2jR1hLF2Wo0QGraQI1hRifHOhs+2xcskAr
 /tIxbptHfSjd0NCFB+LzB3LwmG+Ai/VqctEyqbmPt8DamewWMHg6R5gQB w==;
X-CSE-ConnectionGUID: 63z+bilBTFe+ry36fG1l3A==
X-CSE-MsgGUID: fPCCzMDFRYig7xOdmfE/Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21279308"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="21279308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:46:27 -0700
X-CSE-ConnectionGUID: otj92KRmR/ScZSeAQSmTZw==
X-CSE-MsgGUID: U1BUjoVPRxKhq5ZGFV2l7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25427196"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:46:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:46:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:46:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:46:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJa8SCkcDpasY+86N/sRzntbXauoqOEX2xp4KsZQlMrjUyHQMnORczU32AJd/AhGVO0pNEoK1VzuNyEJOdxyEbpIW9RSIGiL9OvUI9IX93ILWviErS2cfZVG+7RjLhtnBRlNKg2XqaqaUq/8K/Swddxfr5FNd3mXTRhkvUG6w966OCXBqDV39AGJwZ4NKJms/XN/NKqx59vwUe76M99cLSGDg7/CvU7h+eSf5waHNkFwKky3+AbQAwsQLJiwWqogcWesKVir0lyUrTBinwJPJDsJaxwS04OWo6fNe7wJLY3HeVYdBLEYd+63sAD2pfnW7r5DXrvPxLcUmq5aCYZT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muWbpydmSrZQPx0PA3dFWXgVsyKrQ7oY6S6WBvboAr0=;
 b=ad4GY7RD0XFrh3NVnUOeF7wyXvnuVMlu43L3UVVn/Z9kh4hFNw1u9U/uw3TkfUyFFkjOZchi9ngwnGUEEfd6J4dsURLF/cHR+/I0XNFCTfLk6xpDpQFSa1IXwKrBTQvzjLmjHkFbSUMGwOcWLBvHpLjyckdo6FDWnagW+1MbLVM9aAv40eKYEA6Zb6T+aGGaGZRgxvWYV7AhdtRxNrr+tN7KnjjdH6I+4o8yCou/+pElj6qMMcs95G77oeaD2GTPOMpQh4TYZ+0z+1lHHg7Tlr2uT6mzN0BKjnq4FMZ4zjX2aVj2G4/Pw6dk5KckIuoVdsa5MIeHdn+/gfqj8h6RUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8298.namprd11.prod.outlook.com (2603:10b6:a03:545::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 13:46:24 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 13:46:24 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: skip error capture when exec queue is killed
Thread-Topic: [PATCH] drm/xe: skip error capture when exec queue is killed
Thread-Index: AQHalwpbmWy1hSlapUmWCuoNuhoYfbF5K7mAgAFmcQA=
Date: Fri, 26 Apr 2024 13:46:24 +0000
Message-ID: <63e904d67d1d6749932f270d70061ef232a5ddff.camel@intel.com>
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
 <ZiqDf8xAFFssvImq@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiqDf8xAFFssvImq@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8298:EE_
x-ms-office365-filtering-correlation-id: 4454fb19-065f-4a37-c02c-08dc65f743ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bFgyK0ZDZVNjaWk2SGJUOW1QcWJPdWJBVmxvY0NVcjlaVGZUSkhVamg0bVY2?=
 =?utf-8?B?bThoaThJTWh0aVFVbHJrVW16bVFVdjRSU3B6a3Jsd0hyQVpocWU5eDZkVUQ1?=
 =?utf-8?B?Ky8vS1FXZFd6dDJYRW1mR29BYmhZdHFRZFZKOVBNYjY5U3lHOWNrTXFFZTNs?=
 =?utf-8?B?bDdYMUNBSEpsRjEwL25CSVA1bGVpNS84WGJqcS81RSs5N09SSWYxeE5XRzFI?=
 =?utf-8?B?bittSjhsTW44S2JHWEl3MXRwQkVQMm5ZcWJvRFRnN1YzV0FlaFNqd09JbjBT?=
 =?utf-8?B?aU52a24yS1VVVDdqMDRNV1VZSkZwT2puQTlRUzV3Z2hIKzB1aUZPMHZ4cDFl?=
 =?utf-8?B?Rml2c1JORytKVUhCMnpvczNyY1VRaFRGbXpxQ1pTenhSMTVubU1FUVF0TVVM?=
 =?utf-8?B?Y0xuQ2ZlOURxYUhLYXcrdjlScG01OWNWT3d0VGIzTng1anBSTGtYUDZPbjg4?=
 =?utf-8?B?WlZ6SnhvQnVSSXhvYXNaNTQzcHRKM204dCtad1RSaHVSb20rN0JrR0NFY2Nu?=
 =?utf-8?B?OS83Q2k0aVFQV2swNXI3NHk3QWlQYWFvMG44c3BDc0E2SElNNkdvUGNqSzNl?=
 =?utf-8?B?SXl5TUxjcS9WRnJERmVGV0psNDFWQkRDVWRCTzlNT3hDcmNJeUJVbG5xOWRG?=
 =?utf-8?B?eDUzeEI2RExPalVoRVF2dENaZlJQcWdvM2pzZzE2VFFqS0tiVU9FTytVei8x?=
 =?utf-8?B?NmtiRk1Fd0R5dUphSWNsWlpXcmEyNXMwQXpMQjYwcWl4ZFRtQXF4YjV5U0hr?=
 =?utf-8?B?bERBaVZWcDRuam1UK21TVjJOcW5yRWEyUkdZMkdqblhGOXF2UGMzTjZWS29n?=
 =?utf-8?B?RG5yMmVMQTE3SkNGYjdwOWwzMzkwMlBpSjFwUmtrV0QwcjM4cGpBbzUza0lo?=
 =?utf-8?B?M0RIK25TMVdlMHdCNVJkRzRRVkNtdjhHWEdjS1BuSjlsZDlicG9vL2szRFli?=
 =?utf-8?B?M29WWXJwZERSa2I3RWFYM3RUL29BQStqUGhBZWZ5eHFsNEdqMnVsbkdSeHdt?=
 =?utf-8?B?cEk3NHl1UmFUdnVFRkF0UTNRMFNHdnpieGtjZHBPOVBjYXRuSTkvOUwvbVJS?=
 =?utf-8?B?RU1qVW9VeHpiR25tdDhDT045cDgybEEzZXZKN0c3NjZTdzZrbUpCYXFRYVZr?=
 =?utf-8?B?RnlFMWpudUdNL1ByV0VEL0xRYVdSUHQ0ZjlHOThDdDVzYWZwdUJiUjNHVFVr?=
 =?utf-8?B?L1dhYmtVTWpuOFdqODNQcnc5VGNsZ0craVhaNi9KY0paUU0wQ3R2WWZJZnAz?=
 =?utf-8?B?WXJ4ZjFOUWpETFhmZXFkN0pWYkpGeFgwd3V3VWdyczVmWXB2UDZlMmY4ZWxs?=
 =?utf-8?B?NEpFclZWalpvZUdTVXBHTlcxMStTVVdNNEp5UnN0dzhIYS9KRExaeVphbHFP?=
 =?utf-8?B?K0s2R2hVYVZTK2pUY1hzWkVJbG55aldoeEk0UksxNm5YSk5OZ1BRaXI0RDFw?=
 =?utf-8?B?VERoMitFMS9NM1YwbGk1TXNHbExVd25lTGVkaDlncUh6azJGL0UzTUNESmVK?=
 =?utf-8?B?a0h5OHp0TkphZzdZSm14ZzNTMWg0OEFkWTNuVTJVcFV2MGM0MFpmT3U5cWd0?=
 =?utf-8?B?ZVZUNlZ5akJuNFVNRTFDWGZod2N3VjhRYkM5SkdFb3ZOSzVPTXZsMlZxV3lO?=
 =?utf-8?B?M242Sm04UVNSbzlubkhjc1Zka1dzODJaWTZYMjZPeVRRd2hOQkN5MDMrZGQx?=
 =?utf-8?B?OGtQTmRDV3ZLN3NHUlRLTFkrMVVCQ085U09FS3lQcHRRak1UQUkxNGtnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QndPSndNdlhxQldTMk51NlNGWThCTTBVdEFQdWpNQUw3c1UxRGZNTUFXVmdY?=
 =?utf-8?B?Ym9DU251VG4zcXkzb3ZLa2Z0cytuamRSVndoN2JuRW42RTh3elV5N21JaWpV?=
 =?utf-8?B?TiswN1VIZmsrNE5UZUFoTnRLMWsxUitCcEhaelFDd0pWOXFYb0x1Q3BjZjYv?=
 =?utf-8?B?NktvQisyUzAvTGhqaUNjSmJrMVFVTU9vRGdtZkUwUXdYS0hvRktseUduY1ZE?=
 =?utf-8?B?VTQrV2dvOEgwWVFWRkpxMXRidW96OWFKZ04vK0gwQStUYkxqQ0tzWVA4ck5D?=
 =?utf-8?B?Z0d0dmQ4cEdlRmQ0VzZFN3lBQ3lmd3k3N1g1dHZKRnNjYTdrZEF6TFA5VFdj?=
 =?utf-8?B?M1hrYktFNnI5c09TQTFHNTRMY0JvaGJXc1o1K1BERzlSMUVJMGkvZGFGWFkx?=
 =?utf-8?B?Q29pVEdwaGxGUFplVHdQbFJDQ1A5d3UwUi9QamdIL0pseTIxWHZYOW5OZkll?=
 =?utf-8?B?MzdSOWtVZlRPTDQvSXRobVIxTlFZN0xuRnJBTEVrS2dyUWYrUE9BY3djVk10?=
 =?utf-8?B?dEY1WGFQSncvampabVh1c1d4K3lXZEJMVGltU1NQUElTaWN6RFlSMXU2ckhB?=
 =?utf-8?B?UkZIcUhNZFE2elk5RjNPTkxXY1RyMmN1dWduQnpVelg4R3NCQmQzZ3JTRUxm?=
 =?utf-8?B?OWdOK3pEN0Zqb1lERWtMZkJGYTdGb29qVG5GUExia3hra1RBejBlcC9jUEU3?=
 =?utf-8?B?d0ZXVEpJMzJrNU11ZzVUZ3hFMC9ZeUFvUno1YXNnUGwwOXNDRDlHR2dLSU8z?=
 =?utf-8?B?clB2RTRHT2tYQlRBcnY5V0ZBU0xLcDlFcTZoakdiZHdMbjEvKzJrWm5NcUJT?=
 =?utf-8?B?b21XV2ZqMHlaSlZKOTk0R0k4Yy9vOEhYMXdKWnRLR0hkeWQwb2NTYkdzazhM?=
 =?utf-8?B?a1p6aCs3RmFoSkw3ZTgzY1VpSUYyR3NBWEZqckZYZHF0dzlidUhJS2tVR0ZE?=
 =?utf-8?B?R3IvQkNYMVJ6U1I1SWdVNmxPaWRCSTF6anQ1YkxRUDRRWmZxV2p0Y3hGWmhj?=
 =?utf-8?B?NFBlemlEc09BcU1wTkdhRkdEZ1BnVGw3SEVINEkvM1RvYlpNeTdkbjdmZzdZ?=
 =?utf-8?B?TlV0WEVoTUUyYlpkTUlNcnBBamU3ZURNWHJCaG5RWjJWVUhUZlUvQzBPaWlH?=
 =?utf-8?B?Mzg5WXEvcWNZQVY2aEcvUDJ3bTE1NHp2RUt6TDY1U2JhSkdLTkV3Q1YwaHlD?=
 =?utf-8?B?bzcrRm1LQytkR0tqSGl5SGUrazN1WFdRNlcrR3ROaVZzZ1FLNkJNYnk5Z24x?=
 =?utf-8?B?TXRkNk1aYUxFekxIRFA5ZGc0KzUydjNLbjRwSmovS05jTVllRUo3c2JveC9L?=
 =?utf-8?B?T28rRUdUaDNGSkc0WUxXMkl4RDNkUllwL2wrWm51eWlISVRzTDNCOWZ2YW5r?=
 =?utf-8?B?aTBwbnNlc3VhRUdBZVBFaFBXSXRmVXN5TXBvVmlCMEZ5djBnSm45MkJOcWQz?=
 =?utf-8?B?Nm9paGJMVFdaSFRia1Btd1N2eE00SVMwYzNHMDcwVWZ4M0pHbEd4c0xxZVdQ?=
 =?utf-8?B?VENtdXNtY3BNMVFSWnZMenRmWGhSb1pGT0VHdlJsUlhnQ0l1MFB2MlByOXFx?=
 =?utf-8?B?dU9UNHhRNnkyT0RRdE1yWlpQTUVEMk1jYnhQTUxqUEF0WHMxQ0RXaDA3elVX?=
 =?utf-8?B?dkdBSlJVYjBFNkY1NGZKR1lhaGFGdi9mSnhIaXR5SHhaV09wcWFTZ1ZDY3JT?=
 =?utf-8?B?Y2pPUFhwc1doUEdCNGNPTmlOOEx0TFd5RTdiWXZtZUtVNkFOdEI3cTJzUnpJ?=
 =?utf-8?B?ZzZaL1dYMWNkVUNmVklZcjFCeXZLa01PK09JUEpIRlEwM0xiUUtTaWJOcS9w?=
 =?utf-8?B?ZUNTbWVSWHl5aTloMVFqZHh2ZjdXMVpFNEpKWFZDbUlzRTZaVmEvcmxhSkNZ?=
 =?utf-8?B?WWtaY0RmZ1hIbTE1QmlFYjcwbUZUWTQ4bnZ5eFRlQXpqR0hjbnFzYjVqM2R3?=
 =?utf-8?B?UmxKV2QxK1VPUG1qZ1JMbGpnZXFGY0lqOGhSZ2c4YjVmWlJYZGMzTWh3Y3Vv?=
 =?utf-8?B?aHlOZWIwVjc4RVhQRzY5azh5VDVZVFpLd2pUTEpHNVZhTE1iVFMxbGp3cGFO?=
 =?utf-8?B?RWY1aWlhSjRqMTBNT0h2NTJYbThzUldHN0pQRUVabGFoU05DdUlVYS9TWkx2?=
 =?utf-8?B?bWs0NmtFVVExcVNwQlNxWm5tY1NkdzRYZlB3QXBPQldENklYUmhXQmJtQUFS?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD714E0640EF1D4A9C37F4991ACD0970@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4454fb19-065f-4a37-c02c-08dc65f743ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 13:46:24.8014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mHgJaPcj5onwe+QtIwSBGPP3lWngKUDQl0ZHNKUD3gIpyvlXHzcM6hA3nf5e5Io8yk5fX1L9lomidH76pJeT0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8298
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDE2OjIzICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEFwciAyNSwgMjAyNCBhdCAwNTo1OTozMVBNICswNTMwLCBUZWphcyBVcGFkaHlh
eSB3cm90ZToNCj4gPiBXaGVuIHVzZXIgY2xvc2VzIGV4ZWMgcXVldWUgc29vbiBhZnRlciBqb2Ig
c3VibWlzc2lvbiwNCj4gPiB3ZSBhcmUgZ2VuZXJhdGluZyBlcnJvciBjb3JlZHVtcC4gSW5zdGVh
ZCBjaGVjayBpZg0KPiA+IGV4ZWMgcXVldWUgaXMga2lsbGVkIGR1cmluZyBqb2IgdGltZW91dCB0
aGVuIHNraXANCj4gPiBlcnJvciBjb3JlZHVtcCBjYXB0dXJlLCBqdXN0IGZyZWUgdGhlIGpvYiBh
bmQgcmV0dXJuDQo+ID4gcHJvcGVyIHNjaGVkdWxlciBzdGF0ZS4NCg0KV2hlcmUgdGhhdCBpcyBo
YXBwZW5pbmc/DQoNCklyaXMvT3BlbkdMIGRyaXZlciB3YXMgbm90IHdhaXRpbmcgZm9yIGV4ZWMg
cXVldWUgdG8gaWRsZSBhbmQgaXQgd2FzIGNhdXNpbmcgJypFUlJPUiogR1QwOiBUTEIgaW52YWxp
ZGF0aW9uJyBlcnJvcnMgaW4gWGUgS01ELg0KVGhhdCB3YXMgZml4ZWQgaGVyZTogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI3NTAwL2Rp
ZmZzP2NvbW1pdF9pZD02NjVkMzBiNTQ0OGY2MDZkN2E3OWFmZTA1OTZjM2EyMjY0YWIzZTE1DQoN
CkkgZ3Vlc3Mgd2UgY2FuIGhhdmUgc29tZSBoYW5kbGluZyBpbiBYZSBLTUQgYnV0IFVNRCBvciBJ
R1QgbmVlZHMgdG8gYmUgZml4ZWQgdG9vLg0KDQoNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBU
ZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGluZGV4IDkzZTFlZTE4M2U0YS4uMzc2YTJjMDRlODk5
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gQEAgLTk3MSw3
ICs5NzEsOCBAQCBndWNfZXhlY19xdWV1ZV90aW1lZG91dF9qb2Ioc3RydWN0IGRybV9zY2hlZF9q
b2IgKmRybV9qb2IpDQo+ID4gIAkgKiBURFIgaGFzIGZpcmVkIGJlZm9yZSBmcmVlIGpvYiB3b3Jr
ZXIuIENvbW1vbiBpZiBleGVjIHF1ZXVlDQo+ID4gIAkgKiBpbW1lZGlhdGVseSBjbG9zZWQgYWZ0
ZXIgbGFzdCBmZW5jZSBzaWduYWxlZC4NCj4gPiAgCSAqLw0KPiA+IC0JaWYgKHRlc3RfYml0KERN
QV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmpvYi0+ZmVuY2UtPmZsYWdzKSkgew0KPiA+ICsJ
aWYgKGV4ZWNfcXVldWVfa2lsbGVkKHEpIHx8IA0KPiANCj4gWW91IHN0aWxsIG5lZWQgdG8gdGlt
ZW91dCB0aGUgam9iIGlmIHRoZSBETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQgaXMNCj4gY2xl
YXIgb3RoZXJ3aXNlIHdpbGwgbmV2ZXIgc2lnbmFsLg0KPiANCj4gU28gaXQgc2hvdWxkIGJlIHNv
bWV0aGluZyBsaWtlIHRoaXM6DQo+IA0KPiAtICAgICAgIHNpbXBsZV9lcnJvcl9jYXB0dXJlKHEp
Ow0KPiAtICAgICAgIHhlX2RldmNvcmVkdW1wKGpvYik7DQo+ICsgICAgICAgaWYgKCFleGVjX3F1
ZXVlX2tpbGxlZChxKSkgew0KPiArICAgICAgICAgICAgICAgc2ltcGxlX2Vycm9yX2NhcHR1cmUo
cSk7DQo+ICsgICAgICAgICAgICAgICB4ZV9kZXZjb3JlZHVtcChqb2IpOw0KPiArICAgICAgIH0N
Cj4gDQo+IEkgdGhpbmsgSSd2ZSBjb252aW5jZWQgbXlzZWxmIHNraXBwaW5nIGVycm9yIHRoZSBj
YXB0dXJlIGlmIGNvcnJlY3QgaW4NCj4gdGhpcyBjYXNlLiBlLmcuIElmIGEgdXNlciBjdHJsLWMg
YW4gYXBwLCB3ZSBzaG91bGRuJ3QgZG8gYW4gam9iIGNhcHR1cmUNCj4gb24gdGhlIGpvYnMgd2hp
Y2ggdGhlIEtNRCBraWxscy4NCj4gDQo+IEBSb2RyaWdvLCBASm9zZSwgVGhvdWdodHM/IEkga25v
dyBib3RoIHlvdSB3aGVuIGRvbmUgYSBiaXQgb2Ygd29yayBoZXJlLg0KDQp5ZWFoIGRvbid0IG1h
a2Ugc2Vuc2UgdG8gY2FwdHVyZSBpbiB0aGlzIGNhc2UuDQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4g
KwkgICAgdGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklULCAmam9iLT5mZW5jZS0+
ZmxhZ3MpKSB7DQo+ID4gIAkJZ3VjX2V4ZWNfcXVldWVfZnJlZV9qb2IoZHJtX2pvYik7DQo+ID4g
IA0KPiA+ICAJCXJldHVybiBEUk1fR1BVX1NDSEVEX1NUQVRfTk9NSU5BTDsNCj4gPiAtLSANCj4g
PiAyLjI1LjENCj4gPiANCg0K
