Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07CF45A0A
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 19:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7926B10E9C4;
	Fri, 10 Apr 2026 19:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDQwtf6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485910E9C4
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775849372; x=1807385372;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xYSKNUuiy8Jd7thXXSNUhhRD7ldr7TRNAJX3g5x5Ecg=;
 b=ZDQwtf6YZA62whiPjS1jYKDGEjQ85g4E4hqLfRyWf+xem3sIlwDXsS76
 /ltdHkFtlaejiG5B+XcSmMXkGLwB61DnAnjjLe4dHsEPzctSkTZFwlvqn
 QCnlzdgG7vhquRi+NbkqmDTgSdtPlAbbWVt4gEiEvMFaUi6IIFkw0SJIu
 Knv7mOkyw9uW43572BD8QHTwcoHhsudu5elyhWh4/gaMgNHrN1E+ROCda
 BQd7BLxbDv4Gcpr20zl0kC5TKHtlDLpun/UqLq3ruOhozG8y7EgeYUchM
 KvCwn8wIqxI5nhjYqTzBrdrkVKm3Jkg1bj7rQILE6lsbksVpU0NkhecX1 A==;
X-CSE-ConnectionGUID: ZavdkpaNTsyXe3RRP6j27g==
X-CSE-MsgGUID: XTFumQ/7T8O0moiNYAnXrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76766542"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76766542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 12:29:31 -0700
X-CSE-ConnectionGUID: zRnz9T+2Seuk9/rMkJ7NxA==
X-CSE-MsgGUID: MQRI2E4+RIGuVtlTdNZeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="229440234"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 12:29:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 12:29:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 12:29:30 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 12:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuWhPA4E5P76FBkdvIhnIgxE5iyXM09a3lBXJuPByGyLBYmnJrSc0O8IkLTRKAN4sEscJpL+Skkx9zEopHqIJOH+Bo6dznIA6TseDw2zNVXYWX+pPwcAXw1mresCr0sksfWt3tvYcT0PJ0UC7sv2NC/0+aXdWNXhy+tly5xc2CEMH/hey+AdeSbDNxYNP3nImnDCQBu+UcTy1Sq92R8R7Q1Sr1NcCGyroCarX/YoPfv+q6WhoJ7viwTFOBRya4ioG183wGWP2eFIE6nDG4mVIDArdmu2ceJ2UQeJEmWD3yCKBm1c7iG5kJLDoHdC4iI9adMi+Dj/scxO0AxDeB9cOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYSKNUuiy8Jd7thXXSNUhhRD7ldr7TRNAJX3g5x5Ecg=;
 b=TscBAgpowXarwxT8OFHkGrO0yHMVL3NSjFuZdzqBcqrqvN2Hxnpl3BuznP9uVXNPEIHHMo+enqlHWkTJ2aAO5ubPmXFMgm875x0Zq49o17YMqKFoe/BXVc9nePojstjJqyyWOxMVdsIyoY8tvUZsgj315gdXpY4mf+BR51HZVCH64eTXnOMPcrZQ0CqXFfCP6ztq4QnfkAd6uhAwMho8opnyPz+0gMWqtsNYwcdufMT2gTw3u+rjGC+WsU9vA9eWXNzg+kFaX1peV7hPmc6ZVPd+0f8Q+lRYyOAql69/XlLRTL4KnPsrD4CZ6HshzJE1x9CFaowrVsxiKWJ0Miif9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 19:29:28 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 19:29:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Correct printing of register whitelist
 ranges
Thread-Topic: [PATCH] drm/xe/debugfs: Correct printing of register whitelist
 ranges
Thread-Index: AQHcx6cCnfJlySdBLUSfsAtTBbIucLXYsWKA
Date: Fri, 10 Apr 2026 19:29:28 +0000
Message-ID: <14d0ab26d25d568dd5c4580eb9cd32d8c310c1e3.camel@intel.com>
References: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
In-Reply-To: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4759:EE_
x-ms-office365-filtering-correlation-id: 0150d9c6-b550-4d53-b608-08de97377b76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: lSyKgS9EhgqL+y8kCyIGA0dE8cfCOmyRQlzm7UhER+8MpzdDiWgFXAP6bJDFq/tgMmQ3cKgLyBnGswcpG7OMBZzVEtfaiKaFdwVpxIDdrvdSnbkhYUWj+nEKZGlgJbAi/ikFJncrIMpeuu80RY7u8OK5oMvxpy5KGNDJu9FoAuws/ul2wooqaYscBBEbkDdlUM+HNzGlGtf0h4L2ww9BAQHKeWZegRit7/u0xFiH9uW6c/q5dfdenrYSnmHNiMK8WUoOrGu4yLOHxkpYHblNHyz/vu+wIAZCK0EirJ+RxzgWVupLjTqpopl0t/TzfDYJE7JSAL/zGxwkf4S6yroa2XbDDX2grXC374Fvvr/B3L1qEEniikSq16NjcybqcQy2DQqZKA+4554KlzpXAPGyUJBXzkCEl1q+rK1jD1MQvFD3DVjgCNhj+IrQKFQwCba61SWXuX6ecHji42t2SZqmo4CiPPVWNgC3CdxuX/iPFdl4pdZB44EDc3O0GIrZLkfUO0Ao68R4ll5uKcOu3TIfgaElLxTgdir9LdUN2bdN7EIDs+qodPfwmzGQXXBOQoOD1UBnVUakuQ1GaqOxYWcb7G6nQz3kv1bxHORR21d4VlRv9Dm4i4D3y1GhkptvbLNOtdR870MwuKnIkncmG+k1D+N9Z+s3QVS2xEr0cauty7j0gtCLQRYfZe6vRVLGQkDxS8qaqal0jP3sfH83s7qo45shFMLAWzjEe4WihYD0g5XZV1RJVSMlaBQt+M3Y8rNnMmVsIn7w2efNWpQ/bkCEG3y2L64TvMwynOaEr+3Ag5A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VueG9UbVpndVU0Q3RkMTFteXQ3bFl4TW5oY3hmUWtVYlVrSVB0RVdwN1Ar?=
 =?utf-8?B?WVYvT2lmTGNMaW95SGM3RURVZGdEYlN1cjFjemFlVVhTc01mYzk3Q0IrNzI2?=
 =?utf-8?B?eVB0TUNxRTJQNkpJaEFhc2NvcVowczVXazhid0FjZGVIdDhicnU5cHZNK2da?=
 =?utf-8?B?MGxpeUJDMGVZeTlRTnpJTTlVQzhiaFNXYUpFeUt1OHZKYzE5RXVaRHBWc2ND?=
 =?utf-8?B?djNGc2RVdlU3WmdZVE5hZElZZzQ0TmQyMXd4clZmYzlKZDAwM3hndHBGR0dM?=
 =?utf-8?B?Zks4OFZIT3dzUTNzNmo3bVROM0kzLzdiVkZNOVVWN0NYeGZxbXFBTHl0dnhl?=
 =?utf-8?B?V29IVm1RVlJkdkNaNW5IMVUxbGVBelVGOW9Vck9TOUtPdkNZb1FYQ3p1VUNQ?=
 =?utf-8?B?MkdYVDM3RWpMd2dvZlBJaGlMZmRiOTZiZWxhajlCNjZsMFNVSWNBQjBLL1ZZ?=
 =?utf-8?B?UjlHSHdLSHRndUU0VUo1NVIrUFlnekRneGFhRUpRTlU0TW1tQ3dqSkdsUkFZ?=
 =?utf-8?B?ejdtbytEOGdnVWxkR2hKSzArYkI0bWlGUmlnNE9ObjM1dGx6MGpDdk1EdXNK?=
 =?utf-8?B?NHZTVlhSeHRVNW9HN3B0S3JWdTlMUUMySHY1Z2pHNzN5Zms3Mzl3UFd0MWlS?=
 =?utf-8?B?c1czdE5SalkvaEppSjNiSjBoRi8zT0ViYk9QeExISDQ3YnBnbGp5ckhlUmlu?=
 =?utf-8?B?VDhvQkdZZ2ZrdnBNYnZrNWVzWmQydmg2ZzhteWIvd1NhZjFhOTROK2ZVOXkr?=
 =?utf-8?B?djdjMnV0b0owM045aTJJbDRIbHN6Q1NHTU5GM2F4UFBYYWM4TlZZT3JXMEZT?=
 =?utf-8?B?NkNOZUM5ZnQxSUNjYWFsbFlhNnJrQ0pqQ0NtbUg2U09CUUpOdmZTVHBEZUlV?=
 =?utf-8?B?LzB0blZ2OGtZcVRkVHYyMEdWRWFES1hML1FGWU5HTVpGVjJ3Rm1IcC9YSDZt?=
 =?utf-8?B?WEdnMmVjcWxxdkFjOXlCdXM1b05DbzhYOEx0cndOSlowS3dJbWtEK29waldE?=
 =?utf-8?B?QzMwczcvcDhONkJGd21qUmFLajVXbnRESi9GaG92R3k3V280WTlTVW1BMXhW?=
 =?utf-8?B?aHg1TEk1M0hFQjQyVitBMDFtSmlWQmdxbk1EMGhMcitjUUdROGpYNDZsZWZD?=
 =?utf-8?B?Y1ZoUzZpTkVPS2M0ckJXOWp4ck1nQi9aWHJaL0Jmd0o4c3dXSjQzTVdnelcr?=
 =?utf-8?B?L0hPdSt5OG03dlJXYVNUZzJ1MVMrS0RHbTViTk4vV0xSSWZLWElQZHJia2J3?=
 =?utf-8?B?OC9TQUQ0bDVoblJybUpZQ2g3MU53aDdES3duelI1Qi8xaVNOK2JTZDNaczBU?=
 =?utf-8?B?RUxKeXY4SVJ6M3E0UGJJakI1VlMvT2JraFVQajBZaXdSVTlwdTMxdVhvKzEx?=
 =?utf-8?B?TVhUSjhpSWZrQmJKMjdmNnR2Yk9zdWFqNTRBcU9iWWdHMWpWZXluSWtvV3k1?=
 =?utf-8?B?cTlKL0FqeUdJUCsxZDFRUmtNdWo0R2FGWTZVdnB2MEJxT0NXQ2tSaFVuWGdO?=
 =?utf-8?B?RUtBYWV5QzhzRVF1bFhxVzF6NUhBbmlBWjBkZHFQbTE3bzduUTNZa1J2eWVR?=
 =?utf-8?B?bmtJU2syWjdrdzk2YVZHakk4UnJmMUdNUlRUNThPck1Xd2NTQVJ4dHZrRHBL?=
 =?utf-8?B?Z2ovbWx5Z3EyV2w3VXFqbU1BTVRDQUtORXFVTXBuVEU2S21DVUdlY1dSNnNF?=
 =?utf-8?B?aVdyeHJJSERPd0dzWDFYTW1Zc2MwcnhJWVdjTmNWOS9ZLzE1RWlrbmlQajdN?=
 =?utf-8?B?TjlteTZLeWpLd1FPRzV5bTRudHFiWTNyVG1VdUw1ZkgzZVpxZXV6akJCYWll?=
 =?utf-8?B?M3krbTArbEZjK2VTOXlDdlJIR0kvdmJMenpTdFUwZFhLTk1KWjNGTnRaSENG?=
 =?utf-8?B?eXRNdnFQTU1IZzVUMlJlcThsOHErd0lodUtjcWVDcTJLWE5acmdVa1dER2xm?=
 =?utf-8?B?eTdMRFE4cWM5Ni9wYVp5Sm5ZaHVINlV3WVdjelNrdGswSjlzb1RaTnRTNmNC?=
 =?utf-8?B?a1loMFMvS0ZoWlg3aE9Yc1RkdFU3d0hYTHhIRUVLdXVJUmVGNmVJaUZVZGpo?=
 =?utf-8?B?WXdZR1BTbi9VMzk3VGF2WFZwbURpYSsvMHVDL1p4V1pzTWJQWGZQYWluRWs2?=
 =?utf-8?B?dnc4dVBRQ2g0TzhzbXlYY3ZVYi9FaFJDL1VxUFlyeWE4NGg2MEV1OWFmd1Z2?=
 =?utf-8?B?ci9KbUxGUGUrMjFaQy81S0ttZDF6bk5wVTFxNFZuU29ZUnF3akVIS2ovUVlH?=
 =?utf-8?B?UEdFRVFMSVJ4VlZyQVFQdU5ZTUdnWmFUS2RZZFNJY25renhSWUR6VG5TaVVN?=
 =?utf-8?B?QUh1OC9jdXIxcUNnRmhZZlVvRVZ3QVJVdi9Mc1hUcCtSTWgwVlArWWVoNEow?=
 =?utf-8?Q?BHt2MXjX92urvC+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <013CC613D7870447A5AEE28FFFDB3A0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: v+dAdvJRCKBks96eb5kt2El1xDxvgXYt3PpIpe9D4j/atthJivMolg7pRaBfncnsABkuPGoHyz7qQJCbISsmqT5ZP6H+EyyMSPCP9QJ5SPfbSFvW7OiPM2cs578jOomVl8vdx/7bvzHSTHzbCijUKP9I1MFtPlhIk84sgcquDrPrXuTix0I9orkZEPh6FMl6Wqniu2C3JDEf2pIX73ChBAKJnxUlNjPeXTQvBcGBbbUIZSFEuo+y84ZXeG8JPoxfiYkFwKKIa1DvPWBWHzho33eKK/cXmEpeSKd/9S0Vgd811S7uRzPI4KoYHIEilFQ6sgDX/SC8xsp+3l9TB9XpZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0150d9c6-b550-4d53-b608-08de97377b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 19:29:28.3232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgBZD+vhwEFcX3MS0myXgqV8sily6NnE06+h3BocD7zobr65XhNCKEfBkqwMwnT6nTj54gtIjbn5lWt16hthXiyyopdxXa5ZCg7CORH43WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
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

T24gV2VkLCAyMDI2LTA0LTA4IGF0IDE1OjI3IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBU
aGUgcmVnaXN0ZXItc2F2ZS1yZXN0b3JlIGRlYnVnZnMgcHJpbnRzIHdoaXRlbGlzdCBlbnRyaWVz
IGFzIG9mZnNldA0KPiByYW5nZXMuwqAgRS5nLiwNCj4gDQo+IMKgwqDCoMKgwqDCoMKgIFJFR1sw
eDM5MzE5Yy0weDM5MzE5Zl06IGFsbG93IHJlYWQgYWNjZXNzDQo+IA0KPiBmb3IgYSBzaW5nbGUg
ZHdvcmQtc2l6ZWQgcmVnaXN0ZXIuwqAgSG93ZXZlciB0aGUgR0VOTUFTSyB2YWx1ZSB1c2VkIHRv
DQo+IHNldCB0aGUgbG93ZXIgYml0cyB0byAnMScgZm9yIHRoZSB1cHBlciBib3VuZCBvZiB0aGUg
d2hpdGVsaXN0IHJhbmdlDQo+IGluY29ycmVjdGx5IGluY2x1ZGVkIG9uZSBtb3JlIGJpdCB0aGFu
IGl0IHNob3VsZCBoYXZlLCBjYXVzaW5nIHRoZQ0KPiB3aGl0ZWxpc3QgcmFuZ2VzIHRvIHNvbWV0
aW1lcyBhcHBlYXIgdHdpY2UgYXMgbGFyZ2UgYXMgdGhleSByZWFsbHkNCj4gd2VyZS4NCj4gRm9y
IGV4YW1wbGUsDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBSRUdbMHg2MjEwLTB4NjIxN106IGFsbG93
IHJ3IGFjY2Vzcw0KPiANCj4gd2FzIGFsc28gaW50ZW5kZWQgdG8gYmUgYSBzaW5nbGUgZHdvcmQt
c2l6ZWQgcmVnaXN0ZXIgd2hpdGVsaXN0ICh3aXRoDQo+IGENCj4gcmFuZ2UgMHg2MjEwLTB4NjIx
MykgYnV0IHdhcyBwcmludGVkIGluY29ycmVjdGx5IGFzIGEgcXdvcmQtc2l6ZWQNCj4gcmFuZ2UN
Cj4gYmVjYXVzZSBvbmUgdG9vIG1hbnkgYml0cyB3YXMgZmxpcHBlZCBvbi7CoCBTaW1pbGFyICdv
ZmYgYnkgb25lJyBsb2dpYw0KPiB3YXMgYXBwbGllZCB3aGVuIHByaW50aW5nIDQtZHdvcmQgcmVn
aXN0ZXIgcmFuZ2VzIGFuZCA2NC1kd29yZA0KPiByZWdpc3Rlcg0KPiByYW5nZXMgYXMgd2VsbC4N
Cj4gDQo+IENvcnJlY3QgdGhlIEdFTk1BU0sgbG9naWMgdG8gcHJpbnQgdGhlc2UgcmFuZ2VzIGlu
IGRlYnVnZnMgY29ycmVjdGx5Lg0KPiBObyBpbXBhY3Qgb3V0c2lkZSBvZiBjb3JyZWN0aW5nIHRo
ZSBtaXNsZWFkaW5nIGRlYnVnZnMgb3V0cHV0Lg0KPiANCj4gRml4ZXM6IGQ4NTVkMjI0NmVhNiAo
ImRybS94ZTogUHJpbnQgd2hpdGVsaXN0IHdoaWxlIGFwcGx5aW5nIikNCj4gU2lnbmVkLW9mZi1i
eTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCkFsc28gdGhhbmtz
IGZvciB0aGUgZGV0YWlsIGluIHRoZSBjb21taXQgbWVzc2FnZSENCg0KPiAtLS0NCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcmVnX3doaXRlbGlzdC5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmVnX3doaXRlbGlzdC5jDQo+IGluZGV4IDgwNTc3ZTRiNzQzNy4uOGNjMzEzMTgyOTY4
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3doaXRlbGlzdC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0LmMNCj4gQEAgLTIyNiw3
ICsyMjYsNyBAQCB2b2lkIHhlX3JlZ193aGl0ZWxpc3RfcHJpbnRfZW50cnkoc3RydWN0DQo+IGRy
bV9wcmludGVyICpwLCB1bnNpZ25lZCBpbnQgaW5kZW50LA0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0K
PiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgcmFuZ2Vfc3RhcnQgPSByZWcgJiBSRUdfR0VOTUFTSygy
NSwgcmFuZ2VfYml0KTsNCj4gLcKgwqDCoMKgwqDCoMKgcmFuZ2VfZW5kID0gcmFuZ2Vfc3RhcnQg
fCBSRUdfR0VOTUFTSyhyYW5nZV9iaXQsIDApOw0KPiArwqDCoMKgwqDCoMKgwqByYW5nZV9lbmQg
PSByYW5nZV9zdGFydCB8IFJFR19HRU5NQVNLKHJhbmdlX2JpdCAtIDEsIDApOw0KPiDCoA0KPiDC
oMKgwqDCoMKgwqDCoMKgc3dpdGNoICh2YWwgJiBSSU5HX0ZPUkNFX1RPX05PTlBSSVZfQUNDRVNT
X01BU0spIHsNCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgUklOR19GT1JDRV9UT19OT05QUklWX0FD
Q0VTU19SVzoNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMDgwMzdlZmE5MWMzNDllZTE3YjYy
ZGRkMTkwOGE4NDZkN2FiZDkxNw0KPiBjaGFuZ2UtaWQ6IDIwMjYwNDA4LXJlZ3NyX3dsX3Jhbmdl
LTNlNDhmNTIxYjUwNg0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQo=
