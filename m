Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD59EEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 06:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6510E31C;
	Tue, 11 Jul 2023 06:54:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2112.outbound.protection.outlook.com [40.107.22.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DC710E31C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 06:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnf3gpng2Q3xRHMEDar/E68xYzLHtRNzAVwh+1M0OINP5V0yaoR+wc9meFeqn8cBM8EpkPq+JPmdp1ixO/YBw/jEb/JUrltDLyP4kW0itdrA3JjhRq34RMEPaK1GVco8l3pqIdgKG/kM40ZWt/4lE94p++JCFkUmYxDvlYVu58hDzd6tbsY41ztPOAFiWhEaPPEuwrKw124vcbU+WvxpVOj2RjlHmf+E9SN78Psmg0bVLJex83N9/N2Mcddqf5S2NPQJ+dCXLGX59hqgEISansxNbW+mlU9/iDO+ukCB+vT9X+JWOBNkHOm3+LsQSPCryUv6Ubxui6MnNpKaWHDJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA1ddDg9UmY0404UiYCQS3ofNWchy8jcA1/dh/FJMkk=;
 b=QMd/2IjWq/2lCpdTs9YLTY681hkEg7B69rjpxQyOacObaXo/LyNH48quf2xmmzfqcQECih1GGNSurJXI7Rg6pj0PKhgITpmCKAJogf6NawwlL2ospO4UnFriOpYzQJBLPtKA2cDOo3yF2z2Yb++CNpjAQoM23vI2mJWxc2mGl/ZZK9ZjX+wARjbD3ncxnX8EuaRcu9TqFyDVGKJEyO9lHM+ixUd5rcGPASEi8OPvx4rXSyani3snhkkL5FPBLLMxydmQItTfnjM8V2vN5qpX6twXNj/GEMsTs/vzKxuWanGYX3ppL4PiLzmkTWOyh8ZNaWFeQCbBzi6kn5p/BoUzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA1ddDg9UmY0404UiYCQS3ofNWchy8jcA1/dh/FJMkk=;
 b=NJz4AE8GH7kz8+DZuJ6AZm5ZpZGyWx6CQb6S52qDMMvVTyY3WPoL4Qal8iR72gZKFymqgqM7CZS5iOAYcCTkCG8A3d7t2Fh5dD1sOpq5biiYu+DUGXLjTNBaJQVKcvaEoMgZO7+abqfMRMAmh2g0VS8hb2cy6ry0U7ylONgbkcTOnFD9xFIHnXZfthmr1kwafn+vnwKoG3nwNastI1eQMAGDPzI8o31FDBBhwZoX1utTOzeIHLmTv8+84kvSfwWe9QKqIkCEE/HHtd6PW3uin7F2CXaDBY0O/yHJmcmARGgYU7tgrDbwAAZvVSbVSAYI9tiMY+Cw66yEtHAV4e0rOg==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DB9PR02MB10349.eurprd02.prod.outlook.com (2603:10a6:10:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.18; Tue, 11 Jul
 2023 06:54:28 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db%4]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 06:54:28 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Matthew Auld <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
Thread-Index: AQHZqFK78YaZGWK4mECbcQz7inYvba+q+5iAgAAIMoCACTShgA==
Date: Tue, 11 Jul 2023 06:54:28 +0000
Message-ID: <28eb17a2-a6ab-887b-9499-44628bcaefaf@habana.ai>
References: <20230626172039.88635-2-matthew.auld@intel.com>
 <ab5e9528-08ba-7615-d4a1-e80bf14a06f9@habana.ai>
 <d9952f9a-f1f5-8c63-7de4-43eed5e8f351@intel.com>
In-Reply-To: <d9952f9a-f1f5-8c63-7de4-43eed5e8f351@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DB9PR02MB10349:EE_
x-ms-office365-filtering-correlation-id: 09aeff71-3143-4161-0ff4-08db81dbabde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EK7bBsR7rpYGj9+1QgP2u1shJjnu1tFkVCh2lI12uISKR67lLNKrIOEivJx1D4mHOtGYJqEuQhCuG0IJRH0e5qJb+XNkd3Ay1QpLvDx3KCf3nPn1pYrS9qgCY/TvENjR6BqGGwufjAm4BQVYjYvhiVyUaQQqjthMxLxT3fKSlt9PTJPT6dLOOuStXACm9gdcN441EWGlvleGKEupSzLslTV2sHRi2ehtLInw6JHNdFbtoi11LNNfC1n/J5po1mh0gRH3mIjvq1+en/G9C9CDK+erhtP37UyJbFw2oY2fzU158afO17ZNrYNsKDW1KsvEUT/Zc2hjK9UkJWyi/vHzchT95Jff4s93OdV6fE8AImQZsDJul2ezDXtAPRws0R9VdvJge5oCiH2PuoxpfoAMvuSGtqG3RiEUWGE1zHIhCiGXBH6AFg8VcgiHBtEPZilWMu3gWz7tT2az6Zj8nL/U0lL5aBbL6hl2jdKz7Z4/XdeGJrDsaHi2eBgykLnA+/Gx72e2KdSh+InC0J+DwCDjgK2piEAjP1oTHaMxGHSesVItTdGzVt7dfOPDsF9mX6mMrjg31abcJSq0bzdOQcvOHa60gwE3KmfLpGXoPnpuX6Gmu/QAdqVWFfMWZ/OGUyyo5fOe5HHHSXHGPyccT7yUG1EGb9RvdiAHLFBE4c/c2Yw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(6506007)(26005)(53546011)(31686004)(83380400001)(2616005)(110136005)(122000001)(54906003)(38100700002)(66446008)(91956017)(5660300002)(8676002)(38070700005)(8936002)(66476007)(2906002)(186003)(4326008)(66946007)(64756008)(66556008)(76116006)(82960400001)(45080400002)(478600001)(86362001)(31696002)(316002)(71200400001)(6486002)(41300700001)(15650500001)(966005)(6512007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckFqMjdMZjJXdGtoenkyckMvSXJMVGJ5MWZYMGR3VUJVMVJ6UGs1eThMODdq?=
 =?utf-8?B?L0dRK1RZNEhQM3ZaRXJsNUFhVlp5QzY0Z3pFMGVKRWdsRTNqTHBDUmhhQlFj?=
 =?utf-8?B?SXRaSEY1RHNQT1dGUDhlQ2N0YXdPYk90Z0NZY3gzTUJQMWpMSUFHUGo3MnVs?=
 =?utf-8?B?YUIzSnJKSlFlc0JhMWtEQkdseCtBWEVXTDMzZVoxMHlxcXNMZVJmM1ZsSEIw?=
 =?utf-8?B?VmhVREVZYUViMm5NNFhLMnVmd3lKVEs1djlQblZ2YlFEajB4d3FvWDN0TFlQ?=
 =?utf-8?B?Z0RCck1TeGV4RHA4bEpPTHRDam4wM1BDZ2c4MDRDWWJ4dW84VEtDbGczNnEz?=
 =?utf-8?B?NU56TEc3aG96NStsUmcvSW9Pc0NQTVI0cXo4QlRlclVtM1h0MlRBdldJNlhz?=
 =?utf-8?B?ZCtKMzdlUExGUTZLb1hIUi9qSzBFSDFkV1pFcVNUYkdIZmd6NlYrc1BFc0pu?=
 =?utf-8?B?LzU3bHVNeldhSU1YVUkzQzFscWgyQ00wRDlkMnNPWU91MFhkYTNqN3k1M0Rk?=
 =?utf-8?B?MVkrVXBZTkE5RVV4M1huRmEvVXpub0I0ejlVRTRsRzl1a1NnOFpmdUJUQ0J3?=
 =?utf-8?B?dSszTUdmVTFCWnpvbkNPY2pacjVGK2F1UVJiN0YrakE4c1gwM1VGTjJteDli?=
 =?utf-8?B?dml4OSt1ZklyNlZEVEJ4MC8vdHg5SVdRbnZXVmNpM3RJUEtpWXNmd0FGS1hs?=
 =?utf-8?B?QnVBQjJCUnRpMWQwNjYxOFc5SUhxam1KWjRySExJbTFtV0NpOHVyb1l1YWRY?=
 =?utf-8?B?ZGtkbnNYWkhxekNna3QxVDN4V0tXbTRrbDFBOEpzeldTK0JMSUI0SndVRDgz?=
 =?utf-8?B?eVA1T2E3Qm5GeXl6bGZnRU1VK2dkQXVqbnlDbU1yREZTamFaR3NXeS9CZGFE?=
 =?utf-8?B?YXdBVEgrY2FnS0hIQlNFcXFRVk9BOXNBVXBhSkFzbjQwdnIvaGpIR3FNZi9z?=
 =?utf-8?B?VkRoczZIY0szdWo3L0VwWFVoT2QyTWVUUTl0cVdBQWRZdTl0MmVDSGhxWU0z?=
 =?utf-8?B?YUNSVjNyOEJvSnBGamVCSXRDUnBXTXMydjl2aDJmZkhrbDlQR1cwR1h6Zk4x?=
 =?utf-8?B?VUZZcitzcWlML3ZWdE5PZ2FRcTMvRlM3MURxZzZsTkJoelc3TFp6MmlWUzBp?=
 =?utf-8?B?TFpNcXBpSVVBeDdWYk5mdE5tVlVWcFl3U1Fibmt1aGhPaFJLbktUd3c4OUJF?=
 =?utf-8?B?V0VFbU54ZldzUm9RZk5BR0doVlpRRWg2N1VJQW10anJ1eFlFeU1tNkY1MHZj?=
 =?utf-8?B?eGNQNGxDNU95T2JxYmt0ckxmRWxqL1FrY0FqV0Z6S0tNVzdxWHl2MGVLanhI?=
 =?utf-8?B?a2ZtY2lEZDIrc25jeDdPbGtvZ0NKTWdVTjNpR3pVTTB3ZTIvUUxORHJvMUk2?=
 =?utf-8?B?RnBQUnhKckNsZC9hSlc2ZEVxQlBMOE9td28zWmJUT3orMFVqOWwrYUlCNW00?=
 =?utf-8?B?amEzM3I2RHNNaTAwMUc3ZmE0K0g3OEY0ZEhpcThuQlcvK0JnSjlHZ09HcnYz?=
 =?utf-8?B?bjZNem1WMGVScEJSRzZVblNEamNhVTJ1ai9MOGFzQktoYzNLUFJMV3VUcjFN?=
 =?utf-8?B?RWVJWExWRytiOWZLUmFUMjR6OXFnWHBBb0F3MkY4OE9wcXNpbGVWc002a1Ns?=
 =?utf-8?B?aEc4NXpTUFVXRHNhNlNqaWtWbkZlSVFUb2dUNlFTd3hqbmZESVhacDFQVWtr?=
 =?utf-8?B?WUVjR0ZFU0FuSjRnOVMrS3ZrU2FYL3FsUjB1OC9ERFE1UStScmNteGNibUtW?=
 =?utf-8?B?akZ1VDBWNDZWQUNVVE02eFZIbkpVK0hrSlNtRjF1MEViUFJWUzhtampUZ1M1?=
 =?utf-8?B?WVhqTE1TT2JraTRuVWMvbGUvSkcweDhlUnB6c2RrVFp3UEtBbC82cnUwUTEz?=
 =?utf-8?B?aUMvcnJ1cnM4YlRmVEVGdXlRRDZtc0lUSUFmN1k2bjFDaEdXbkk5VkZIcGlL?=
 =?utf-8?B?OU1qNHRjRVI4bjJNRFV1Zys4RDB0ZmJlU2k4T0V5VGpnV2R4SGpwb2ZOK2k5?=
 =?utf-8?B?N2NtRjB0T0RsZHFHd1gzUklBN3hzRGdXOCtOV3FMbWtvc21oVkJOU1FoY1Ez?=
 =?utf-8?B?YnB6ZHdTZy9zQU1KbFROZExKbVZFa05OQjlpWWVsQW8vdFU5UkZBbDJnRDFI?=
 =?utf-8?Q?HQbs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D80F1482F3F0454DB7C5904DF72D1F0A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09aeff71-3143-4161-0ff4-08db81dbabde
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 06:54:28.4221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wx9l8c3YjAS/6PlYkLOLM7v0jqWv3Kn3eSzdrpcAduurAg9ZvRrrfMD2jWLahMFibfoV4Q0Cax75KB8EQ5lRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10349
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

T24gMDUvMDcvMjAyMyAxMzoxOSwgTWF0dGhldyBBdWxkIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MDUvMDcvMjAyMyAxMDo1MCwgT2ZpciBCaXR0b24gd3JvdGU6DQo+PiBPbiAyNi8wNi8yMDIzIDIw
OjIwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+Pj4gSXQgbG9va3MgbGlrZSB0aGUgc2luZ2xlLXRp
bGUgUFZDIGluIENJIGRpZXMgZHVyaW5nIG1vZHVsZSBsb2FkIHdoZW4NCj4+PiBkb2luZw0KPj4+
IHRoZSBwY29kZSBpbml0LiBGcm9tIHRoZSBsb2dzIHdlIHRyeSB0byBhY2Nlc3MgdGhlIGFkZHJl
c3MNCj4+PiAwMDAwMDAwMDAwMTM4MTI0IHdoaWNoIGRvZXNuJ3QgbWFwIHRvIGFueXRoaW5nLCBo
b3dldmVyIDB4MTM4MTI0IGFsc28NCj4+PiBsb29rcyB0byBiZSB0aGUgUENPREVfTUFJTEJPWCBy
ZWdpc3Rlci4gU28gbG9va3MgbGlrZSB0aGUgcGVyLXRpbGUNCj4+PiBtbWlvIHJlZ2lzdGVyIG1h
cHBpbmcgaXMgTlVMTC4NCj4+Pg0KPj4+IER1cmluZyBwcm9iZSB0aGUgdGlsZSBjb3VudCBpcyBw
b3RlbnRpYWxseSB0cmltbWVkLCBzaW5jZSB3ZSBkb24ndCBrbm93DQo+Pj4gdGhlIHJlYWwgY291
bnQgdW50aWwgd2UgYWN0dWFsbHkgcHJvYmUgdGhlIGRldmljZS4gVGhpcyBzZWVtcyB0byBiZQ0K
Pj4+IHRoZSBjYXNlIGZvciBzaW5nbGUtdGlsZSBQVkMgb3Igc2ltaWxhciBkZXZpY2VzLiAgSG93
ZXZlciBpdCBsb29rcyBsaWtlDQo+Pj4gdGhlIGd0X2NvdW50IGlzIG5ldmVyIGFkanVzdGVkIHRv
IHJlc3BlY3QgdGhpcyB1cGRhdGVkIHRpbGUgY291bnQuIEFzIGENCj4+PiByZXN1bHQgd2hlbiBs
YXRlciBkb2luZyBzb21lIGZvcl9lYWNoX2d0KCkgbG9vcCwgbGlrZSB3ZSBkbyBmb3IgdGhlDQo+
Pj4gcGNvZGUsIHdlIGNhbiBnZXQgYmFjayBzb21lIEdUIHRoYXQgbWFwcyB0byBzb21lIG5vbi1l
eGlzdGVudCB0aWxlDQo+Pj4gd2hpY2ggaGFzbid0IGJlZW4gcHJvcGVybHkgc2V0IHVwLCBsZWFk
aW5nIHRvIGNyYXNoZXMuDQo+Pj4NCj4+PiBUcnkgdG8gZml4IHRoaXMgYnkgYWRqdXN0aW5nIHRo
ZSBndF9jb3VudCBhZnRlciBwcm9iaW5nIHRoZSB0aWxlcyBmb3INCj4+PiByZWFsLg0KPj4+DQo+
Pj4gdjI6IEZpeCB0eXBvIHNvIGl0IGFjdHVhbGx5IGJ1aWxkcw0KPj4+DQo+Pj4gQ2xvc2VzOg0K
Pj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVz
LzM4Mw0KPj4+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVs
LmNvbT4NCj4+PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+
DQo+Pj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+Pj4gLS0t
DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyB8IDYgKysrKysrDQo+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5j
DQo+Pj4gaW5kZXggZjEzMzY4MDNiOTE1Li44MTUwYmY2ZjM1NzggMTAwNjQ0DQo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9tbWlvLmMNCj4+PiBAQCAtMzM0LDYgKzMzNCwxMiBAQCBzdGF0aWMgdm9pZCB4ZV9tbWlv
X3Byb2JlX3RpbGVzKHN0cnVjdCB4ZV9kZXZpY2UNCj4+PiAqeGUpDQo+Pj4gICAgICAgIGFkal90
aWxlX2NvdW50ID0geGUtPmluZm8udGlsZV9jb3VudCA9DQo+Pj4gICAgICAgICAgICAgICAgUkVH
X0ZJRUxEX0dFVChUSUxFX0NPVU5ULCBtdGNmZykgKyAxOw0KPj4+DQo+Pj4gKyAgICAgLyoNCj4+
PiArICAgICAgKiBGSVhNRTogTmVlZHMgc29tZSB3b3JrIGZvciBzdGFuZGFsb25lIG1lZGlhLCBi
dXQgc2hvdWxkIGJlDQo+Pj4gaW1wb3NzaWJsZQ0KPj4+ICsgICAgICAqIHdpdGggbXVsdGktdGls
ZSBmb3Igbm93Lg0KPj4+ICsgICAgICAqLw0KPj4+ICsgICAgIHhlLT5pbmZvLmd0X2NvdW50ID0g
eGUtPmluZm8udGlsZV9jb3VudDsNCj4+PiArDQo+Pj4gICAgICAgIGRybV9pbmZvKCZ4ZS0+ZHJt
LCAidGlsZV9jb3VudDogJWQsIGFkal90aWxlX2NvdW50ICVkXG4iLA0KPj4+ICAgICAgICAgICAg
ICAgICB4ZS0+aW5mby50aWxlX2NvdW50LCBhZGpfdGlsZV9jb3VudCk7DQo+Pj4NCj4+DQo+PiAn
eGUtPmluZm8uZ3RfY291bnQnIGlzIGdldHRpbmcgaW5jcmVtZW50ZWQgaW4gJ3hlX2luZm9faW5p
dCcgZHVyaW5nDQo+PiBwcm9iZSwgc2VlbXMgeW91IG11c3QgcmVtb3ZlIGl0IGZyb20gdGhlcmUs
IG9yIGVsc2UgJ2d0X2NvdW50JyB3aWxsDQo+PiBldmVudHVhbGx5IGJlIGVxdWFsIHRvIHgyIG9m
IHRoZSBkZXNpcmVkIHZhbHVlLg0KPg0KPiB4ZV9pbmZvX2luaXQoKSBsb29rcyB0byBiZSBjYWxs
ZWQgZmlyc3QuIEJ1dCB0aGlzIGlzIHZlcnkgZWFybHkgZHVyaW5nDQo+IHByb2JlIGFuZCBtaWdo
dCBub3QgYWNjdXJhdGVseSByZXByZXNlbnQgdGhlIGFjdHVhbCBIVywgc28gc29tZSBvZiBpdA0K
PiBhcHBlYXJzIHRvIGJlICJwbGFjZWhvbGRlciIgb25seSwgbGlrZSB3aXRoIHRpbGVfY291bnQu
IE9uY2Ugd2UNCj4gZXZlbnR1YWxseSBpbml0aWFsaXNlIGVub3VnaCBvZiB0aGUgTU1JTyBzdHVm
Ziwgd2UgY2FuIGFjdHVhbGx5IHByb2JlDQo+IHRoZSBIVyB0byBmaWd1cmUgb3V0IHRoZSByZWFs
IG51bWJlciBvZiB0aWxlcywgYXMgcGVyDQo+IHhlX21taW9fcHJvYmVfdGlsZXMoKSBoZXJlLiBB
dCB0aGlzIHN0YWdlIHdlIG1pZ2h0IG5lZWQgdG8gdXBkYXRlDQo+IHRpbGVfY291bnQsIGJ1dCB3
ZSBtaXNzZWQgYWxzbyB1cGRhdGluZyB0aGUgZ3RfY291bnQsIGxlYWRpbmcgdG8NCj4gZXhwbG9z
aW9ucyBpZiB0aGUgcmVhbCB2cyBwbGFjZWhvbGRlciB0aWxlX2NvdW50IGlzIGV2ZXIgZGlmZmVy
ZW50Lg0KPg0KDQpJIHNlZSwgc28gZG8geW91IHNlZSBhbnkgcmVhc29uIHRvIGtlZXAgJ3hlLT5p
bmZvLmd0X2NvdW50Jw0KaW5pdGlhbGl6YXRpb24gaW4gJ3hlX2luZm9faW5pdCc/IGFueXdheSB5
b3Ugc2V0IGl0IGhlcmUgYW5kIGl0IGlzIG5vdA0KdXNlZCBpbiBiZXR3ZWVuLg0KDQo+Pg0KPj4g
LS0NCj4+IE9maXINCg0K
