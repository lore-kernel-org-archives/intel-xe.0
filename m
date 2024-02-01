Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27781C47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 11:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC11C10EC95;
	Thu,  1 Feb 2024 11:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7XlllSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4096B10EC93
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706788557; x=1738324557;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZoA/WEtgZL1l2cQ2pGMvdCICmhx6VPLqxiqfKKv3kgE=;
 b=m7XlllSXpFUieGTaV8vH3igM+vs7WvJ8RMEQCaa18Fy+vs55SKcQDL5k
 J3ZTvClbPqLTjfWuqR8WvjErTdxdcsD5rABBTmIJQ3qv4CZbz6x5hNVU6
 NkPActayEjG/3ULLgX4is4cl6BHF377kw5Q02soR/5yjVOqQgFhdzQzrj
 ROk+xM6W6yb0AJehZOc2/yNilNLQeWeoNG+AaVfHX041kNnoC/DsRO7L8
 VNwfbcf2mK0V7DZ+Q7F7iEbotOMsX0EaeP9WNm++/M4ueLzq9gYFNk5fb
 XNI7RCPol1fGYLsYdKkhxvbIHF3PaKR2X77AN1m8Gfju0ms2GjElQHhdt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10628589"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10628589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4360545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 03:55:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 03:55:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 03:55:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 03:55:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPI1oOT9UO98cYkNk75Thw55PxAlgJa8EMo7jFckXUrrSM9mGThZLipH3N2hik4XQzRkqDtewZmLacr3jP5k/bDomJ9DTOKFCKlNsXZIoka8gdHdl2m6Fwql0W0eCyO58FmBIbmAkGntPxhrDGZ65n8O1jykC+a5GyLARX+0je8XqKIRAko8TMCbXAonbQNFfzui7G7LFNqP7C2DnuvqfSQd67TcBL3xpyFTknGkFxq7OX9smRvBO8KKrL5XI9SHZJU4xrWWoZW5AXA6aiHwJp7zg2AVcuBcM7opNQwLCkzavQ8sk+ObAdchdj2qGPyQ0MPuqc0t1HXL7/87iZuHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoA/WEtgZL1l2cQ2pGMvdCICmhx6VPLqxiqfKKv3kgE=;
 b=XPDX+WbIxK33EQNr2ixyCUP/sQ1GndEgmfSFymYM0fgh47t5//nxfrTvQo0MYMOdpTHT3HSzGNnq3EBnLCUJ1as7NzI6JqKDX6c8Vm2eO/pPE+EPi38B83rtFvREh+nm0MeMKD0NoQAXhMdRDinkdPY962aRCTRvnvsQc2Aktg6ClWi7rNKDZ5v+mQfqheaqbOZu0onaB6DsOod1m7g8i4zgb3UGOxJhozfG1tGPFN+uJjohjuY4OYrl6oRvXNIWGa3VYu13KBlj40CPTM6VtSCuh1khMmfXa8UW/RXjI/w3IBbtEkrh9Wgs1G7OMwLDWKE4NuRymM0AKZuFqjMnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 11:55:47 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 11:55:47 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Remove persistent queue support
Thread-Topic: [PATCH] drm/xe: Remove persistent queue support
Thread-Index: AQHaVQKje9YNPClWPkyUYnCIY5iv37D1XmaAgAACi+A=
Date: Thu, 1 Feb 2024 11:55:47 +0000
Message-ID: <SJ1PR11MB6204EC26B9956B55F52718AD81432@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240201114601.2431375-1-tejas.upadhyay@intel.com>
 <6b748f1ce0296dccde0f804b2f02468e54660044.camel@linux.intel.com>
In-Reply-To: <6b748f1ce0296dccde0f804b2f02468e54660044.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4560:EE_
x-ms-office365-filtering-correlation-id: cffae4c3-1004-47d2-6f77-08dc231cbab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ezIAkBPebrZFYEBp2HYPiS9B1ECuDDNuCavxJ/D2WTUQHsLNzbiwK7YTOAjqo7pq1fZx9Gk8vw8PD5b6BVM8eYhNA2oFwxOVxievcFyQvvD5atPMt6PECzfuW0k2fyoC/7lffBPdM/EnbcEo2BTInNYLqZ8o3JKV7h6avTcAtdyWbkNW9eLaEUWRNje/uQOKIVAg4V2EpxbHAGIteHKvXdrsE7xYB3pn7Owcx5IP6LpMaGKfkfYRS/XIgEcy4/E6UrviGceWRHmSce77XHsAonsYG3MAwjmqE/pjZz0txGe6LEiU9qi2kZ2eqIlQJGHs6WmAnGGooN6OhOtR8uq4x3yKdfBC6Ki1WVDN2MuvybFti0CqSnftJnmV9oWYPg816poPQ7Qtbys2EfP0gVXu4KWVZLVrVx8md/uydLqvz7ELABjko0GqB4DGOfwKAx73CoXo4D0+6xUJNYkPYzAdFi+gZzngHRn8ts6C4qY9hY9K9HjEs30H/NRa0+ERwVHIAMGXj7aIHE0PpJDsJ/pmbJsgWAEuU/okhbSndtldAVcZ7cGLQmeb1Iqb8HLOS/RpNNuCdpwoBL8nT/VlaCMH24YXsbAYOBy5ybt4GGIKlE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(316002)(71200400001)(8936002)(7696005)(53546011)(6506007)(41300700001)(9686003)(83380400001)(122000001)(52536014)(5660300002)(8676002)(2906002)(4744005)(478600001)(966005)(110136005)(66946007)(66446008)(66556008)(76116006)(66476007)(86362001)(64756008)(33656002)(82960400001)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUp0SUxNcVN1YndkYnNxdWxhcXNtMnhUajVyYzkwZExNdUt1S1J2TndnVUor?=
 =?utf-8?B?dzh5bjhjU0xaMWJhZDJ3TWhqN0FuN0RWZDFCb0o2dCtBYktRU0JwUFJFdUhJ?=
 =?utf-8?B?R2lFb3EvZVdzUko2dnNuUXFLbWtCZ012RnAxR09iZ2hHRjhSOWhtRnNlUjdu?=
 =?utf-8?B?LzA1bTRjdnh6Y0JuVnE0eDlGakZSUDlFQ1RRRm1sajhQenB5YUNZV25PVWJK?=
 =?utf-8?B?Y2h1cUVoWFhBOEpZSkVPVmVKTCsyczJ2bWNNYkFiUTNIZTAwcWxjUzVrYUgy?=
 =?utf-8?B?UHNtTTVGVDR4NlMvdHlkajlUdHptUkV5MUtNNmlmRE1IakpDcW5TalZvN1ly?=
 =?utf-8?B?emFkaDE2MVdtUHFyR2RwN3QzUWIyYlFCSjJNa0ZVTDJHSGNaWGVFcXRGM0NY?=
 =?utf-8?B?bTdaNTNjaGxrbE5jeXFlN1NhVTVZRVZBSkhtN0RvU0hCZm05cEVzT1g4V2Nx?=
 =?utf-8?B?MmdiS1NiOVpINjF3TGpvY2NjQW9HWUlTOVJ5N3l6MmZFWXZzOExKSlorQXY4?=
 =?utf-8?B?djF3Ym9ybDh4cmRmSkxwblE4WndUZVUzbEZldXZ3REJvN3U1RjNBMmdra1hi?=
 =?utf-8?B?K0hXdGFQVWRnOXk4L0YwRWNlNWZOYld6MkxCYTRNUWFyRzB3UjJEMDhBb3gx?=
 =?utf-8?B?M2F5WTkvdE5KV3dPd1Z0WXdydzN1aVBCV3VMRFc0Skp3VWFLMlZsd1dZT1dV?=
 =?utf-8?B?cXJMcm5vN2lhN0ZCVTNiTUtIR3VTTG94NXREZURkM2p2R2F2cHhkWUFZK2E4?=
 =?utf-8?B?SFZ3dTdJd24xS3cvdTY4MHZVc1J1dS9QREcyRm1HZXlLK2JhcW92b2s0bHNx?=
 =?utf-8?B?bzEyWjJZRERVcU9CTW11a3RSVldxNEtzeEVNY2J5Q3NPUEdHbCtrR0kybXBu?=
 =?utf-8?B?WWVFNGNhTldEMERMNEd2RUxMMlJGWlk0ZjdxV1B6RkpYbnpvbkttMWZFdmN4?=
 =?utf-8?B?R0NOZDBscW5Kd1Q2L3VxTlNucytLUUxZVGE4cjlxQW9CZ1l5S3RVQkxYK0ti?=
 =?utf-8?B?RlljMjlzdHVjcWpaM3ZtT2RiWEs1Nk9MdTNiYzRXek43K3oySFBqbnlSdEU4?=
 =?utf-8?B?R2R6QkQxVXRBdndVczNXL2FLaXVoM1ZURUpXbzZnK2ErUlhBMmdzVTJ1Q3N1?=
 =?utf-8?B?c0tBcDVZbDloTzk2SnpxT1g0WTM2YnFadTBtVkp5aVRnVHdpSzVDbDRzcFBW?=
 =?utf-8?B?WWNVdDVOL2RsbU9vMDVJSDI3TTJnVjFOKzRQQ0I1eDFmQVBKb2Mra2trVlZE?=
 =?utf-8?B?VkhITGIxblNldmtlQ1pKWkxZTTBqWFd0N3FuQ043eWdaejRXeGZ1QmRGWG9C?=
 =?utf-8?B?aDhSaFNGZ2JNTmVTTkRqUkhIWmVhcGNYNnIrdnAyNTJqWkQ5K3BLWFhUZ3J5?=
 =?utf-8?B?VC9vN1E3V2ZFSG5NUEE2SktMRDgyaFg2dGJvc3YzSGRYU1pVc3dFbk9IYzRm?=
 =?utf-8?B?WnFMNGorbE5hdDFqNHVnVk9rYzhPVjRJQ3l1bmtGRm1NdWZJSEdZNjVJNnAv?=
 =?utf-8?B?VHp4ZkI5anYyazFTTzFkUzdmN09jczE2Ymsyb3lOTEZnclU3clB0V0J2NzZU?=
 =?utf-8?B?QzBOZGJkQU0vRkdSSjJuSDliRTlGcnduMGw2U1Z6OC80ZlhqU202bmNLODFZ?=
 =?utf-8?B?S3FNWUxWdkZUdFFKS1IrcGhvbSs3YTFnRkpqUEpJNVhnZkVwUHF4elRJamhT?=
 =?utf-8?B?UXFXa3hZbFpXWVBCQlVZVlhDQmxUQ2czUXpnWk84TUZPKzQ1WTBYZWp2cTB0?=
 =?utf-8?B?WE8rUGpEMEJKZjh4TGdLaG1PQVV1dEkvUFNKZGVJUkRHK2p4Q1hVTXpnZ1h0?=
 =?utf-8?B?dDlKdWxydGhLaityd0VUZHhITEpETlNNVnhqS2drdW9saWlBWkViV3BORXF1?=
 =?utf-8?B?TG9pZnptRGh3QWdnTW9Fd0VYeEk2YVdXUktCOG5GV2NOcStBU0tNUmlvdzVC?=
 =?utf-8?B?NHNDUU90SmFrdjE2RFVPWGtscVN6MHhyMmg0dXNxMDFqRGwvTlNpN29VenVZ?=
 =?utf-8?B?TTVUSzI0SlNUUE1OaWxKUGlHTWE2cWEvb2tRZHQ1dC96R3p5M0JYSG5BZVNz?=
 =?utf-8?B?UDVQTU1Mcy9sZ25nM253U3AwRysrYlloMXhsbGxoeGFWQVc3bVVlWFBxQ0cr?=
 =?utf-8?B?aWxmUlhhQ2xQMFRsRlRiODYzZ0xBejduRE5FcDlzbmhFa2loUFJNVjhrUXgv?=
 =?utf-8?Q?MP9pWfBClRn+JAj1Zal4m9Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffae4c3-1004-47d2-6f77-08dc231cbab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 11:55:47.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPKxrFGpjZDeNtc43x1pkZCaZWahrcNzbhL8tSouMM/P1Hfa/9kS6yw7FECErszphPRzzUHPtp9OuM2h2/8+No3bih8RnL5IFeCSuXaO3Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
RmVicnVhcnkgMSwgMjAyNCA1OjE2IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVw
YWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlOiBSZW1vdmUgcGVyc2lzdGVudCBxdWV1ZSBzdXBw
b3J0DQo+IA0KPiBIaSBUZWphcywNCj4gDQo+IA0KPiANCj4gDQo+IE9uIFRodSwgMjAyNC0wMi0w
MSBhdCAxNzoxNiArMDUzMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gTXVsdGlxdWV1ZSBz
dXBwb3J0IHdpbGwgYmUgYWRkZWQgaW4gbmVhciBmdXR1cmUgd2hpY2ggbmVlZHMgcmVtb3ZhbCBv
Zg0KPiA+IHBlcnNpc3RlbnQgcXVldWUgZmVhdHVyZSBhcyBpdCBjYW4gd29yayB3aXRob3V0IHF1
ZXVlcyBiZWluZw0KPiA+IHBlcnNpc3RlbnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWph
cyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiANCj4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU3NjQxMS8/c2VyaWVzPTEyOTMxMSZyZXY9MQ0K
DQpUaGFua3MgYW5kIGdvb2QgdG8ga25vdyB5b3Ugd2VyZSBhbHJlYWR5IHdvcmtpbmcgb24gaXQu
DQoNCkJSLA0KVGVqYXMNCj4gDQo+IA0KPiAvVGhvbWFzDQoNCg==
