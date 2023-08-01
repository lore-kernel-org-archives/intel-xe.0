Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCF0C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF7110E31E;
	Tue,  1 Aug 2023 08:04:59 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B8510E31E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690877097; x=1722413097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUYMc1pCRVi5P2grCY3Ysdb/qk1zvdHfsTCIsQBy0Aw=;
 b=lAGtedgu6o5g7NxWb2ewquwLO7HpiGkGN+ZcChXQK7dwtv/bljnzakXD
 IU+pTAeVBj+fpWILeTnu7lAgvh2Vey/JZPiWqcu9O5xszOrpa4HwN7vrL
 k0UR6+mIgZPgWe7Ww0d2RU6SlVsO8EWaWiBTIOHar60Je/gk5+PSH9gRh
 HCGP8BJYUFYuQueZo5dVquODddtL8FMFI2rMLxaou0eup9S6w+xzqUlbC
 1dwqGCWsiwkZCuNmRyNv+xHCnw8Z435AwZXl3ev7uommD6QvZlpfpetx6
 4ls2sA4yJ+uDrs/nP0k47IbRlr7XHco9B+zuf/cnrSDwmLZFSyKhv6tzj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455606732"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="455606732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="758254423"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="758254423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 01:04:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:04:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:04:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXYRPCwT3V5PjZt8qrZm3fNM9Ul7wunARnvm7PiMsLzHvRb/rQmydmVuDS5g+g83J6SKeIAa7Qg2GAsBFrMAy2Q1Jr383dFT6dtMtL/0VwKV5sVrspiI4Lr/dGywsjv27TquoDn3WjJSClO8A0u2A5Z49wqr1nh85aVf2nerVT/d/aEv0ykw6DYQai6ig85bDG+zn/0DueEQ4z8YQfUlcPbSM+T5JjB86GUcXrO6g3mO76pyrFOfoTRwX+dflaNmiZkXVeAdqIfDCgO2CzymRGmoKW2LvXCUTdEmUujHXpqHxGkzjAKSgmp8cnPxJnyRj1N+oIOqkIEwJslIdnMewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUYMc1pCRVi5P2grCY3Ysdb/qk1zvdHfsTCIsQBy0Aw=;
 b=lsIkDZSb5EhHMsFC3ujAlNii0tYnHyBCIphp8kSCv7CuMpBvBEF/aL0G5UzwpiSk/8HKAbtcDW4l48grP2Fd+zW9sQgSMPgElvgtfru2joFR8rhLsMGqMfqKSkhWkTkjSKjMKKu1JInPVAhXOejKS/Gq6UW8akUisudzmbFUYVvt2jP/iJUxj+Iz+HF8p0qJBxDVytQ3cZqofqNnf1/1A0bCJk+jzC+UHB9iGVN7Ahmh/yqUP1ZrqtH1dMokOyHwCCLVxYCC46P/FZ2F8cZUicJ2uSXloyaVDfuZ8g8ECWdnvFWekNX+nMSRuPiRAFO5X7Eli9AWNG1YL4Mfd6alJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:04:53 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 08:04:53 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
Thread-Index: AQHZwBf59cfM18kIo0W+TuHXjgNGlK/T9sqAgAAOnNCAAPXcAIAAAtdQgAAe/ACAAAA00A==
Date: Tue, 1 Aug 2023 08:04:52 +0000
Message-ID: <MW4PR11MB70567367C384A351B720EF49B30AA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
 <ZMfFaXW7607Cy45j@bvivekan-mobl>
 <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZMif6Huf+E95GL3J@bvivekan-mobl>
 <MW4PR11MB7056C765077F19BD80A6A99EB30AA@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZMi8SN+Std8zyey7@bvivekan-mobl>
In-Reply-To: <ZMi8SN+Std8zyey7@bvivekan-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: 7f767a29-b30a-4ce9-d847-08db9265fc8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrW2ztz8YK7BmYbzBG7nlpIEGA49ySBGv+gIGEYPPPbgp14E/VUwYmhqiVnLbscWSBsXLxsIZip+8gYeZm0vPPTDQlhFjLKACjoaf4NegrkOcXO6Pl9tdHjCz2SdVmMrHQG0sDCYHxT8mywoHnH9FIxXqyXnOy3ueXLXR6fFaS8DcOSpMO3HjzKC7G7e5tzNiiQjQiN2EiGhkAiu3D8UFJB2DVwEfwgPLvyg9Z4NpcuFNlFuCfkM2aCV+kanJjO2tjkBEO30Samfbws9eQuuRvfjIzoNA/H1zkPK1BSHUoKoQ4ML4+0UPtq5u0sdPC3KdBgPZBjV7vIZo99XB6/t91GtfixARTpD13pNmQE+v9vHArg4OBnCP9/q0n+O1Ox1ZN+B7ay9bjcqIsrYugZpf8vNbry+/01wGDL8j6+xjLQtbKRKYSHAB/mpl+HIcPok//X74kxb/MQHXD6cDzD4CxCsUQnkPnF/o2v1CBCJemtKoGpITRJt0IHXzRhQDuD/Mu48wDLT3qQwfNE812y9fJetqnaqqHfm7Tjbozplujja0dC7FLcdigfrNSchISARbYKsGl6Gthi4aHB5HRFnBt1sYJkom3xQEHeapAk/rDs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(82960400001)(52536014)(110136005)(54906003)(122000001)(966005)(9686003)(26005)(33656002)(6506007)(7696005)(8936002)(8676002)(5660300002)(55016003)(76116006)(66946007)(66556008)(66446008)(71200400001)(64756008)(66476007)(53546011)(4326008)(107886003)(2906002)(83380400001)(38070700005)(478600001)(41300700001)(86362001)(186003)(38100700002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TldFRjhHKzVSQlZYUDZybjhkTm56R1IrdmpPRUQvK05zMzlPSWVKcUZDRnI3?=
 =?utf-8?B?M1R6UVdhdm03UzN6MGVGVklhNFBKOG9NVkpDbEhDdWRTK1NjVWxZeFRYd2R2?=
 =?utf-8?B?WHhHSHR5VWYyQjlCV29xSzRQdHl5T1NUVU42eS92M3VYbVd2b25hQlI4eTNR?=
 =?utf-8?B?eWNKRXExMTNIak9mOG84VnU3UHVoRldGNE1ZQ0U1ckpjSEdKc3NrWkNvR3BJ?=
 =?utf-8?B?elk1cG1pMHZsUEZZNWdkcHFiRmxPckpPdFNLMHVZeUM4VHZON1NsQkpoOUxO?=
 =?utf-8?B?eW1NRVNuK3lpYTgxUnNUT3FraFNCWnZqNzRwY3lyYm42WjF1QzBRMGlQbTZD?=
 =?utf-8?B?WkVvZDdYTmdaRmlUTC9hTWEzc0Y5RmFscGx5aUVFRTJPN3hTR0JReEJSazAv?=
 =?utf-8?B?VDA2NzU1M1pUOE1NdmZIVFN4a2xXbkdZVVNRN2l0djkzaDVFUDIrVUp5d2hO?=
 =?utf-8?B?YnlPbEMwU0krNkNET2pXcnJHdCt1a21WV1BSUjN6cCtFNW4vaTBFOVdRMGtj?=
 =?utf-8?B?bkpMWFpzSWxoK2FwcXQzWXYydTJIUCtWdmJJNUJzUFRMNDc1ZGRCblpnZDNM?=
 =?utf-8?B?TGRoSHp2U0tVRmNiNmtPN1hjQStvTWFZb3pYNEZhSHRYbWhZQzN5RjRKTzda?=
 =?utf-8?B?UHd4VFhDNEU4R01aSXRlOHdjREpTbDNkblg2WmxMalc3d0Q0VVVFNE9oOWJx?=
 =?utf-8?B?VUZnVnR1S1FlaEx4aUkrS1dXemFxSXR4cFB0Z2RBSHpjUDArRUhRUithbk14?=
 =?utf-8?B?WE5xZGxmVzFTeTZNbWZHWTRuL2c1NWdHNlZSSzVvZUcva2RKZUduR3RvYVAx?=
 =?utf-8?B?OU51eGw5Mm9IWE55bEw4RG11bk9VcXNxQVQ0WE45U1k2cXA2Q0dJUlR1bnJI?=
 =?utf-8?B?U0c3SE0wNGgrRjZQNi9ROHRqNDFBQ29wcTRhNVlYYW1PaGJuVFlWMmxwYXdS?=
 =?utf-8?B?MWZHY2k4S3o4WFVvYW1IYTV5V3ZWZVNSWmdoNVFJdVNXSmVaTjRMaWh0aURr?=
 =?utf-8?B?QkU1cjl5aWozNjc5RmZRb1RvWUp4Y1ZIdkNUOVVVZnBBMGFGT3pDNFp2UFdJ?=
 =?utf-8?B?cGl2TVZYSEVuTk1qdEJBTDRxS0U4Y0MyQk9mcGQrdnM2VUFPUmxIVnFrbS96?=
 =?utf-8?B?TW5LdWtSeGFFT0F6QlkzbzJ1TUNxTGxqSXoxRFlZZXlsT1g4a3RhTmdSUXY0?=
 =?utf-8?B?Mjl0SjZ3WW9QaUt0Z3RsSjcrSXhDUlVlZUgzTGNxUlJkdlNTcjN0d3lmcmZm?=
 =?utf-8?B?ajZ3VmE5anUvRGRhQXVkSzNLY25IMTRNL0Rud0h0YVEvUjhZelVSTERuOERk?=
 =?utf-8?B?QTNueGJlYS9XU0U3MEhvQm12NkFrNTBkeTgramdMMUVHS0FPa0pzdVIvcGh2?=
 =?utf-8?B?MXR0TnF2WUF1dGxrWVI3Y2NKNzlBZkM4U0NtS1NQcEUySjhETE82ZWdzV1BQ?=
 =?utf-8?B?S3FqNDFqRnFMN0Q4MjVwNnkvUjBxQUlXdEZTR2svdE5DTVN4NFdQcEJnWVZO?=
 =?utf-8?B?bWRGWW1IYUFIZFg1b3h5SmRTTytrU0YwaytZWVVJUkZweE9MbTh5dzdYNXRw?=
 =?utf-8?B?TDh6MlRYWXJ2VzVVZi9MSHZTeUdGL0tsLzVaMEhFUDdlcVQ1V1hVclF4VzNq?=
 =?utf-8?B?cTNWcE1DY1g2cGg2ZWJDWjFkd3J1Q3NNdmJoUEQ3YktWOFRmellvaWl5RlVs?=
 =?utf-8?B?eE5vV3FKRkNYR0lIYkE4RmoraS81UGNMMkhwMUwwdGkzd2REcy8yaHZ4SWlP?=
 =?utf-8?B?QmU5OXE5VVdWcTQra043SHpiY2pQb2liZEFxdFN0aWNVb0NmNXdESXpDcW1X?=
 =?utf-8?B?Vk1yYWJNUW1CMU5LYXliSkx5QTM1WjZYVkNkWmJDZWg1V3lkSkNjOUZHNmxX?=
 =?utf-8?B?TkdZMmh6MFZIMDRMUWhJUElJYVdQRXMvZmtBNW1NaHVvOTVGbXJaM2d5ZVBY?=
 =?utf-8?B?OEZDWkJFUzY2cU40OGc0Sjh5a0x3K3ViVElKSFJXNG5tcGxncnhad29PYmZi?=
 =?utf-8?B?U0lKdXdVQlJyYUVtZTNpY08vc1pRY1liZVhPWFd0SHVNNUtrQUpWMnIxR3Mv?=
 =?utf-8?B?WGFxZ3k1YU1oUXpoQUwxRXdiWU1LWmU5bENkd3Q3eUNudFppcHJkbXNsV0Rn?=
 =?utf-8?B?a3hyMjVmTkRmVWEyWmZvUnRwak5QNmREL3lJOENoVEFBMmtIS01qM2djVDFx?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f767a29-b30a-4ce9-d847-08db9265fc8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:04:52.9118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZkdsvQpNVEYJHBeMyZ9QGIWU72OSGfUW6k1egkB3sq5AH8dGLWjahsOFu3v3sHIQr0lLV4/Sa7FwFMMUyCDD+zhulq7PliwxZWsvlW2rdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IDAxIEF1Z3VzdCAyMDIzIDEzOjMzDQo+IFRvOiBHaGltaXJheSwgSGltYWwgUHJhc2Fk
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIHY5IDMvM10gZHJtL3hlOiBJbnRyb2R1Y2UgZmF1
bHQgaW5qZWN0aW9uIGZvciBndA0KPiByZXNldA0KPiANCj4gT24gMDEuMDguMjAyMyAxMjoxNSwg
R2hpbWlyYXksIEhpbWFsIFByYXNhZCB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVml2ZWthbmFuZGFuLCBCYWxhc3VicmFtYW5p
DQo+ID4gPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiA+ID4gU2Vu
dDogMDEgQXVndXN0IDIwMjMgMTE6MzINCj4gPiA+IFRvOiBHaGltaXJheSwgSGltYWwgUHJhc2Fk
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+ID4gPiB4ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IENjOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvDQo+ID4gPiA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSCB2OSAzLzNdIGRybS94
ZTogSW50cm9kdWNlIGZhdWx0DQo+ID4gPiBpbmplY3Rpb24gZm9yIGd0IHJlc2V0DQo+ID4gPg0K
PiA+ID4gT24gMzEuMDcuMjAyMyAyMDo1NCwgR2hpbWlyYXksIEhpbWFsIFByYXNhZCB3cm90ZToN
Cj4gPiA+ID4gSGkgQmFsYSwNCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IFZpdmVrYW5hbmRhbiwgQmFsYXN1YnJhbWFuaQ0KPiA+
ID4gPiA+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+ID4gPiA+ID4g
U2VudDogMzEgSnVseSAyMDIzIDIwOjAwDQo+ID4gPiA+ID4gVG86IEdoaW1pcmF5LCBIaW1hbCBQ
cmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+Ow0KPiA+ID4gPiA+IGludGVs
LSB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gPiBDYzogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA+ID4gPiA+IDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVd
IFtQQVRDSCB2OSAzLzNdIGRybS94ZTogSW50cm9kdWNlIGZhdWx0DQo+ID4gPiA+ID4gaW5qZWN0
aW9uIGZvciBndCByZXNldA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gMjcuMDcuMjAyMyAwNDo1
NiwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3RlOg0KPiA+ID4gPiA+ID4gVG8gdHJpZ2dlciBn
dCByZXNldCBmYWlsdXJlOg0KPiA+ID4gPiA+ID4gIGVjaG8gMTAwID4NCj4gPiA+ID4gPiA+IC9z
eXMva2VybmVsL2RlYnVnL2RyaS88Y2FyZFg+L2ZhaWxfZ3RfcmVzZXQvcHJvYmFiaWxpdHkNCj4g
PiA+ID4gPiA+ICBlY2hvIDIgPiAgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxjYXJkWD4vZmFpbF9n
dF9yZXNldC90aW1lcw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IENjOiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBDYzogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gUmV2
aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheQ0KPiA+ID4gPiA+ID4gPGhp
bWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jIHwgMTAgKysrKysrKysrKw0KPiA+
ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jICAgICAgfCAgOCArKysrKysrLQ0K
PiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5oICAgICAgfCAxNCArKysrKysr
KysrKysrKw0KPiA+ID4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZWJ1Z2ZzLmMgaW5kZXgNCj4gPiA+IDA0NzM0MWQ1Njg5YS4uMWZkMDE2ZTZmN2Ew
DQo+ID4gPiA+ID4gPiAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZWJ1Z2ZzLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMNCj4gPiA+ID4gPiA+IEBAIC01LDYgKzUsNyBAQA0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ICAjaW5jbHVkZSAieGVfZGVidWdmcy5oIg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+DQo+ID4gPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3N0cmluZ19oZWxwZXJzLmg+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gICNpbmNs
dWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4NCj4gPiA+ID4gPiA+IEBAIC0yMCw2ICsyMSwxMCBAQA0K
PiA+ID4gPiA+ID4gICNpbmNsdWRlICJ4ZV92bS5oIg0KPiA+ID4gPiA+ID4gICNlbmRpZg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0ZBVUxUX0lOSkVDVElPTg0KPiA+
ID4gPiA+ID4gK0RFQ0xBUkVfRkFVTFRfQVRUUihndF9yZXNldF9mYWlsdXJlKTsNCj4gPiA+ID4g
PiA+ICsjZW5kaWYNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICBzdGF0aWMgc3RydWN0IHhl
X2RldmljZSAqbm9kZV90b194ZShzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqbm9kZSkNCj4gew0KPiA+
ID4gPiA+ID4gIAlyZXR1cm4gdG9feGVfZGV2aWNlKG5vZGUtPm1pbm9yLT5kZXYpOyBAQCAtMTM1
LDQgKzE0MCw5DQo+IEBADQo+ID4gPiA+ID4gdm9pZA0KPiA+ID4gPiA+ID4geGVfZGVidWdmc19y
ZWdpc3RlcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAg
CWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ID4gPiA+ID4gPiAgCQl4ZV9ndF9kZWJ1Z2ZzX3Jl
Z2lzdGVyKGd0KTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0ZB
VUxUX0lOSkVDVElPTg0KPiA+ID4gPiA+ID4gKwlmYXVsdF9jcmVhdGVfZGVidWdmc19hdHRyKCJm
YWlsX2d0X3Jlc2V0Iiwgcm9vdCwNCj4gPiA+ID4gPiA+ICsmZ3RfcmVzZXRfZmFpbHVyZSk7ICNl
bmRpZg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYyBpbmRleCA1ZTcwZTQ4NmIyN2MuLjY5MWUzYmFmOTdjOQ0KPiA+ID4g
PiA+ID4gMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Qu
Yw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4g
PiA+IEBAIC01MjUsNiArNTI1LDExIEBAIHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3RydWN0IHhlX2d0
ICpndCkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgCXhlX2d0X2luZm8oZ3QsICJyZXNldCBz
dGFydGVkXG4iKTsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArCWlmICh4ZV9mYXVsdF9pbmpl
Y3RfZ3RfcmVzZXQoKSkgew0KPiA+ID4gPiA+ID4gKwkJZXJyID0gLUVDQU5DRUxFRDsNCj4gPiA+
ID4gPiA+ICsJCWdvdG8gZXJyX2ZhaWw7DQo+ID4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiA+ICAJeGVfZ3Rfc2FuaXRpemUoZ3QpOw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KGd0X3RvX3hlKGd0KSk7DQo+ID4gPiA+ID4g
PiBAQCAtNTYzLDYgKzU2OCw3IEBAIHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3RydWN0IHhlX2d0ICpn
dCkNCj4gPiA+ID4gPiA+ICBlcnJfbXNnOg0KPiA+ID4gPiA+ID4gIAlYRV9XQVJOX09OKHhlX3Vj
X3N0YXJ0KCZndC0+dWMpKTsNCj4gPiA+ID4gPiA+ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0
KGd0X3RvX3hlKGd0KSk7DQo+ID4gPiA+ID4gPiArZXJyX2ZhaWw6DQo+ID4gPiA+ID4gPiAgCXhl
X2d0X2VycihndCwgInJlc2V0IGZhaWxlZCAoJXBlKVxuIiwgRVJSX1BUUihlcnIpKTsNCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiAgCS8qIE5vdGlmeSB1c2Vyc3BhY2UgYWJvdXQgZ3QgcmVzZXQg
ZmFpbHVyZSAqLyBAQCAtNTg0LDcNCj4gPiA+ID4gPiA+ICs1OTAsNyBAQCB2b2lkIHhlX2d0X3Jl
c2V0X2FzeW5jKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiA+ID4gPiAgCXhlX2d0X2luZm8oZ3Qs
ICJ0cnlpbmcgcmVzZXRcbiIpOw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAJLyogRG9uJ3Qg
ZG8gYSByZXNldCB3aGlsZSBvbmUgaXMgYWxyZWFkeSBpbiBmbGlnaHQgKi8NCj4gPiA+ID4gPiA+
IC0JaWYgKHhlX3VjX3Jlc2V0X3ByZXBhcmUoJmd0LT51YykpDQo+ID4gPiA+ID4gPiArCWlmICgh
eGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KCkgJiYNCj4gPiA+ID4gPiA+ICt4ZV91Y19yZXNldF9w
cmVwYXJlKCZndC0+dWMpKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2hlbiBgZmFpbF9ndF9yZXNl
dC9wcm9iYWJpbGl0eWAgaXMgc2V0IHRvIGEgbGVzcyB0aGFuIDEwMA0KPiA+ID4gPiA+IHZhbHVl
LCB0aGVuDQo+ID4gPiA+ID4geGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KCkgd2lsbCBub3QgYWx3
YXlzIHJldHVybiB0cnVlLiBTbyBpZg0KPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IHhlX2ZhdWx0
X2luamVjdF9ndF9yZXNldCgpIHJldHVybnMgZGlmZmVyZW5ldCB2YWx1ZXMgd2hlbg0KPiA+ID4g
PiA+IGludm9rZWQgZnJvbQ0KPiA+ID4gPiA+IHhlX2d0X3Jlc2V0X2FzeW5jKCkgYW5kIGd0X3Jl
c2V0KCksIHdlIHdpbGwgaGF2ZSB1bmV4cGVjdGVkDQo+IGJlaGF2aW91ci4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFdlIHNob3VsZCBhdm9pZCBjYWxsaW5nIHhlX2ZhdWx0X2luamVjdF9ndF9yZXNl
dCgpIG1vcmUgdGhhbg0KPiA+ID4gPiA+IG9uY2UgaW4gYSBzaW5nbGUgcmVzZXQgY3ljbGUuDQo+
ID4gPiA+ID4gV2UgY291bGQgZXhpdCBpbW1lZGlhdGVseSBpbiB4ZV9ndF9yZXNldF9hc3luYygp
IGlmIGZhdWx0DQo+ID4gPiA+ID4gaW5qZWN0aW9uIGlzDQo+ID4gPiBlbmFibGVkLg0KPiA+ID4g
PiBJbnRlbnRpb24gaGVyZSBpcyB0byBjYXVzZSBuZXh0IHJlc2V0IGZhaWwuIFVubGVzcyB5b3Ug
bWFrZSB0aGUNCj4gPiA+ID4gcHJvYmFiaWxpdHkNCj4gPiA+IDEwMCB0aGF0IGlzIG5vdCBndWFy
YW50ZWVkLg0KPiA+ID4gPiBBbmQgbm8ub2YgdGltZXMgbW9yZSB0aGFuIDEgYXJlIHBlcmZlY3Rs
eSBmaW5lIGFzIGxvbmcgYXMgcHJvYmFiaWxpdHkgaXMNCj4gMTAwLg0KPiA+ID4gPiBFdmVuIGlu
IGNvbW1pdCBtZXNzYWdlIGl0IGlzIG1lbnRpb25lZCBjbGVhcmx5IHRvIHVzZSBwcm9iYWJpbGl0
eSBhcw0KPiAxMDAuDQo+ID4gPg0KPiA+ID4gVGhyb3VnaCB0aGUgY29tbWl0IG1lc3NhZ2UgaXQg
aXMgdW5kZXJzdG9vZCB0aGF0IHdlIG5lZWQgdG8gc3VwcGx5DQo+ID4gPiAxMDAgYW5kID4xIHZh
bHVlcyBmb3IgcHJvYmFiaWxpdHkgYW5kIG5vIG9mIHRpbWVzIGRlYnVnZnMgZW50cmllcy4NCj4g
PiA+IEJ1dCBpdCBkb2Vzbid0IHByZXZlbnQgYW55b25lIGZyb20gdHJ5aW5nIG90aGVyIHZhbHVl
cy4gSW4gc3VjaA0KPiA+ID4gY2FzZXMsIGl0IGlzIGZpbmUgZm9yIHRoZSBmYXVsdCBpbmplY3Rp
b24gdG8gbm90IHdvcmssIGJ1dCBpdCBzaG91bGQgbm90IGNhdXNlDQo+IGFueSBpc3N1ZXMgaW4g
dGhlIGRyaXZlci4NCj4gPiA+IEkgdGhpbmsgaWYgeGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KCkg
cmV0dXJucyBmYWxzZSBpbg0KPiA+ID4geGVfZ3RfcmVzZXRfYXN5bmMoKSBhbmQgdHJ1ZSBpbiBn
dF9yZXNldCgpLCB0aGVuIHdlIHdpbGwgZW5kIHVwIGluDQo+ID4gPiB4ZV91Y19yZXNldF9wcmVw
YXJlKCkgaW52b2tlZCBidXQgbm8gZ3QgcmVzZXQgY29tcGxldGVseSBleGVjdXRlZC4NCj4gPiA+
IFRob3VnaHQgSSBoYXZlbid0IGFuYWx5emVkIGhvdyBpdCB3b3VsZCBpbXBhY3QgZHJpdmVyLCBJ
IHRoaW5rIHRoZQ0KPiA+ID4gZHJpdmVyIHdvdWxkIGJlIGxlZnQgaW4gc29tZSB1bmV4cGVjdGVk
IHN0YXRlLiBXZSBzaG91bGQgYXZvaWQgdGhpcy4NCj4gPiA+DQo+ID4gPiBXcm9uZyB2YWx1ZXMg
Zm9yIHRoZSBkZWJ1Z2ZzIGVudHJpZXMgc2hvdWxkIGhhdmUgbm8gaW1wYWN0IG9uIHRoZQ0KPiBk
cml2ZXIuDQo+ID4gV3JvbmcgdmFsdWVzIGluIGRlYnVnZnMgd2lsbCBhbHdheXMgaW1wYWN0IGRy
aXZlciBoZXJlLg0KPiA+IDEpIElmIHByb2JhYmlsaXR5IGlzIG5vdCAxMDAuDQo+ID4gWW91IGRv
buKAmXQga25vdyB3aGljaCByZXNldCB3aWxsIGZhaWwgYW5kIHdoaWNoIHdpbGwgcGFzcywgd2hp
Y2ggaXMgZnVydGhlcg0KPiBpbmRldGVybWluaXN0aWMgZnJvbSBzb2Z0d2FyZSBwZXJzcGVjdGl2
ZS4NCj4gPiBTbyBwYXNzaW5nIHdyb25nIHZhbHVlIHRvIHByb2JhYmlsaXR5IHdpbGwgaW1wYWN0
IGlycmVzcGVjdGl2ZSBvZiB0aW1lcy4NCj4gPiAyKSBJZiBwcm9iYWJpbGl0eSBpcyAxMDAgYW5k
IHRpbWVzID0gLTEsIGFsbCB0aGUgcmVzZXRzIHdpbGwgZmFpbCBpcnJlc3BlY3RpdmUgd2UNCj4g
d2FudCBmYXVsdCBpbmplY3Rpb24gb3Igbm90Lg0KPiA+DQo+ID4gU28gcGFzc2luZyBvZiB3cm9u
ZyB2YWx1ZXMgaXMgc29tZXRoaW5nIHdlIGNhbnQgZ3VhcmFudGVlIHRvIHdvcmsgd2l0aCBpbg0K
PiBjYXNlIG9mIGZhdWx0X2luamVjdGlvbi4NCj4gPiBKdXN0IHRvIG1ha2UgY29kZSBmbG93IHdv
cmsgd2l0aCB0aW1lcyA9IDEsICBJIGNhbiBjYWNoZSB0aGUgc3RhdGUgb2YNCj4gPiB4ZV9mYXVs
dF9pbmplY3RfZ3RfcmVzZXQoKSBhbmQgdXNlIGl0IEluIGJvdGggcGxhY2VzLCBidXQgaXQgZG9l
c24ndCBoZWxwDQo+IHdpdGggcGFzc2luZyBvZiB3cm9uZyB2YWx1ZXMgdG8gZGVidWdmcyBhdCBh
bGwuDQo+ID4NCj4gPiBIYWQgZGlzY3Vzc2lvbiB3aXRoIGFyY2hpdGVjdHMgIHJlZ2FyZGluZyB0
aGlzIGJlZm9yZSwgaW1wbGVtZW50YXRpb246DQo+ID4gUXVlcnk6ICIgT24gZnVydGhlciBleHBs
b3JhdGlvbjogIEluIGZhdWx0IGluamVjdGlvbiBtZWNoYW5pc20gdGhlIHByaXZpbGVnZQ0KPiB1
c2VyIGNhbiBtYWtlIGFsbCB0aGUgcmVzZXRzIGZhaWwsIHdoZXJlYXMgaW1wYWN0IG9mDQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE5Nzg0LyBpcyBsaW1pdGVk
IHRvIHRoZSAgcmVzZXQNCj4gY2F1c2VkIGJ5IHRoaXMgcGFydGljdWxhciBkZWJ1Z2ZzLg0KPiA+
IGZvciBleGFtcGxlIDogaWYgdXNlciBzZXRzIGF0dHI6IHRpbWVzID0gLTEoIG1lYW5pbmcgdW5s
aW1pdGVkICkgYW5kIGF0dHINCj4gcHJvYmFiaWxpdHkgYXMgMTAwLCBhbGwgdGhlIHRyaWFscyB0
byBndF9yZXNldCB3aWxsIGZhbGwgIGR1ZSB0byBmYXVsdCBpbmplY3Rpb24uICBUaGlzDQo+IHNo
b3VsZG4ndCBiZSBvZiBjb25jZXJuIGFzIGxvbmcgYXMgd2UgYXJlIHNldHRpbmcgY29ycmVjdCB2
YWx1ZXMuIg0KPiA+DQo+ID4gUmVzcG9uc2Ugd2FzOg0KPiA+ICIgWWVhaCwgdGhlcmUgc2hvdWxk
IGJlIG5vIGNvbmNlcm4gb24gdXNlciB3cml0aW5nIGJhZCB2YWx1ZXMgdG8gZGVidWdmcywNCj4g
aXQncyBtb3N0bHkgb25seSBzeXNmcyB3ZSBuZWVkIHRvIGJlIGNhcmVmdWwgd2l0aCINCj4gDQo+
IENhbiB3ZSBleGl0IGZyb20geGVfZ3RfcmVzZXRfYXN5bmMoKSBpdHNlbGYgd2hlbiBmYXVsdCBp
bmplY3Rpb24gaXMgdHJ1ZSwgYW5kDQo+IG5vdCBwcm9jZWVkIHdpdGggZ3RfcmVzZXQoKT8NCk5v
LiBXZSBuZWVkIGd0X3Jlc2V0IHRvIGZhaWwuIFRoYXQgaXMgdGhlIHJlcXVpcmVtZW50IGZyb20g
ZmF1bHRfaW5qZWN0aW9uLg0KPiANCj4gUmVnYXJkcywNCj4gQmFsYQ0KPiANCj4gPg0KPiA+ID4N
Cj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBCYWxhDQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBCUg0K
PiA+ID4gPiBIaW1hbA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUmVnYXJkcywNCj4gPiA+ID4gPiBC
YWxhDQo+ID4gPiA+ID4gPiAgCQlyZXR1cm47DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIAl4
ZV9ndF9pbmZvKGd0LCAicmVzZXQgcXVldWVkXG4iKTsgZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5o
DQo+ID4gPiA+ID4gPiBpbmRleA0KPiA+ID4gPiA+ID4gNzI5ODY1M2E3M2RlLi5jYWRlZDIwM2E4
YTAgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0K
PiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmgNCj4gPiA+ID4gPiA+
IEBAIC03LDYgKzcsNyBAQA0KPiA+ID4gPiA+ID4gICNkZWZpbmUgX1hFX0dUX0hfDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX3V0aWwuaD4NCj4gPiA+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gICNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4gPiA+ID4gPiA+ICAjaW5jbHVkZSAi
eGVfaHdfZW5naW5lLmgiDQo+ID4gPiA+ID4gPiBAQCAtMTYsNiArMTcsMTkgQEANCj4gPiA+ID4g
PiA+ICAJCWZvcl9lYWNoX2lmKCgoaHdlX18pID0gKGd0X18pLT5od19lbmdpbmVzICsNCj4gKGlk
X18pKSAmJiBcDQo+ID4gPiA+ID4gPiAgCQkJICB4ZV9od19lbmdpbmVfaXNfdmFsaWQoKGh3ZV9f
KSkpDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfRkFVTFRfSU5KRUNU
SU9OIGV4dGVybiBzdHJ1Y3QgZmF1bHRfYXR0cg0KPiA+ID4gPiA+ID4gK2d0X3Jlc2V0X2ZhaWx1
cmU7IHN0YXRpYyBpbmxpbmUgYm9vbA0KPiA+ID4gPiA+ID4gK3hlX2ZhdWx0X2luamVjdF9ndF9y
ZXNldCh2b2lkKSB7DQo+ID4gPiA+ID4gPiArCXJldHVybiBzaG91bGRfZmFpbCgmZ3RfcmVzZXRf
ZmFpbHVyZSwgMSk7IH0gI2Vsc2Ugc3RhdGljDQo+ID4gPiA+ID4gPiAraW5saW5lIGJvb2wNCj4g
PiA+ID4gPiA+ICt4ZV9mYXVsdF9pbmplY3RfZ3RfcmVzZXQodm9pZCkgew0KPiA+ID4gPiA+ID4g
KwlyZXR1cm4gZmFsc2U7DQo+ID4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ID4gKyNlbmRpZg0KPiA+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gIHN0cnVjdCB4ZV9ndCAqeGVfZ3RfYWxsb2Moc3RydWN0
IHhlX3RpbGUgKnRpbGUpOyAgaW50DQo+ID4gPiA+ID4gPiB4ZV9ndF9pbml0X2Vhcmx5KHN0cnVj
dCB4ZV9ndCAqZ3QpOyAgaW50IHhlX2d0X2luaXQoc3RydWN0DQo+ID4gPiA+ID4gPiB4ZV9ndCAq
Z3QpOw0KPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+IDIuMjUuMQ0KPiA+ID4gPiA+ID4NCg==
