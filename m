Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2062C7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4D10E0B6;
	Fri,  9 Jun 2023 18:34:43 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795EC10E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335681; x=1717871681;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=DJjSWirpPFmeXr79De/yRWhkLPDJPi3G5TjzmBkil+A=;
 b=Q/6r4fDuQ4l8WJLNfiGr0F75pCCnJ/EqQ+MqsLeqXA158kDd6eZpI9P6
 3kuysLTplYK1R9Sa0C0KV0tmjlv1Q3QKBvTnABcDBeyk9vqZ/AdJUhjoM
 Gu5TlKkvt87DOCNWEU64TQWj8wV1YJvPq8p7DJkvQaYcYYm0dZeCk2NtY
 j1dz+zcwCGYCIjaZoxNCakN1OGftGJAFNZIlxkR6k3tkPHdpSLAIjHgw5
 wcSNkmPLVKI/tphtN1I/aZc6+GPkqk22M7QcOnYDdWkaD3kTDqdDsuHgd
 CPD/6TqWINMiz1VnZYMc/U+7Q//Ua73ZJMK2DjvHu0n0rH0xEKWqZoKUe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="421254430"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="421254430"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884673582"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="884673582"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 09 Jun 2023 11:34:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:34:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 11:34:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 11:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4RAOHan2Y5o2RFXENycCAzTtqLkJPbgfXQNGppWobTS3F/fw1SSbdT0epIxN9pFl6/AVSrhqW9Fh1+2b2RvOTM6w9h5n/+eFX5+Vq640v70NGqKk2QmUXBzl/jOvbcqESsU4f0YSYWLOuaK0WB2SKnElXDfJdyzW21D30I71HPYq4q7EZrCmiGqIP2Ng/5z133QIcf/AeLl6vjIPzjv7K7AMtWGmaSWtSFH0Lx0ODdaq6VECTJL52t+B3uVTVONWASHlV3ZFgUI/HWXbFwIuGwnWIi3iNfZ/elDahuM8kd7C04ldPxK/KTFHnSBhHQ2EvKbs6kZ4j5JGTM+BFkZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJjSWirpPFmeXr79De/yRWhkLPDJPi3G5TjzmBkil+A=;
 b=bYuCNOmF947uggO90bITuDoW6LtTbfcj5rqR7h2p67gbTFSA55+4Uv/NM8pE80Zv+pJL8b08ivJufYmwc5p9BUFTXIGIjUBofLxoc0IQq6qkcbdCaSuJ9ga+fjJwAHhHYuKz5QV/puN31k7Srmn99ckqGnOnViNjBBNkNbDWnCPLHDlyG1DYvtAFuf43PDRLuRJYFlAu9wPCLPC3OUQVPK1fbUP8Y+r6A9Bww4cMFC1UFJBP7KPL74YQUhxR1Mu3p0oSBkeEJ8rB5BR8Z/hk2PXol6AGF6alNvk/zHPiMf98UUKPDeohtbaIz5rZtoKLZfBf8NJ4WtrjCIs9Afi4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 18:34:33 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 18:34:33 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits an
 error
Thread-Index: AQHZmv/w20xoPWp8e0OmDKZ0V6jHZ6+CzAsA
Date: Fri, 9 Jun 2023 18:34:33 +0000
Message-ID: <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
In-Reply-To: <20230609182627.143150-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8460:EE_
x-ms-office365-filtering-correlation-id: 9f94eb23-a25d-4d7d-541d-08db69182ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CrtdZ4jzWHJTEk1+TvhOjkuvegkKQ5lurQAmAokq/V/mlb8srpbBeAIlF3pt+WA24HdpBC33p2XvZTIMl0jOFatVdvPn5D5onnTOkOdfToAl1I7acrxa1b8RbBu3QIvXcPNFFtuVrJp+vYC5STfOKnDz28zveimwe4f6WmamPNLwLAJdg9IobWB7LbQdtoUdby3UEEDy3RrEBFzo0rcLRCY8L5ggSLXjQtGpIgOkzYutr3ylGMIiga4ew2Lc3t6Eo8OHKDt8OHKuyyAD2rfl4xlkrbhFbKIax2iA+INvicNXL0lqz5DkONQ0gA6khff8vukTwPDpIXpD2xFsnp94bz7eweXM6Tx5GbLM4owcv+EBDU5zR7pqHUppXu0uomFDeh3oI9gEyB2KeFa/GPEGK+WkeGf/rymKk5vdMUe3Ccg3vxmpOiv0LYsUNRU6N8pQEKxD9P7pznS2fgkStTfK/uJRWO7dBXmDtz7nZFHoqCKRdUzAPsxFoG1rVA+icyhw46ROvnmmYGzS37OdssTFqs9gDDAKJNjAUQqfTbpUzgWweJGu091jkyd/ZNukxvpTDuNhTdha+7z1GbDlDTBOjPu95vsAqpp8h6ou7N/w0ayLRGIMhD7dyYsRnhmSN0us
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(2616005)(6512007)(38100700002)(6506007)(41300700001)(6486002)(26005)(83380400001)(186003)(71200400001)(478600001)(110136005)(64756008)(122000001)(91956017)(66446008)(316002)(66946007)(82960400001)(76116006)(8676002)(66556008)(66476007)(6636002)(8936002)(5660300002)(2906002)(38070700005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmNBT2ZMenFKRXpueEZzRWYrR0xSUndPRVp3WDZxb3hyNUh2Ui9GVEo2b3lL?=
 =?utf-8?B?SjRaNngxamtyQ2FJNEpyQkcrakxoc1UzS1dmOU1zbjMvbXFVTmpvakZ3cy9h?=
 =?utf-8?B?UUlzMnR0UHFJY3E0Q3RMMnpQUVBTUVJnSDExVEtYa1NNY1lnd056RUgwSTZj?=
 =?utf-8?B?SnNmdWdQYlZ1QWZsOENHemoxRzlTb0JNdWlTcTJPSHU4MzZXL0E0cnhyb1dN?=
 =?utf-8?B?eWNOYmI4RGNzdmhtNVdBa0NSblNqcllvL3F1T01Kb09TODhzRUQ0bDNmWCtL?=
 =?utf-8?B?bkJma3hyN2ZCcGlPMURUUXRzdGJNSFhVRWQxcEJ4QWhPWld3bjY4Q0RmMkRm?=
 =?utf-8?B?N3JrTllOa3JuYlJYTGhVenpFQkQ4dUNiblZZQzNqVVBxR2xiUG9pNU9xNk5Y?=
 =?utf-8?B?bFNyM2kxZm9BalRoeWVuYXN2MlhtQkp6T0VhQTVXT0lxWEFEbnNJc2ZJZ3Fw?=
 =?utf-8?B?V2hzbXRDdnYzT3NRL3lXV0V1Q2pvanUvdmloZGpLV2xhRlN3aWJOU0xpcW10?=
 =?utf-8?B?amd0NmJjUWwrbjAyQ3ZXbjhGZzMva09lRTlyci9rT2FPZWJ4UGxQMHN3VmVP?=
 =?utf-8?B?RTRPTmJaNmVTa1liOWQvZEhkRTZVYW5LTElnYmM0aGVnRFNSSFFPaHhianc4?=
 =?utf-8?B?VkZ6ZWpJTnN6TmZjeXgzZUVnenhsdTBManpsTFovL1hPeFUrUGMyRlBpQkkx?=
 =?utf-8?B?Q1dvVVR0d25POTlwdS9wSUk5VkdldCt3NjVYenVjeURIQXhQeUl4MmNwZ0Rr?=
 =?utf-8?B?TzZmOXozVFFCMFE4SFRpeTRGSzArOHFWS2cvNnhNa0lFbDVucXA3Z3Vmdzdl?=
 =?utf-8?B?VzNtQzJIaHRSVGcrU1VleUlKTVNRYmplbjBEaXl1ZUdOVUpEejVMc1lNazZX?=
 =?utf-8?B?ZG1zM21GdGozWGQwbVJSUzI0MEZQc2FhL3lzRDlIM3prWW15ZWIzcTM1Nmp5?=
 =?utf-8?B?cUFDSzc0U0hTci9NUWE5TUpGY2lGbmlaY1EzUXRCYWZBcExCUmFHTHBNMko2?=
 =?utf-8?B?NStPZTVqRkdPejlSREwvTCtjN29QbWlrTmtydEZTS3Jnc2N5TG9NVmdWU0oy?=
 =?utf-8?B?N1YvbTV6VG5aTHZrUlN2cUttcWEzb0RYZ0pxNTB1elpFQVcyNHRjMTlrU1FW?=
 =?utf-8?B?RTNqSkx3WWhvUmRaSEpRQUQ5L2JoVTBCaHVSUWNTKzkvazhqT3cvYUxhK2pO?=
 =?utf-8?B?Y1ljS2Q1ODE4REtqck5ORFZUQndvZ1gvK0FSVVd2TXpuWkg1RHRDVENNczIv?=
 =?utf-8?B?RTk1TWRLR0F3Y1RJZ01qTm5yc3ZTZDcwU01xY2hVcSttR05lZ1pGZktFQXBm?=
 =?utf-8?B?cXROQWFGNkxBTlRhZHJXdXo2cG85WU81RW1ubEI0L05TNC9aVEY0aFB5am5a?=
 =?utf-8?B?YWhUSVdXcjJlMFFaWW9SbGlOYjNicnJiSVhGMEJFT3lEck11eG53a3k4R0Y1?=
 =?utf-8?B?MjJJd1prTUNrUkhtRklZM1FBVUNrc3VzbWFTeVpnRHFrYUVqbmR4ZWJDdER2?=
 =?utf-8?B?SkpxVGk1bkl0bUphaUdJSEZDYUdPNTQzUGd1ZnRPaHJkM1FSaXh1N3FxcXIr?=
 =?utf-8?B?MDFHdExrejVvRUVrQyswNkR1dGZ3OVdHUVRsQVJKZUNiemlZMFNFRjBmNUpv?=
 =?utf-8?B?N0ltMExwQ0JKdHlteW9OK0VDRk8xaklrSUhEN0ZzQkdvOVIxZUtteEJNenRM?=
 =?utf-8?B?WUxVK2ZVMkdXNWhoMmQ3djV1VnpKTVRRV2wwcVUzZWk3NUJRaG9Xa3dUYisw?=
 =?utf-8?B?YlIwbjB0WFhFVjM5aDZjbDcwenRLUE1USVNNTHdDVUs4dzc3WUExcnRlN1RF?=
 =?utf-8?B?SXk4dFJTVnZoSzlUM2E3SUpmemd6ZHlOSFVQQkVYUGxOL00zSkVOTER4VHBU?=
 =?utf-8?B?RXJIMlVFaWlENUUyZHpGSEpHaUw2dFl6cFR6ZmRxUWhjeGVIdnkzWnZWRmht?=
 =?utf-8?B?eXJGVUtJelF3ZlpLeEk5dVNoMDU0czNhTk4wLy9xbGJaTjNXMGlBT3pGL1Bo?=
 =?utf-8?B?MWk3TThLNlRnRk9sMUlnbVZlYTlqK1pZekJnS29xQ1ArcThQVG1HTHNNWTR5?=
 =?utf-8?B?bmoyL2FmczduQ2gySjc5bHBiMzh0dnNMa2llVzhiTXoybnpiUUdGNk12OVRM?=
 =?utf-8?Q?7R6a3DHtY76HDOCCOR0vpN2Pe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9C5637B57882B4B93A251F558216D76@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f94eb23-a25d-4d7d-541d-08db69182ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 18:34:33.5107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCHeZt3ePsjc0MxFBsfgAA1LxS6P5AQhf++x3BTc6ZHB02L2E+sXTg0i2ITAm6D67BDRp7xupGahEz/3QJT42g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits
 an error
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBXZSBjYW5ub3QgcmVjb3ZlciBhIFZNIGlmIGEgcmViaW5kIHdvcmtlciBoaXRzIGFuIGVycm9y
LCBiYW4gdGhlIFZNIGlmDQo+IGhhcHBlbnMgdG8gZW5zdXJlIHdlIGRvIG5vdCBhdHRlbXB0IHRv
IHBsYWNlIHRoaXMgVk0gb24gdGhlIGhhcmR3YXJlDQo+IGFnYWluLg0KPiANCj4gQSBmb2xsb3cg
dXAgd2lsbCBpbmZvcm0gdGhlIHVzZXIgaWYgdGhpcyBoYXBwZW5zLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jICAgICB8ICA1ICsrKysrDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZXhlYy5jICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV90cmFjZS5oICAgICAgfCAgNSArKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmggICAgICAgICB8IDEwICsrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bV9tYWR2aXNlLmMgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtX3R5cGVzLmggICB8ICA1ICsrKy0tDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2VuZ2luZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+IGluZGV4
IGIzMDM2YzRhOGVjMy4uYjFmODA4YzA4ZGM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZW5naW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5j
DQo+IEBAIC01OTcsNiArNTk3LDExIEBAIGludCB4ZV9lbmdpbmVfY3JlYXRlX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCWlmIChYRV9JT0NUTF9FUlIoeGUs
ICF2bSkpDQo+ICAJCQlyZXR1cm4gLUVOT0VOVDsNCj4gIA0KPiArCQlpZiAoWEVfSU9DVExfRVJS
KHhlLCB4ZV92bV9pc19jbG9zZWRfb3JfYmFubmVkKHZtKSkpIHsNCj4gKwkJCXhlX3ZtX3B1dCh2
bSk7DQo+ICsJCQlyZXR1cm4gLUVOT0VOVDsNCj4gKwkJfQ0KPiArDQo+ICAJCWUgPSB4ZV9lbmdp
bmVfY3JlYXRlKHhlLCB2bSwgbG9naWNhbF9tYXNrLA0KPiAgCQkJCSAgICAgYXJncy0+d2lkdGgs
IGh3ZSwgRU5HSU5FX0ZMQUdfUEVSU0lTVEVOVCk7DQo+ICAJCXhlX3ZtX3B1dCh2bSk7DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2V4ZWMuYw0KPiBpbmRleCBlNDQwNzZlZTJlMTEuLjI3YzExODEyZDczMyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlYy5jDQo+IEBAIC0yOTQsNyArMjk0LDcgQEAgaW50IHhlX2V4ZWNfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpm
aWxlKQ0KPiAgCWlmIChlcnIpDQo+ICAJCWdvdG8gZXJyX3VubG9ja19saXN0Ow0KPiAgDQo+IC0J
aWYgKHhlX3ZtX2lzX2Nsb3NlZChlbmdpbmUtPnZtKSkgew0KPiArCWlmICh4ZV92bV9pc19jbG9z
ZWRfb3JfYmFubmVkKGVuZ2luZS0+dm0pKSB7DQo+ICAJCWRybV93YXJuKCZ4ZS0+ZHJtLCAiVHJ5
aW5nIHRvIHNjaGVkdWxlIGFmdGVyIHZtIGlzIGNsb3NlZFxuIik7DQo+ICAJCWVyciA9IC1FSU87
DQoNCldoZW4gYmFubmVkIGl0IHNob3VsZCByZXR1cm4gRUNBTkNFTEVEIGxpa2U6DQoNCmlmIChY
RV9JT0NUTF9FUlIoeGUsIGVuZ2luZS0+ZmxhZ3MgJiBFTkdJTkVfRkxBR19CQU5ORUQpKSB7DQoJ
ZXJyID0gLUVDQU5DRUxFRDsNCglnb3RvIGVycl9lbmdpbmU7DQp9DQoNCkFib3V0IGhvdyB0byBu
b3RpZnkgVU1ELCBob3cgYWJvdXQgYWRkIGEgRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9QRVJUWT8N
Cg0KPiAgCQlnb3RvIGVycl9lbmdpbmVfZW5kOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaA0KPiBpbmRl
eCAyZjhlYjdlYmU5YTcuLmViODlhYzkzNDM5NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RyYWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgN
Cj4gQEAgLTQ3Miw2ICs0NzIsMTEgQEAgREVDTEFSRV9FVkVOVF9DTEFTUyh4ZV92bSwNCj4gIAkJ
CSAgICAgIF9fZW50cnktPmFzaWQpDQo+ICApOw0KPiAgDQo+ICtERUZJTkVfRVZFTlQoeGVfdm0s
IHhlX3ZtX2tpbGwsDQo+ICsJICAgICBUUF9QUk9UTyhzdHJ1Y3QgeGVfdm0gKnZtKSwNCj4gKwkg
ICAgIFRQX0FSR1Modm0pDQo+ICspOw0KPiArDQo+ICBERUZJTkVfRVZFTlQoeGVfdm0sIHhlX3Zt
X2NyZWF0ZSwNCj4gIAkgICAgIFRQX1BST1RPKHN0cnVjdCB4ZV92bSAqdm0pLA0KPiAgCSAgICAg
VFBfQVJHUyh2bSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggZTQzMTFjNDhjYzU0Li4xOTY2YTU4
M2I3NjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC01MTQsNiArNTE0LDI0IEBAIHZvaWQg
eGVfdm1fdW5sb2NrX2RtYV9yZXN2KHN0cnVjdCB4ZV92bSAqdm0sDQo+ICANCj4gICNkZWZpbmUg
WEVfVk1fUkVCSU5EX1JFVFJZX1RJTUVPVVRfTVMgMTAwMA0KPiAgDQo+ICtzdGF0aWMgdm9pZCB4
ZV92bV9raWxsKHN0cnVjdCB4ZV92bSAqdm0pDQo+ICt7DQo+ICsJc3RydWN0IHd3X2FjcXVpcmVf
Y3R4IHd3Ow0KPiArCXN0cnVjdCB4ZV9lbmdpbmUgKmU7DQo+ICsNCj4gKwlsb2NrZGVwX2Fzc2Vy
dF9oZWxkKCZ2bS0+bG9jayk7DQo+ICsNCj4gKwl4ZV92bV9sb2NrKHZtLCAmd3csIDAsIGZhbHNl
KTsNCj4gKwl2bS0+ZmxhZ3MgfD0gWEVfVk1fRkxBR19CQU5ORUQ7DQo+ICsJdHJhY2VfeGVfdm1f
a2lsbCh2bSk7DQo+ICsNCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGUsICZ2bS0+cHJlZW1wdC5l
bmdpbmVzLCBjb21wdXRlLmxpbmspDQo+ICsJCWUtPm9wcy0+a2lsbChlKTsNCj4gKwl4ZV92bV91
bmxvY2sodm0sICZ3dyk7DQo+ICsNCj4gKwkvKiBUT0RPOiBJbmZvcm0gdXNlciB0aGUgVk0gaXMg
YmFubmVkICovDQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtf
ZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpDQo+ICB7DQo+ICAJc3RydWN0IHhlX3ZtICp2bSA9
IGNvbnRhaW5lcl9vZih3LCBzdHJ1Y3QgeGVfdm0sIHByZWVtcHQucmViaW5kX3dvcmspOw0KPiBA
QCAtNTMzLDcgKzU1MSw3IEBAIHN0YXRpYyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKncpDQo+ICAJWEVfQlVHX09OKCF4ZV92bV9pbl9jb21wdXRlX21v
ZGUodm0pKTsNCj4gIAl0cmFjZV94ZV92bV9yZWJpbmRfd29ya2VyX2VudGVyKHZtKTsNCj4gIA0K
PiAtCWlmICh4ZV92bV9pc19jbG9zZWQodm0pKSB7DQo+ICsJaWYgKHhlX3ZtX2lzX2Nsb3NlZF9v
cl9iYW5uZWQodm0pKSB7DQo+ICAJCXRyYWNlX3hlX3ZtX3JlYmluZF93b3JrZXJfZXhpdCh2bSk7
DQo+ICAJCXJldHVybjsNCj4gIAl9DQo+IEBAIC02NjIsMTEgKzY4MCwxMiBAQCBzdGF0aWMgdm9p
ZCBwcmVlbXB0X3JlYmluZF93b3JrX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KQ0KPiAgCQkJ
Z290byByZXRyeTsNCj4gIAkJfQ0KPiAgCX0NCj4gKwlpZiAoZXJyKQ0KPiArCQl4ZV92bV9raWxs
KHZtKTsNCj4gIAl1cF93cml0ZSgmdm0tPmxvY2spOw0KPiAgDQo+ICAJZnJlZV9wcmVlbXB0X2Zl
bmNlcygmcHJlZW1wdF9mZW5jZXMpOw0KPiAgDQo+IC0JWEVfV0FSTl9PTihlcnIgPCAwKTsJLyog
VE9ETzogS2lsbCBWTSBvciBwdXQgaW4gZXJyb3Igc3RhdGUgKi8NCj4gIAl0cmFjZV94ZV92bV9y
ZWJpbmRfd29ya2VyX2V4aXQodm0pOw0KPiAgfQ0KPiAgDQo+IEBAIC0xMTI3LDcgKzExNDYsNyBA
QCB4ZV92bV9maW5kX292ZXJsYXBwaW5nX3ZtYShzdHJ1Y3QgeGVfdm0gKnZtLCBjb25zdCBzdHJ1
Y3QgeGVfdm1hICp2bWEpDQo+ICB7DQo+ICAJc3RydWN0IHJiX25vZGUgKm5vZGU7DQo+ICANCj4g
LQlpZiAoeGVfdm1faXNfY2xvc2VkKHZtKSkNCj4gKwlpZiAoeGVfdm1faXNfY2xvc2VkX29yX2Jh
bm5lZCh2bSkpDQo+ICAJCXJldHVybiBOVUxMOw0KPiAgDQo+ICAJWEVfQlVHX09OKHZtYS0+ZW5k
ID49IHZtLT5zaXplKTsNCj4gQEAgLTMwNDgsNyArMzA2Nyw3IEBAIGludCB4ZV92bV9iaW5kX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSkNCj4gIAkJZ290byBmcmVlX29ianM7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKFhFX0lPQ1RM
X0VSUih4ZSwgeGVfdm1faXNfY2xvc2VkKHZtKSkpIHsNCj4gKwlpZiAoWEVfSU9DVExfRVJSKHhl
LCB4ZV92bV9pc19jbG9zZWRfb3JfYmFubmVkKHZtKSkpIHsNCj4gIAkJZHJtX2VycihkZXYsICJW
TSBjbG9zZWQgd2hpbGUgd2UgYmVnYW4gbG9va2luZyB1cD9cbiIpOw0KPiAgCQllcnIgPSAtRU5P
RU5UOw0KPiAgCQlnb3RvIHB1dF92bTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgNCj4gaW5kZXggMzcyZjI2MTUz
MjA5Li44NTgyMDdhMjAwMTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oDQo+IEBAIC00OSw2ICs0OSwx
NiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfdm1faXNfY2xvc2VkKHN0cnVjdCB4ZV92bSAqdm0p
DQo+ICAJcmV0dXJuICF2bS0+c2l6ZTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGlubGluZSBib29s
IHhlX3ZtX2lzX2Jhbm5lZChzdHJ1Y3QgeGVfdm0gKnZtKQ0KPiArew0KPiArCXJldHVybiB2bS0+
ZmxhZ3MgJiBYRV9WTV9GTEFHX0JBTk5FRDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBi
b29sIHhlX3ZtX2lzX2Nsb3NlZF9vcl9iYW5uZWQoc3RydWN0IHhlX3ZtICp2bSkNCj4gK3sNCj4g
KwlyZXR1cm4geGVfdm1faXNfY2xvc2VkKHZtKSB8fCB4ZV92bV9pc19iYW5uZWQodm0pOw0KPiAr
fQ0KPiArDQo+ICBzdHJ1Y3QgeGVfdm1hICoNCj4gIHhlX3ZtX2ZpbmRfb3ZlcmxhcHBpbmdfdm1h
KHN0cnVjdCB4ZV92bSAqdm0sIGNvbnN0IHN0cnVjdCB4ZV92bWEgKnZtYSk7DQo+ICANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+IGluZGV4IDBmNWVlZjMzNzAzNy4uNzY0NThmOGQ1
N2YzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gQEAgLTMxMyw3ICsz
MTMsNyBAQCBpbnQgeGVfdm1fbWFkdmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPiAgCWlmIChYRV9JT0NUTF9FUlIoeGUsICF2bSkpDQo+ICAJCXJldHVybiAt
RUlOVkFMOw0KPiAgDQo+IC0JaWYgKFhFX0lPQ1RMX0VSUih4ZSwgeGVfdm1faXNfY2xvc2VkKHZt
KSkpIHsNCj4gKwlpZiAoWEVfSU9DVExfRVJSKHhlLCB4ZV92bV9pc19jbG9zZWRfb3JfYmFubmVk
KHZtKSkpIHsNCj4gIAkJZXJyID0gLUVOT0VOVDsNCj4gIAkJZ290byBwdXRfdm07DQo+ICAJfQ0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0KPiBpbmRleCA3NmFmNmFjMGZhODQuLjU2NmI2N2Fi
ZTFjMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmgNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmgNCj4gQEAgLTE3OCw4ICsxNzgs
OSBAQCBzdHJ1Y3QgeGVfdm0gew0KPiAgI2RlZmluZSBYRV9WTV9GTEFHX01JR1JBVElPTgkJQklU
KDMpDQo+ICAjZGVmaW5lIFhFX1ZNX0ZMQUdfU0NSQVRDSF9QQUdFCQlCSVQoNCkNCj4gICNkZWZp
bmUgWEVfVk1fRkxBR19GQVVMVF9NT0RFCQlCSVQoNSkNCj4gLSNkZWZpbmUgWEVfVk1fRkxBR19H
VF9JRChmbGFncykJCSgoKGZsYWdzKSA+PiA2KSAmIDB4MykNCj4gLSNkZWZpbmUgWEVfVk1fRkxB
R19TRVRfVElMRV9JRCh0aWxlKQkoKHRpbGUpLT5pZCA8PCA2KQ0KPiArI2RlZmluZSBYRV9WTV9G
TEFHX0JBTk5FRAkJQklUKDYpDQo+ICsjZGVmaW5lIFhFX1ZNX0ZMQUdfR1RfSUQoZmxhZ3MpCQko
KChmbGFncykgPj4gNykgJiAweDMpDQo+ICsjZGVmaW5lIFhFX1ZNX0ZMQUdfU0VUX1RJTEVfSUQo
dGlsZSkJKCh0aWxlKS0+aWQgPDwgNykNCj4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgDQo+
ICAJLyoqIEBjb21wb3NpdGVfZmVuY2VfY3R4OiBjb250ZXh0IGNvbXBvc2l0ZSBmZW5jZSAqLw0K
DQo=
