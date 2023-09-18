Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BDBC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 20:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27E910E344;
	Mon, 18 Sep 2023 20:57:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181A410E344
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695070668; x=1726606668;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xdcbwKI/FcFrYN+8NzNz3wgdhH1zehKwSJRl0kzNJVg=;
 b=JGhEM2dCQtmMZ05GmPZnD88IquNvKUOzIZWs1Zccv8F3LIHY/Dhp6dyM
 A2FlcKVua7GQsvx+Ljxvx5rcV02B3KAOkq3FY+UTAbg2RPi+5EF7+gX/u
 r/Y7t54un+Bp5QQS0c5pmtch12bz6R3RUfCJTiUbMsx6XxmYMyBJ6wnlO
 iHdcmirDAHaVW6orbb7gK948XBg6JMM+c4vDDCLPx1cYwI8TqnnR75ufU
 +OUYtc2J8r3tUCkKZ5YRuLAxDpzE5Mu3gWxreVrs6dLjYGTJ5d+zi+rVY
 bUsSFh+WKVM2BwgxX14QIToLkpu+V68ZrBGhYJK5+86KH7KnSGDaIRBMy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364813068"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="364813068"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 13:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722598115"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="722598115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 13:57:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 13:57:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 13:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRaucKwzdaxQC3KSjH8VrC8kmWRMQo+3Dz5/MAJZpSDT7HECENs8i1qRn3V+lFjYEie1AU6ov+2eRI+1lVFbe1fPedZ7C4QXCgpN6mvVEqwffHC4y9DyJ2DWlMVIWHQKBQkzjzJRSgC52EhtnV9smrSE3eviQhCmPFqcBR9LAaSbjVnXfHBbHsSmnVtCY1yrfK2EDPd14pDYt4taVdByBNOPUrcminCrjf8kpd6bHjSqrn48eX+WI6ymIjdhFNRepsUgdOjMxGdIuXGD9r/IVcvhK8EHilowfGLqlbEOwZmfFlrKKd19mBQ857VAAEBYvNlQOU5bXZBQosQeq2MCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdcbwKI/FcFrYN+8NzNz3wgdhH1zehKwSJRl0kzNJVg=;
 b=EYPvDmEBUs/Ka9j8TajEykv4JxK6hHRCnT++85id3Sk7UOTUJJQbBUKzyxvRhIDSrnt30nweAQqfCvUwKh/a23hp1iYTwQ8iXHp/843UkYWixoDxGWVUEFiR5/Bz726V01rLJ3HZ0h90NlHEdsmpdPlgtVooCm7OO6Xm0DbETtx37Qpe+/UN0xTKDdVkh7ioLWaCYjaFDPzHP+qUJtbAv+eFxlq8aVqQM2hdVVW/KhCU3qi/uYip6VIyEeIvj4s9veEe9gbiB3uuJbWUjoxRIe5XW9pGHc8BiywljQAEvQpswl9dnFu4xaGuzNnCbl6fETaguDepRt/Y61gvI5ddhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Mon, 18 Sep 2023 20:57:42 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 20:57:42 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 6/6] fixup! drm/xe: Add frontbuffer
 setter/getter for xe_bo
Thread-Index: AQHZ58OCSzlNP+K/AUO/QRynWOX1sbAhFf+A
Date: Mon, 18 Sep 2023 20:57:42 +0000
Message-ID: <c5d0ca764c6fb331488fe4d3b56f44c019d22f20.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-7-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-7-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DS7PR11MB7808:EE_
x-ms-office365-filtering-correlation-id: 5a59bd5c-9a62-4573-16c2-08dbb889e6e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I2UEL0r3WPxVTe+NmJ0mbHYRuriSzZ790Yg1plDA86L5EffnDzUVUoteohi0gFetHRTHZsSbwhluF9Fj7W9yjHB1f/ZXrxUoh1ghelSIjSf6uQ5DXRTU3eidVHncVOGb9MdRFvFIFXdO8oWLR1KIyQGpppVC6yS6IrMd77xjgDVvXvZOb+nTdzrVZBnTJNlE0MAbLSJuHGTgw1tDY3owcAaBhnuOu0Xm5UCE1IGNGRv/pkzAr5BmZLAIQx3f6TomAe47bfhfM51FFKMHdWquh6RVpnai9u7m5DSWQe8yViVDwEeQO/iMndf/I3hycDCT2N2gtcb+pbUUTTx5gQSt0ltS50cZCkDBmDEfNdq4c5UU0FqvYkd6lsydjIrdiiabEN7HNaDKFGDCmeD32MguzV6mAhAH8k6j6nVMxG5ht4BEjcNs6yqK8n5Uu/P7iI1r17yXFqfIL2JnBVVC9wzzM+SodhbpOJaSlbwajEkal87XI/2ajhM8j7OFBSHyiNetxh4bw5EYvKg6e6yI/JfJI1MCxGEi5fu70dDDQcfdD4xBAFElC5P3dXrR+iEibbBRFfVcsRfGbaRfMj84GzJjIH10ce3nw1yHdVoLVL/grywRLd24dGomrQ+BStDZoJWB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(71200400001)(83380400001)(82960400001)(122000001)(38070700005)(86362001)(38100700002)(36756003)(2616005)(26005)(316002)(41300700001)(6636002)(8936002)(8676002)(2906002)(66556008)(64756008)(66946007)(76116006)(66476007)(66446008)(91956017)(110136005)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STQrcHE1QlZRVkc0OTBCZDlMTjhsRXdTODlMM2xGMTI4VDduajF6Nnl1UldX?=
 =?utf-8?B?eEZTMldhbVBUMHlNYjdWeVY4cTZ0M3VISVVsaEg4TVhuaHNnaGJ2ZDIwM3N2?=
 =?utf-8?B?YSt3YklCWExRbUxmLzN4ZkR4ODFNOVV5L2llU2FTeFozY0ZLSVF2WEZ0S0Zq?=
 =?utf-8?B?dlo1dlNuT2ZTYnYzcnllNzdXQzNUQ3ZEcjI2R1hlWmg0dlFTNTYwN1BMQUJW?=
 =?utf-8?B?amZmQm9ySjVGUmpoSlEyVDlEWE1BMk16dVZPTGF2WVdLSk1pQ0hRTGVtU1h6?=
 =?utf-8?B?WVE1dzNwbENXOXZmemtrK1RNZDRTWTJhMGcwM1RqdS95TzEyb1dmRm5GOW5a?=
 =?utf-8?B?NndYR0xuNkdjUUZPYlA5VHJsV2xEUWlhTVBSRnVxNVcwRlBpQzdMbFh6MStS?=
 =?utf-8?B?RTVMZGNkYk02aWVnUDN2K1lSeDhkSkZVVWhaS1NBWEVjck5GTlNUUUFiTkpw?=
 =?utf-8?B?V2p5R1JISW9HbGJKcDY2OVcxRkxYbkxpUnNWMDViTnZxNXc0QmQ3OGRrSXIr?=
 =?utf-8?B?Q3FKU2ZwUFNPWFY1QkE5dXZZQlcwNS9PV1hvcVJHS2VIbWJHTjg2Q1dGTFRu?=
 =?utf-8?B?Ui9yQ1BOY1VJY3l4UmwxM2g3TWphNVVZWUZZdDgzNFM0b01LN2RlWGMzMDlZ?=
 =?utf-8?B?TkNoTjEzS2ZXZkpIajVNZmtBdktEWE5rMXZjenNER2xnSWt1NmxXMWZkL09M?=
 =?utf-8?B?NFYvc0h0OWFzc2FIQU9ISlc4T3NNQ1oxMTV5d1lWSWRhcTN4UXJIcVpJTFdy?=
 =?utf-8?B?ZXdxVVVGYmViSE9reWgzSXF1RUNJWWJwQVNBMkxheDhza0w3OFNhYm8yYlJZ?=
 =?utf-8?B?Y29mU05DaDVZeUJyOG1EK2RJejhKdFNwQXRSR3NIZE8xV04xbEw1RVIvNXpJ?=
 =?utf-8?B?RHhnQjVVWFlnSGl1eFV1ajNKWSswc21YbkhDd0RFVGtPeFdvbzladUNTUEtP?=
 =?utf-8?B?VlF0c3lLYXk1dFJlaktPVGNySHR0TjE1NTJDWWNrWmZxb251ei9MOXBCcVRl?=
 =?utf-8?B?UHZ0NVh6MlhRenFmMFdJelpURjlNOUNINXhIdzJwYklrWDJVOTdpbDU5aHVV?=
 =?utf-8?B?Q1FoUW5sODVhYS9ZT2pRRWtobnVGVjQ1aU83M2hPV0tJNEd4RnQzVjJEM3gy?=
 =?utf-8?B?TjRTZFZ4OTd3ZmpaMnBQMDIwc2o5VDh3eEJraEl4TFFlMmdMbFB4a1dSdWFZ?=
 =?utf-8?B?ZzV4R29zV1R2eTJqdmZ5R2RYNmc2ODNiQ242cnFPeWhNV0VzMUU2emVxOUlH?=
 =?utf-8?B?d3F5TUE2Tk5DaTFlMDc5bTdyaTVQSkx1alVSUnpmQ3N3SU43Rzd6YWxCYUx6?=
 =?utf-8?B?Ymo4eG9pWXNUeFhYZDQ5VGc0blBNWDFQT3VwSWtDNDRVWHU4aThML0ZBNnpI?=
 =?utf-8?B?dzFJSk1Hc3FRSk5oUW00TG1nbmpxV3dZTEFPN3IybUtEZFlLZ0t3SURrZkww?=
 =?utf-8?B?UFhyeG1KM0tJUFM3clk2U1FxMjNnbFpIUGZkbHg5NjllRU9KbzZ5b2VYZzBi?=
 =?utf-8?B?OFNvUmRGM0lDWkgzZmhpMFZmK3B0QVM1SkR2MzUxNkZTdStNTm5DZXcxMGI5?=
 =?utf-8?B?cGppbkhmNmtLcW1CMzUxVkVEenhXYXhhb2U0Z2VzVVIvbEk2Qjdnd1N1eVI1?=
 =?utf-8?B?amVFc2tPMGRZTFlMbC9zZ2RaRkhDaGVmbnlSQktwWnM0bW8wWnlScEJzN1E2?=
 =?utf-8?B?a1VsRnc4NGxIVjBhQy83a245azR4bFlaTk9kaENnWE10RFNYM3d2U3V5SCtV?=
 =?utf-8?B?N1lNME81SHBVVEFVUmZRb3BvWlRxamc2OWxlZ3BxWFFHdFlSUkp3am9uYmxW?=
 =?utf-8?B?WU8zaXV4Y1dYcFJySFJIbTVpZFNPa0dOMkl4cHRjK0xiRHUrTTNZdkMxTWFv?=
 =?utf-8?B?alBKWkkreXZERVJBMWJHYW1Kak1WNXdPT1RpOWI3T0UwOHcwNFZmMkZzWENM?=
 =?utf-8?B?MWZldHlNbVRmVzdHd3BiTUZpczhlWGtiSUYrUHF3RWdjczhIMlJ3ZW8zempQ?=
 =?utf-8?B?K2VwdE1xSmZtOUJZT0U1cU8rZEhVbDloSllFZ3NSekYzQjk3K2xmWnhEVE5E?=
 =?utf-8?B?OEFObStPVUtBOU1DUmE5REtZMHl2QlI5d2lPZlUxRUQ2MWRlNTZlUENnMUF5?=
 =?utf-8?B?d1RpalJZclJ1TUc5bHVPL2QwMmtGdGlhbkxmaFlZazZiRXdoMnlQTUtKVjVp?=
 =?utf-8?Q?21Tovrdxi3MyjbqeiKo65To=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D1622D7F6636E4AB168CFAB300E3AC6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a59bd5c-9a62-4573-16c2-08dbb889e6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 20:57:42.6662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fDrECur24u6g8Ksn6vbAJwZ+Bu/al1VvqCPO0/UmPkImR3pMjkbrAw9P4Tks5B4e7e08WKAXH4wy15HOW62MzgOKk4zR3uWV3QA8F/hDjDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] fixup! drm/xe: Add frontbuffer
 setter/getter for xe_bo
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

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IGk5MTUgZnJvbnRidWZmZXIgc2V0dGVyIGFuZCBnZXR0ZXIgYXJlIG1vdmVkIGludG8gc2Vw
YXJhdGUgaGVhZGVyIGZpbGUuIFdlDQo+IG5lZWQgdG8gZG8gc2FtZSBmb3IgWGUgZnJvbnRidWZm
ZXIgc2V0dGVyIGFuZCBnZXR0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5k
ZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgLi4uL2dlbS9pOTE1X2dl
bV9vYmplY3RfZnJvbnRidWZmZXIuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEy
ICsrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAtLS0NCj4gwqAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2dl
bS9pOTE1X2dlbV9vYmplY3RfZnJvbnRidWZmZXIuaA0KDQpMb29rcyBnb29kIHRvIG1lLA0KDQpS
ZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRl
bC5jb20+DQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5
MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fb2JqZWN0X2Zyb250YnVmZmVyLmgNCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fb2JqZWN0X2Zyb250
YnVmZmVyLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4y
Mjc5NjVlNWY3ODQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
Y29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fb2JqZWN0X2Zyb250YnVmZmVyLmgNCj4g
QEAgLTAsMCArMSwxMiBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0K
PiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8N
Cj4gKw0KPiArI2lmbmRlZiBfSTkxNV9HRU1fT0JKRUNUX0hfDQo+ICsjZGVmaW5lIF9JOTE1X0dF
TV9PQkpFQ1RfSF8NCj4gKw0KPiArI2RlZmluZSBpOTE1X2dlbV9vYmplY3RfZ2V0X2Zyb250YnVm
ZmVyKG9iainCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlVMTA0KPiArI2RlZmluZSBpOTE1X2dlbV9v
YmplY3Rfc2V0X2Zyb250YnVmZmVyKG9iaiwgZnJvbnQpwqDCoMKgwqAoZnJvbnQpDQo+ICsNCj4g
KyNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmggYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiBpbmRleCA0YTY4ZDg2OWIzYjUuLjkwOTdiY2MxMzIw
OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4gQEAgLTMwNSw5ICszMDUsNiBAQCBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGludCB4ZV9zZ19zZWdtZW50X3NpemUoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJvdW5kX2Rvd24obWF4IC8gMiwgUEFHRV9TSVpFKTsN
Cj4gwqB9DQo+IMKgDQo+IC0jZGVmaW5lIGk5MTVfZ2VtX29iamVjdF9nZXRfZnJvbnRidWZmZXIo
b2JqKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqBOVUxMDQo+IC0jZGVmaW5lIGk5MTVfZ2VtX29iamVj
dF9zZXRfZnJvbnRidWZmZXIob2JqLCBmcm9udCnCoMKgwqDCoChmcm9udCkNCj4gLQ0KPiDCoCNp
ZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfS1VOSVRfVEVTVCkNCj4gwqAvKioNCj4gwqAgKiB4
ZV9ib19pc19tZW1fdHlwZSAtIFdoZXRoZXIgdGhlIGJvIGN1cnJlbnRseSByZXNpZGVzIGluIHRo
ZSBnaXZlbg0KDQo=
