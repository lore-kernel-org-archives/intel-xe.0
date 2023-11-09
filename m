Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4038C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 17:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9892010E0E4;
	Thu,  9 Nov 2023 17:11:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B81F10E0E4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699549913; x=1731085913;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yIXVzu/dQeRqf94xJtYZ7uLnxpvcOScrS4f6+0IAgAI=;
 b=A67eecsXcaQC8mn+XFtWAnUJ0hf1mUIWBseMdfR8vpIh2d2Y/B7NoFRU
 5djBJiS28TjgP9Q/WkzXztGacASbXWyPOkX7stBNy0jOkmw7efYIQBzNF
 mRPlCO0xWaS9v4Ub8pXXhuxb7eqhtkwSeLi46ist80PD6zAg2G4UV41ms
 cDukWGAYzl+QG7IlgSOPTg6GrG2RJo1rFiUh15Cuq47f1xVoyMVz05iWF
 QJq0qY0++nXfS1poMF0nbhf6tgf5/92MF5W90aeCYz2Ks7pvx+2SN2eS9
 sHLEMwOL2GKfUovaKZlvQTowVpx/seT7njW+CEQYXCU+zhK4rhPmMsXEL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421123824"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="421123824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829388656"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="829388656"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 09:11:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 09:11:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 09:11:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 09:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM0/uVvG5fEiPXvDyiUAiiCvqWpEqFtc8XxTWB/jykFFKsXlcG5pYTyvCBbwTPvlk2uZzQ59uiu+rfmaTLKkvY2Y00ykyjYrcAm1z0w8pAFI3xGcwvRHf8+RG2pgcZpeLGfU5FzG6u1/h0cfpMMm8bYZugi8oXd2aCatbudyCf7a8RsykUULF3bZD/11QQYJAQ2i+GwQqCDj5KTLSAvxnpCworuWBYz1r3Q5sKIwnTGjerxwVohfQ2cC6mfJKxr6k1sGtyHzG6Vn5OTyWFLASttUv0sMn79sLz6Wxkduj15ltQhiQXYX6zRajQdHOjA9sIzltRaiNksLt3AeqP2zbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIXVzu/dQeRqf94xJtYZ7uLnxpvcOScrS4f6+0IAgAI=;
 b=mP+mDXSIqMty7/rARZ4yur0yeniLIV1A5lPjOxOj001B7xgxOiNKhabb746IZC5Jck1x5Un2Vvje66Mvr3WoXY8nhFq4zZ3DH+oruv0fI43qB/3rB7+fq+Gzdf3cnEtE5J3cVN6mm3SCvR3BW6U20/VOpny0h8IucrS/Vq1eqzbyt5sIgOgBCu67CIVjQ9684fcDkKjB6Xu3l6hwaqxRjUpmsW8m+RLYhrvwU/gdNdt7mQXupZ3E/YHwtJeNneJxAkgY1YMbOsIacBn5wjxmGfD5dC5op+meCoZXDCKCY0VvbnwRlBygXB4ae+DuuhAGwD5nHSwsJlvvcCGsG8N6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 17:11:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 17:11:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 00/43] uAPI Alignment - take 2
Thread-Index: AQHaEyPOTOltrGHZSUOq8cnpQK5jGbByOVQA
Date: Thu, 9 Nov 2023 17:11:42 +0000
Message-ID: <4d9d5fbc8f4cf96469b611235804eedde3f97d13.camel@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: a6cdea48-3de3-4f86-86bb-08dbe146f224
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+VWv0NSLzmahxnGe/0C9nfTbj20mnXDKo8sXTXJrnr6my2SQG35kMkDlKWENUse7bNrcFSRrXQtDnMKBwLw9vEzw9cM84cvgZBdTSudxgEELWgD0k5PyNR0PUK2v0R1avqdlfSs5dS5IzqfwX4EacOJAUSPLtsW0FLqDHBTodH83QfgNpCXHb8E1ALfUH0DkqldaOmKCzMz+NrJ2yTsEhRpxHjBLGHJh1MFfYdEN7WHJ1B5DxkXm19dXKgdoQbZxNdYq09WMo7OeaDCwNITulFBnnayZSl+3pXBTON4qQsjQmvVx0UpHFIGfgxFdnx5zggEbE0RbHStbasJJN8HpOETDpzIMb6/8z/zYjjDE1ZXO/tVmb34X4RXZFPbRiDjt4QDrFZ9uOyZe0bZ7o5Pba3me+2bdUb5ZLP1GAg1QVKb5r5zZ7SrMedfvC1IAZQ1SeVPKAlGTwb8rxCmnVXR5RF9cS9bXdXYmom337Q2KMLC08CpNP3FPHWVwXUGP8awB6rNQ5qBpu3I0gu76dI4X/w9SXEWMANYf5X/xVqs9j+UBrgjnL+FjNbmulU7F4XM7OpWPDYlbWCneAfEF/CWfU8C8z2Fn/aY3IkNp640F4AD9IGmTtJDuC2sOAwS/aJLNINK9iHRcnTY1xAiVxztPbMpiH3TNvroHfpJ7ls78Fg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6512007)(83380400001)(91956017)(110136005)(76116006)(66946007)(26005)(2616005)(478600001)(71200400001)(6506007)(8936002)(8676002)(64756008)(66446008)(66556008)(316002)(66476007)(6636002)(6486002)(38100700002)(86362001)(41300700001)(5660300002)(122000001)(82960400001)(2906002)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enVOdlo1VmxLcnpwSWN0OVgreE1nTnpOem9ZOE5IbU8rY20wcG03b1ZJdm9S?=
 =?utf-8?B?U3c4UzhsOU5URkh5WFZqbDVIbEdRR25Kelo0TnZ3RWRqOXArMkxZL2RMNzdB?=
 =?utf-8?B?TVRqdTBVaCtYMi91Y3NpemZRTzl2SGwwSXhVNWRoSUd1SmtzK1B0cW1UajUr?=
 =?utf-8?B?RG42Z3UrR3ZwbTV2bUk0VkZnTUNTb01FSzJjMDRkdDJmR25MTEpOTlhhK0Y2?=
 =?utf-8?B?L2VHRGt4OEd3VXZqWWdUMGp1eWh1TGZnWlEyNmRmUWhvTjlEYmlicmh6K1Q4?=
 =?utf-8?B?Z1U1bjVEdmJtVzcvZ0N3NXdxdVpWSzBtdFlGeCt1Uk9zeDlsYzE1ODdtM25r?=
 =?utf-8?B?dkZVbUVURFpjM3JuS1pKSU1LaTNleUxNd1lxcjB5WkFjSW9hN1RPaUJyRUVj?=
 =?utf-8?B?UFpJQWR6MHArbUJoVHpTVkplT0lURkFiRFlxeGlGSGFUZTViOGt0aWZSemw2?=
 =?utf-8?B?WEpqNVB3VWRobGZPTGZHMUROK0JOaUdEbngra2JGUnQ0UFc3eDZwWk1WU0Z1?=
 =?utf-8?B?Q3JxQ3pBK09VVWZpSGJYVUcvREgzOWd0dlVTY0loL0JrUGIzemJ6clFxU2Zt?=
 =?utf-8?B?WmVyR3gyZGJSNitJWWVUNGdWZGFsTHlYZldOSWlHTTlqelc0STNYU1VpbUdP?=
 =?utf-8?B?eWhFOUpzN202QTJZc3E4alJDaEJQQ3ZoQTFLYjhQYTBEekMzdmgrMTl5bG1G?=
 =?utf-8?B?RWlwa3ErS0d2S0xBYmREQ2h2UFJSSVEycm43WnpleHhsZEI4S1ExVU5DU055?=
 =?utf-8?B?YTJ6ZGY3Z2d5SXNKKzFpT2JJY21DVFMxa2p6N1hMbEVmSm1jSVBsdGQwUVJm?=
 =?utf-8?B?d3d0N1pEcVU3NFQyYjhFL0ZnMWJGR0RqMUZ2WXF3WmdCY3FkK3Z5ZEhZTkdP?=
 =?utf-8?B?ZFNHcFo2YnB6RWh6Ykx3akdLTkdPLzhrbWNXYm5tRTlNVGNCaFBudkM3Z0lG?=
 =?utf-8?B?T3NEWjRkRHNOQWxWMEwwWEpueEFWSHlNU1puYVh1SjZybnE2cW5lRGNSaEZx?=
 =?utf-8?B?bTd3ZDJJVG51ZnAyNXI2MzFIUndnd0xPcE83Qi82NXExYzZwczh0K29RNi8x?=
 =?utf-8?B?YlFNUys4ejhJRlRFa0wwdmR2QmhUVWNFRlZQQktwbjZMdzU5cW8yMmtKZVZI?=
 =?utf-8?B?ZmM0bHlBdmdDOEZIdkJ0d2lpYlhjb2hiU1BGVU5kS3ROVS9qR1d4OWo3cCtt?=
 =?utf-8?B?ZWNPc3BYeE9xNDUzYTZpVmc5THBuRUJkR3BIRitKYnp5VlZpSUUweTh5WXQy?=
 =?utf-8?B?THE5S2w4SURuYmVBcStuc1ZWSmJCbFlhalNKSlc0ZGlFZGM5WkFTTFNVTmNB?=
 =?utf-8?B?MUtBYWhDN0k3VjdGT3RxcGdlTVFzTzl0NkpzeFFqdytnQm5BUGNoS2w2KzdD?=
 =?utf-8?B?L3N0Q2E5TWM0bmFCOTFqUzgzNnFzSW5LbFRMMXB1eFhmVXhHbElVZlY2cktm?=
 =?utf-8?B?Vi83VkdDcmY3L0hPbTN0NmRoQjJxcHFBYkNpR0Q2UUQxTXdhcnBVcTIrZVJ1?=
 =?utf-8?B?UnE4bHhGOE90MzFlSENXWmQxbzhRaU0rNmVLSGZKZCtndm84VDVCLzBWTE5Y?=
 =?utf-8?B?SFNhZ2ZEWlFzUUVGZFoxd3lZSU9yZXBwUmx1S2Ivb0wycGpPRDlMb2NsdURI?=
 =?utf-8?B?T3VkYmM5VVBUVmtsR2VIcE92MEFGcHpERmZFU2ZmWVRaeHhZcXE1cVdlWHU3?=
 =?utf-8?B?ZjM3VTRtUTZOUkFENmNZNHlSTkh1N3VXU2dieEpPbktiYldObllkajVpdUhX?=
 =?utf-8?B?VzlOVHZyaEdMMklqYXdCS0tDZEErQVBJN0wxa1l4TDl2ZW8yWlU0L1FPbUp6?=
 =?utf-8?B?M2RIc05Wa1lsWTlsdFMzT1QrNzE2RVNOZjZXbldpY0FtUThiQ0hwUWZCT2Na?=
 =?utf-8?B?aGlxb0JtN0RYSnRTMHlBWnAyVUYxelJTSjkwU1lFQjJ1aEFJdlhvUFprWWUv?=
 =?utf-8?B?YTFNcmRoV3dDNjI3RE5WSitoV1BQbThrZEMwRGt5M3FtMXd1Yy8rVWR1UTdR?=
 =?utf-8?B?UzR2MGZzaXRlQlk0cXlJTjVxZFIrZTVjN0RPT3hTRjBHRjlHb3pnL1N2QjhW?=
 =?utf-8?B?WElWRXJHOGdKa1hoQjllMmh0UGgwelBPSXp1ZTZ6dmlaMGJvbGhsVTVNREh0?=
 =?utf-8?B?ZmVYMjIwRUtJRkhPRWgxS1FNbXJGeHE0MXF6ZUZncEw2b3pobk1rUGpSbDl6?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECC1265B2D7A27498E4B7D3C54933C80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cdea48-3de3-4f86-86bb-08dbe146f224
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 17:11:42.9051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Dt6wuC8drBKBj0wo/nR+9kut5cPoGNi2KTyLlnCDBl+PB9RnXl9n4ZtEFh8Arpe1Yz4xcHBaZNyWxdcw60I+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 00/43] uAPI Alignment - take 2
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

VGhpcyBzZXJpZXMgaXMgaHV1dWdlZWVlIQ0KVGhpcyB3aWxsIHRha2UgYSB3aGlsZSB0byBnZXQg
YWxsIHBhdGNoZXMgcmV2aWV3ZWQgaW4gS01EIGFuZCBVTUQgc28gbGV0cyBzdGFydCBieSByZWR1
Y2luZyBpdCB3aXRoIHRoZSBwYXRjaGVzIHRoYXQgZG9uJ3QgYnJlYWsgdUFQST8NCg0KSGVyZSB0
aGUgb25lcyB0aGF0IEkgdGhpbmsgdGhhdCBjYW4gYmUgbWVyZ2VkIHdpdGhvdXQgYnJlYWtpbmcg
YW55IHVBUEkgYmVjYXVzZSBhcmUganVzdCBjb21tZW50cyBjaGFuZ2VzLCByZW1vdmFsIG9mIHVB
UElzIG5vdCB1c2VkIGJ5IFVNRHMgb3INCmFkZGl0aW9uIG9mIGEgbmV3IHVBUEkuDQoNCmRybS94
ZS91YXBpOiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgcXVlcnkNCmRybS94ZTogQWRkIHVBUEkgdG8g
cXVlcnkgbWljcm8tY29udHJvbGVyIGZpcm13YXJlIHZlcnNpb24NCmRybS94ZS91YXBpOiBEb2N1
bWVudCBEUk1fWEVfREVWSUNFX1FVRVJZX0hXQ09ORklHDQpkcm0veGU6IEV4dGVuZCB1QVBJIHRv
IHF1ZXJ5IEh1QyBtaWNyby1jb250cm9sZXIgZmlybXdhcmUgdmVyc2lvbg0KZHJtL3hlL3VhcGk6
IE1ha2UgY29uc3RhbnQgY29tbWVudHMgdmlzaWJsZSBpbiBrZXJuZWwgZG9jDQpkcm0veGUvdWFw
aTogS2lsbCBWTV9NQURWSVNFIElPQ1RMDQpkcm0veGUvcG11OiBEcm9wIGludGVycnVwdCBwbXUg
ZXZlbnQNCmRybS94ZS91YXBpOiBGaXggaW5kZW50YXRpb24gaXNzdWVzIHRoYXQgc29tZXRpbWVz
IGNhdXNlcyBidWlsZCB3YXJuaW5nDQpkcm0veGUvdWFwaTogT3JkZXIgc2VjdGlvbnMNCmRybS94
ZS91YXBpOiBNb3JlIHVBUEkgZG9jdW1lbnRhdGlvbiBhZGRpdGlvbnMgYW5kIGNvc21ldGljIHVw
ZGF0ZXMNCmRybS94ZS91YXBpOiBEb2N1bWVudCB0aGUgbWVtb3J5X3JlZ2lvbiBiaXRtYXNrDQpk
cm0veGUvdWFwaTogQWRkIGJsb2NrIGRpYWdyYW0gb2YgYSBkZXZpY2UNCg0KT24gVGh1LCAyMDIz
LTExLTA5IGF0IDE1OjQ0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6DQo+IFRoaXMgaXMg
dGhlIHNlY29uZCB0YWtlIG9mIHVBUEkgdXBkYXRlcyB0aGF0IHdvdWxkIGxlYWQgdG8NCj4gYnJl
YWthZ2UgaW4gdGhlIGNvbXBhdGliaWxpdHksIHdoaWNoIGl0IGlzIG5vdCBhY2NlcHRhYmxlIGFm
dGVyDQo+IHdlIGFyZSBtZXJnZWQgdXBzdHJlYW0uIFNvLCBsZXQncyBicmVhayBpdCBiZWZvcmUg
aXQgaXMgdG9vIGxhdGUsDQo+IGFuZCBzdGFydCB1cHN0cmVhbWluZyBhIGdvb2QsIHJlbGlhYmxl
IGFuZCBjbGVhbiB1YXBpLg0KPiANCj4gdjI6IFJlYmFzZSwgZHJvcCAiUkZDIiwgbW9yZSB1QVBJ
IGZpeGVzIGFuZCBjbGVhbnVwDQo+IA0KPiB2MzoNCj4gLSBSZWJhc2UNCj4gLSBDaGVja3BhdGNo
DQo+IC0gQXBwbHkgZml4dXBzIGFuZCBzcXVhc2ggDQo+IC0gRG8gbm90IHJlbW92ZSBudW1fcGFy
YW1zIA0KPiAtIFNraXAgIltQQVRDSCB2MiAwMS81MF0gZml4dXAhIGRybS94ZTogQ29ycmVsYXRl
IGVuZ2luZSBhbmQgY3B1DQo+ICAgdGltZXN0YW1wcyB3aXRoIGJldHRlciBhY2N1cmFjeSIgYWxy
ZWFkeSBtZXJnZWQgYnkgTHVjYXMgDQo+IC0gU2tpcCAiW1BBVENIIHYyIDQwLzUwXSBkcm0veGUv
dWFwaTogQWRkIGxpbmsgdG8gWGUgZG9jdW1lbnRhdGlvbiINCj4gICBhcyBsb2NhdGlvbiB3aWxs
IGNoYW5nZSANCj4gLSBDaGFuZ2UgIltQQVRDSCB2MiAxMi81MF0gZml4dXAhIGRybS94ZTogQ29y
cmVsYXRlIGVuZ2luZSBhbmQgY3B1DQo+ICAgdGltZXN0YW1wcyB3aXRoIGJldHRlciBhY2N1cmFj
eSIgdG8gbm90IGJlIGEgZml4dXAgDQo+IC0gRml4IGNvbW1pdCBtZXNzYWdlIG9mICJbUEFUQ0gg
djIgMjQvNTBdIHhlL3hlX2JvOiBSZWplY3QgYm8NCj4gICBjcmVhdGlvbiBvZiB1bmFsaWduZWQg
c2l6ZSIgDQo+IC0gSW5jbHVkZSBhbHJlYWR5IHByb3ZpZGVkICJSZXZpZXdlZC1ieSIgDQo+IA0K
PiBBcmF2aW5kIElkZGFtc2V0dHkgKDEpOg0KPiAgIGRybS94ZS9wbXU6IERyb3AgaW50ZXJydXB0
IHBtdSBldmVudA0KPiANCj4gRnJhbmNvaXMgRHVnYXN0ICgxNyk6DQo+ICAgZHJtL3hlL3VhcGk6
IEFkZCBkb2N1bWVudGF0aW9uIGZvciBxdWVyeQ0KPiAgIGRybS94ZS91YXBpOiBEb2N1bWVudCBE
Uk1fWEVfREVWSUNFX1FVRVJZX0hXQ09ORklHDQo+ICAgZHJtL3hlOiBFeHRlbmQgdUFQSSB0byBx
dWVyeSBIdUMgbWljcm8tY29udHJvbGVyIGZpcm13YXJlIHZlcnNpb24NCj4gICBkcm0veGUvdWFw
aTogUmVtb3ZlIHVzZWxlc3MgWEVfUVVFUllfQ09ORklHX05VTV9QQVJBTQ0KPiAgIGRybS94ZS91
YXBpOiBBZGQgbWlzc2luZyBEUk1fIHByZWZpeCBpbiB1QVBJIGNvbnN0YW50cw0KPiAgIGRybS94
ZS91YXBpOiBBZGQgX0ZMQUcgdG8gdUFQSSBjb25zdGFudHMgdXNhYmxlIGZvciBmbGFncw0KPiAg
IGRybS94ZS91YXBpOiBNYWtlIGNvbnN0YW50IGNvbW1lbnRzIHZpc2libGUgaW4ga2VybmVsIGRv
Yw0KPiAgIGRybS94ZS91YXBpOiBDaGFuZ2UgcnN2ZCB0byBwYWQgaW4gc3RydWN0IGRybV94ZV9j
bGFzc19pbnN0YW5jZQ0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUgdW51c2VkIGluYWNjZXNzaWJs
ZSBtZW1vcnkgcmVnaW9uDQo+ICAgZHJtL3hlL3VhcGk6IFJlbW92ZSB1bnVzZWQgUVVFUllfQ09O
RklHX01FTV9SRUdJT05fQ09VTlQNCj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIHVudXNlZCBRVUVS
WV9DT05GSUdfR1RfQ09VTlQNCj4gICBkcm0veGUvdWFwaTogUmVwbGFjZSBCTyB3aXRoIEdFTSBp
biBkb2N1bWVudGF0aW9uDQo+ICAgZHJtL3hlL3VhcGk6IEFsaWduIG9uIGEgY29tbW9uIHdheSB0
byByZXR1cm4gYXJyYXlzIChtZW1vcnkgcmVnaW9ucykNCj4gICBkcm0veGUvdWFwaTogQWxpZ24g
b24gYSBjb21tb24gd2F5IHRvIHJldHVybiBhcnJheXMgKGd0KQ0KPiAgIGRybS94ZS91YXBpOiBB
bGlnbiBvbiBhIGNvbW1vbiB3YXkgdG8gcmV0dXJuIGFycmF5cyAoZW5naW5lcykNCj4gICBkcm0v
eGUvdWFwaTogQWRkIGJsb2NrIGRpYWdyYW0gb2YgYSBkZXZpY2UNCj4gICBkcm0veGUvdWFwaTog
QWRkIGV4YW1wbGVzIG9mIHVzZXIgc3BhY2UgY29kZQ0KPiANCj4gSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSAoMik6DQo+ICAgZHJtL3hlOiBBZGQgdUFQSSB0byBxdWVyeSBtaWNyby1jb250cm9sZXIg
ZmlybXdhcmUgdmVyc2lvbg0KPiAgIGRybS94ZTogTWFrZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VO
R0lORVMgZnV0dXJlIHByb29mDQo+IA0KPiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgKDEpOg0KPiAg
IGRybS94ZS91YXBpOiBSZWplY3QgYm8gY3JlYXRpb24gb2YgdW5hbGlnbmVkIHNpemUNCj4gDQo+
IE1pa2EgS3VvcHBhbGEgKDEpOg0KPiAgIGRybS94ZTogRXh0ZW5kIGRybV94ZV92bV9iaW5kX29w
DQo+IA0KPiBSb2RyaWdvIFZpdmkgKDIxKToNCj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIEdUX1RZ
UEVfUkVNT1RFDQo+ICAgZHJtL3hlL3VhcGk6IEtpbGwgVk1fTUFEVklTRSBJT0NUTA0KPiAgIGRy
bS94ZS91YXBpOiBTZXBhcmF0ZSBib19jcmVhdGUgcGxhY2VtZW50IGZyb20gZmxhZ3MNCj4gICBk
cm0veGUvdWFwaTogUmVuYW1lICpfbWVtX3JlZ2lvbnMgbWFza3MNCj4gICBkcm0veGUvdWFwaTog
UmVuYW1lIHF1ZXJ5J3MgbWVtX3VzYWdlIHRvIG1lbV9yZWdpb25zDQo+ICAgZHJtL3hlL3VhcGk6
IEZpeCBpbmRlbnRhdGlvbiBpc3N1ZXMgdGhhdCBzb21ldGltZXMgY2F1c2VzIGJ1aWxkDQo+ICAg
ICB3YXJuaW5nDQo+ICAgZHJtL3hlL3VhcGk6IE9yZGVyIHNlY3Rpb25zDQo+ICAgZHJtL3hlL3Vh
cGk6IE1vcmUgdUFQSSBkb2N1bWVudGF0aW9uIGFkZGl0aW9ucyBhbmQgY29zbWV0aWMgdXBkYXRl
cw0KPiAgIGRybS94ZS91YXBpOiBTcGxpdCB4ZV9zeW5jIHR5cGVzIGZyb20gZmxhZ3MNCj4gICBk
cm0veGUvdWFwaTogU3RhbmRhcmRpemUgdGhlIEZMQUcgbmFtaW5nIGFuZCBhc3NpZ25tZW50DQo+
ICAgZHJtL3hlL3VhcGk6IERpZmZlcmVudGlhdGUgV0FJVF9PUCBmcm9tIFdBSVRfTUFTSw0KPiAg
IGRybS94ZS91YXBpOiBNb3ZlIHhlX2V4ZWMgYWZ0ZXIgeGVfZXhlY19xdWV1ZQ0KPiAgIGRybS94
ZS91YXBpOiBNb3ZlIG1lbW9yeV9yZWdpb24gbWFza3MgZnJvbSBHVCB0byBlbmdpbmUNCj4gICBk
cm0veGUvdWFwaTogRG9jdW1lbnQgdGhlIG1lbW9yeV9yZWdpb24gYml0bWFzaw0KPiAgIGRybS94
ZS91YXBpOiBCZSBtb3JlIHNwZWNpZmljIGFib3V0IHRoZSB2bV9iaW5kIHByZWZldGNoIHJlZ2lv
bg0KPiAgIGRybS94ZS91YXBpOiBDb252ZXJ0IHRpbGVfbWFzayB0byBhIHB0X3BsYWNlbWVudF9o
aW50DQo+ICAgZHJtL3hlL3VhcGk6IEV4ZWMgcXVldWUgZG9jdW1lbnRhdGlvbiBhbmQgdmFyaWFi
bGUgcmVuYW1pbmcNCj4gICBkcm0veGUvdWFwaTogUmVmYWN0b3IgZW5naW5lIGluZm9ybWF0aW9u
DQo+ICAgZHJtL3hlL3VhcGk6IENyeXN0YWwgUmVmZXJlbmNlIENsb2NrIHVwZGF0ZXMNCj4gICBk
cm0veGUvdWFwaTogQWRkIFRpbGUgSUQgaW5mb3JtYXRpb24gdG8gdGhlIEdUIGluZm8gcXVlcnkN
Cj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIGJvZ3VzIGVuZ2luZSBsaXN0IGZyb20gdGhlIHdhaXRf
dXNlcl9mZW5jZSBJT0NUTA0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAg
ICAgICAgICAgfCAgICAxIC0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9kbWFfYnVm
LmMgICAgfCAgICA4ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyAgICAgICAgICAg
ICAgIHwgICA1MSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggICAgICAg
ICB8ICAgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgICAgICB8
ICAgIDggKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyAgICAgICAgICAgfCAg
ICA4ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jICAgICAgICAgICAgIHwgICAg
NCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyAgICAgICB8ICAgODYg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmggICAgICAgfCAgICA0ICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oIHwgICAgNCArLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgICAgICAgICAgICAgICB8ICAgIDIgKy0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jbG9jay5jICAgICAgICAgfCAgICA0ICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICAgICAgIHwgICAgNCArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyAgICAgICB8ICAgMzIgKy0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9pcnEuYyAgICAgICAgICAgICAgfCAgIDE4IC0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wbXUuYyAgICAgICAgICAgICAgfCAgIDI1ICstDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcG11X3R5cGVzLmggICAgICAgIHwgICAgOCAtDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgIHwgIDIyMCArKy0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcmluZ19vcHMuYyAgICAgICAgIHwgICAgOCArLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3NjaGVkX2pvYi5jICAgICAgICB8ICAgMTAgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9zeW5jLmMgICAgICAgICAgICAgfCAgIDI3ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3luY190eXBlcy5oICAgICAgIHwgICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dHJhY2UuaCAgICAgICAgICAgIHwgICAgOCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMgICAgICAgICAgICAgICB8ICAxMTUgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9k
b2MuaCAgICAgICAgICAgfCAgIDE0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFk
dmlzZS5jICAgICAgIHwgIDI5OSAtLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21h
ZHZpc2UuaCAgICAgICB8ICAgMTUgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNl
cl9mZW5jZS5jICB8ICAgNzQgKy0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAg
ICAgICAgICAgfCAxMzM0ICsrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIDI5IGZpbGVzIGNoYW5n
ZWQsIDEyNTAgaW5zZXJ0aW9ucygrKSwgMTE0NSBkZWxldGlvbnMoLSkNCj4gIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuaA0KPiANCg0K
