Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6679BCDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 11:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF34010E03E;
	Tue, 17 Oct 2023 11:40:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A2C10E03E
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697542823; x=1729078823;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aHbP8FKx6C2ik0CMtPzsVStnalBRxrrrC0qKUxX0uR8=;
 b=AUAdYlumBcwKNYj7RtccJ8A/3zJ3jzIIjd/ptlIt/EJnd6/oIr7NkUvr
 ZlS4S3BHuIATlE5n4wmHEOIBULvLJ9CPCZ5YRIL3CwB7gMz7inDQ+34g3
 ADNc1nSXVlDS4dyltXQhH89SxYPoHY2iiKa0laeWDjlnBXVwUJ9S8S5gl
 lRlQ9vf2wyWsBqVOlOySCcTR5fKVGj2U99I7ozOgkLW2XJvqC7eJxnnbJ
 upc3n8vacBCudmOHIfV+jrjK2LROMt0XLMrdyZ1Mcph6t5nRdVeuaLE7D
 p3v7Lw5ObkSrQbAcJi5Fik9DW6SzgSxnMF7Zmun8Hb3sZHERo9lsaGdFy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452238049"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="452238049"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 04:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="759777876"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="759777876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 04:40:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:40:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 04:40:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 04:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9wK9D8ZLuhkJi6/f/gTaKffgV5VhoHE3EVumIiqdeyvcXyVjkuZNGp7lrVaUGauA5H2MX6JR5xJJYB8jjW97NwTMLqW10NoUEt1UTTQYWwyZk0tSc1rV3Sy6ittSgq3KiqpNJTxCSIz1B8D87zY68ZiNHpeDOJp2uln+/uA52wntnnYubYlE29+4wqxWpV3um3aUAEcwx8EmYFKt+8pZaDpr+O6mDub942FadT1V2GyLIIGKmrMtSStQJ7lUtuuyyRev6CBJhyPPVOiycQEglTj0CqVqLOQfKuPA26DHBbij0zLTqxqE3181f/Y3yLQ65X7Cm/w/4Qa2UjaOXlm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHbP8FKx6C2ik0CMtPzsVStnalBRxrrrC0qKUxX0uR8=;
 b=JZKBEobnirsuLSvc/RZI7YhI7LBjh/jgcbC2AMoC2CezaGEeNuZ1E2meAf7ZCcqwTypVeNSZv1EvkSjuDVbpDD2ogyX8CtDdpqmhXN4f2rd/6PzeI7pQMApn30rpm27tskM4oenst81K5nf4qJh7Ho+M3l58xs0r+mvt0znHfABS3/q4hVwMcvmrQ2SkLosrqzhMjy6zsHORv02MqlGk7s5shz2K6otDzy6isWAnKEF0DOqD6GZjZom1+xlkNlKIZtoATjddBlqHWeKM2WMRKx0CQ3fvwknOMh9gJ8J7ZWuerMHzcn41rfMGNHKtx0afhZOFTZQ95oHBsWhNk1z2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 11:40:19 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 11:40:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v6 0/2] Enable remapped display page table on
 Xe
Thread-Index: AQHaAO607wtdrr88+06WIbXuj74LmQ==
Date: Tue, 17 Oct 2023 11:40:19 +0000
Message-ID: <c76d0a38c80b9135b8760ae125456d8580b0c6f0.camel@intel.com>
References: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB6427:EE_
x-ms-office365-filtering-correlation-id: a3d983ea-a019-403d-a3eb-08dbcf05d767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OuBWRQz1dm+cuLreFE62M7KT35towUly9uPkgt0CL0UwRxalhmkq04MFyIjitlO992PSTuD44H8d9QWOSaVTVpXUvfBhJXxo+cZioI4NqMdAxLzkW8u8wh3tnwsIA3EGmtxSBnu6W9x18QuO9ZEs3facrjepMSJM//f/Y7p4ydzs0AM8bcDwfc1C0atO4WtTR/0VQciwDvmZs5KUb3pY4Sne3+Nke49sc11nkkmc5kVnBXMUoIFkeRjq0GUkkxWhBuL7x3PcxPcH0RE3MqoBairK5R1iYbeiAQ0n5RZMYgcjZ6cxI7/HkSCfR9HCH7nNiJdnmV3SdB7ppOY/khfUHag0UjRjE1Px1+AAAx3AgzMMwLDAsbUg138+upg0ogXpckf3mdIaasAekVrwsLj/lG/AjHhNWCT0DJZ7OmSbW1bR5/05xWzYEiekQI0On06zIAyVLroo83MS1dInLwEfiDSAUF2hLnyDFN1t/Nk7cb5en338WU5RxwyEacrWqidjfkaDz6ac2VeNCouHkeZSibjsnfHm7QF8htEh73F4ZOj0nCLjfwLOvdUCeibWhAEN2UbjRZpjj2j+DqSr5hcRS1opi6avRIONY41m7fTDSAzC82/B7aGhU/IjzhXD4Cxk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6486002)(478600001)(91956017)(316002)(110136005)(66556008)(66446008)(41300700001)(64756008)(8936002)(8676002)(76116006)(66476007)(66946007)(71200400001)(5660300002)(6506007)(122000001)(38070700005)(38100700002)(82960400001)(6512007)(86362001)(2616005)(26005)(36756003)(83380400001)(4001150100001)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0RYSDlVckcvZEVUWWhlMTdBNDAvRVdzS0VmWEpxK1N2THZKMFBGVjhOaDRj?=
 =?utf-8?B?RTlTYUN2N29vQXhFWXBoM1BGdlh6elg0OHNRRGw2NnZ1WE16MFI0SE1Md3p0?=
 =?utf-8?B?bnVHL1BrVE84VzgyTkdjUFlJaVlHVXVLVFdpaUhXcVRsWWg0bExrTWV5a3ZQ?=
 =?utf-8?B?dkZyR20vRkZJR01SeHM0cElObk5KQS8yN3FuNEdmZzQvbk8rUjV3R0ZZTzQ0?=
 =?utf-8?B?RVFES3B5RldwRlNSNUs0TzQzckJVdUlFMUlUTG5POWtQV09nc2hqaGd2Ky80?=
 =?utf-8?B?K3dycFIwZDBUMmhObGpwUUlscXlUdC9xR2ZLM0JQcjloS2ZqQlhTaDdBaHB1?=
 =?utf-8?B?UHJBbkxwVVRkQ0FJdXUwM01hdWpzdkJDWnptc2VTYnYvbUdaY0JJcVZPNnpq?=
 =?utf-8?B?Zzd2Ly93MUVqeEtMRFlxUjFaUzRUOEMwb3pqZ0pUbGcrNElJaUhzWFVaOXcv?=
 =?utf-8?B?T21LZFZGWXdkTlQ3VStQbU0vbHFMbVdjdVVCcHR1OHRFMTJBLzZvQWJlVVZH?=
 =?utf-8?B?K0hkTFhuc2RQYUVTbEhudjZUOWNTN2hhWFMvM1dQTWZFaGpLOURIazFRRTRa?=
 =?utf-8?B?MHkwTlBGcVFjSmdOZGNlT1hLMEdRMmhLQ0gzclRkSzd5SDRVZFdmODlxMTZq?=
 =?utf-8?B?QXkwVTdQS0YxWFdxcjRYSXRWMFBiTERMSkRCMFhSS0R1ZWFnTkVhenNnUmtZ?=
 =?utf-8?B?TlR2bExYdE5OWThZNUppdGVDR2Jjb0pGYVJpcTI4MlQyemJWTDhoRGZUY3cv?=
 =?utf-8?B?WnJ6R0lKM25WVFVxUEF4b3I1WDhoUE5lYlI0Mzh4RDV6WWlINTVDVDhSWkZ5?=
 =?utf-8?B?OFNWSUdBN0g4NitNd2V0MkkzSGpZdlNXdm9CenhGang1cGpyZ2JjTzRJcFNQ?=
 =?utf-8?B?dW9tNmFOS3VKdW1wUHFneGwzZit5R0o3SlhTL2U5dCtrVXZtYnRoc0Y2RkU1?=
 =?utf-8?B?S0ZqSlBORHVuLzMyaGp1Q0d5UnQrUG9YSUJvREZjZkNUMVVpS2lzYnd1bjZK?=
 =?utf-8?B?bFJ4ZkthRnBLVitGbCt3ZGwxS09KY0FkNzZXT09GVm1tcDEyK0l4K2x3WjM3?=
 =?utf-8?B?SWR2dkxoL3dpcWsxRkx5dkx4eUtic1RhWTQ4TFdxekFHd3VyMTJLNElnSnZu?=
 =?utf-8?B?SWtocVhzbUFyVHA1VUJ4Tm8rWmcwdDhQZFNNaVJwRHdLRWs5OXFrUlVCcWFP?=
 =?utf-8?B?UWJZaWZGTEpKaTVrNW5oVFJqZjRndjA5M1lmd3YxUUNYUXgxTzBpSU5SbHpL?=
 =?utf-8?B?NlFLUmhadnhXczlaaVRINXdHZVpHM25pSXhxZUlQaFRCT3N4Q1kzZGlLT3JL?=
 =?utf-8?B?NHIzcU5RMzM4VTFXZ0I2YWk0Rzd2N2VpSUdSZ1NLK3dWOFR5MDU1OUw4Z3gr?=
 =?utf-8?B?Tk1YblJSUzhyeVlaOFI0L1g5MjAyNk5CTm5hemZVOE5qREE4RUZDZXdFRXJZ?=
 =?utf-8?B?MDhSSm5ZUmRPSW1qUHBXZEE3YmY4N3JGdkh4amUrbzFVc3BDdmtzUW5rdzM4?=
 =?utf-8?B?RVRvWXd0ZWhScmVGRUgvOU5zZ2RMSGk2eUN4YmVydSs0YXBQcHFpNXV4U0dv?=
 =?utf-8?B?dWRITjFUQlE5N0pNaVg3ZG11ejc2MXlBeG5wbUJabXY0RElZSWU4RUdwblZs?=
 =?utf-8?B?Q3JrdENqdG1OT0xCQlpacThCUVlVNzdZUFg4RDFMSnpDdFJIM1ZCS1RGWDRI?=
 =?utf-8?B?QTVCY1J4VkRsNkNiOFh2MVRIaEd1ekJxaW5BVlV5Ly80YjcrSEpMajNCMW9N?=
 =?utf-8?B?d2lnVWV4SFNrVHQ2ZVpsR0o4NzJhSTlzVFA0WjBqZGNPdTNsV01RMm1OMUtR?=
 =?utf-8?B?K1VUQjV2eW5pTzNZLzR0Y1hDVlBXSCtteFN6d1QrL2lzR2JpNTR6b0hFNTVn?=
 =?utf-8?B?T1VCYUVPc3VDL3JpaE1Kdnd4N1BwSFMxQ1V0WUkwTS9TdWgyaEV2YkJLR3Uz?=
 =?utf-8?B?VXkrd3RDa1p4TkJRTXBESEdGWmVwU3ZNSE8vby9GbVVSS1QxTXdwWWhvTitY?=
 =?utf-8?B?Ni95NHhJYXBodWpBZEI1c3h5d2IzUnVra1hsZWVEc09aZEw1YXhYVmJpcUZP?=
 =?utf-8?B?Rm02cDZ6WERuSFZNaGQwc0RUSGs4Wmdna3J4eGJLL1ptejZ3ZVVwZm9MNEor?=
 =?utf-8?B?RU0wRkV2b1BOTUhMQ2lNajJEdGtsR3F3MGh4ZVVHRGFwRko3SlRHZVF2V1J6?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33CD97FA536A114BBCF1C5181AC10A57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d983ea-a019-403d-a3eb-08dbcf05d767
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 11:40:19.8349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lVjulQa877IvaqHW6rFaDNLvNrtu3x1SUIqwQ1teCi1FzKHQxkHgESLfVDUZIrj1PQ7X+pm6JW05Qd1DQPQ4bw0XdqzqWBrJ7A+jVJg6No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/2] Enable remapped display page table on
 Xe
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

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDE2OjUyICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOg0KPiBIZXJlIGFkZGVkIHdyaXRpbmcgb2YgcmVtYXBwZWQgZGlzcGxheSBwYWdlIHRhYmxl
IGFuZCB0YWtlbiBpbnRvIHVzZQ0KPiB3aGVyZSBuZWVkZWQuDQoNClRoYW5rIHlvdSBKUCBmb3Ig
eW91ciBwYXRjaGVzLiBUaGVzZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdh
bmRlcg0KDQo+IA0KPiB2Mi4gY291cGxlIG9mIHRoaW5ncyBmaXhlZCBhZnRlciBmb3Jnb3QgdG8g
cnVuIGNoZWNrcGF0Y2gNCj4gDQo+IHYzLiByZWJhc2UNCj4gDQo+IHY0LiBiaXQgbGVzcyBjb2Rl
IGNodXJuIChSdWhsLCBNaWNoYWVsIEopDQo+IA0KPiB2NS4gTWlub3IgY2hhbmdlcy4gUmVhcmFu
Z2UgcGF0Y2hlcyAoTWFhcnRlbikNCj4gDQo+IHY2LiByZWJhc2UNCj4gDQo+IC9KdWhhLVBla2th
DQo+IA0KPiBKdWhhLVBla2thIEhlaWtraWxhICgyKToNCj4gwqAgZHJtL3hlL2Rpc3BsYXk6IERv
bid0IHRyeSB0byB1c2UgdnJhbSBpZiBub3QgYXZhaWxhYmxlDQo+IMKgIGRybS94ZS9kaXNwbGF5
OiBBZGQgd3JpdGluZyBvZiByZW1hcHBlZCBkcHQNCj4gDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZmJfcGluLmMgfCA2MyArKysrKysrKysrKysrKysrKysrKystLS0NCj4gLS0N
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+
IA0KDQo=
