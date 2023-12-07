Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58145C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE7F10E104;
	Thu,  7 Dec 2023 05:12:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0755F10E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701925966; x=1733461966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bVohtOPLR3oOc3KUfWJJpc1LM3E3ALxJ0vHR/ChZBoI=;
 b=ARFkB9k0JE4TaJEqSpZELWx8ODxs40B11NXTXpxnIH7aJkoJ1g/B8Z3h
 A2EEiw3aFhARf2NNYPg9PNQHFl/jrNFfNVge0DzKelczgudcnLhJ7wpKb
 rg2axMyp1sTCuakgl7rdFUMHIj6+IYoCtj1cWFaIXubihtlr92JTZQ0W6
 D/oijUONgShMXS1zPw6SdYTxT1T2WN/OQ5ggxS+Df2szQmMmrWLPWNDp5
 nLyOWCzJLzKmNk7k/nMN5hWbMI4E59Gx/818GgkcNlrM8etVkOd0/IkvR
 LzvNuzAu63zAT1b9SS3DJijgQ2zchl0mMOgFESlJnUEnxMxsWQhQMjwm/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460663035"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460663035"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018814777"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1018814777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:12:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:12:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:12:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:12:44 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz/Qwzv/XK8C+rsVFpqa8+hT4g0EmR2YKWr823KNeWsI2xFdvorybiAa6znPQoqqSpheCn7lgzPEaxxD1OSM8IU3wlhExa7q0DX1MY4fkT5vL6pD33PCO9iKYfmAPYY5ZLrBu2d3FPLf1T5NofIhJMjg3KBo1O1Y+7fWWzrOn8A9V5B68CMGT80/n2973scOlMT8B3HURshMkmuehwqDkDACz+W/AECnqjaQzxFTWykFEq7ixuD3Q2Dad/74Qq3vA8OjZ3Xkj0KB2GBvc/otlp87ZGbByfu7F987mtofjM+Eh4T91qjXhlZgh2PCuv3477zORHuHTLQLwkTbFxNF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVohtOPLR3oOc3KUfWJJpc1LM3E3ALxJ0vHR/ChZBoI=;
 b=n/3JfWITfQJbK43N+hfk71dVnNouTlqU5F2gt+T1ty43lcXmEiZ2ZQcESI1u1U1b6Jkg14VwX3zeeaG6Sdgds+CFnj907A1ctNtrNcr/Lgf25jyvF98JF2MWlotoWLivNmhMa3HA+jrCnyrxhhg+6wMJL7dpuGElqErs/dufp5kKyx35Fe/+MeTfCvtIo1xMCOSS1yAqiTQOrHOVtWTXGd6kV/MMMV74IXk/V3fNbzi5ELNNXw3IlG0UbYNmTJQyV3EZ2yHKhqu0GLtdW9Nl9EKcffTYYgQAm3fwzNfBnWRqka6kFPHo37Zi1l5QjeGS6kXFS5hrA06dduki4i47Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:12:42 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 05:12:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaJ/1lvSh0mtb24EupUiCAkv4727CcJcKAgAAEAACAAAGMAIABHD8A
Date: Thu, 7 Dec 2023 05:12:42 +0000
Message-ID: <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
In-Reply-To: <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB4850:EE_
x-ms-office365-filtering-correlation-id: 6241ebb4-9034-4212-36f5-08dbf6e323f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MlDUncMzIItPgwJNYHnWO6PyPMFkW4/mX9pQXKN0oThGhZoSiGX1uQuVI9Y1dY0tNFAdnNpK0TZTJhD/cH9YFYf7rVEmIZsjr8w5aGW8ccyNg4h+GZVj8YDMU+jmYgHNVCmQNH4wEJTMSv2SCq4OIi7ETMrJosshc1ste6nwJSS+wv1/4dJjEg1nk95T0ym+rYRQ2jgwi0HrQflqcLx0vEoTIQwASsdhAqsjE5ghLlZfdzZXqP7t7aD5zty86dU01rEMyeSYdVm+xY1sjtrE1DzlNytaZqLOldavVE5ngmdQv7xQwpTNWugZ+HbCv8MOpJMGzqVbPtQj7V3i7s6Ml8H45UigjimhfZXWNkHzzWJfvkv23401vVHq/DA+9lUMiadLV309B1KITPhriTwHdIZ7UdQ/c3KyYc2BILV+Ic0bqqFYSm54BelcjV0waevYEMWSw86mLLSi40sBxYUKYj3OK4NEJ1KL1BRVD8sNGhDwTZqPve3vNo7sEHdwoox1iXlhoAc33e6kFTwvBCxZ5PJi+oPILKlBBTeN57C8mhU80IIlRgPh2bTHrnAiAVfxWIzBrQOxfp6l/+Lus4GjAe5SW9LVzIu6vMmjKEixYz8/hOKaj+XZ2rOxXY7c6ppo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(55016003)(9686003)(83380400001)(82960400001)(478600001)(71200400001)(107886003)(6506007)(7696005)(53546011)(66946007)(64756008)(316002)(110136005)(66476007)(66556008)(66446008)(76116006)(4326008)(8676002)(8936002)(52536014)(122000001)(38100700002)(5660300002)(2906002)(86362001)(41300700001)(38070700009)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUpqVElvOU0yWGJsSHBUZzl4dVFsQmgrM3pmZGtlT1oySmVRb1Y0d1VMdklt?=
 =?utf-8?B?SFhkdEoxQVlXSjRMZEpRbEZoSno4S3FTT3ovNTYwaFNiVG0rTXlTV3lMVDlQ?=
 =?utf-8?B?TzA2RHFOdmV2SksyRmV0R1hyUDlTSEhudHFqUmpweVNVMG1kRTJPMS94bXJQ?=
 =?utf-8?B?eU1WeGN3cEdidXJXVFpaUGFOZXBzQXljRThwZXJTRkQxV2tDQzVPNDJNM0I5?=
 =?utf-8?B?bTZLekVmaUlkS0prWDJOS2ZYWGF6dGdVUG5EbHBYZFNQQVZ5Ry82UmdEMkpo?=
 =?utf-8?B?dnJ6cFVOZnVOM2g5N0ZYdURJWWYvOTR6N3I1REhTNk9EaUJQMTRGOHNiRWd2?=
 =?utf-8?B?cWgyNy9pMVlqTkJxRTZnZnJTWlZaQ3cvSlZmMW1LdWdsdmRtc1p5ZFZyM3hC?=
 =?utf-8?B?cjV2MGZadFVMcE1LUnhpdXllRDZjSkJNV3BTMXJBVU14N1lzaGV2QlF2YTJx?=
 =?utf-8?B?TWk2WTZ0VTBTS2RKbzlXRXVpTjl3cyt0ZUdlQm5PWXBSL2U5VXJHNzNVRXky?=
 =?utf-8?B?MEhJS25adUJXMVRvZjZzc0JmMFkrYlZEa0tGTmFsZ1k3V0VoSEkrUndDamJs?=
 =?utf-8?B?RzR0cEhQZ3hRbVh1T1NWR0hvU2tyK29qNUF4NW9hSzNObThpVjhmQk00WldY?=
 =?utf-8?B?bTdTS0lhNTluMFJmckdpTEI2UDByZGt0bjR4bEkwcms3cVo2ZDNkeE8zSGpk?=
 =?utf-8?B?cVRwVEJWSmlweW9MUnBWSjlHc2thc1BrMDhxSkt0QkcwbWllQXVFN1pibUg5?=
 =?utf-8?B?S3I3QWpFVlpqY1BhVFh3VmE4dUx1M2hwTHhNOGlzbDFzVzF0dy9sa2h6a1F5?=
 =?utf-8?B?c0ozTW8xN2ZnVGpubWhDWk1RS2E1dkg1dHdtWHdYeUVuQzNoSGk5eVVuMzNl?=
 =?utf-8?B?dXpwa2ttN2d2TFYxUGNKa3A1a2ZXQTFVL3Q2dTlXYzJZK1BHSVFMWHFuUTZj?=
 =?utf-8?B?Tk9GZXNQbExtcFpXUXBxTHJGdVFYWWR4UlpjdTFwelpDVHpiTmxTSGNTWUEv?=
 =?utf-8?B?ZitCS203ODZ5alMyMkMvMDNqVHl4UjRCSUxuNTdRQWFPZVpOY0xJY2hySnBh?=
 =?utf-8?B?RXZkNnRUNSt4R3JFalJGZ2l0QmN1VzF0YXpwblBZWnVHcGxpM3QxYnYwOG1D?=
 =?utf-8?B?Z3F0bDRiQnpUQlp2VzRJcE00UHB0YTZIbUxoV08vbWNOOTJjZTFGY2NDejkw?=
 =?utf-8?B?cGFObnRTNm1penpLenpydnpaaVpxWUl2b2pqMnNTRTN1ZHZpeVVFTWVka0lz?=
 =?utf-8?B?clNqVTVPcDI4b0RqczRxaHMwK3F2NWY1V1N0ZnR5V2VRSFlPRlZmSHRnbW1F?=
 =?utf-8?B?Y2J4NVo4azU0QWFlaGJzNjkzZmVKNytWblFZTU1jVkJWYmIvQ29YdFIyZEZC?=
 =?utf-8?B?NGdKd3FVUDZUMmtKOGV2OVB3dEFBU2NsRHFxTlhZVENMQ09YeTBkamVaZUxy?=
 =?utf-8?B?NmluRkNpb3ljMXcxS0RXMjdnM0IzZjhSdW5tZUQ2Z1FobzlKSEY3eHJlLy9C?=
 =?utf-8?B?QTQxTFcyY20xNHhiMHI3akNnU1JsUGVIdlF6M1hWckNWRjFjY1VPaXl2bjdT?=
 =?utf-8?B?ZzRmKzM3NENKNHJyZ3ZDendyMEw5VHYwU1RTV1M0Q2xkRFlTNnNMWHJpZmow?=
 =?utf-8?B?ZkhyZHVKZlBCR0MrNzVURzROVkV5WDVJUk5RM0JacHhCR0JaRHU1a1hwUzF3?=
 =?utf-8?B?UGE3MTdnMHgzM3VVNDBrUGdsNzZwNGcxTWhIWWo4Njg1akJjbDEwRDJQN0h1?=
 =?utf-8?B?alJ1ajEwMEsvRjYxM2M4QU5HSWVjRlhaL1Z6V0VVQmxzVFVNdm9TdGdyZ2Vr?=
 =?utf-8?B?UnFrTFBncE5UR2tEUUlYamFaNnQwcENMaHRWUGpGeXpKVHNVMWhyRDVaRDV2?=
 =?utf-8?B?alNxRXZnMUpHWjRYU0pVRXNab3cwam1leHJQWHVmSWZ1SE83SlNSemFJQWtQ?=
 =?utf-8?B?T3FieWxxVVpFbkowZ3ltVW9NcStycnF0M1RKaVZ0azdjcTk5dnJJVkVBS1RE?=
 =?utf-8?B?NGU5SGNDT243T2wwVDhsNUszMHpnTEJCL25UL0sxSWVOSFgwcXl5NVYrUDR6?=
 =?utf-8?B?ZDlpVTRmTVc5dzBkTnVuOWw4WWJWTDFrRFIvSGtDWmxtM3Qyc1VsbCtpNmFW?=
 =?utf-8?B?dVcyc0QxWEFHQTk4eG5BYzNXRk9qdEVGU1FKRUNMbUh5VWUzOHRKcWFSaXJ0?=
 =?utf-8?Q?19qabQKZcf90ghnAIr1kSYc43GLppSpLq6vRP9Mz9M+x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6241ebb4-9034-4212-36f5-08dbf6e323f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 05:12:42.4321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYbiIbMaPLXv5QkGOfMChyBj3WjZZ7W0sLiNntPJVTqqL3j1WJvqMju9Wv8jM60KdudQbfQ54ZBfQG1D8ObTPdIGc9ZOM4yOTs/NTnK98Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gU3VuZGFy
ZXNhbiwgU3VqYXJpdGhhDQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgNiwgMjAyMyA1OjQ0
IFBNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IGlu
dGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFt2MiAxLzJd
IGRybS94ZTogQWRkIGEgbmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXINCj4gdGlsZQ0KPiANCj4g
DQo+IE9uIDEyLzYvMjAyMyA1OjM4IFBNLCBTdW5kYXJlc2FuLCBTdWphcml0aGEgd3JvdGU6DQo+
ID4NCj4gPiBPbiAxMi82LzIwMjMgNToyMyBQTSwgR3VwdGEsIEFuc2h1bWFuIHdyb3RlOg0KPiA+
Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEludGVsLXhl
IDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+
ID4+PiBTdWphcml0aGEgU3VuZGFyZXNhbg0KPiA+Pj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJl
ciA2LCAyMDIzIDEwOjE4IEFNDQo+ID4+PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+PiBDYzogU3VuZGFyZXNhbiwgU3VqYXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNh
bkBpbnRlbC5jb20+OyBWaXZpLA0KPiA+Pj4gUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gPj4+IFN1YmplY3Q6IFtJbnRlbC14ZV0gW3YyIDEvMl0gZHJtL3hlOiBBZGQgYSBuZXcg
bWVtb3J5IGRpcmVjdG9yeQ0KPiA+Pj4gdW5kZXIgdGlsZQ0KPiA+Pj4NCj4gPj4+IEFkZCBhIG5l
dyBtZW1vcnkgZGlyZWN0b3J5IHVuZGVyIC9kZXZpY2UvdGlsZTxuPiBhbmQgbW92ZQ0KPiA+Pj4g
cGh5c2ljYWxfdnJhbV9zaXplIGF0dHJpYnV0ZSB0byB0aGUgbmV3IGRpcmVjdG9yeS4NCj4gPj4+
DQo+ID4+PiBOZXcgaGllcmFyY2h5Og0KPiA+Pj4NCj4gPj4+IC9kZXZpY2UvdGlsZTxuPi9tZW1v
cnkvcGh5c2ljYWxfdnJhbV9zaXplX2J5dGVzDQo+ID4+Pg0KPiA+Pj4gdjI6IEZpeCBoZWFkaW5n
IHR5cG8gKFJpYW5hKQ0KPiA+Pj4gwqDCoMKgwqAgRml4IGNsZWFudXAgZXJyb3Igb24gdW5sb2Fk
L3JlbG9hZCBjeWNsZQ0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFN1amFyaXRoYSBTdW5k
YXJlc2FuIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMgfCAxNSArKysrKysrKysrKyst
LS0NCj4gPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGls
ZV9zeXNmcy5jDQo+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4g
Pj4+IGluZGV4IDE2Mzc2NjA3YzY4Zi4uZThjZTRkOTI3MGU2IDEwMDY0NA0KPiA+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+Pj4gQEAgLTI0LDcgKzI0LDggQEAgc3RhdGlj
IHNzaXplX3QNCj4gPj4+IMKgIHBoeXNpY2FsX3ZyYW1fc2l6ZV9ieXRlc19zaG93KHN0cnVjdCBk
ZXZpY2UgKmtkZXYsIHN0cnVjdA0KPiA+Pj4gZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKmJ1ZikNCj4gPj4+
IMKgIHsNCj4gPj4+IC3CoMKgwqAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBrb2JqX3RvX3RpbGUo
JmtkZXYtPmtvYmopOw0KPiA+Pj4gK8KgwqDCoCBzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZrZGV2
LT5rb2JqOw0KPiA+Pj4gK8KgwqDCoCBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGtvYmpfdG9fdGls
ZShrb2JqLT5wYXJlbnQpOw0KPiA+Pj4NCj4gPj4+IMKgwqDCoMKgwqAgcmV0dXJuIHN5c2ZzX2Vt
aXQoYnVmLCAiJWxsdVxuIiwNCj4gPj4+IHRpbGUtPm1lbS52cmFtLmFjdHVhbF9waHlzaWNhbF9z
aXplKTsNCj4gPj4+IMKgIH0NCj4gPj4+IEBAIC0zOCw3ICszOSw3IEBAIHN0YXRpYyB2b2lkIHRp
bGVfc3lzZnNfZmluaShzdHJ1Y3QgZHJtX2RldmljZQ0KPiA+Pj4gKmRybSwgdm9pZA0KPiA+Pj4g
KmFyZynCoCB7DQo+ID4+PiDCoMKgwqDCoMKgIHN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOw0K
PiA+Pj4NCj4gPj4+IC3CoMKgwqAga29iamVjdF9wdXQodGlsZS0+c3lzZnMpOw0KPiA+Pj4gK8Kg
wqDCoCBrb2JqZWN0X2RlbCh0aWxlLT5zeXNmcyk7DQo+ID4+IFdoeSBrb2Jla2N0X2RlbCBpbnN0
ZWFkIG9mIGtvYmplY3RfcHV0Pw0KPiA+PiBUaGFua3MsDQo+ID4+IEFuc2h1bWFuIEd1cHRhLg0K
PiA+DQo+ID4gSGkgQW5zaHVtYW4sDQo+ID4NCj4gPiBCYXNpY2FsbHkgd2hlbiBzYW5pdHkgY2hl
Y2tpbmcsIGFmdGVyIHJlbG9hZCB3ZSBzZWUgdGhhdCB3ZSBhcmUgbm90DQo+ID4gZG9pbmcgYSBw
cm9wZXIgY2xlYW51cC4NCj4gPg0KPiA+IGtvYmplY3RfcHV0IHdpbGwgb25seSBkZWNyZW1lbnQg
dGhlIHJlZiBjb3VudCBhbmQgcG9zc2libHkgZnJlZSB0aGUNCj4gPiBrb2JqZWN0Lg0KPiA+DQo+
ID4gQnV0IHRoYXQgaXMgbm90IGhhcHBlbmluZyBpbiB0aGlzIGNhc2UuIFRoZXJlIGlzIGEgZHVw
bGljYXRlIHJlbWFpbmluZw0KPiA+IG9mIHRoZSB0aWxlIGRpcmVjdG9yeS4NCj4gPg0KPiA+IFRo
aXMgcmVxdWlyZWQgYSBjbGVhbiB1bnJlZ2lzdGVyIG9mIHRoZSBwYXJlbnQgZnJvbSBzeXNmcyBo
ZW5jZSB0aGUNCj4gPiB1c2Ugb2Yga29iamVjdF9kZWwuDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4N
Cj4gPiBTdWphDQo+IA0KPiBBcyBhIGNvbnRpbnVhdGlvbiBvZiB0aGUgYWJvdmUgcmVzcG9uc2U7
DQo+IA0KPiBJIGNhbiBwcm9iYWJseSBhZGQgYSBrb2JqZWN0X3B1dCBjYWxsIGFzIHdlbGwgdG8g
ZW5zdXJlIHRoYXQgd2UgYXJlIGNsZWFuaW5nDQo+IHVwIHRoZSBtZW1vcnkgc2lkZSBvZg0KPiAN
Cj4gdGhpbmdzIGFzIHdlbGwuIFdpbGwgYWRkLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gU3VqYQ0K
PiANCj4gPg0KPiA+Pj4gwqAgfQ0KPiA+Pj4NCj4gPj4+IMKgIHZvaWQgeGVfdGlsZV9zeXNmc19p
bml0KHN0cnVjdCB4ZV90aWxlICp0aWxlKSBAQCAtNDYsNiArNDcsNyBAQA0KPiA+Pj4gdm9pZCB4
ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+PiDCoMKgwqDCoMKg
IHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdGlsZV90b194ZSh0aWxlKTsNCj4gPj4+IMKgwqDCoMKg
wqAgc3RydWN0IGRldmljZSAqZGV2ID0geGUtPmRybS5kZXY7DQo+ID4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBrb2JqX3RpbGUgKmt0Ow0KPiA+Pj4gK8KgwqDCoCBzdHJ1Y3Qga29iamVjdCAqa29iajsN
Cj4gPj4+IMKgwqDCoMKgwqAgaW50IGVycjsNCj4gPj4+DQo+ID4+PiDCoMKgwqDCoMKgIGt0ID0g
a3phbGxvYyhzaXplb2YoKmt0KSwgR0ZQX0tFUk5FTCk7IEBAIC02NCw4ICs2NiwxNSBAQCB2b2lk
DQo+ID4+PiB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+Pg0K
PiA+Pj4gwqDCoMKgwqDCoCB0aWxlLT5zeXNmcyA9ICZrdC0+YmFzZTsNCj4gPj4+DQo+ID4+PiAr
wqDCoMKgIGtvYmogPSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRkKCJtZW1vcnkiLCB0aWxlLT5zeXNm
cyk7DQo+ID4+PiArwqDCoMKgIGlmICgha29iaikgew0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgIGtv
YmplY3RfcHV0KGtvYmopOw0KDQpEbyB5b3UgbWVhbiB0byBwdXQga29iamVjdF9wdXQodGlsZS0+
c3lzZnMpIGluc3RlYWQgb2Yga29iamVjdF9wdXQoa29iaikgPyBhcyB0aGVyZSB3YXMgbm8gS29i
aiBjcmVhdGVkIGJ5IHRoZSB0aW1lIHlvdSByZWFjaGVkIGhlcmUhDQoNClRlamFzDQoNCj4gPj4+
ICvCoMKgwqDCoMKgwqDCoCBkcm1fd2FybigmeGUtPmRybSwgIiVzIGZhaWxlZCwgZXJyOiAlZFxu
IiwgX19mdW5jX18sIC0NCj4gPj4+IEVOT01FTSk7DQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOw0KPiA+Pj4gK8KgwqDCoCB9DQo+ID4+PiArDQo+ID4+PiDCoMKgwqDCoMKgIGlmIChJU19E
R0ZYKHhlKSAmJiB4ZS0+aW5mby5wbGF0Zm9ybSAhPSBYRV9ERzEgJiYNCj4gPj4+IC3CoMKgwqDC
oMKgwqDCoCBzeXNmc19jcmVhdGVfZmlsZSh0aWxlLT5zeXNmcywgcGh5c2ljYWxfbWVtc2l6ZV9h
dHRyKSkNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoCBzeXNmc19jcmVhdGVfZmlsZShrb2JqLCBwaHlz
aWNhbF9tZW1zaXplX2F0dHIpKQ0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRybV93YXJuKCZ4
ZS0+ZHJtLA0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiU3lzZnMgY3JlYXRp
b24gdG8gcmVhZCBhZGRyX3JhbmdlIHBlciB0aWxlDQo+ID4+PiBmYWlsZWRcbiIpOw0KPiA+Pj4N
Cj4gPj4+IC0tDQo+ID4+PiAyLjI1LjENCg==
