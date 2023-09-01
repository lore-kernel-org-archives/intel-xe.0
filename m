Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDCDCA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 12:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9810E7B5;
	Fri,  1 Sep 2023 12:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8410E7B5;
 Fri,  1 Sep 2023 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693570679; x=1725106679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a+/PNUJTyN+jg/qT4HhUej5EyKdYmXGcnoDv9IRgeGc=;
 b=CnDZ1gMqWcB2W91/AUo4XLRs9Fg3utpTj/1RRTBllCU2bGdBavIyTMTE
 GfNxvZKAai+c224/MJlWKULoPtga3qbsD7JQ/kfyeKr425anVfEYnE7Fo
 zL0s+8XV5Hok2j5yDrS857uhJ220N270mOyzbs7XcMay4QQoovDlTiunw
 cG4aHVAuGcrYZwpj4lj8fk16Qmp+KkidLk+0c2ZXUdiwIZtlCWID/slOA
 p0Xb7e2OgB4fwyX5Of5G4aZ/+InpPVxH3LZpifJ3di2bdhN2s34IsA8/q
 2tiEx5HgFx61fkoMXmJNbyBQ34ZjN1SAWNDlso78KrynNmJ76+sS67I3C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407200179"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="407200179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830105695"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="830105695"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 05:17:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:17:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:17:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 05:17:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 05:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiCCjlrQNvcwMUR+BXehN3NGYhM93ZC58+aTEFUhYAVyzNePvJj1COFLsjH+Ne7ZaB7rt7YH6ts9VEeDEH0TtFmhUCcVu3SNZF5OGjwYQpa9hlB3QaqBf3YLJmFHPX+1/qEin7JhlJTCkIJTDgXUmHALeN1RbKcT2hRgyffOzrL+/LbhXz0qa+LT8729oA8cuGId1IOPPQL0RWutjDU9N9upQ4NfuPMAP5vEchd8MCXTnahyI2cQ2xOcS1e0CwaZY7CgY33wKniMyY/URVM8/6ufg9vBlg4I9Q0Ehygg236FQ8pDi2NgeB6OK2oM9eJLAIfPmdq6FcX+AM21REuGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+/PNUJTyN+jg/qT4HhUej5EyKdYmXGcnoDv9IRgeGc=;
 b=Wm8Ir4vcMQ/IE/dvbV5MNDvo1IYi2rB+K4cEW6crKPHLwwDXK2FndAAcX2BmyQf5KRBjJnWZGrB2h5l4VsbzUE6FS8cXjqHDdmj2d8lys/CzMrqHow3SlDkoHYVs6mM5yohWEzJ/S7uo6wfaIOspHnjUqK/Jq1X+0za3sx6//uzrecOd3MEwjaqCvRQs6rnDkirad+VJo/n+imK9RnhN7KNZq+CgJG5IqpOJKh5NQXKzbPgKoy0XbyXoMtseYuwJLcz9+u7FZj9AUoBShTnsJZ/V+XJrjr6MzPXfxbo0pBNnsXjxE8p0wYngt8GMV4JsdZE4LMhlpi3KE9NU6+Erfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 12:17:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 12:17:53 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
Thread-Index: AQHZ3LWtmpODP8H0L0OGAYeJI7wMArAF4zyA
Date: Fri, 1 Sep 2023 12:17:53 +0000
Message-ID: <4fa2fbf667feb0a47fc7063171a3661d2c12082a.camel@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
 <ZPAzB95lw3vSqgan@bvivekan-mobl>
 <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
In-Reply-To: <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CY8PR11MB6940:EE_
x-ms-office365-filtering-correlation-id: 5ed4c61e-3dee-4022-3587-08dbaae57792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TINxqHiO5scsU1qe3Rf8NG/WlqZX7a1PjzlupKMEVZs57r/ctsqOOhTnNLVjeKBttd3eiIBPX+8v7SdE4oRty6IRfx2B7UBwRWef0r1Qst4ED9ZUh2n6yqyp02U47Cp2k+HU0P0GlZVzRySiYgfXBx+iQLbmA+Rnd9mV8dKdF/M1JpuYVx5WPFQsnNaq5iMM54ET09CFdEY/DEmVQLZhoXS+hcvCW7rJ65db/yy7XYvWRlGDbdRWtUZNXVcnlwyk/ADqL/24a/h6up8msTqREg/dqRb3lDjocJJ7IKxJn2sABTTBnBWf4njBp/eUsvjW1wcZWD5Z/UrDugnMvN/jsBqYR9DElkpqHHzSPHrKUy6lAAYE0ZfiXdW9laRi1hOTJX3Jw8hq8QdunCQwcZOchj+QVvlWCwh8Fsimoba7JpStpUYFoYgK/cOixfVf1pFUR45iGlrTQ0vryzOFAy038q5lbWKsah9cPhx1ruCmI9u7GBEu+1Rqgdcb367aeJsmJKrux/6z68I9jlxFqdwUvXbrXqfmlX28bCVl0s7DbJcSTQG4wtQUbUCiJGRQjJkp8uLCW6D1XMTs3ysG3/Tc6BfhvPKMkXndH3yHRGm9vUOSA/vpU0541k9+kmRaI/mZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199024)(1800799009)(186009)(71200400001)(6486002)(6506007)(6512007)(53546011)(478600001)(83380400001)(2616005)(26005)(2906002)(64756008)(66556008)(6636002)(54906003)(66446008)(66476007)(316002)(41300700001)(66946007)(76116006)(110136005)(91956017)(5660300002)(450100002)(8936002)(8676002)(4326008)(36756003)(82960400001)(86362001)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmtYMGtJUlhtaW9QNkI0ZGRjV2UzMjZSa2wySUFDNVNuQjhwbHJGRllycGxz?=
 =?utf-8?B?Z1NuaFpMVW9ibkJ2czZXQk1qbXU2R1E1K1VYZnEzOFkxM25yRk9ReWQvZzJh?=
 =?utf-8?B?WFcvSmlZcGM0VHlYV2xXeE9XeSt1bTNLNmovZWxsVG52N3dTWVhEYzhxNUFT?=
 =?utf-8?B?RXQ0bmgvUHRZdFkxK2dVbTBmSmkyMTRRWnJCbG1ncmFVcXpFbVhOT2NKa3Mx?=
 =?utf-8?B?Titxc2h1VkpTMlJCTUFNNVZNSFNvbFIxQ1RJUlg0S2tCbFp1NDQzdnhNYWNx?=
 =?utf-8?B?UmVNVXRZZHpZSFdtMjViNm11OStWWWhoL2hHbGgwbkJHei93dGpTdlBNLytz?=
 =?utf-8?B?R2tudUdnQW1JTjhKMm5OSjFmV2JjWmhlZnhQR3UyS2VtTXp1Z3BHMjd3cmRz?=
 =?utf-8?B?Y0M0T1pKS29vRmc5QmY2aWc5NG9hMDVVYkZVVGJyRVA1VVBmcTVQRS9JWStK?=
 =?utf-8?B?Y2s3RS91cXI4YmZ2Z3pFblVtcnlQM1VSaWloYS9ndGxSWXkrc2tuYUU1aVJ1?=
 =?utf-8?B?WXhuSjJ4T29abWQ2L0xmb3RBdXVLOGU3eXRIZFBGMFo5dGtLbXB3U1NMZHpO?=
 =?utf-8?B?cXRpeERIRkI3eE9tc3huU2t1NmxmY3lSdGpYWDgzL3E4emVFOFBMTENabWNE?=
 =?utf-8?B?b0RsTWtvK08wbTJRaXZCZTNSNmhaUXlWb1ZsbkdlTDAzQ0lSY3BsdmdEY3hs?=
 =?utf-8?B?cmpsUG51NSs2VGk2ellpTTdlK3NZcU9hdWdCTklyK3U1YjZnaXZaVEJtQmp5?=
 =?utf-8?B?K1NVOS9Ocktockxiditzd1FUUEhPcmtEY0tGUFd0aGJjaHo2NytsTkZLOXBp?=
 =?utf-8?B?RVJ4Z01XL2k4L0RyN3lCdnlIZnEyQzVPdGZSazY2Z1FFdTZhUG5OT0VKZXlK?=
 =?utf-8?B?c3R3Mkhad3lXcUZnaWtIU2ZiSGtnZGM0K2RtNVVqQ2VNZkFhRGZldys3UFha?=
 =?utf-8?B?T1VIc0gxa3paRHZNZHZ0K1RnVlNMeHcwdEl3b0NWREtTQ1gxKzFCR3lJQkVR?=
 =?utf-8?B?a1VaV3RQcTFUQlE5UzVXOXV2ZXVyUVBNS1hxLzBSLys5OFJIV1pRWjVDYmNG?=
 =?utf-8?B?d3lNRGZVMVcxeStVb0xLbmVCTXBKakI5YXV6SXVmUW4vVVJ5YnRrUC81Sldu?=
 =?utf-8?B?QkNFUE40NkFvRkNvdVFYVll1TldONVU3RTZYcEJhOGowU0VVSllEclI5MEMz?=
 =?utf-8?B?aUFxMERJcjRYNzNiVzFIZzhZVTVSMGdPOUdXRTV4MDZjRFVmQzdaVWZLTE5v?=
 =?utf-8?B?ekhvSGVNb0hYa1NXblF6QnRYbTNUOVJNVGllOW9mOWJDUWVrTDZnUGJLRGdx?=
 =?utf-8?B?c0hjc0p2SEZjQVZpMjVkT041eTRwQUhxSXpESDdheFZHMmFEakJMTHEvWlF1?=
 =?utf-8?B?ck9ZMWNFSm1CeWc2SjhMWXVBR21tUmVKQ2tSZnoyMzYwa2pzZjB5UUZMSWhn?=
 =?utf-8?B?a3NBQlkrM2UxZEdUUG95VnZ6ZklUbDVHTk00SjNEenFoQTNOL1JmWkdlenJI?=
 =?utf-8?B?NDdmYTBCdDJxVlBhQkU1aTY1YUhoSDF3OUlwUm1LL2NhMVJDSkhxa3lpWDBF?=
 =?utf-8?B?MTVEYjBkWGZST3hpNFp2Q3BYSHYwang3UFZGeTJwbFpmQ2NDSXNoSmtjQUcw?=
 =?utf-8?B?N0gwMUJYZGNaTHRDZFk0UDF0UEhHUldrMDhPd3B6bGZoUkxneU5lNmNhT3JL?=
 =?utf-8?B?L2tJUC9hVTJLL3h0UjY3cjJJUDBudTlYbitwTmdRWjZtN0JLaFNWZkZWYmsv?=
 =?utf-8?B?V2xSREc3SkFKN2lOUDNsbVh6c0VhU0Vnc29nV3RWc1ZGdjVPV1NpVGo0bWJT?=
 =?utf-8?B?RmN3emoyVFlmTFZmaEJKZmJjSkkxbndWaWNFUFd1Y0orMjI1VmlVLzNvd0RF?=
 =?utf-8?B?NTBkRW5yVDBGM2Z3MnhmTjZERm9YMDFldWdQOVdMbjZlTmZHT1VBNkxvSzN5?=
 =?utf-8?B?UHJ0WVZET0NpZlVkQmc5Z1RObE5wU0lMSzRLWXlWK1Y0T0dXT3NHQjRHQ1pG?=
 =?utf-8?B?K25WczZ0TzZkUDkwZUUza3JONDlqSmtNbTNvYVVubTAycVlrMFVXSG5idXZw?=
 =?utf-8?B?eUhUVlNQUHNXMGpmWEpMYzdka0RRbTh4d3J6YXRoM3kwVVNja3FzRkplaFZp?=
 =?utf-8?B?ZC8rc3dLMnp2OWU5aTdYVzBVVGlnQWZ5ZkZMV1h6RVhyQVN5WnlsQ1FjSEk0?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44277A756ECC5449B5583B17EE2A8519@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed4c61e-3dee-4022-3587-08dbaae57792
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 12:17:53.3326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFJemD4ALevaWuJCVoy4zyP3JiTJnLNmboQT2X1PVT+rCbJ9VkQvu1eAyzR3zDPkmfgi4FTQLcQx184slcWLXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTAxIGF0IDAyOjIxIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+ICtSb2RyaWdvDQo+IA0KPiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxMTo1ODoyM0FNICsw
NTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiB3cm90ZToNCj4gPiBPbiAyOS4wOC4y
MDIzIDA3OjExLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiBXaXRoIHRoZSBpbnRyb2R1
Y3Rpb24gb2YgTHVuYXIgTGFrZSwgaWd0IHdvbid0IGJlIGFibGUgdG8ganVzdA0KPiA+ID4gcmUt
dXNlDQo+ID4gPiBpOTE1X3BjaWlkcy5oIGZvciBib3RoIGRyaXZlcnMgYW55bW9yZSBzaW5jZSB0
aGUgc3VwcG9ydCBmb3IgTE5MDQo+ID4gPiBpcyBvbmx5DQo+ID4gPiBjb21pbmcgd2l0aCB0aGUg
eGUgbW9kdWxlLiBDb3B5IHhlX3BjaWlkcy5oIGZyb20gdGhlIGRybS14ZS1uZXh0DQo+ID4gPiBi
cmFuY2gNCj4gPiA+ICh1cCB0byBjb21taXQgYjljOTAyMGZjODE2ICgiZHJtL3hlL3B2YzogVXNl
IGZhc3QgY29weSBlbmdpbmVzIGFzDQo+ID4gPiBtaWdyYXRlIGVuZ2luZSBvbiBQVkMiKSBhbmQg
c3RhcnQgaW5jbHVkaW5nIGl0IHdoZXJlIG5lZWRlZC4gVGhpcw0KPiA+ID4gYnJpbmdzDQo+ID4g
PiBhbGwgdGhlIExOTCBQQ0kgSURzLg0KPiA+IA0KPiA+IEkgY291bGRuJ3QgZmluZCB0aGUgY29t
bWl0IGhhc2ggYjljOTAyMGZjODE2LiBJcyBpdCBsb3N0IGR1ZSB0bw0KPiA+IHJlYmFzZT8NCj4g
PiBJbiB0aGF0IGNhc2UsIGRvZXMgaXQgbWFrZSBzZW5zZSB0byB1c2UgdGhlIGNvbW1pdCBoYXNo
IG9yIGp1c3QNCj4gPiBrZWVwIHRoZQ0KPiA+IGNvbW1pdCBzdWJqZWN0Pw0KPiANCj4gUm9kcmln
bywgZGlkIHlvdSB0YWcgdGhlIGJyYW5jaCBiZWZvcmUgZm9yY2UgcHVzaGluZz8gSWYgc28sIGNh
biB5b3UNCj4gcHVzaCBhIHRhZyBsaWtlIHRoZSBhcmNoaXZlLyogb25lcz8gVGhpcyB3b3VsZCBh
bGxvdyBwZW9wbGUgdG8gc2VlDQo+IHRoZQ0KPiBjb21taXQgcmVmZXJlbmNlZCwgZXZlbiBpZiBs
YXRlciB3ZSBmb3JjZSBwdXNoIHRoZSBicmFuY2guDQoNCm9wcywgc29ycnkgZm9yIHRoYXQuIA0K
VGhlIHRhZyBpcyB0aGVyZSBub3c6DQoNCmRybS14ZS1uZXh0LTIwMjMtMDgtMjkNCg0KYnR3LCBJ
IG5vdGljZWQgd2UgYXJlIHVzaW5nIDIgZGlmZmVyZW50IHN0eWxlcywgc2hvdWxkIHdlIGFsd2F5
cyBhZGQNCidhcmNoaXZlLycgb3Igc2hvdWxkIHdlIGRyb3AgdGhhdD8NCg0KSXMgdGhlcmUgYW55
IHRhZyB0aGF0IGlzIG5vdCBhbiBhcmNoaXZlPw0KDQo+IA0KPiANCj4gTHVjYXMgRGUgTWFyY2hp
DQoNCg==
