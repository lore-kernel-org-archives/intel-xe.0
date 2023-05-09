Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAF5C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EC010E1E3;
	Tue,  9 May 2023 06:16:16 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::717])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907110E1E3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BncKIV0s6TGsaz5PTIQtEkTRe48xMgMV7axPoc1itSoYe7zj32N0FP6IWh3aQCmzMpVXESdjMaUuOjeN8lWk+ePHcvV2kUkqhLBwilwO4+FQzVHEAKE9HbJ1el9/Vvs5gWjVYeEMcJTli6hAhVUzuCh1X7XonfmkZtcI3crlxgB1vLJJSLsKz4Ndr0VGWwTl9PQ2h8QuOH0WedWXQKwoP9iC2VBAQrl2GgbJX6z96963QJLY7UDBGTq8aRrKcedkr0PiGFPmSn1GBIa7h8KbckoyOMhOreGb5Q6zQqsGnjevCudRbMMLbZ8Pv0PnraN3IYrV47l4fGPFfaA5h4RFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOutiMqYQSp4FEsJ/kXPIAnxrpcPl+Dz/LA+1y3PYq4=;
 b=ae943PnKcyxkbmC2tRNLXzAmXbvaz6PM2j2kiJEQhHu8C3WmPBdOtLiYExJ0rRugCy6VlUsEO4e2VBWbEyWtbp/jSOpKvm5181uX11+kWd9JLqfXrxf3eukMB90g8xHFzW8P/ciqh9mtRhwaPwB5qNoy8K3LpwaTQEbJs78nwNg3w3rO8Xup0rj9SqOI6CenPtwsJsDItQNXFbWx6dykAT4dNcfj5n62jxeR7DBM1F4zVvrB0jKhVynDux38bruP/lDBlj05kiimLX/mu9wf6EKKKjBvqSre0T8cm8x+3cc1xDAPCUcsn3U8GQx04LmWD9+0GnA9V51ZaWRHtR3wKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOutiMqYQSp4FEsJ/kXPIAnxrpcPl+Dz/LA+1y3PYq4=;
 b=PThLbML8PD/PWGXwlcxnvqVubQteemYywJ1kMc18AAxR4u4tY6Q2eUkGI41qab8pXHLWdCizEyyI7zTFD7/ESDCgAjpmrLXeb6Y0LEg8JWqrlBa9mG5QuKTotL+jtwXDnh3rx/HrxeY+qOlJWpclFg3uy8sPY10HGY5OzqiPjSCFXXAz/lg6UjUAyuzq1bzbQS6uGGHdEghAExSvh6sWvEqi1ERx+m/++AwKgL/0o6KoDnb3AR6NJZPfnCk7JvGop3pUQvz9g0TlRzP8d6VuNvrT8MfFhKTCobgA0HaR2Qb7FTWPykxC80drSYurYJcPw1WDlgilio4zv6e/SSd/HA==
Received: from DB4PR02MB9311.eurprd02.prod.outlook.com (2603:10a6:10:3fd::9)
 by AS8PR02MB9433.eurprd02.prod.outlook.com (2603:10a6:20b:5a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:16:10 +0000
Received: from DB4PR02MB9311.eurprd02.prod.outlook.com
 ([fe80::bf33:602a:6553:fb72]) by DB4PR02MB9311.eurprd02.prod.outlook.com
 ([fe80::bf33:602a:6553:fb72%7]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 06:16:10 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: Francois Dugast <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [RFC PATCH v3 1/3] drm/xe: Introduce function
 pointers in xe_gt.c with local structure
Thread-Index: AQHZgjGzq/jWX4o53EKdrFNmjWyytK9RdxqA
Date: Tue, 9 May 2023 06:16:10 +0000
Message-ID: <d35f6853-1132-022d-c925-62f753042e12@habana.ai>
References: <20230320081257.1788039-1-francois.dugast@intel.com>
 <20230320081257.1788039-2-francois.dugast@intel.com>
In-Reply-To: <20230320081257.1788039-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB9311:EE_|AS8PR02MB9433:EE_
x-ms-office365-filtering-correlation-id: 3f2ac7fd-3f1a-4d66-5f9f-08db5054e234
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: asA9IoDYphEFJ7dbx6wHumgUeULV1AdmCzIC3KpcSW4sLrQrESwvX/x07ALnGHw9n3C76VmBNQZgyRiLHAdQqBk+SE56PRvN46aDGQ8D0wspGD2BHR7R0gdKNSN3G7GLRuiJIHEltX7Dk4/mu5EJAxk0yQ8m1o45P5/VTWV0+SyHGMILt431+uJ3qYRJ4ToYM/Vm2G7WEcaiEIqDCgNDGF5UXQt8KgHzz+Xhx5K3ZxxWHcwCE/FHoumwApOpwjsZyzXk5ta2BnW5prfOMdqKag2AHBKuWsAAoUtPAXTMjEgcEBWT8qQMSEGiYDtgt+HloPAbeNEg333d5//U5EfykCBOhDknoClQXWcupN3Sp67wbwN13R56Ncj5EoODKYEZD/57ZZDzzkUsOsQeYUAeR0FtJBm7Tt4dnkAMjyHx8Jp0qXcqkZJ5tApbThpSW4kJvd7g3OfBnmYIIUlEl6LyKfORgNFs9Lkn2LkJvwvD7ShiLuYXxf8vru2bogliA3DPX1/9yHVbRMlHd20LTC1D/wqK89uogKpQySdh0o60V/hhp6zKaiH6OlCIA8nLn7ENE3AjcjqRIMgS6ISZnMr5IOMslH+Ey8SFVO2T4jahWI2KDfqsQlhU7kqMN4934a9igTgH9LFvhgTzmxJk6HRQ0NTPVEFr2PD3Gz9CXekV5OF5tq/ozTWuisYwnOgaiBfc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB4PR02MB9311.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(451199021)(38070700005)(316002)(5660300002)(41300700001)(38100700002)(31696002)(82960400001)(26005)(64756008)(86362001)(66946007)(71200400001)(122000001)(53546011)(66446008)(66476007)(66556008)(110136005)(6506007)(6512007)(91956017)(2906002)(76116006)(8936002)(8676002)(31686004)(186003)(6486002)(478600001)(36756003)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1JlS0VHQ3kxQXhab2MzYm5ZY0VNdTl5TFJHWGd0ZVhFZXAwY3BxS2FRc2hH?=
 =?utf-8?B?UmIwTlU4ZkFmYnptLzIwaDFoUWs0ZXJXTWhmRGQ1WGhob1VwVzFzT3lMV1J3?=
 =?utf-8?B?UWN0VEl2d2liVWh6UTdMUkR5RTV5QVRaeVBSbis5SmkzdnBUdFZ0ZndFbXFM?=
 =?utf-8?B?UVY4cHJNUXBjUW9tRHNSa0dFOElMczZuRzh0Zkt4cUVNWVFoK2Fnb2VqVm5x?=
 =?utf-8?B?b0l2UkpKV045M050d2Rrbk5xTVVlZWxsUWJZcTAvMHlacjVsTzgzRUMzR01D?=
 =?utf-8?B?bmZZRlFwcU5Qd09EOUNKRnFISmdvUXpuTzZGaGdSZi9jbHFyZmpqcWx4RGE3?=
 =?utf-8?B?bTFpcnFUdTRRcWVobkliYjNJc1YxOXNxVm5SRWxnMC9ZSlpZTlZTS2hPVUxG?=
 =?utf-8?B?YVFHVnhJckNZZFhmQ1lzQzBGNDZlTnlxOHRmMHFMOEVNRUtsMDVNR2lvWHZE?=
 =?utf-8?B?T1ptbkZKSHRkd0Vlek55SkFTOWhReld0LzdkQVNLcUF3OWx6YTJrZnZUeEsz?=
 =?utf-8?B?cTZEV1lGOGgvUm02YzJLWWpYaldxN1BxUUxRLzVWbldYWERqdFFlYWJHWXZ1?=
 =?utf-8?B?Qk5IaDlKakVFNk1aQWk4TlFCenNBSmIxVm1kamkxY3V6N0x5U1dOUjZpemMz?=
 =?utf-8?B?K0xmeWRyc1BMcW80NkRNWVRvbTNxNXJnODJWRlZLWENrV3lKbVQwK21LVXlz?=
 =?utf-8?B?WDVHaWY5QnZFZXV1THM5MHhLYjJ6dXIyTkZ0eHVNamplaFZzeWFmdkdVQk8x?=
 =?utf-8?B?SEFNMmo0WEJJNkdiNjVNNVdMTzZYanQwNjl6ZllLdGJCVXQ0Z000cjZNZlFG?=
 =?utf-8?B?dXBKdE4vQUFtREpaKzd5ZTJZZG5UaHlPRk9CSzlhSGUzaTZYd21SVmtLMGk1?=
 =?utf-8?B?UDAxT3JmUEhEM0Vud3VOS0xMYXVZNE5JbUxab05RY3g5R1V1aU1wek9CVUtN?=
 =?utf-8?B?MDdzSkZOeXBhVjZ0Kzh6M0JqOTFLRFR5azE1MjBGZU54OVQybzRjNFk3RGxv?=
 =?utf-8?B?THR5d2JpRXRCUnEyUThDNEVWUmV6Y3NDVHFUd3RRODIvaGJkYUJXbWxJWTNj?=
 =?utf-8?B?VzYydkhub2ZFNHM1SyttaFR3dDIxMHZITXBwdC9nNGZsNEZ0Y0U2MWhhVHVU?=
 =?utf-8?B?RDBrUG1mWSt3V1BuQ09wK0RYVy81VDB0d3BadXN5VjBxTU80OUhzNXpQL0ZI?=
 =?utf-8?B?OUpyVWlpU1ZYckFITksvYVdtV0w3UEJYV1RoSlRlWmRlc3BSeXlBaXM0TVJ0?=
 =?utf-8?B?Z0N5WG80SWxTWXlVRDVFRkl1bktrRVlHV1hlQ0U4alNqZ1BDcmhKUlhRNHcy?=
 =?utf-8?B?VWNwQkl4VHJDdkZreTFuV2l0azFaamFOSWdrVnpXV3oxbzJ0QmhCNWtaaENY?=
 =?utf-8?B?VFRhK29xTjNxTkpXTFQ2ODVESi9IRnRXVmlydU90TEVuTkE1TVJrQ0FmbitG?=
 =?utf-8?B?cHJKRExhanJYanhwb3hVUWd4dmFCbHVmSE9QT1VLUXk1alY3NnZkenZyR01M?=
 =?utf-8?B?b2JOUWdtdTU0WVdqa0YwMUt6c3c0NzgxdC9PYWZuRE5JU2tCMFpFWnd1REtK?=
 =?utf-8?B?akRkN2FNZ0ZUdlhKaVdhK1c2Ky95QTZ6K1R1dFU2UGNqRG1MeDQ4b1Z0cFRj?=
 =?utf-8?B?SERpWEoveFpsSHZOVDB6eml2TmJVN1NKNEVRSjdiL2E5QUg0TENlOHcvYTRx?=
 =?utf-8?B?UEo4N1NpOEJEQWtnZ0F4VlFyVlBtYm5XN1NTQW5Eb2g3YW1pRGN2ckZVZUxI?=
 =?utf-8?B?THZjajlwUjVueWhYL2JHOGpnd21wU1VVRWFIU0ZUODBqa2U4QmZwcUIzcnRr?=
 =?utf-8?B?RXhFN0RYNWRtV0FPNW16ZmE3eVByUnY4SmZUQ2JpRytDY2drY3h3U21GUGE0?=
 =?utf-8?B?YVM5OElScStIUGt2TTdtQ3YvNW8rc0VxQ1dwMUQxNGhTZ3hmYlZyS2xDTTZC?=
 =?utf-8?B?czIrcHVkeDhWVk9Za29OVWpNbnp0WXN2eDV5TVhKL0hMbjNxanZ3Z0ZXdVE5?=
 =?utf-8?B?bWYvOHFoMDNxY1M1RHh0dUVsZzhkZGVhUk0xNitmcmczN1hqMmxGYUNZZnFW?=
 =?utf-8?B?bVZFZDlFMzVLSTBXQ3FNL010d1lINkN5ejVZb0oxbWl5V0FrZWpPK2F4Wlht?=
 =?utf-8?Q?zcO0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39C1858C53F0B9469E19FCBD4B4A73BF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB9311.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2ac7fd-3f1a-4d66-5f9f-08db5054e234
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 06:16:10.5326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZY3+f8Dim5jFoWd8kFltkHY5hBQOqwYwSm0cP7eMTbG4CAPbCRZ49ah9mZzzBW3tjzwSKyi5+23nUgo/S+ijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9433
Subject: Re: [Intel-xe] [RFC PATCH v3 1/3] drm/xe: Introduce function
 pointers in xe_gt.c with local structure
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

T24gMjAvMDMvMjAyMyAxMDoxMiwgRnJhbmNvaXMgRHVnYXN0IHdyb3RlOg0KPiBBIGxvY2FsIHN0
cnVjdHVyZSBvZiBmdW5jdGlvbiBwb2ludGVycyBpcyB1c2VkIGFzIGEgbWluaW1hbA0KPiBoYXJk
d2FyZSBhYnN0cmFjdGlvbiBsYXllciB0byBzcGxpdCBiZXR3ZWVuIGNvbW1vbiBhbmQgcGxhdGZv
cm0NCj4gc3BlY2lmaWMgY29kZS4gVGhpcyBzdHJ1Y3R1cmUgaXMgaW5pdGlhbGl6ZWQgb25jZSB3
aXRoIHRoZQ0KPiBmdW5jdGlvbnMgbWF0Y2hpbmcgdGhlIHBsYXRmb3JtLCB0aGVuIGl0IGlzIHVz
ZWQgaW4gdGhlIGNvbW1vbg0KPiBjb2RlIHdpdGggbm8gbmVlZCBmb3Igc3dpdGNoIG9yIGlmL2Vs
c2UgdG8gZGV0ZWN0IHRoZSBwbGF0Zm9ybS4NCj4gRm9yIG5vdyBvbmx5IHRoZSBmdW5jdGlvbiBz
ZXR1cF9wcml2YXRlX3BwYXQoKSBpcyByZWZhY3RvcmVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBG
cmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8ICAxICsNCj4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYyAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGluZGV4IDRjNjU1OTg2
NTJlOC4uN2Q3MmZiM2ZmMDhkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+IEBAIC0zMTMsNiArMzEzLDcgQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ICAgCQl1MzIg
bHZkc19jaGFubmVsX21vZGU7DQo+ICAgCX0gcGFyYW1zOw0KPiAgICNlbmRpZg0KPiArCWNvbnN0
IHN0cnVjdCB4ZV9ndF9wbGF0Zm9ybV9mdW5jcyAqZ3RfZnVuY3M7DQo+ICAgfTsNCj4gICANCj4g
ICAvKioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gaW5kZXggZGFhNDMzZDBmMmY1Li43MThjZDE4YjY0MjEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+IEBAIC00Miw2ICs0MiwyNiBAQA0KPiAgICNpbmNsdWRl
ICJ4ZV93YS5oIg0KPiAgICNpbmNsdWRlICJ4ZV93b3BjbS5oIg0KPiAgIA0KPiArc3RydWN0IHhl
X2d0X3BsYXRmb3JtX2Z1bmNzIHsNCj4gKwl2b2lkICgqc2V0dXBfcHJpdmF0ZV9wcGF0KShzdHJ1
Y3QgeGVfZ3QgKmd0KTsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyB2b2lkIG10bF9zZXR1cF9wcml2
YXRlX3BwYXQoc3RydWN0IHhlX2d0ICpndCk7DQo+ICtzdGF0aWMgdm9pZCBwdmNfc2V0dXBfcHJp
dmF0ZV9wcGF0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiArc3RhdGljIHZvaWQgdGdsX3NldHVwX3By
aXZhdGVfcHBhdChzdHJ1Y3QgeGVfZ3QgKmd0KTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCB4ZV9ndF9wbGF0Zm9ybV9mdW5jcyBtdGxfZnVuY3MgPSB7DQo+ICsJLnNldHVwX3ByaXZhdGVf
cHBhdCA9IG10bF9zZXR1cF9wcml2YXRlX3BwYXQsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHhlX2d0X3BsYXRmb3JtX2Z1bmNzIHB2Y19mdW5jcyA9IHsNCj4gKwkuc2V0dXBf
cHJpdmF0ZV9wcGF0ID0gcHZjX3NldHVwX3ByaXZhdGVfcHBhdCwNCj4gK307DQo+ICsNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZ3RfcGxhdGZvcm1fZnVuY3MgdGdsX2Z1bmNzID0gew0KPiAr
CS5zZXR1cF9wcml2YXRlX3BwYXQgPSB0Z2xfc2V0dXBfcHJpdmF0ZV9wcGF0LA0KPiArfTsNCj4g
Kw0KPiAgIHN0cnVjdCB4ZV9ndCAqeGVfZmluZF9mdWxsX2d0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+
ICAgew0KPiAgIAlzdHJ1Y3QgeGVfZ3QgKnNlYXJjaDsNCj4gQEAgLTE2MSwxMiArMTgxLDggQEAg
c3RhdGljIHZvaWQgc2V0dXBfcHJpdmF0ZV9wcGF0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ICAgew0K
PiAgIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gICANCj4gLQlpZiAo
eGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfTUVURU9STEFLRSkNCj4gLQkJbXRsX3NldHVwX3ByaXZh
dGVfcHBhdChndCk7DQo+IC0JZWxzZSBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKQ0K
PiAtCQlwdmNfc2V0dXBfcHJpdmF0ZV9wcGF0KGd0KTsNCj4gLQllbHNlDQo+IC0JCXRnbF9zZXR1
cF9wcml2YXRlX3BwYXQoZ3QpOw0KPiArCWlmICh4ZS0+Z3RfZnVuY3MtPnNldHVwX3ByaXZhdGVf
cHBhdCkNCj4gKwkJeGUtPmd0X2Z1bmNzLT5zZXR1cF9wcml2YXRlX3BwYXQoZ3QpOw0KPiAgIH0N
Cj4gICANCj4gICBzdGF0aWMgaW50IGd0X3R0bV9tZ3JfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiBAQCAtMzgwLDYgKzM5NiwyNyBAQCBpbnQgeGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyhzdHJ1
Y3QgeGVfZ3QgKmd0KQ0KPiAgIGludCB4ZV9ndF9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9ndCAqZ3Qp
DQo+ICAgew0KPiAgIAlpbnQgZXJyOw0KPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9f
eGUoZ3QpOw0KPiArDQo+ICsJc3dpdGNoICh4ZS0+aW5mby5wbGF0Zm9ybSkgew0KPiArCWNhc2Ug
WEVfTUVURU9STEFLRToNCj4gKwkJeGUtPmd0X2Z1bmNzID0gJm10bF9mdW5jczsNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSBYRV9QVkM6DQo+ICsJCXhlLT5ndF9mdW5jcyA9ICZwdmNfZnVuY3M7DQo+
ICsJCWJyZWFrOw0KPiArCWNhc2UgWEVfUk9DS0VUTEFLRToNCj4gKwljYXNlIFhFX0RHMToNCj4g
KwljYXNlIFhFX0RHMjoNCj4gKwljYXNlIFhFX0FMREVSTEFLRV9TOg0KPiArCWNhc2UgWEVfQUxE
RVJMQUtFX1A6DQo+ICsJY2FzZSBYRV9USUdFUkxBS0U6DQo+ICsJCXhlLT5ndF9mdW5jcyA9ICZ0
Z2xfZnVuY3M7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCURSTV9FUlJPUigiVW5z
dXBwb3J0ZWQgcGxhdGZvcm1cbiIpOw0KPiArCQlicmVhazsNCj4gKwl9DQoNCldvbid0IGluaXRp
YWxpemluZyB0aGUgZnVuY3Rpb24gcG9pbnRlciBoZXJlIHdvdWxkIGRvIGl0IHBlciBudW1iZXIg
b2YgDQp0aWxlcyAoYnV0IG92ZXItd3JpdGluZyB0aGUgc2FtZSBwb2ludGVyKT8NCg0KTWF5YmUg
Y29uc2lkZXIgbW92aW5nIGFsbCBGUCBpbml0IHRvIHRoZSB2ZXJ5IGJlZ2lubmluZyBvZiANCnhl
X2RldmljZV9wcm9iZSAoc29ydCBvZiBzd19pbml0KT8gV2UgbWF5IG5lZWQgc29tZSBmdXR1cmUg
ZnVuY3Rpb25zIGF0IA0KYW4gZWFybHkgc3RhZ2UuDQoNCkluIEFkZGl0aW9uLCBpZiBJIHVuZGVy
c3Rvb2QgY29ycmVjdGx5LCB0aGlzIHN3aXRjaC1jYXNlIHdvdWxkIGJlIA0KcHJlc2VudCBmb3Ig
ZWFjaCBGUCBncm91cC4NCkRvIHlvdSB0aGluayBpdCdzIHBvc3NpYmxlIHRvIGdldCB0aGlzIGlu
Zm8gZGlyZWN0bHkgZnJvbSB0aGUgZGVzY3JpcHRvciANCih0aGUgZHJpdmVyIGRhdGEgaW4gcGNp
X2RldmljZV9pZCk/DQoNCj4gICANCj4gICAJeGVfZm9yY2Vfd2FrZV9pbml0X2d0KGd0LCBndF90
b19mdyhndCkpOw0KPiAgIA0KDQpUaGFua3MsDQoNCk9oYWQNCg0K
