Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14755EB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 09:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECAF10E349;
	Wed,  5 Jul 2023 09:50:31 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2122.outbound.protection.outlook.com [40.107.247.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F210E349
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 09:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9aydWBHv8Nyx3aweQfNMB2EXFIAKsc0oiAkpX2G1dQqnMErolvmZgTVUgr/ORQ/Cbh8Pl8mawyXrl94bLAa4rl57KlXbCX8pNJteNMYZlZpHUCLaviN0qDTMOAy13gaisljFNoecpbeH+E64OtX5Oubyk0oXzgQd8o1uqdrJX9BtJoF01aZXzX84zqV3n+QCXoL1FCPvlxZFVoU+yR7LSqiTDDq3bYMqiuev0sITzN/fRwdeWE0UoKMUt0pRMAtYxM75VfytjysCKuKdDZjLj/8UcVjsNpeDJeWfGYaZW9nVston5dd7vzD5JBh57Ksd/Yp3ScC+co2UmzdjENSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=annfNJ7I0m1gSUzTZRhUifygMbColV9SCDZ0y9o7G9Q=;
 b=SumGcxwCHkiIbiZTK9VJkV2OUlr4ZUXPh4X1w9oQRJklQ+C6vQRWlwgwdfBVJKOgyri+CXtJtxVyTEpjnphI0i3TJ3e5NR0FUcdYslVBvOwvNMmZ5iIhFIb4+jq5Jn1lZt/D4j1dn+WLgQ15xLqGhWVnfAFzzIjQ7WfvhuNaUjgQOPnj2OrQIaDEnM6rvEplhWY3IC4qI34BVZopDWQ9MJREEHSPUk0aQLkmW7EJNntY+/KgiWv7byn+DKG+zdKGFB/HpI7k5i721fnd1PCjF/xomnxCs19OI0itVysK7YsHgnxbWxMromzgVtwmPECSKK5ionIXVZp/A2CqiYoJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=annfNJ7I0m1gSUzTZRhUifygMbColV9SCDZ0y9o7G9Q=;
 b=dddv0q72iXh4SAA0INi9zHzhhYpXxPumuX//vlUaYrcsBEFNnCbvEIrGtdJm+7Y3MH2fyM2eXJRqE+vIMohIW9T7HnSTL4HnHeexbKDuBWWTddP3MydJZiVZicXNAX8AxejIcAghewibw6Ku/qR0HG3yA8HYNL8FwBXggJIx71fNnuldqttsOFb0TiprUlUmZpbrwk4fsvkCnBPoLh19l8qLaO3rlWro8/IrPfZx0vwMIfjiloHFVaUc3ap4GLTB3g4qZDW7X4/FHsXJqYRKbvdsw1w3leBrLlDN6JAxn/0PDD0ilAiQEcNuVhul4P1FU1Ti6AJSzVLpxxlWJ1moeg==
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com (2603:10a6:20b:2c9::22)
 by PA4PR02MB6864.eurprd02.prod.outlook.com (2603:10a6:102:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 09:50:26 +0000
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::acdd:454e:78f7:c8e8]) by AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::acdd:454e:78f7:c8e8%5]) with mapi id 15.20.6565.011; Wed, 5 Jul 2023
 09:50:26 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Matthew Auld <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
Thread-Index: AQHZqFK78YaZGWK4mECbcQz7inYvba+q+5iA
Date: Wed, 5 Jul 2023 09:50:26 +0000
Message-ID: <ab5e9528-08ba-7615-d4a1-e80bf14a06f9@habana.ai>
References: <20230626172039.88635-2-matthew.auld@intel.com>
In-Reply-To: <20230626172039.88635-2-matthew.auld@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB6611:EE_|PA4PR02MB6864:EE_
x-ms-office365-filtering-correlation-id: 88b192a7-e9da-4288-0ed4-08db7d3d423e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VS3dhfmlzcw57zBcbh4q3wi6V3oUfiEEcXWhV0EEM6cU3YUHAjNdLXrROpO2sVHdWIvOxtrF54tKCwwC7ToqmcdCp/Ey+q3ZNBUiYRPJU72eyHDjiZqD7iPl838pJ/P6nCd8nNEqlyuoyadOYysOPNgpsW+JS5Kih0GhoWfP+LrJIhI9Zw1NN8ox8fPftlXNeGyN3sSEKtpGd3fHX9fugA76Iw2r0HkvXJ/amYWlTmhJVBCnJ4ut+kIZHWOwNZy7ILzGdDfqGdtc8x2zPQPCf2pSLeZuaMe24l+RNH+qpcdOfe8Z4WyPU79EpExQaKA0wnjMz+mZrVYm9vjvDBr6lNDcio/UKgNV2XOZ5Jy6L96epDRKnH5o3oIqJCkPgGzQlqs00LWJUahUkD/owTEuKSC34/uZSVgx9KT1qQ5pmxfmRKjxVCvEkUB1nMrotHf3PbeI2LmCJI3G1gUsOY/8r1XZk1gu4PETwJoJbDteeiXHBhVUgOapx3WI4H8tN2thqe1BRlN/OV6egwwM4ABCDc8iwiALrm4WhX/lFeSMJVr6IaRkjwSEYm3UKoXbTDXqEYnowVjzfFuuYNk2GJcDOTiZnGlOm/zbXNCwezzLA3EJeqWuDObsCIfCJ6mj+l30ZI/rGNqLTFusZdKcF1NnwX9VhjSvQ3fYXb5Q7pxqia0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6611.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(451199021)(41300700001)(2906002)(6486002)(82960400001)(71200400001)(2616005)(122000001)(38100700002)(83380400001)(6506007)(6512007)(53546011)(186003)(26005)(966005)(54906003)(86362001)(110136005)(31696002)(478600001)(38070700005)(316002)(36756003)(91956017)(66476007)(66446008)(8936002)(66556008)(66946007)(64756008)(4326008)(31686004)(76116006)(5660300002)(8676002)(15650500001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2tkeWdON2FWekhXTFg5aUdwek1ZV0NMWmtvWGpBdHlCRTIwdXErVk9QUHNL?=
 =?utf-8?B?UFk0UzBhS0dQc0trckVhSkxzRERSUFFnTE9oMzVIejFkK2FTSlplSlFpZ1cr?=
 =?utf-8?B?RFl3VGdITlM2VWpoMEt5YVdwQmIxTEdNeG9JMUpTMXJRQ0w5cVBMSFAwNlRm?=
 =?utf-8?B?UWpOK05KeG1hdEFqaUtDcmhBWUc1OW1ValVka1dzNXdMbjU1NjRRVUc4bU9B?=
 =?utf-8?B?MENUT3FhSHd2cE5ZMm9QZHF2RUtCRkJFTlNFVDUvNnNqQTltYW1Ecy85bDRk?=
 =?utf-8?B?SFBsbDA5WEZDd2ZXdW5VVGE5SFQ2NzgzWlBmbEdQbDdnY3c0emgwKy9NWkJG?=
 =?utf-8?B?Y0JZaWc5UFprdFRDQTAzTkZReVRkV0Y4YUxSZ3BoR3ZMSzZGZE9XeUdNRjdM?=
 =?utf-8?B?dUQ2TWhNVFVvd2dES28zazh6QXdtdnYwQ3hnL0tlTTVLU2VpNVVmZUVLQzhS?=
 =?utf-8?B?QThaN2lTcjdoYlZYNi9aWTlvY25PMmg5QVB5YlJ2SXNpSUdqRHd3OHE2cUlr?=
 =?utf-8?B?WXZsRkRtQW9Ccjh5c29qTWI2dWlsVGNwM1daSU96RHdvTWs0NHF1eFBOZllh?=
 =?utf-8?B?NFZlSUVBSXQ3bUxmSFFMWVdlOS91TE9pNTR4UFNQY21ZbndjKzRoNVZhWGV4?=
 =?utf-8?B?cVI5cnlXSW0rU2g3RG5laGhTWlg2a3M1NXVpWmRMdWk3WktzVFpvZHBvQjl4?=
 =?utf-8?B?N0xzcGR1ZVZqNlJiTEluSi9NQ1FVYkhuRnp1TXBLdzgxdEpTTmhMVFZ1ZE1n?=
 =?utf-8?B?ckptMlh5akJ6YmlzT1dIREFkdWcrV2MxZzFOZDg4YjJMT2loeVpWWmpRa0Rv?=
 =?utf-8?B?V3dqNkFxM29hSGlDVHh4UGtaNHlySWFUdzhsTFgvV3ZSN1VZLzRwa0VLRGVG?=
 =?utf-8?B?c3IveWVXYlZKUkFrc2FwSGtKVDA0a1lNakNGcmFpN0hPdEh1NzM0WngzanA0?=
 =?utf-8?B?ak9uMjQ3eElTRnBoWkoxL2JRZzRkNy9ERnFsNmdSNlNMUDN6MEx1dzJKZGZM?=
 =?utf-8?B?WTZxVHN1V2FaaUdDQXM2RTRRckRkR0x2akZyempRRjVRYzViOXF6WHpOQWMw?=
 =?utf-8?B?YmJnQ1JjTjR6L0VnSU1YSXB4MEc1aXVzY0ttdmRDZFByZDRYUUdyenFCWTAw?=
 =?utf-8?B?cnRZYjJCd25OSmhWU3V5YXFqR01wb3prUUdsWE85cXJseUZibTFYODVNSXJ0?=
 =?utf-8?B?MmJzbTZpdkE3eEkyYVRrQU5yR1Zmc1lxWjBUa3J0T2R2QkpiaGVpR0FEbjVs?=
 =?utf-8?B?WC8wTU40blA3VkFSVENFME5wZXU0RDExL2N1UitzQzZkSFQ0QXdkZDBIQ3Jz?=
 =?utf-8?B?U3NmTFZPeXZVaHF3Rlc3c25xSisrQ25VelF1TlF3c0tlV1JLZVUxZkM4clg0?=
 =?utf-8?B?ajd1aUR4dGJwZ1FDQ1Y2bGZlSktETmxJRXAxVlNDVEJaRGRhbVVuUHFSZWJP?=
 =?utf-8?B?WVlvV0pUdzlxK1JhblpWdVlFWHhnOXhxSk1EblQzOEhTMUFFandLOFJtZGhB?=
 =?utf-8?B?b09kL1VoMkZHQUJGME9tV0plc3RaRzdCMm5tdGlzaTJsVzh2dHp4dlkzMlA1?=
 =?utf-8?B?UDkvNW4vYzdrNjR6YmpheXMwUjB3VFFNMmgrZjNCNmtVRGRDLzlTNVMxbGxr?=
 =?utf-8?B?VFIyNS9lTHowZFEvS1k2alIrKzhtUFM5WTJDWUdDVUFqd0hLOVFlaDJXME9k?=
 =?utf-8?B?NEd2NEJIcHlHSDZJWW9ySjhVMk5iUm0xSjQ1Y1JHT0UxYWpWNFBwL0VmNHRo?=
 =?utf-8?B?Y0o4ekkwdDBNSzFSTmU0RlhQZW5COFMzSGZ4V2ErWU1LalVCQ2cxLzY4bHpv?=
 =?utf-8?B?Q1NDbzR2Z0RJWVBQTEsrNDBFUzhUZTN1cFNQaEFCUlJtdUNzbEk1eUpZS2pX?=
 =?utf-8?B?OUNYNzJVTCtOa1lqWG5kTkdyb2tTOTB4ajlMZzg0NnQyR0lRRlZMWm03OUR4?=
 =?utf-8?B?OFNDNDVnblU5QnQ5NkRSZS94MGZRNFl3VXNES3NLaXF6WTYwYXBTckl0OFVD?=
 =?utf-8?B?bjRMTjMydGxzTGlZYmhKRHJ0cGtYaWtUYldabzlHQUlQTVBxdDhUK3FmZ1Uv?=
 =?utf-8?B?NDBkVVpHa21ieXVlZ003WVN0ODF4NkhZUkhLczViWE9aTndDTXNhKzFwUVFN?=
 =?utf-8?Q?Z1LA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCF53B3C67649A47B080DC79E74F8F5F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6611.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b192a7-e9da-4288-0ed4-08db7d3d423e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 09:50:26.0343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+XOhtJ2u+LCyCU6qR7sJ0ElO1v160MLA5TEJ1WuO13TGAPRLtZZIAGodgg2vJPRNxEtw+2PsjMYsbSFgSYvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6864
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjYvMDYvMjAyMyAyMDoyMCwgTWF0dGhldyBBdWxkIHdyb3RlOg0KPiBJdCBsb29rcyBsaWtl
IHRoZSBzaW5nbGUtdGlsZSBQVkMgaW4gQ0kgZGllcyBkdXJpbmcgbW9kdWxlIGxvYWQgd2hlbiBk
b2luZw0KPiB0aGUgcGNvZGUgaW5pdC4gRnJvbSB0aGUgbG9ncyB3ZSB0cnkgdG8gYWNjZXNzIHRo
ZSBhZGRyZXNzDQo+IDAwMDAwMDAwMDAxMzgxMjQgd2hpY2ggZG9lc24ndCBtYXAgdG8gYW55dGhp
bmcsIGhvd2V2ZXIgMHgxMzgxMjQgYWxzbw0KPiBsb29rcyB0byBiZSB0aGUgUENPREVfTUFJTEJP
WCByZWdpc3Rlci4gU28gbG9va3MgbGlrZSB0aGUgcGVyLXRpbGUNCj4gbW1pbyByZWdpc3RlciBt
YXBwaW5nIGlzIE5VTEwuDQo+IA0KPiBEdXJpbmcgcHJvYmUgdGhlIHRpbGUgY291bnQgaXMgcG90
ZW50aWFsbHkgdHJpbW1lZCwgc2luY2Ugd2UgZG9uJ3Qga25vdw0KPiB0aGUgcmVhbCBjb3VudCB1
bnRpbCB3ZSBhY3R1YWxseSBwcm9iZSB0aGUgZGV2aWNlLiBUaGlzIHNlZW1zIHRvIGJlDQo+IHRo
ZSBjYXNlIGZvciBzaW5nbGUtdGlsZSBQVkMgb3Igc2ltaWxhciBkZXZpY2VzLiAgSG93ZXZlciBp
dCBsb29rcyBsaWtlDQo+IHRoZSBndF9jb3VudCBpcyBuZXZlciBhZGp1c3RlZCB0byByZXNwZWN0
IHRoaXMgdXBkYXRlZCB0aWxlIGNvdW50LiBBcyBhDQo+IHJlc3VsdCB3aGVuIGxhdGVyIGRvaW5n
IHNvbWUgZm9yX2VhY2hfZ3QoKSBsb29wLCBsaWtlIHdlIGRvIGZvciB0aGUNCj4gcGNvZGUsIHdl
IGNhbiBnZXQgYmFjayBzb21lIEdUIHRoYXQgbWFwcyB0byBzb21lIG5vbi1leGlzdGVudCB0aWxl
DQo+IHdoaWNoIGhhc24ndCBiZWVuIHByb3Blcmx5IHNldCB1cCwgbGVhZGluZyB0byBjcmFzaGVz
Lg0KPiANCj4gVHJ5IHRvIGZpeCB0aGlzIGJ5IGFkanVzdGluZyB0aGUgZ3RfY291bnQgYWZ0ZXIg
cHJvYmluZyB0aGUgdGlsZXMgZm9yDQo+IHJlYWwuDQo+IA0KPiB2MjogRml4IHR5cG8gc28gaXQg
YWN0dWFsbHkgYnVpbGRzDQo+IA0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzM4Mw0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgfCA2
ICsrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21taW8uYw0KPiBpbmRleCBmMTMzNjgwM2I5MTUuLjgxNTBiZjZmMzU3OCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbW1pby5jDQo+IEBAIC0zMzQsNiArMzM0LDEyIEBAIHN0YXRpYyB2b2lkIHhlX21t
aW9fcHJvYmVfdGlsZXMoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAgCWFkal90aWxlX2NvdW50
ID0geGUtPmluZm8udGlsZV9jb3VudCA9DQo+ICAgCQlSRUdfRklFTERfR0VUKFRJTEVfQ09VTlQs
IG10Y2ZnKSArIDE7DQo+ICAgDQo+ICsJLyoNCj4gKwkgKiBGSVhNRTogTmVlZHMgc29tZSB3b3Jr
IGZvciBzdGFuZGFsb25lIG1lZGlhLCBidXQgc2hvdWxkIGJlIGltcG9zc2libGUNCj4gKwkgKiB3
aXRoIG11bHRpLXRpbGUgZm9yIG5vdy4NCj4gKwkgKi8NCj4gKwl4ZS0+aW5mby5ndF9jb3VudCA9
IHhlLT5pbmZvLnRpbGVfY291bnQ7DQo+ICsNCj4gICAJZHJtX2luZm8oJnhlLT5kcm0sICJ0aWxl
X2NvdW50OiAlZCwgYWRqX3RpbGVfY291bnQgJWRcbiIsDQo+ICAgCQkgeGUtPmluZm8udGlsZV9j
b3VudCwgYWRqX3RpbGVfY291bnQpOw0KPiAgIA0KDQoneGUtPmluZm8uZ3RfY291bnQnIGlzIGdl
dHRpbmcgaW5jcmVtZW50ZWQgaW4gJ3hlX2luZm9faW5pdCcgZHVyaW5nIA0KcHJvYmUsIHNlZW1z
IHlvdSBtdXN0IHJlbW92ZSBpdCBmcm9tIHRoZXJlLCBvciBlbHNlICdndF9jb3VudCcgd2lsbCAN
CmV2ZW50dWFsbHkgYmUgZXF1YWwgdG8geDIgb2YgdGhlIGRlc2lyZWQgdmFsdWUuDQoNCi0tDQpP
ZmlyDQo=
