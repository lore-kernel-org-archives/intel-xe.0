Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB0C4707B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 15:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D081310E311;
	Mon, 15 Jan 2024 15:24:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D821F10E310
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jan 2024 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705332291; x=1736868291;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3V+NV5i6vKNxb85eG945dOw1yEYXZXVuDiKVIPj1ScI=;
 b=Q1swz61FJJ8KS+Y6PXswgIICzw/8zmznnwYPp/iT5vKIyni0JrHUohdH
 S2eOYSKqfKKm0+9DrCCanL5Q9rfz83sb3aSh2AwCEiaPnG+BjGxDWE5lN
 269buY1XfqIxi5fpLT+1ANTOlR0Q71sa7IUYC6YFaEuoa0s+J65N/HZAA
 MHkl+Xui3POB6TorQzIv4fMZQMJLVnBLQdQyhuA7aMcXpMNsyGk1dTDmU
 qeGxKsHp1guIxitA4d0MBlqlbUMFMLrDRLHMGRcfjlnJn0zgcyMbEIHkB
 7HRgUEi7mBcuI0p1lNcZ3qCaPzryGhUYikxoUISjICuqdSib6pQC7T3d3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="466017775"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="466017775"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 07:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="32159355"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 07:24:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 07:24:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 07:24:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 07:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvlNcCWX0vV4rPZppkOsojf2vteoaxTP6pymsh9NPXZapayQQJ1Sx2XDN8LW/6WJzH0dKmh8vi+8VLkPoA5iLJGJHT74wO6JtRNeC6rn7TJkzPWaV5Ks4H5mArVLmqah5qrD5owoHrBxBlC2kzmgLqrQA6XHIXZedSoti0p+AMU84nYyE3UIn5jwWnB5GRSSnLUN3WhveLf/L8MYCZNxPqrWjl6MlBsjkcLkSsxYmsAVY3TZf6O7DBCY8LbOQWpC5LYAnGnzO5omzYv/H/6Ajqy63gXmGmJhRvE7I1Nv0J6nbaPdahbeENwg5h/S9rqr8uIxCeRDZsYYfkfgeTp3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V+NV5i6vKNxb85eG945dOw1yEYXZXVuDiKVIPj1ScI=;
 b=BlUf/kkF2iPcSLW4Bkt3gupP+i+xbVQrAhwSbA3qOQwqXFNon+JF/UH0LjcZwv5kGE9nb8jynrNfheGn+7YPQDwrsCjuStMUOF7BnDMjgUEwGDF0S0nboFf80iDqqyhbj2GyT5FVIUND/tlCwFeplKoz80V9j7/dFW00/rzdLcx7DVP9cPhIbSETXbklHad8t1oW0JqEaRWZXIkFnfeCeUu8q8lbLPVGIUElR5OsrlqfABXhc82LKB35h/QF5Gfy1XkwyR3nVAxwgaxAHZX4bx8TIZaCBuHt0kGmtq7KLyfkPdrdqqntHk/kZFkictPWWvNp8LitzPObBkl8+w4rXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 15:24:42 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7159.026; Mon, 15 Jan 2024
 15:24:42 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Topic: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Index: AQHaP5hJrVGQCOiAeUW8vomZiDKUJrDbDXLQ
Date: Mon, 15 Jan 2024 15:24:42 +0000
Message-ID: <SA1PR11MB6991D458534CE8945A094EFD926C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB5114:EE_
x-ms-office365-filtering-correlation-id: 5258f874-17f9-46d0-8ba2-08dc15de18aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jVj0DRKWtDG/lzzl6wbShIMKlMxonYI5ac7WmR+1q+YrrDXrgX75gXFm/MZoJ6NN8bFPQVvmVFsTBJGmnidQIqIkXx/3rvYRxYQ1diMAoHpTYWvKrLAXiDaiGbA+VYZuhtCRRVZailMPEYawQfHNFMw3fxfDHnCMGCrVO1JUvIjlKywpcOcH+RXGWEW35OyLpKg8CU4zbBzCpoArE4dMfa9YK708qOOstprceKyKZ4Uxvbg99tHt7LEpU5/6T/Dsn/TEf8lmEQ0aLBcHe/on+NTY8UHqgcfM6GzfqKzBgH2W6gEJeOsIQRtxCS0p0uNZoE5RjR85qhwjS5Xb5oxzq8+eLq4Tuf5FE43b2jM6IsukhJI4jZB/FIpJmbLl7LIvnmOAbKR5Pa1qEbIOYVnDlaUSdv2BaJYCf53vj2ZPK5wSs6n63i2ny/0gVQHCtGYyLtRisSE+hGc1VqDBint4TlXlY2Y0Gb34iZxAsY28EcjZyprNnQ6FxPb36YA91dWNrBaXATVEvZ9MTW1ZUfjoqSioocaLzj+NJAp41nICvZl7QSQnZ+Vff1fsJ3R72GHWDmXy8T9mGs8jQD8Hs+cf9FepF0AWzYd5W/2hrIl/f8JGgoXKYMxgRFS1AU/Fp56L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(921011)(86362001)(82960400001)(26005)(55016003)(38070700009)(66574015)(83380400001)(122000001)(38100700002)(33656002)(71200400001)(9686003)(6506007)(7696005)(76116006)(66946007)(66556008)(66446008)(66476007)(110136005)(53546011)(64756008)(316002)(6636002)(2906002)(5660300002)(8676002)(8936002)(478600001)(52536014)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1c3Z0lKb2ZLTURCNzhGTmlrc2tlUUxnQTRhNkx6OFdFT0prdHRpQ0xSamlv?=
 =?utf-8?B?VVFFL0pEUVB0VnAyM3FJK043clNuOEFieS9GYW5pY05tc3FVT0Rvcis4YVl0?=
 =?utf-8?B?TUZoWjdadVFkdG1MTlBIRzZOOWVxM3kxTk1nSXRWRXJuWFRQYzNtWU56eDFY?=
 =?utf-8?B?L1RCL09melpCMjN2eSttOE16MVlva0VyQVIwY3RDbnJURzlURy9oZHk3cVhS?=
 =?utf-8?B?Q0VIMy9mdHdvRURJVHExSXF6RXRleTRoVm5VcFpqUFJSZDFuam1PYk9qVGFj?=
 =?utf-8?B?aHcwanp3OFNXUEdweDBBMjBKSmZvcXAxNlFjODE1TEVQelVYSVEvQjB0S0M3?=
 =?utf-8?B?WHczUUZZRHVuNkRNdlBMQWFQdHd2dUxFZWVyT0hMVDJwNDdrS21FSk82WTJx?=
 =?utf-8?B?aUdlMitzbWFvdWJ1QzBRVzBSRlE0aWFqRGRvbmlnOEdSMkRGL1NSMi9Td2NW?=
 =?utf-8?B?VmhoRXgvN0dPMU02dGx3eWZPeXd3eDcrc1dVQWI4K0JWR3YrbEhxY2FTdXJZ?=
 =?utf-8?B?LzdUaW0xUDM1UXJXRGJGckRyVGYzNkhtYjdEMHNnbWJFNGMraWxOeEdycGNI?=
 =?utf-8?B?MDNjOFk0cUNWdi9kU1BhcjZ2RVhXWTRuYzlucnpoaHpxYnhzUTh2L2c3ZVpp?=
 =?utf-8?B?WE1mM0ZkVzFpWlZrNksyS2huZnMyVGdxUU9KbUhxSFBNZjRnelJTNE9EM2NH?=
 =?utf-8?B?TkRTMXMyR0xiT2pYa1BIM2gvMzRiL3lnajNodEQyZzV1OUR1MkJsLzZxSCt2?=
 =?utf-8?B?eVF3aVF0bExJVFFnRG92d1NhNXQzWXpvVXhsb3RHWHBSY01JSFpxYWF6aUsr?=
 =?utf-8?B?SGwwdjRjbTVDK3pkKzI1ODZlRGF2aFUxdlhaak1uSTluQm5EZFQ1K2xrV29I?=
 =?utf-8?B?YTNndDUrSTdzWFBQc0dqSmtlM2k2USt6cnFRcHRqM2VuMDFqUWNUZUtkSzNK?=
 =?utf-8?B?NnNSY09SNFdJMkVxbkI5U0poT0Fac3g3d3dGZmZDelk3YkpWZ0FMbEkzWTZY?=
 =?utf-8?B?N09POWI2UDZ0NUdBcStVMEdYOFVaNHYvdEhySWRFNC9oaDlrNmJQQzFBNmtB?=
 =?utf-8?B?MlpKa2NwQVZFQi9Qd3RwOVJpcmlEbFVVUjFrRUZrZ3puZ2EzckJOdzB3bnJW?=
 =?utf-8?B?QXNKNHd6c01jamxrT3ZlQ1BVQjFWZDUzWHJQVzMxSnhlZGw0ekd2cmo2aXc4?=
 =?utf-8?B?SWMyODFRL3RmemJObjMxVm5UUTc5aUxURWZBZnd3MjBOYnJYci9ReGd2Mndr?=
 =?utf-8?B?RXlKZE56azdoQllzTHM1SkVzWVQ1dXMwUlFGZ0pIZWxNQmJHUERRYnZHYjZL?=
 =?utf-8?B?YVlUZm9qSXY0U0gvSkk4RmJvb2JEaXRyTmM2SHczUDBrbVRyVmZ5M1Q4dFBu?=
 =?utf-8?B?WG03STIzQWkyRStmc0VsZGt0VkhqRWdzK3RRMDlyZGUxR1FKa2lpQ2d2YllG?=
 =?utf-8?B?VW5UenBlRlJmVGtPVXpHTFpMV2JrREV2Y3IrZjFiMm1iclIzM3hGajgrUVlv?=
 =?utf-8?B?VkpFVmRUL1M4STFyanJ4aTltd3VpQ2ZCTTFxMStaOVM5MER4aEJyYlhRdUxk?=
 =?utf-8?B?d2NnY3BBV1h3TGtSaytKd0w0b3lkRWtsbUx0Z2huR29rVHpVajY3b3dBM1cx?=
 =?utf-8?B?aThMM3pNTFp3UnI2NHY5Q2xoMHRqd2pWcFJRb2ZoRWVpY1crRGMweGtUOVRt?=
 =?utf-8?B?ckR5WUV0N3pockNvOHpLL2puMk1JKzBseU1hazQwYkVUZm85QW9VWFNNelc0?=
 =?utf-8?B?Z1RtU3dZb3FMSlBqYmVuUHJkZStCYURRN2JrMFBJdVdLbmo1VUZ1N3NZK1pV?=
 =?utf-8?B?Tks5SDU5b091N1RET3dkY3JEejQ5c0M5RWYyWndJeS9iMGl5WWdZY29ZMkV0?=
 =?utf-8?B?Qk1YYzRpOXB1bU9pRld6SzBPRE9XejhqN0NDUTZibWxKenc2c3FFRm96Q3dN?=
 =?utf-8?B?VEIxaitHbWtIT1BCYk8xSGxhQmttVkl6TU4zZHZkdWZ2VE5LdndlYkZhQmpJ?=
 =?utf-8?B?M3ZPaTA5aUZrbi9wdnc0bzFzbGNqMUw4Q0RMVnBlS3N5TklhM3dRV2F1c0gr?=
 =?utf-8?B?S1BZK0NWd0pWb1o3aFZxQUk5WHVrYkM3U0Y4WFNndWdNQkIxN2hCN21XbDFO?=
 =?utf-8?Q?OQJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5258f874-17f9-46d0-8ba2-08dc15de18aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 15:24:42.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrI64jVb8XHWs4ZzY0YlKBV+aHlb96fp+5kcYMX9RNChOBXvt/SokJvnai/Pf6dZ6leOHoRvaULoSMK3OuDt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
X-OriginatorOrg: intel.com
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

SW4gYSBtdWx0aXBsZSBncHUgZGV2aWNlcyBzeXN0ZW0sIHRoZSB2cmFtMC92cmFtMSBwcmludCBj
YW4gYmUgb24gYW1iaWd1b3VzLCBzaW5jZSBpdCBkb2Vzbid0IHNheSB3aGljaCBncHUgZGV2aWNl
J3MgdnJhbXguIFNob3VsZCB3ZSBhbHNvIHByaW50IHRoZSBncHUgZGV2aWNlIHBvaW50ZXIgb3Ig
ZGV2aWNlIGlkPw0KDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBEYW5kYW11ZGksIFByaXlhbmthIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBT
ZW50OiBGcmlkYXksIEphbnVhcnkgNSwgMjAyNCAxMjoyNCBBTQ0KPiBUbzogRGFuZGFtdWRpLCBQ
cml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tOyBLZW1w
Y3p5bnNraSwNCj4gWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IFpl
bmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPjsNCj4gV2VsdHksIEJyaWFuIDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldw0KPiA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSF0geGUveGVfYm9fbW92ZTogRW5oYW5jZSB4ZV9ib19tb3ZlIHRy
YWNlDQo+IA0KPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBp
bnRlbC5jb20+DQo+IA0KPiBFbmhhbmNlZCB4ZV9ib19tb3ZlIHRyYWNlIHRvIGJlIG1vcmUgcmVh
ZGFibGUuDQo+IEl0IHdpbGwgaGVscCB0byBzaG93IHRoZSBtaWdyYXRpb24gZGV0YWlscy4NCj4g
U3JjIGFuZCBkc3QgZGV0YWlscy4NCj4gDQo+IHYyOiBNb2RpZnkgdHJhY2VfeGVfYm9fbW92ZSgp
LCBpdCB0YWtlcyB0aGUgaW50ZWdlciBtZW1fdHlwZQ0KPiByYXRoZXIgdGhhbiBhIHN0cmluZy4N
Cj4gTWFrZSBtZW1fdHlwZV90b19uYW1lKCkgZXh0ZXJuLCBpdCB3aWxsIGJlIHVzZWQgYnkgdHJh
Y2UuKFRob21hcykNCj4gDQo+IHYzOiBNb3ZlIG1lbV90eXBlX3RvX25hbWUoKSB0byB4ZV9iby5b
Y2hdIChUaG9tYXMsIE1hdHQpDQo+IA0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogT2FrIFplbmcgPG9hay56ZW5nQGludGVs
LmNvbT4NCj4gQ2M6IEtlbXBjenluc2tpIFpiaWduaWV3IDxaYmlnbmlldy5LZW1wY3p5bnNraUBp
bnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4N
Cj4gQ2M6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyAgICAgICAgIHwgMTEgKysrKysrKysr
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAgICAgICAgfCAgMSArDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5jIHwgIDggLS0tLS0tLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV90cmFjZS5oICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKystLS0N
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYw0KPiBpbmRleCA4ZTRhM2IxZjZiOTMuLjExNTRkOGY3YjNiMSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTI4LDYgKzI4LDE0IEBADQo+ICAjaW5jbHVkZSAieGVf
dHRtX3N0b2xlbl9tZ3IuaCINCj4gICNpbmNsdWRlICJ4ZV92bS5oIg0KPiANCj4gK2NvbnN0IGNo
YXIgKmNvbnN0IG1lbV90eXBlX3RvX25hbWVbVFRNX05VTV9NRU1fVFlQRVNdICA9IHsNCj4gKwlb
WEVfUExfU1lTVEVNXSA9ICJzeXN0ZW0iLA0KPiArCVtYRV9QTF9UVF0gPSAiZ3R0IiwNCj4gKwlb
WEVfUExfVlJBTTBdID0gInZyYW0wIiwNCj4gKwlbWEVfUExfVlJBTTFdID0gInZyYW0xIiwNCj4g
KwlbWEVfUExfU1RPTEVOXSA9ICJzdG9sZW4iDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHR0bV9wbGFjZSBzeXNfcGxhY2VtZW50X2ZsYWdzID0gew0KPiAgCS5mcGZuID0gMCwN
Cj4gIAkubHBmbiA9IDAsDQo+IEBAIC03MTMsOCArNzIxLDcgQEAgc3RhdGljIGludCB4ZV9ib19t
b3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdHRtX2JvLA0KPiBib29sIGV2aWN0LA0KPiAg
CQltaWdyYXRlID0geGUtPnRpbGVzWzBdLm1pZ3JhdGU7DQo+IA0KPiAgCXhlX2Fzc2VydCh4ZSwg
bWlncmF0ZSk7DQo+IC0NCj4gLQl0cmFjZV94ZV9ib19tb3ZlKGJvKTsNCj4gKwl0cmFjZV94ZV9i
b19tb3ZlKGJvLCBuZXdfbWVtLT5tZW1fdHlwZSwgb2xkX21lbV90eXBlKTsNCj4gIAl4ZV9kZXZp
Y2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPiANCj4gIAlpZiAoeGVfYm9faXNfcGlubmVkKGJvKSAm
JiAheGVfYm9faXNfdXNlcihibykpIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9iby5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4gaW5kZXggOTdiMzI1Mjhj
NjAwLi5iZjc3YmYxN2U1MTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9i
by5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oDQo+IEBAIC0yNDQsNiArMjQ0
LDcgQEAgaW50IHhlX2JvX2V2aWN0X3Bpbm5lZChzdHJ1Y3QgeGVfYm8gKmJvKTsNCj4gIGludCB4
ZV9ib19yZXN0b3JlX3Bpbm5lZChzdHJ1Y3QgeGVfYm8gKmJvKTsNCj4gDQo+ICBleHRlcm4gc3Ry
dWN0IHR0bV9kZXZpY2VfZnVuY3MgeGVfdHRtX2Z1bmNzOw0KPiArZXh0ZXJuIGNvbnN0IGNoYXIg
KmNvbnN0IG1lbV90eXBlX3RvX25hbWVbXTsNCj4gDQo+ICBpbnQgeGVfZ2VtX2NyZWF0ZV9pb2N0
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgCQkJc3RydWN0IGRybV9m
aWxlICpmaWxlKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xp
ZW50LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5jDQo+IGluZGV4IDgy
ZDEzMDVlODMxZi4uMWFjMTRjOTEwNDkxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZHJtX2NsaWVudC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xp
ZW50LmMNCj4gQEAgLTEzMSwxNCArMTMxLDYgQEAgc3RhdGljIHZvaWQgYm9fbWVtaW5mbyhzdHJ1
Y3QgeGVfYm8gKmJvLA0KPiANCj4gIHN0YXRpYyB2b2lkIHNob3dfbWVtaW5mbyhzdHJ1Y3QgZHJt
X3ByaW50ZXIgKnAsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gIHsNCj4gLQlzdGF0aWMgY29u
c3QgY2hhciAqY29uc3QgbWVtX3R5cGVfdG9fbmFtZVtUVE1fTlVNX01FTV9UWVBFU10NCj4gPSB7
DQo+IC0JCVtYRV9QTF9TWVNURU1dID0gInN5c3RlbSIsDQo+IC0JCVtYRV9QTF9UVF0gPSAiZ3R0
IiwNCj4gLQkJW1hFX1BMX1ZSQU0wXSA9ICJ2cmFtMCIsDQo+IC0JCVtYRV9QTF9WUkFNMV0gPSAi
dnJhbTEiLA0KPiAtCQlbNCAuLi4gNl0gPSBOVUxMLA0KPiAtCQlbWEVfUExfU1RPTEVOXSA9ICJz
dG9sZW4iDQo+IC0JfTsNCj4gIAlzdHJ1Y3QgZHJtX21lbW9yeV9zdGF0cyBzdGF0c1tUVE1fTlVN
X01FTV9UWVBFU10gPSB7fTsNCj4gIAlzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gZmlsZS0+ZHJpdmVy
X3ByaXY7DQo+ICAJc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYgPSAmeGVmLT54ZS0+dHRtOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmggYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHJhY2UuaA0KPiBpbmRleCA5NTE2M2MzMDNmM2UuLmM2NmE5MWRmN2Q4YiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4gQEAgLTEyLDYgKzEyLDcgQEANCj4gICNpbmNsdWRl
IDxsaW51eC90cmFjZXBvaW50Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gDQo+
ICsjaW5jbHVkZSAieGVfYm8uaCINCj4gICNpbmNsdWRlICJ4ZV9ib190eXBlcy5oIg0KPiAgI2lu
Y2x1ZGUgInhlX2V4ZWNfcXVldWVfdHlwZXMuaCINCj4gICNpbmNsdWRlICJ4ZV9ncHVfc2NoZWR1
bGVyX3R5cGVzLmgiDQo+IEBAIC0xMDAsOSArMTAxLDI2IEBAIERFRklORV9FVkVOVCh4ZV9ibywg
eGVfYm9fY3B1X2ZhdWx0LA0KPiAgCSAgICAgVFBfQVJHUyhibykNCj4gICk7DQo+IA0KPiAtREVG
SU5FX0VWRU5UKHhlX2JvLCB4ZV9ib19tb3ZlLA0KPiAtCSAgICAgVFBfUFJPVE8oc3RydWN0IHhl
X2JvICpibyksDQo+IC0JICAgICBUUF9BUkdTKGJvKQ0KPiArVFJBQ0VfRVZFTlQoeGVfYm9fbW92
ZSwNCj4gKwkgICAgVFBfUFJPVE8oc3RydWN0IHhlX2JvICpibywgdWludDMyX3QgbmV3X3BsYWNl
bWVudCwgdWludDMyX3QNCj4gb2xkX3BsYWNlbWVudCksDQo+ICsJICAgIFRQX0FSR1MoYm8sIG5l
d19wbGFjZW1lbnQsIG9sZF9wbGFjZW1lbnQpLA0KPiArCSAgICBUUF9TVFJVQ1RfX2VudHJ5KA0K
PiArCQkgICAgIF9fZmllbGQoc3RydWN0IHhlX2JvICosIGJvKQ0KPiArCQkgICAgIF9fZmllbGQo
c2l6ZV90LCBzaXplKQ0KPiArCQkgICAgIF9fZmllbGQodTMyLCBuZXdfcGxhY2VtZW50KQ0KPiAr
CQkgICAgIF9fZmllbGQodTMyLCBvbGRfcGxhY2VtZW50KQ0KPiArCQkJKSwNCj4gKw0KPiArCSAg
ICBUUF9mYXN0X2Fzc2lnbigNCj4gKwkJICAgX19lbnRyeS0+Ym8gICAgICA9IGJvOw0KPiArCQkg
ICBfX2VudHJ5LT5zaXplID0gYm8tPnNpemU7DQo+ICsJCSAgIF9fZW50cnktPm5ld19wbGFjZW1l
bnQgPSBuZXdfcGxhY2VtZW50Ow0KPiArCQkgICBfX2VudHJ5LT5vbGRfcGxhY2VtZW50ID0gb2xk
X3BsYWNlbWVudDsNCj4gKw0KPiArCQkgICApLA0KPiArCSAgICBUUF9wcmludGsoIm1pZ3JhdGUg
b2JqZWN0ICVwIFtzaXplICV6dV0gZnJvbSAlcyB0byAlcyIsDQo+ICsJCSAgICAgIF9fZW50cnkt
PmJvLCBfX2VudHJ5LT5zaXplLCBtZW1fdHlwZV90b19uYW1lW19fZW50cnktDQo+ID5vbGRfcGxh
Y2VtZW50XSwNCj4gKwkJICAgICAgbWVtX3R5cGVfdG9fbmFtZVtfX2VudHJ5LT5uZXdfcGxhY2Vt
ZW50XSkNCj4gICk7DQo+IA0KPiAgREVDTEFSRV9FVkVOVF9DTEFTUyh4ZV9leGVjX3F1ZXVlLA0K
PiAtLQ0KPiAyLjI1LjENCg0K
