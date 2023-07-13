Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08604C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59B410E6E6;
	Thu, 13 Jul 2023 13:55:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2090.outbound.protection.outlook.com [40.107.105.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10FC10E0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBXPrU/ddJsIAuPIxESB/xc7NIgfSIt2GSAXOM8+te8lIQiS4j3dLNSIqMK4FyhvCWAlazK1WeNChFvjIESMIAKPaWpbuQJylN7aJl6rLtIlEOgO9MwrGSeTMBPBJ2Ifr7y2dOmEGtBuLcjRmEVsns10x3+FkuKXGBjEjxHDNIeuQFk8mX4zVs7em2Iaw8UWBRF/SXcxaxAWZP8VufDubrx80EIPXtMv+l2d6RPyDKWXUKKZkHQUSg29fC2GKXhzdJrf5tCCWAorQsin59GnIln+TprJLUkEtRJJqexG7fMN6g/0WPaRymOU7JRKLBGLkPurCg4PaWtRMCR+GLeLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mc+9z84+aTSXH3A+MgaLBATzuHZ+Ybbopj59Yr5TR4=;
 b=RKWDXttGs44ujJBwekcOE1J26u+Y3rXdt08O4k6/OmUEEv8mMTQCKGdvf04rDDT9MALae1eO51l+QTOrOWJr7tNfcSNtyS86uXvVOakOAqYgKQpF5cGkUVmxkAL3qwlloQOzHw5on6rJQeQL9B3eg0NmbQe1IG0BHizABQP5TkejSBDENFxLxWI/QEnb1Xfo+LNxSrnB9Z/8qAvCupncDJFzwmneumjGDBNOSqBtJ6laboi9btr7+NilRKe9nsGj8wJCgvhSD7JEFwNFHARBhasuZeh9p7CLAhu9dPZyJQJOxvK0nMj+rLmJeqf+fieFw4Ax1IGIuIuQv39m7ugt5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mc+9z84+aTSXH3A+MgaLBATzuHZ+Ybbopj59Yr5TR4=;
 b=ij0yofaLREohs85SocwqCXm4vJlRnJuhoFR6bFPcSGDTkvI2VWz70WZb/iLhkNFKwq4Fm8ZnodZ+YKifgSuBjqslz47PIZqE7QzBZRpXOYqDHxd5fP//BClu0kP/FJqR93dYWdXPf3X7BPvmbw2TjK/p/2HZ1oC7UlpAZs+7lHhYIMLZy1zMm4Wla3nT+W7/Ym7ZqppEaIn7DkGrxyiTMQU5kXeniViVEfYj7mLRysgtLsHenMmAxH60lvQjd79qUmHYOlfoYi+vgE1kipBy2v7ijtpPcK3NY9bDYOh5tQ5uaj3bWBD8WJOFCdWlk4kAJRzUtsEfK/xd2YzlqRKv8w==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DB9PR02MB7001.eurprd02.prod.outlook.com (2603:10a6:10:22c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 13:55:37 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 13:55:37 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Matthew Auld <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
Thread-Index: AQHZqFK78YaZGWK4mECbcQz7inYvba+q+5iAgAAIMoCACTShgIAAJ4UAgANy0AA=
Date: Thu, 13 Jul 2023 13:55:36 +0000
Message-ID: <37798d58-4914-c8cc-6241-4f55611b832d@habana.ai>
References: <20230626172039.88635-2-matthew.auld@intel.com>
 <ab5e9528-08ba-7615-d4a1-e80bf14a06f9@habana.ai>
 <d9952f9a-f1f5-8c63-7de4-43eed5e8f351@intel.com>
 <28eb17a2-a6ab-887b-9499-44628bcaefaf@habana.ai>
 <5eaabf49-5b51-2673-062c-c730552eedd5@intel.com>
In-Reply-To: <5eaabf49-5b51-2673-062c-c730552eedd5@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DB9PR02MB7001:EE_
x-ms-office365-filtering-correlation-id: 9f27c8e6-5f9b-4401-b79a-08db83a8d5ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /sDpS2dVi6GbkO2TUo7+/szTsbns4r5dFmj0cAucTqy7QcEnYk0UgLT19rMV48KZMSHYfcsNWdBojO2y7uztv2xgvryK/st1zu04eXPnLr1FjndzCnqITo+GA7+ktxYeLI1tpdiXZqivwJMDy1zguvXTLbhTDBADbciIK5NdAgndjikRzRipSYh9UVMkwwjtFRogbEeSbZpWKx6n9a32YPXRz3toQesvahc79nIW2i+HLO8+tfsB0LbGRA8J5nbZZ67Fx8VIaiYtU7xj6F9fzOesRyRkVrP4RnM3e7Sen1hQtYSKrdntJgN4awqpoQA29AWPr5/6PqzvGoxmyDn7tyl1UspABLq+GE30ljF+gOXzuE0vboy+90I/emN7hyrg6R/EwyikoPhWi3LevHRpssJubpIquF3Y0SBzA7OOIUSeRfvoFzXs7cSsV8kugiP6YJchw6bWCxJK+zBKY/2UxKOIdAjyi6vTTB3RPZzQWimyJ+6QbZNcJhvVWpbZHRIyanAn2JksGSruq02Xe1NGu9RYK5V9Sh0MZVi/gwplxTbAeQckIPEiyRWtfS92FT7LZWsDLry3ywdM34qPd92GpELdnNaack2PYFC08qIHuEBgQ7c9i600sQP7GpbnyRnE7SYcabQFzRl3KcR0JBe3VqSUIaibRJ87FEf7oyMxtAA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(451199021)(6486002)(966005)(6512007)(45080400002)(71200400001)(83380400001)(186003)(36756003)(2616005)(122000001)(38100700002)(38070700005)(31696002)(86362001)(82960400001)(26005)(53546011)(6506007)(54906003)(66476007)(66446008)(64756008)(76116006)(91956017)(4326008)(15650500001)(110136005)(66946007)(66556008)(41300700001)(5660300002)(31686004)(316002)(8936002)(8676002)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXl3YW1EREtnbFRYbC9Xdm1ia2paTzhZdmFnMm1Pa2prS0MzRm45RVdjRjRi?=
 =?utf-8?B?Y2s4SERPUy9NS0lxeTFJYjMyVjBOMk10bGpER2N1MzQ2R25ib1BYMUdtNDk4?=
 =?utf-8?B?a0QrRzZsUWd1UXFGU0xSSHVaWVBBSTgzelBtTWFzRXF1QXcvS0Q3VVI0eUI4?=
 =?utf-8?B?TittZkV3ZDVIUS80cER4VmlMbWxsVnRpVEhDSG9MNE51bllnbFA2ME1wdHU1?=
 =?utf-8?B?R21XOVZ5WkFPRFpXWWtNZ2M0VU9OQmF5U1haSlBsblVjcHVPQjJkMFNLYTFz?=
 =?utf-8?B?eW9lSmRqNFpDUFl6ZjVmYnJ3cWNPMVZ6QmZxdGw2cUt0YzdJWnczVHlCT0d0?=
 =?utf-8?B?dHFrVDNvb1N6endqTTF3cVdtQVJpS21CMFNvVVNWb3dldkl2ajNOSit0elBX?=
 =?utf-8?B?Rmc1TzZ2UTVCTXNlditlNTVLZ1Exa2lEcTR6eWE1dHZFTGcraVlnKzVrUk5l?=
 =?utf-8?B?cXNTOWVRYTRMY3hyYmVBbkw3TmU3cDNkSUpSRVdkQnRkY2x4NWUxQ1JsRHFT?=
 =?utf-8?B?a2VwT0JHV0srVUlYYlBTTmxveXFzc2l0MGlRWEFUNEdUVy9TbFhJRkhsSHZL?=
 =?utf-8?B?alNZVng3bUFIZXpKWFBkOXE3dG9RamQ0Wm1vMnV0eWg4UU5yOS9ROG9XRHlr?=
 =?utf-8?B?MHZ4TERnTlU5WjUvcE5EakF1RUdzb3pTa2dySnVCT0FDcGo4eDFqb3hyeExO?=
 =?utf-8?B?ZGlOUGdjSnZOTHI1VXBlRzk4dEd0eUlybFVrV0ExcWpKL1RJWW8wZmxWT2hE?=
 =?utf-8?B?SURHQUdtVDNyaUozaTlpeW9sSUg5bTBQUFZseDMrQ0JITDRkNCtIL2NmOFBC?=
 =?utf-8?B?am1NWnB0Z3pDQzlwdy9LY0dwZC9Rc3kxTi92L3NobGpDVlBLS3lKWjYzWmQr?=
 =?utf-8?B?VTZWME5jY1MvRUNnWVRJSWtocGFIRHhiZUdaMitTdXNDakVuR1RnU1pTZjFD?=
 =?utf-8?B?WGNlOWtOOUhXVjB4UG5wYTdrZGhCa1FRc21FY0FrMExsLzhtalNsK3BibVRq?=
 =?utf-8?B?d0FNTjQzb3BTYlNBUmZGMW1MQWwrUTVCbkJyYTRqU09NUEFDNVFvd0dDMEtn?=
 =?utf-8?B?UW5tUDd5YlhYMEl4dGVVaTZxMDlZOFZQZUQ4cXpya0lUYVo1NkJpNWx2WFpu?=
 =?utf-8?B?bHVxek80WGErMmJyWk5aakQ1UTFFUWNoTWNsRDVmc0RRcU1ldXFuM2tNQUZ3?=
 =?utf-8?B?d2RlMjdLT2M2Z2l2VWszVzlDM3BMV0hkNWtKMmRna1JMNCtmMlllTHhiazJI?=
 =?utf-8?B?SHB0Q0tVbFI2YzdJeFlpYjhPWWp3T01EdDlIY3l5KzdtUmozbzkxZHFFaGV0?=
 =?utf-8?B?OVM4R0dXRnJablZTTE90QlVXWkVyMEJ6U2hpWjNLaW9vWGRJUUlYblVRTFFC?=
 =?utf-8?B?eEpzNHJzRkpuZ3dQemJWNml2YkNoUVBRK0dIeDhrZEZEK21pNlpmaHVJUlow?=
 =?utf-8?B?Zmc5cVRqbXcxSUxBb0lhRCsyeWxpUWs1d3NJdW4xUmZpTTg2SnZGeTRHbEQ3?=
 =?utf-8?B?Ly9FRHNTbTVjVEUxb1pqS2tWOVpwUUFMMUc2aXRnRndwaDRpTTZWeU92c0pS?=
 =?utf-8?B?NGpsVlJFQk5wR01sYmZ6QzR5bzFNRHJFYXdmS2t1ZkhqVUI5VWdCRUdMbnVk?=
 =?utf-8?B?R3NwbU1oOWZhS01WcTB2dFBEelhhUXBOVnAyV1hZVmRvQWUzNEFvSzA5YVhT?=
 =?utf-8?B?SU9Nb3g5VEcrcUhFWG50Zzl3dnRLYVlUU1RBcVNzZmRLRzBTQU1xQ1E4Tmhs?=
 =?utf-8?B?bWc3dC9rYTlrTG10akFyQ3B6azNUdG9yUW11S3FjNEtUdDd6MXdEZWEyZitB?=
 =?utf-8?B?RmV1ZTFRR2hSUlJBQnNuUFU4cG1PRkR3VXFjUitEUkZjNkVHbWV2Ykd5L1d3?=
 =?utf-8?B?T2J6YmlaWlpLUDRMYW15dzRkelBnOCt1bGZiV250R3hjUDhxRVJNTGxXMUIw?=
 =?utf-8?B?eEV5WFQzd05PaW9TYUcxR2VwN3Nia3U1MVZGTWJOYXVoNjB4T1dBOGQ5SGxR?=
 =?utf-8?B?aXRxdzVFU0lyZm1QUjBoZGxYbG4rZHg1UGVaVVpOODJ1Yy9oOSs0bW1QRW5S?=
 =?utf-8?B?cWhZQ3ZVK0J1SDFXWUVUdzFIcU0wQWlKcGoxZWNLUkpYeTNhWmhIdXlyQnpM?=
 =?utf-8?Q?sZJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76073C1154D8A648AE096E4E837127DE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27c8e6-5f9b-4401-b79a-08db83a8d5ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 13:55:36.9424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDb4joSAhYTQn6cMuG0N+VxOGM5Lxmb89BrI/xaiDUiGY/9374/8HXRVunBEFhm9Qr/dqVV/U+1kjgB9fcFUSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7001
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMTEvMDcvMjAyMyAxMjoxNSwgTWF0dGhldyBBdWxkIHdyb3RlOg0KPiBPbiAxMS8wNy8yMDIz
IDA3OjU0LCBPZmlyIEJpdHRvbiB3cm90ZToNCj4+IE9uIDA1LzA3LzIwMjMgMTM6MTksIE1hdHRo
ZXcgQXVsZCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDA1LzA3LzIwMjMgMTA6NTAsIE9m
aXIgQml0dG9uIHdyb3RlOg0KPj4+PiBPbiAyNi8wNi8yMDIzIDIwOjIwLCBNYXR0aGV3IEF1bGQg
d3JvdGU6DQo+Pj4+PiBJdCBsb29rcyBsaWtlIHRoZSBzaW5nbGUtdGlsZSBQVkMgaW4gQ0kgZGll
cyBkdXJpbmcgbW9kdWxlIGxvYWQgd2hlbg0KPj4+Pj4gZG9pbmcNCj4+Pj4+IHRoZSBwY29kZSBp
bml0LiBGcm9tIHRoZSBsb2dzIHdlIHRyeSB0byBhY2Nlc3MgdGhlIGFkZHJlc3MNCj4+Pj4+IDAw
MDAwMDAwMDAxMzgxMjQgd2hpY2ggZG9lc24ndCBtYXAgdG8gYW55dGhpbmcsIGhvd2V2ZXIgMHgx
MzgxMjQgYWxzbw0KPj4+Pj4gbG9va3MgdG8gYmUgdGhlIFBDT0RFX01BSUxCT1ggcmVnaXN0ZXIu
IFNvIGxvb2tzIGxpa2UgdGhlIHBlci10aWxlDQo+Pj4+PiBtbWlvIHJlZ2lzdGVyIG1hcHBpbmcg
aXMgTlVMTC4NCj4+Pj4+DQo+Pj4+PiBEdXJpbmcgcHJvYmUgdGhlIHRpbGUgY291bnQgaXMgcG90
ZW50aWFsbHkgdHJpbW1lZCwgc2luY2Ugd2UgZG9uJ3QNCj4+Pj4+IGtub3cNCj4+Pj4+IHRoZSBy
ZWFsIGNvdW50IHVudGlsIHdlIGFjdHVhbGx5IHByb2JlIHRoZSBkZXZpY2UuIFRoaXMgc2VlbXMg
dG8gYmUNCj4+Pj4+IHRoZSBjYXNlIGZvciBzaW5nbGUtdGlsZSBQVkMgb3Igc2ltaWxhciBkZXZp
Y2VzLiAgSG93ZXZlciBpdCBsb29rcw0KPj4+Pj4gbGlrZQ0KPj4+Pj4gdGhlIGd0X2NvdW50IGlz
IG5ldmVyIGFkanVzdGVkIHRvIHJlc3BlY3QgdGhpcyB1cGRhdGVkIHRpbGUgY291bnQuDQo+Pj4+
PiBBcyBhDQo+Pj4+PiByZXN1bHQgd2hlbiBsYXRlciBkb2luZyBzb21lIGZvcl9lYWNoX2d0KCkg
bG9vcCwgbGlrZSB3ZSBkbyBmb3IgdGhlDQo+Pj4+PiBwY29kZSwgd2UgY2FuIGdldCBiYWNrIHNv
bWUgR1QgdGhhdCBtYXBzIHRvIHNvbWUgbm9uLWV4aXN0ZW50IHRpbGUNCj4+Pj4+IHdoaWNoIGhh
c24ndCBiZWVuIHByb3Blcmx5IHNldCB1cCwgbGVhZGluZyB0byBjcmFzaGVzLg0KPj4+Pj4NCj4+
Pj4+IFRyeSB0byBmaXggdGhpcyBieSBhZGp1c3RpbmcgdGhlIGd0X2NvdW50IGFmdGVyIHByb2Jp
bmcgdGhlIHRpbGVzIGZvcg0KPj4+Pj4gcmVhbC4NCj4+Pj4+DQo+Pj4+PiB2MjogRml4IHR5cG8g
c28gaXQgYWN0dWFsbHkgYnVpbGRzDQo+Pj4+Pg0KPj4+Pj4gQ2xvc2VzOg0KPj4+Pj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvMzgzDQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+
Pj4+PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+Pj4+
PiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgfCA2ICsrKysrKw0KPj4+Pj4g
ICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPj4+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbW1pby5jDQo+Pj4+PiBpbmRleCBmMTMzNjgwM2I5MTUuLjgxNTBiZjZmMzU3OCAx
MDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4+Pj4+IEBAIC0zMzQsNiArMzM0LDEy
IEBAIHN0YXRpYyB2b2lkIHhlX21taW9fcHJvYmVfdGlsZXMoc3RydWN0IHhlX2RldmljZQ0KPj4+
Pj4gKnhlKQ0KPj4+Pj4gICAgICAgICBhZGpfdGlsZV9jb3VudCA9IHhlLT5pbmZvLnRpbGVfY291
bnQgPQ0KPj4+Pj4gICAgICAgICAgICAgICAgIFJFR19GSUVMRF9HRVQoVElMRV9DT1VOVCwgbXRj
ZmcpICsgMTsNCj4+Pj4+DQo+Pj4+PiArICAgICAvKg0KPj4+Pj4gKyAgICAgICogRklYTUU6IE5l
ZWRzIHNvbWUgd29yayBmb3Igc3RhbmRhbG9uZSBtZWRpYSwgYnV0IHNob3VsZCBiZQ0KPj4+Pj4g
aW1wb3NzaWJsZQ0KPj4+Pj4gKyAgICAgICogd2l0aCBtdWx0aS10aWxlIGZvciBub3cuDQo+Pj4+
PiArICAgICAgKi8NCj4+Pj4+ICsgICAgIHhlLT5pbmZvLmd0X2NvdW50ID0geGUtPmluZm8udGls
ZV9jb3VudDsNCj4+Pj4+ICsNCj4+Pj4+ICAgICAgICAgZHJtX2luZm8oJnhlLT5kcm0sICJ0aWxl
X2NvdW50OiAlZCwgYWRqX3RpbGVfY291bnQgJWRcbiIsDQo+Pj4+PiAgICAgICAgICAgICAgICAg
IHhlLT5pbmZvLnRpbGVfY291bnQsIGFkal90aWxlX2NvdW50KTsNCj4+Pj4+DQo+Pj4+DQo+Pj4+
ICd4ZS0+aW5mby5ndF9jb3VudCcgaXMgZ2V0dGluZyBpbmNyZW1lbnRlZCBpbiAneGVfaW5mb19p
bml0JyBkdXJpbmcNCj4+Pj4gcHJvYmUsIHNlZW1zIHlvdSBtdXN0IHJlbW92ZSBpdCBmcm9tIHRo
ZXJlLCBvciBlbHNlICdndF9jb3VudCcgd2lsbA0KPj4+PiBldmVudHVhbGx5IGJlIGVxdWFsIHRv
IHgyIG9mIHRoZSBkZXNpcmVkIHZhbHVlLg0KPj4+DQo+Pj4geGVfaW5mb19pbml0KCkgbG9va3Mg
dG8gYmUgY2FsbGVkIGZpcnN0LiBCdXQgdGhpcyBpcyB2ZXJ5IGVhcmx5IGR1cmluZw0KPj4+IHBy
b2JlIGFuZCBtaWdodCBub3QgYWNjdXJhdGVseSByZXByZXNlbnQgdGhlIGFjdHVhbCBIVywgc28g
c29tZSBvZiBpdA0KPj4+IGFwcGVhcnMgdG8gYmUgInBsYWNlaG9sZGVyIiBvbmx5LCBsaWtlIHdp
dGggdGlsZV9jb3VudC4gT25jZSB3ZQ0KPj4+IGV2ZW50dWFsbHkgaW5pdGlhbGlzZSBlbm91Z2gg
b2YgdGhlIE1NSU8gc3R1ZmYsIHdlIGNhbiBhY3R1YWxseSBwcm9iZQ0KPj4+IHRoZSBIVyB0byBm
aWd1cmUgb3V0IHRoZSByZWFsIG51bWJlciBvZiB0aWxlcywgYXMgcGVyDQo+Pj4geGVfbW1pb19w
cm9iZV90aWxlcygpIGhlcmUuIEF0IHRoaXMgc3RhZ2Ugd2UgbWlnaHQgbmVlZCB0byB1cGRhdGUN
Cj4+PiB0aWxlX2NvdW50LCBidXQgd2UgbWlzc2VkIGFsc28gdXBkYXRpbmcgdGhlIGd0X2NvdW50
LCBsZWFkaW5nIHRvDQo+Pj4gZXhwbG9zaW9ucyBpZiB0aGUgcmVhbCB2cyBwbGFjZWhvbGRlciB0
aWxlX2NvdW50IGlzIGV2ZXIgZGlmZmVyZW50Lg0KPj4+DQo+Pg0KPj4gSSBzZWUsIHNvIGRvIHlv
dSBzZWUgYW55IHJlYXNvbiB0byBrZWVwICd4ZS0+aW5mby5ndF9jb3VudCcNCj4+IGluaXRpYWxp
emF0aW9uIGluICd4ZV9pbmZvX2luaXQnPyBhbnl3YXkgeW91IHNldCBpdCBoZXJlIGFuZCBpdCBp
cyBub3QNCj4+IHVzZWQgaW4gYmV0d2Vlbi4NCj4NCj4gQUZBSUNUIHhlX2luZm9faW5pdCgpIHR1
cm5zIHRoZSBzdGF0aWMgZGVzY3JpcHRpb24gKGdyYXBoaWNzX2Rlc2MgKw0KPiBtZWRpYV9kZXNj
KSBvZiB0aGUgcGxhdGZvcm0gaW50byBhbiB4ZV9pbmZvIHN0cnVjdCwgd2hpY2ggZ2V0cyBoYW5k
ZWQgdG8NCj4gdGhlIG5leHQgcGhhc2Ugb2YgZHJpdmVyIGxvYWQsIGFuZCBpbiB0aGUgY2FzZSBv
ZiB0aWxlX2NvdW50IGl0IGlzIGp1c3QNCj4gYSBwbGFjZWhvbGRlciBzaW5jZSB0aGF0IGluZm9y
bWF0aW9uIGlzIG5vdCBzdGF0aWMuIFRoZXJlIGxvb2tzIHRvIGJlDQo+IHZhcmlvdXMgdGhpbmdz
IGxpa2UgbWVkaWFfZGVzYyB3aGljaCBjYW4gYWxzbyBpbmZsdWVuY2UgdGhlIG51bWJlciBvZg0K
PiBHVHMuIEknbSBub3Qgc3VyZSB3aGVyZSB0aGF0IHNob3VsZCBpbnN0ZWFkIGJlIGhhbmRsZWQ/
DQo+DQo+IE9uZSBpZGVhIGlzIHRvIHZlcnkgY2FyZWZ1bGx5IHByb2JlIHRoZSB0aWxlX2NvdW50
IGR1cmluZw0KPiB4ZV9pbmZvX2luaXQoKSwgc29ydCBvZiBob3cgaGFuZGxlX2dtZGlkKCkgZG9l
cyB0aGluZ3MuIEJ1dCBJJ20gbm90DQo+IGNlcnRhaW4gaWYgd2UgYXJlIGV2ZW4gYWxsb3dlZCB0
byBkbyB0aGF0IHRoaXMgZWFybHkuDQo+DQo+IEFkanVzdGluZyBndF9jb3VudCB3aGVuIHdlIGxh
dGVyIGFkanVzdCB0aWxlX2NvdW50IGxvb2tlZCB0byBiZSB0aGUNCj4gbWluaW1hbCBmaXggaGVy
ZSwgYnV0IGhhcHB5IHRvIHRyeSB0byBzb21lIG90aGVyIGlkZWFzLg0KPg0KDQpvaywgSSBzZWUg
bWFueSBvY2N1cnJlbmNlcyB3aGVyZSB4ZS0+aW5mbyBpcyBvdmVyd3JpdHRlbiBoZXJlLCB0aGlz
IHdpbGwNCnJlcXVpcmVzIHNvbWUgbW9yZSB0aG9yb3VnaCB3b3JrLCBtZWFud2hpbGUgSSB0aGlu
ayB3ZSBjYW4gZ28gYWhlYWQgd2l0aA0KdGhpcyBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IE9maXIg
Qml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4NCj4+DQo+Pj4+DQo+Pj4+IC0tDQo+Pj4+IE9maXIN
Cj4+DQoNCg==
