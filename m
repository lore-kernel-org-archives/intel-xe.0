Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7ABC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 17:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8210E3D7;
	Mon, 10 Apr 2023 17:29:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A6510E1E0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681147760; x=1712683760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bm5rjeKZm4zpd62NhZ51FYa9yYD5/ZxlrkfB4R6X094=;
 b=a8KWKDTNxDRbQQjnSHOcHPYQS8WCnH3GjRmliA+kyUNNmJi9Q57VF27z
 vSFyzhRnPjiliJzcSGstLGx7wcJUpzu/zFhbfrKZNRApKHnbp5eLkD4Oe
 68veBU29SBiLX8FQnhvhKGpaco5aJ9jPfRHrMUYwc7fSMR0N3Uipm/Epv
 9jczCEdXylb+/4Mw0lhOF25rgvFUB6s+FHLYXd+uS96Ea+tnnH/3Jq8K3
 lWXm4PJJcWmjUoiSw/izLsmRG1Fh1Pn8FtRF2gS8THvRTdKe8aUPBp7/M
 ved9VHreRSBHoH75TJHrrtRxCT/1whdgO7W7pZVYXz8/fKNQ9iaP3Akfc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408546820"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408546820"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752838617"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752838617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 10:29:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:29:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:29:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIEc7h5EeGXu6JnReJ9/gm/tkit9tbwO/qH4zkoIHEqEQjjrWSzjLUIHteMyuSw3F5BEl3mgIS5v6EivhXIWakyS3861eCa3MGHAJKR/c0wyCHqJYsiz6zjpClzknG3bV4oD224KjHcGSEV9PeAnq+zTfeiCgKWj9+pvMS1bvC0dAocwRugJZhFDyBePd8F58tp1CxhfxOh6Qxo2c9rf5GrJPhOoOUT4307w8w4ycbDEkUFO4cAZfjlPELZItK26cLkJAFuUZSs+EU2x4dj3YIJFZ5i6Jnqggg2lpIzVlAnvFa3+PhBoiKfjE+5INi7xulCtRhX+1Babgfqlg0h+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm5rjeKZm4zpd62NhZ51FYa9yYD5/ZxlrkfB4R6X094=;
 b=heqpwZ1RblFEqXtXTrnHue352VscP7cOMNRhP8AIZvUimJ9tIcHjtfYVp9cx+pypvU36i71nBR02lHZkkN8cl3N76Vr5cLdm62H9Vpei8ZlUhFC9Zyf9cx9pY1ILUirijD2oSnknP7zj5452TJzhvCH0G/jnzElyrMZSo91r7CLBjkEVJ9uQMZBHYTxIXS1auovQi11L4MLJPeKC70wBmms1ZIWXq8CLhaRhJJhnqsXlgdpcW0eTch86uB+htqZNOYf2PkZkjY+Gb8vDPMYvWtsxODTz1N7ufFZxBHAic9D/SrzNhAf2VlpNqbSI1wITZDumYork9HafSE6nP9J9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 17:29:16 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 17:29:16 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable modular
 fia in TGL
Thread-Index: AQHZaJSMR6ZsdytSyUGeoT9qcYq7na8ks9sAgAAMuQCAAAdgAIAABuIAgAABYwCAAAKNgA==
Date: Mon, 10 Apr 2023 17:29:16 +0000
Message-ID: <e75c650e6996a7630c4b4301b95613fb02b62750.camel@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com> <ZDQteoVKCktzyNus@intel.com>
 <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
 <ZDQ+VkdmHwcZQL/W@intel.com>
 <e8ab12b22159466ae1fb606ecca2c4e4f02a0e12.camel@intel.com>
 <ZDRFRruHewZK26MW@intel.com>
In-Reply-To: <ZDRFRruHewZK26MW@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6290:EE_
x-ms-office365-filtering-correlation-id: 4ee07542-302e-4914-376a-08db39e91c3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wKCkXDa8u7gM3W1lfnUtq1K+akoN/Piu9ojjinNW7v7+VT5bTBzvkQDeILD5YjhXBA3T2TAj330LkDnFWq35iacTyqXasq4wC7u4FVXp8YgJb+5VBZpSA/SGUjuV+XjQ6JJ3mC8O2Pt53QCkmvkSInlT7U2jgrrrlBa7ONqi9QQb7QV4QKzqc7RG5l0fDQRVEZlV8aWMcyKEg7ppRAkES0pe3Y6abrf8APNWUlvCtAPd/nUa2EPrHEbx3RVrppYKkcxhnecfemm0TXlg3DAA0LagfTfWpnVq9tse4xeMCyc7rxESlfhwHcIOQsw92WwDzhjiQuy93iT/4u9oR6lyRSiKh4Z2TWudll34K6l6KrSdXLtiOxWqCdGRCZiD1zUPkU28EtYh63iaDqdlMBuNh/lmkKyvaUzTAIz6LmGdq+RDO5pjzQEVrns2IZ+FQGu7k65I+f2SMnFm7DGg6hIwdFdyrOXQzs98WgeOEWQFGJFfQ1x1hNEQM8r6kp/cBTWJdFHr19IdGxYm7xVPvfWEI07e7U495mPnuqjRYXQLNrDo1OY2F/vDrrWghWFMnpA2TTmmNZKqw+8nf//W7b9jIzApk84rMMjv+HucjYw5ZewAif+JP2vjJnfHJ2qmA4FZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(86362001)(36756003)(91956017)(37006003)(316002)(76116006)(41300700001)(66556008)(6636002)(478600001)(4326008)(64756008)(6486002)(66446008)(66476007)(8676002)(66946007)(71200400001)(6862004)(82960400001)(5660300002)(2906002)(8936002)(38070700005)(38100700002)(122000001)(186003)(26005)(6512007)(6506007)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVJ5a3owOUN4aFpsMWF1M3AvdUMvMlNhdGhxYlo1Ujh1QnNDeW9aZkkwc0hM?=
 =?utf-8?B?ejhFbmFFUnlpWGg5M3lnVDJlbmNQa0FubFNvelBNWXgrREVtMmNxdUk4WXJV?=
 =?utf-8?B?TVZSUEdYbzEyT1VtcEtObzc2WkxCa1VTZHNIVjNvTzRBb1ZZbXBrbXdQRUlY?=
 =?utf-8?B?bjJrQzc5QUZOK056aUtDUFFINDFhakFyUU1ZVFplKy9jNDV1S3hHM0wzWHNu?=
 =?utf-8?B?TW16VXdLVWdLQWRHdkp4SW5oaDFnT3plekZTb3BKcGc0bFQwK2VYbit4cytl?=
 =?utf-8?B?eEoyeFJCL2FtZkpHOEk2MVFFZTdqQ1RrY3ZZZk9oNEQydkVoU1cxNE1zQXZh?=
 =?utf-8?B?NHg3NjlMeHlpRHNFUTl5NE5oc0o5R3gxd3AxczZMcnBZeGFzMU9tOStGVmVy?=
 =?utf-8?B?Vm1mK296NE1mbkZqYzl0WFRTdVVZMUZVUllsRG12ekRhOHAra1hHUjdFV1pa?=
 =?utf-8?B?bk5BZnlobDNGcnB3N1I1bFNjeThNNnlnSDFNYUVwdU8vOWJtdVRKWWdHRElq?=
 =?utf-8?B?SGlEZFlXSmVsTDZZdDRsZFgyWWtLVlBxMDNsYTI2VmE1TXFCd3MwQTlRd2lp?=
 =?utf-8?B?ZUZQdlpiaE9OWW95TWVid3hJRjhDcmp3Yzc2UFJwd1h2Qm5IdlZzZkszNXVI?=
 =?utf-8?B?eTRwdFN4NEMxL2lrVnBDMWc4ZEpDbXFCK0ZZbGlzZDI4VlJRTlRYdkJjNURY?=
 =?utf-8?B?ME1UMWh2RUI5R0F0WkcvbkFUVW43YllXanE3cmVKcUlaYnJ5Q2NzTkJLd2w4?=
 =?utf-8?B?NzFTMDM5WVI0aisxai9GSnpqL0NnY2N5TXdmMExKSWRZNDllV3ZsL1RLU2c0?=
 =?utf-8?B?Zzk0UEE4SWtCWEpxeXhYdFdFcjdHWnRwRTV2VUNLU3IweThndzAxUWk4UytU?=
 =?utf-8?B?YTJpRDlsVHZ5N3JBTWJBQVVwNFRZdzZLMXZ6SnlkNU5zUnZXRERWTXJGeVph?=
 =?utf-8?B?clVJeDkxbTRFV2x0aCt4R1NKVTNHVlMzelMrSWcvUmxEVU1WYXdva0xIdUx5?=
 =?utf-8?B?T1k2QkN0RnpKSkhEY3FOTWFrWWhuTnlhWkRFMjE5Qmw2OFRFWmtXTjlhaURm?=
 =?utf-8?B?ejNSdzJyKzV0QTRTdnFmWk9GRFV3bzk5azVPWW1Gc044T2JjZWppYS82V3JU?=
 =?utf-8?B?QmVZYktPb1hNM3dKZFdDaFo3Q3hxOFg3TmRvTEhWZDk3STk1VCtkVi8yZU1s?=
 =?utf-8?B?QXJpd0YrMFgwZktueW1hVklvOUxXenk3YU9jWjZ5eFNZMlZ2VkdGNk5Yam9Z?=
 =?utf-8?B?anlDeXNLOFU0aXZFalllMERid21yL3JpT2lMZjh5eTRUeSsxdG5tTE9oVWV2?=
 =?utf-8?B?QzhvYXBWMXQrS0EwMzg5NGVZN1RacHR3NklLWEtZU2ZzRDFycmlKRGhiYzBl?=
 =?utf-8?B?STJLRDIvWldPdnhGN000WFVPajNNZVpVMnVCdlpldVU4ak5scDBSWURscEt1?=
 =?utf-8?B?ay85bGw3bC9qalVhb0Z4V2RoQS81a05TMmc2cWQ2YnhwVU83amxEdjhwZmt1?=
 =?utf-8?B?aVIyZzlFeFN6UHJoc2dnLzhTcUFyaFpXMTZzMGJxaWllTjVsRC8wM1pEUWRP?=
 =?utf-8?B?QXhYSm1PVkNSY0xIVEtvZjlVemNnQytiQnlnNy9uVGN1enJicDN3RDUySjRV?=
 =?utf-8?B?YWZQQWxuNTNPK05SaTNrRWFEZnBMdks5QVdrRVdBR0dyL0RIQkd2SC96ZXZl?=
 =?utf-8?B?K2ZoK3MrWkVRZ3l5eWIwWk4wMDF6dGEzREt4TzMxVFRZVkNNQ0VOSUZubTFw?=
 =?utf-8?B?R3dVbzg0SXpvSzBtb2E0b2w1TnBUUXlGMG1rZlI5THhhd2NhNGNEcGo0WDNU?=
 =?utf-8?B?dGZBVncvSFZFeXRnaUMrNzh4Vk1JbjZwNWhSVGFXNUVxYUdxT2huMmxYL0dr?=
 =?utf-8?B?WUthQnpaVCtJeUlhdXpxSmQ4VjMzdk5mODU4NVZoakhPOW1SQUVpK1FPNUNk?=
 =?utf-8?B?d3NXdFhnWThrRm05aThkaGNGSStTVk4zQ0JiYmYrQWtqNkRWVFhCb29TSzF2?=
 =?utf-8?B?LzNEdmR6YlZNUnRyeXNUN0J2ZHNBZ0dUUG9ESG0rSVVIdVFpdE9SYjFFOXox?=
 =?utf-8?B?bCsvbUpvRVJRbEJCWVBUV3BnMUlPZGx5OUVKSEpCT3Y3ZHp5ZkJEWDl3WGtZ?=
 =?utf-8?Q?kIZoATJB5KrytaC8OwYui9ZKX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5731CBA5143D484BA1DA1FAF1B665FC0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee07542-302e-4914-376a-08db39e91c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 17:29:16.6842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyypzEaZzDPymu1FIgOcnuv5LS7Eo/1FGDjd0XyatxhOuEZXgIxs+sWAT67Jm1QZOvDYjeY72ckH00DfFYlTzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDEzOjIwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgQXByIDEwLCAyMDIzIGF0IDA1OjE1OjExUE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0wNC0xMCBhdCAxMjo1MCAtMDQwMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOg0KPiA+ID4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMDQ6MjQ6MDlQTSArMDAwMCwg
U291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgMjAyMy0wNC0xMCBhdCAxMTozOCAt
MDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFRodSwgQXByIDA2LCAyMDIz
IGF0IDA3OjMxOjMxQU0gLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4g
PiA+ID4gPiBUR0wgaXMgdGhlIGZpcnN0IHBsYXRmb3JtIHRoYSBoYXMgaXQuDQo+ID4gPiA+ID4g
PiBFbmFibGluZyBpdCBmb3IgREcxIGRvbid0IGNhdXNlIGFueSBpc3N1ZXMgYXMgREcxIGRvbid0
IGhhdmUgYW55IHJlYWwNCj4gPiA+ID4gPiA+IFRDIHBvcnRzLCBzbyBpbnRlbF90Y19wb3J0X2lu
aXQoKSB3aWxsIG5vdCBiZSBjYWxsZWQgZm9yIERHMS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBz
bywgd2h5IGRvIHdlIG5lZWQgdG8gZW5hYmxlIHRoZW4/DQo+ID4gPiA+IA0KPiA+ID4gPiBUR0wg
aGFkIGl0IGRpc2FibGVkLg0KPiA+ID4gDQo+ID4gPiBzbyBpdCBsb29rcyBsaWtlIHdlIG5lZWQg
dG8gcmVmYWN0b3IgdGhpcyBpbmZvIHN0dWZmLi4uDQo+ID4gPiBiZWNhdXNlIGxvb2tpbmcgdG8g
dGhlIGRlc2MgaXQgd2FzIHRoZXJlIG9uIFRHTDoNCj4gPiA+IA0KPiA+ID4gLmRpc3BsYXkuaGFz
X21vZHVsYXJfZmlhID0gMSwNCj4gPiANCj4gPiBXaGVyZT8NCj4gPiBJIG9ubHkgc2VlIGl0IHNl
dCBmb3IgYWRsLVAgaW4geGVfZGlzcGxheS5jIGFuZCBvbiBpOTE1X3BjaS5jIGZvciB0Z2wsIGFk
bC1wIGFuZCBtdGwuDQo+IA0KPiBkb2ghIEkgbG9va2VkIHRvIHRoZSB3cm9uZyBwbGFjZS4NCj4g
V2hhdCBjb25mdXNlZCBtZSBpcyB0aGF0IHRoaXMgaGFzX21vZHVsYXJfZmlhIGRvZXNuJ3QgZXhp
c3QgYW55bW9yZSBvbiBpOTE1Lg0KPiBTbyB3ZSBwcm9iYWJseSBuZWVkIHNvbWV0aGluZyBkaWZm
ZXJlbnQgaGVyZS4uLiBvciBiYWNrcG9ydCBzb21ldGhpbmcgdGhhdCBpcw0KPiBhbHJlYWR5IGlu
IGRybS1pbnRlbCBhbmQgdGhlbiBhIGZpeHVwISBvbiB0b3AuLi4gb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4uLg0KDQpIdXVtLCBkaWQgbm90IHNhdyB0aGF0IHRoaXMgd2FzIGdvbmUgaW4gZHJtLXRp
cC4NCkl0IHdvdWxkIG5lZWQgc2V2ZXJhbCBiYWNrcG9ydHMgdG8gZHJvcCBoYXNfbW9kdWxhcl9m
aWEgaW4gWGUsIFRDIGhhZCBhIGh1Z2UgcmVmYWN0b3IuDQoNCkNhbiB3ZSBoYXZlIHRoaXMgY2hh
bmdlIG1hcmtlZCBhcyB0ZW1wb3JhcnkgcGF0Y2ggdW50aWwgbmV4dCBYZSByZWJhc2U/DQoNCg0K
PiANCj4gPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gPiBUaGlzIGlzIG5lZWRlZCB0byBwcm9wZXJs
eSBpbml0aWFsaXplIFRDIGluIHNvbWUgc2t1cy4NCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyBhIGtl
eSBpbmZvIHRoYXQgd2FzIG1pc3NpbmcgaW4gdGhlIGNvbW1pdCBtc2csIHBsZWFzZSBpbmNsdWRl
IGl0DQo+ID4gPiBpbiBhIG5leHQgcmV2aXNpb24uIEFsdGhvdWdoIEknbSBub3cgY29uZnVzZWQg
d2l0aCB0aGUgaW5mbyBzZXQgaW4gdGhlDQo+ID4gPiBkZXNjcml0aW9uIGFuZCBoZXJlLi4uDQo+
ID4gDQo+ID4gV2lsbCBkby4NCj4gPiANCj4gPiA+IA0KPiA+ID4gV2h5IGlzIHRoYXQgZGVzYyBv
bmUgbm90IHdvcmtpbmc/DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYyB8IDUgKysrKy0NCj4gPiA+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGlzcGxheS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiA+ID4gaW5kZXggNWZhYjVi
OWZiZGUwYy4uMDAwMWE5ZDAyNDk1ZCAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kaXNwbGF5LmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kaXNwbGF5LmMNCj4gPiA+ID4gPiA+IEBAIC00ODYsNyArNDg2LDEwIEBAIHZvaWQg
eGVfZGlzcGxheV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiA+ID4gPiAg
CXN3aXRjaCAoeGUtPmluZm8ucGxhdGZvcm0pIHsNCj4gPiA+ID4gPiA+ICAJY2FzZSBYRV9USUdF
UkxBS0U6DQo+ID4gPiA+ID4gPiAgCWNhc2UgWEVfREcxOg0KPiA+ID4gPiA+ID4gLQkJeGUtPmlu
Zm8uZGlzcGxheSA9IChzdHJ1Y3QgeGVfZGV2aWNlX2Rpc3BsYXlfaW5mbykgeyBHRU4xMl9ESVNQ
TEFZIH07DQo+ID4gPiA+ID4gPiArCQl4ZS0+aW5mby5kaXNwbGF5ID0gKHN0cnVjdCB4ZV9kZXZp
Y2VfZGlzcGxheV9pbmZvKSB7DQo+ID4gPiA+ID4gPiArCQkJR0VOMTJfRElTUExBWSwNCj4gPiA+
ID4gPiA+ICsJCQkuaGFzX21vZHVsYXJfZmlhID0gMSwNCj4gPiA+ID4gPiA+ICsJCX07DQo+ID4g
PiA+ID4gPiAgCQlicmVhazsNCj4gPiA+ID4gPiA+ICAJY2FzZSBYRV9BTERFUkxBS0VfUzoNCj4g
PiA+ID4gPiA+ICAJCXhlLT5pbmZvLmRpc3BsYXkgPSAoc3RydWN0IHhlX2RldmljZV9kaXNwbGF5
X2luZm8pIHsNCj4gPiA+ID4gPiA+IC0tIA0KPiA+ID4gPiA+ID4gMi40MC4wDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gDQo+ID4gDQoNCg==
