Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE00CD613C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1010E082;
	Mon,  9 Oct 2023 22:04:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1661A10E082;
 Mon,  9 Oct 2023 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696889072; x=1728425072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mxpjzOXxVCi+OJgF3rQxT0bPPaugxSwBrY3c8X+YE9Q=;
 b=Oks0DHWvJxN8dRxmRAZABYTyxire+rNzSW6szZle/tQuh8EbXBraw5rV
 RSSLQmHEB5Te961GNn4KUAbMbs2hOp+ZrZLSrYEec/+WdeFbnAlRCQeO2
 fswkwV+xzM82ygKxfBskrovjocmoGqMTZ894MAOY5zGMe3Zvk2wNZVyJu
 6O/6cJKg2GraipcrRO4IwEKrUHaFI7sBXivz3T/INSuUrPkw6CD2XqjBa
 ISCf/BbxzqU4RU2KypaWwx/XzLtXIvZOuK+oFS85rL3j7rFVcIjcXnYGS
 PYAHxPqKH347pQcderpyDyTENUSYzGLIcFpmJHfE+wka8OFFjafHP5FC3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387088883"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="387088883"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756862229"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="756862229"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 15:04:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 15:04:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 15:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIASdMH+6Nk5Rt3GK+g2W7WtDOTtPzEk2PGlSuCNrXHEOhvubPEUY1C5t+J77kBOyBORcvCNWrfXDVJrbzEtVP6KAupymixjjiADMdf1YtcZOnyxzs3axJp3by2amuIFWJ7BZHpb4vTDU7mw/HW22a+7zjSVAbTS/i6bCNo32+jmZstnj8Owib70YFJBdvPlxbFWOz+FnPrethKiwMQPVtIKFFMQf5ZPpiDmApuPJ0lRJAoSppiRMnEki9aSKTkYD0eEI3OF7NYdL0/4T7+Hrcq5WLGyNb2howOzyBer5tNLWgnKLZ3++ipDsshW+2q3qkj0NNvX4P2qHLtQgPb7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxpjzOXxVCi+OJgF3rQxT0bPPaugxSwBrY3c8X+YE9Q=;
 b=WZckYQMS09qh80g3aB4U5olIfiHWfsZHAFIgnnGIAUwCKqd8ZJPVVSvZCJ7zkP/JH8egddBnsraJWW3ZZJiw4djw6sXU0WJKIZhAWz+XuGsa6ryF64+P1RkNxNjLTrt2QPokbKgVx7Enu3OX9LXitzxa0fFSTjj41BGPUABqhNyT/zKAGLalastHeGoTtcl1dKboJfGQ8x6+xUnIvcuK7I/5pHErkjVSnu6B0akOAD6Fj5f1w1Vk60WZy9SX7Xad20xCUXC34L+khChkfYn6GS9tDLCJC/rmG55YOZOIgf8ft2ci7bp33y+GHuge15jxfObA9TE7rrso1Xpsn5ma8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 22:03:59 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 22:03:59 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t 03/12] lib/igt_draw: mark buffers as SCANOUT
Thread-Index: AQHZ96EVVH6kLQv8hkWxW6G07YJrBLBCCbZQ
Date: Mon, 9 Oct 2023 22:03:59 +0000
Message-ID: <PH0PR11MB5782AF81E325E521E2B5EE6182CEA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-4-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-4-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SN7PR11MB7602:EE_
x-ms-office365-filtering-correlation-id: e9f2dd22-8b92-4f27-ee12-08dbc913a3b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NDIEfJDqURzaOlZuzW9sWK8EuY6eKoJ6jL1XUSTaI2+lnzSILlmtTjv/cUOKm6SzwTiujAsuK1f9pnyC09msxTVuKYVVA9bSepM/bhOJivH9Zn4/XTXv5azFmpU05mRGsyeNsOQUIZ95deahlv9OYCm7sX/0QDjM9paacpB/kMzWYONZjiqCKcOAjWu5teQl5kO+gwNT/fDybXDT79kZw7iQ7NjPhnQ498T+aYybozl4L68pbKbq+ZkGDCepKPsvAHBw+T3LNXUNdLo5Vi7omnDI7pI6pKdjHGEbBJxEM9wbYuZ4kk91Mcq2csIVdMXzgmitssIJZpQ18Viyjdwj44liq6P/Vr6dHpxXcbDyHZaWYp/RaUBEuySVGnGHlyVZ4blQ5e9Sn816KCDYZKxG44cHG3LQ08nqUhnzw3EUlZV3ItOi9diu8+sVnPC+9B5WcznsZ8E35mUt4uMJnC3jdVbto0QF1Fy6rMhebo9wKUVkRAJq1H3fKp6F00h98V9eflunpKJn7epuegLauWrmQusjgVKt7t9phMmxduLBTHQJDw4WYt2VyYzm9vvdiVMzSGLPsxFSaCJqDKU6GcQwTw0i45DmnfcEfrLHsgfxAKyVvAZn0fpJrwcJJScQxoDZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(55016003)(76116006)(107886003)(83380400001)(26005)(316002)(110136005)(64756008)(66556008)(66476007)(66946007)(66446008)(450100002)(54906003)(4326008)(53546011)(52536014)(8936002)(5660300002)(41300700001)(7696005)(71200400001)(6506007)(9686003)(478600001)(8676002)(33656002)(82960400001)(86362001)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkFBTFZrQ0EvbHJIaklzZkxkTit6KzBrWnY5N1d0N2o5VGo0aUlwWHN2c0lu?=
 =?utf-8?B?c05EN1o1aTdDRFFvanFIeFlEVTZoOVRZMGo0Z3FuTXYwajI4bGxKVDFNYkVO?=
 =?utf-8?B?eGpUamd3T1FxN3pTMlMrTUNscmRXUmdEWitxeXhLUGsydDBiQzVFRHlyNE4z?=
 =?utf-8?B?anZBUCtqRUFiUklGL2gyR3hDV1ZhMVNSeDRsYVlTN2NOZ1Z1cE52UnQ0d3Nz?=
 =?utf-8?B?QmhoU2hCWmpGMTIrZUpyWVpmbVplOWxvM0ZiSGVMQThLbGUzTkhIQ0dZUzZU?=
 =?utf-8?B?UWNFQ1NJVC8vVTZ5djlnTlRDbms2aXJ5dmlBNFNZRXQ3K0c2dkJVak1aSW4v?=
 =?utf-8?B?TnRCdUdzSDc0cXQwOGJoSjJxWldUbnBCTGpydHhYa001aTAzQlEwd2hZaU11?=
 =?utf-8?B?aUFwa0I5c3F1OW8yNTNVTXVyZXlNMmFWMnAxM3B3Q2Z0TUg4YTUvTTF1V2ZO?=
 =?utf-8?B?V2Vqb0pRWlhPckEyNGt2dDh5U1BOYWJFYW1BTklWSE5GdVhzZ1oydU94NHpw?=
 =?utf-8?B?SGRIb1Ntd1lvT3FlZ3NrOG5uTXIvVmhzSUd1eG1QUDhiNFhYNTZZZGhockh4?=
 =?utf-8?B?U2UrQkpCb2Y5VFZ1VFJ1amh6WkNCT2FiYmJkelF4OVZqenkzWlZlTmp5WmxV?=
 =?utf-8?B?TExrQWd4LzErZVhVdHIwTktBcFd3YkFCY3lXaktFRUFFc0pLYlM5SWJ3R2Qv?=
 =?utf-8?B?dFBQekdKQlZlbmphMmdLeE0vbU9QUXpkdSt1YlcyTWpjeW95M3h0TFZ2bTNO?=
 =?utf-8?B?WXRHcGJ0K1JXbUlPUkR4Vm10bFh0Y3BicWNQRXZwQ2xYNis1Qk5DYTV3TjQ1?=
 =?utf-8?B?eWw5MWE4dEdIS1FlWFhub2RjOG8xd2RtMWF2Z1B5WDRpWklpUE5QZmYwWmxU?=
 =?utf-8?B?a3hDb05QZEdOSUhicnNvalV5RTdrMzNRNm53b28yZG1QS2t0bjRZSWhzNzZD?=
 =?utf-8?B?eitTMG1NWTh4THdHTTZZcWNlYlUwMTJWeHFUM1Y0eDlrQ2lPTE9DaHRDeWsr?=
 =?utf-8?B?YXdabFJLVzloQnNlVnVnZ01sK3lsbVFLc2NJN00xbVAxZmNETElHMXpNYkpw?=
 =?utf-8?B?ODJadTMrUkZ4TzVrOUMyTUh0OG1pSDNyL005c1Q4U0d1K2p2bnZaOEluMEhW?=
 =?utf-8?B?UFRZV09JcEVyYVUyMkJpN1UyMEZBMlNhb3NsTmF0NHJNYUFNT3UzTHpNRDQz?=
 =?utf-8?B?TDBxMGpQZ0ZGa0V0cGpkZ1pqQWcxdXU1M05XcUtET2U4eHFYc1YweVZmTmda?=
 =?utf-8?B?VkZXSTR0S3NnSEVHTTV2cmhlRlNycXpBZlFDUnFTVUN6K1RPc3EvTEo1Q3RC?=
 =?utf-8?B?ZjJhNjRZNWcrQjh3dVYrTVRaZG1DUG95aDgrVmFzNitKTjdhTkhvTGxwdndD?=
 =?utf-8?B?eWhOeGd5SkdkTGdGSjFQRXl4M0FRM3l6U205V2VmY01jMlgxVGMybVQ4QlpJ?=
 =?utf-8?B?UkpTajhmZjhiWXV0NDU1WDR1SEZtTU9DUElTVjk0ZWxnTDlJVGZTN2pWbWtL?=
 =?utf-8?B?d3JNR1Z3MHM5VE81TmlPNy9HcktoSk9XdEFPZDh3RjI2aWVJYjBSTVNaVXV3?=
 =?utf-8?B?OUcxWFVkMlRldWRrYW5GUzJSNkhEak1HWFkvQ1hDY3l4RFZmVzlVZnNhRXpG?=
 =?utf-8?B?NytLOFhjWmc5WHpSWGFraWxuc25FSFR4T2Q0TFlPYlk0NGt6TW1DQVJmdy8y?=
 =?utf-8?B?MXR4dm0xU1EzY2NiRW83bkpQalZ0VXM2NkVTeFNJV0VvY1p6Nkl3YWh5U2hG?=
 =?utf-8?B?UXMvSlBNREY4eTAxM0ZRcFpYL29RaFZNeGM5WnhabEFKMlBldzByc2lqbjNO?=
 =?utf-8?B?cGhyYTdzaWVOSUFxaE82RnUxeUw1bGZlVzdiYmU1NDVCYlgra2NxSTFCaFlS?=
 =?utf-8?B?V3FoWkFySWV0M2NDbmV1cVdpMjAzWFJMeVdTdk9qR1NjVDQxWmpOVDBUUlRP?=
 =?utf-8?B?cEpNWXRGc25IMUxJQkJJa2F1SEQ5N0pwSGczb3RJVTUybXVxbExwSUhRSzVV?=
 =?utf-8?B?Qmp2TE5IVVNFSmlkVTlyeWFUY0Q5WGJ6OXhVTlFxdGVWeEpBT21KUU12ejZk?=
 =?utf-8?B?Wi9uUGE4VGRyc3BjaFJhK2h4TVR2dS9HWjlUVXdydzBoZStySkY3T2hIV1Jj?=
 =?utf-8?Q?gCSyCoMpSankw634WxYhtvfjf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f2dd22-8b92-4f27-ee12-08dbc913a3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:03:59.0638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZsWI5i2uRAQCfk90I5WRG+FVOtnsGUyJeDULiO1vieup2jX03CK9rGawc+jw6dnVEAI9fz2Iid1qng/qf2ReBL45k6Mdi8xWFtH9BpYl70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 03/12] lib/igt_draw: mark buffers as
 SCANOUT
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAy
MyA4OjMxIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ow0KPiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IDAzLzEyXSBsaWIvaWd0X2RyYXc6IG1hcmsgYnVmZmVycyBh
cyBTQ0FOT1VUDQo+IA0KPiBEaXNwbGF5IGJ1ZmZlcnMgbGlrZWx5IHdpbGwgd2FudCBXQywgaW5z
dGVhZCBvZiB0aGUgZGVmYXVsdCBXQiBvbiB0aGUgQ1BVIHNpZGUsDQo+IGdpdmVuIHRoYXQgZGlz
cGxheSBlbmdpbmUgaXMgaW5jb2hlcmVudCB3aXRoIENQVSBjYWNoZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IFBhbGxhdmkg
TWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBQYWxsYXZp
IE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfZHJh
dy5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RyYXcuYyBiL2xpYi9pZ3RfZHJhdy5j
IGluZGV4IDQ3Njc3OGExMy4uMjMzMmJmOTRhDQo+IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2Ry
YXcuYw0KPiArKysgYi9saWIvaWd0X2RyYXcuYw0KPiBAQCAtNzkxLDcgKzc5MSw4IEBAIHN0YXRp
YyB2b2lkIGRyYXdfcmVjdF9yZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGENCj4gKmNtZF9k
YXRhLA0KPiAgCWVsc2UNCj4gIAkJdG1wLmhhbmRsZSA9IHhlX2JvX2NyZWF0ZV9mbGFncyhmZCwg
MCwNCj4gIAkJCQkJCUFMSUdOKHRtcC5zaXplLA0KPiB4ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQo
ZmQpKSwNCj4gLQkJCQkJCXZpc2libGVfdnJhbV9pZl9wb3NzaWJsZShmZCwNCj4gMCkpOw0KPiAr
CQkJCQkJdmlzaWJsZV92cmFtX2lmX3Bvc3NpYmxlKGZkLA0KPiAwKSB8DQo+ICsNCj4gCVhFX0dF
TV9DUkVBVEVfRkxBR19TQ0FOT1VUKTsNCj4gDQo+ICAJdG1wLnN0cmlkZSA9IHJlY3QtPncgKiBw
aXhlbF9zaXplOw0KPiAgCXRtcC5icHAgPSBidWYtPmJwcDsNCj4gLS0NCj4gMi40MS4wDQoNCg==
