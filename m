Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D762C83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CC510E163;
	Wed, 30 Aug 2023 21:38:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9049F10E163
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693431479; x=1724967479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+KGECK3JDgjKxEgOHoKEMBmF8zm02smxNPLOTkqGl9o=;
 b=FREgLAnrHfuaJHFI5mL+thbLP16R/+wK5yEeWviVaATHRFvyV7YXjcC6
 mK+BJ0VSZPbooIg0EN6qdE/R/Ne/c9CrzDo7u+pXHhMLtz62pD477bsJD
 o5R7stLFblpCRyaXDcsTKqtubDNidis7pQwp5QPnaUmi447b3dX1GQmMv
 I7AzfIXVgNC3w4q1C4mP48aRg4Jem036TF7MDZRgKXZ6rSWnR1b2Ee+/y
 36P3FCJGwhgdq3RFpQHlJZe7yBld7MQKoept77Jm2E0tPaLbrU7Y9z+tg
 mp2NuDL6crZbI6HL/7RKpnUwLlsblMiOF/sD/dWmZcRlQ7UUYjiOakxRP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356070899"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="356070899"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985925660"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="985925660"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 14:37:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:37:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:37:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZq7muDAa499YfR9dz8wozix634jh+ED2O6GYo8yNtdZS3zZxvBYpQnHES4wCQ+872AkiJaWz+dkJpZeYGGVrUKUhmYxn7tcabw/ssmMn9/53ECWhTUv8m43g8KiyzdbsEN0AGcsa5iBaO0/VKh6M4BRLu9sKx7FB23tsXOHDUBqQ/7oYJ8QFDi8ognpW20fJvb/KVb+DY3trO6muik5nKB/4KeY9rL6yo9HEoD2nHypkD+3hretTrM3isEB7+FQw8c1DPD5C1Q1UxqjkcICroUDcBgHwBIIBPmf5ulChBiB0IJI2deekBXjN7V5eOXxkZhXWHkoZGu9jQEQhik/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KGECK3JDgjKxEgOHoKEMBmF8zm02smxNPLOTkqGl9o=;
 b=ibVprFvZXeDtsbocnPTkaCh1cgJLCjq3hVKDPvu3dOai0kBek8iJ8SREQh/CfsnF3nNUg4jIc2K+nCxtUeww90aAqfAsFGtJ74E6a73sRBFfA5Tn8gZptZsk6A1CUKfi+wqkN+ZoF49GzW9t2aRICKVZClHt54CpWGW/rBMJVUS8FtsrE+xqpkRx+encKYJ1fNdHfH1P5BxoiRKhyubSPXMQxlC9J9yiNiNdv5uDHa1NiN8RS7p1QUVRl1oBuNU57tqRUpv+UPc8XSZizgPLx7q8IYRjMVKWU6YBvsiD+IGortw5THSlvIFAKTdDQExbszKeCHOZrA78zysltAtdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 21:37:50 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 21:37:50 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Enable scratch page when page fault is enabled
Thread-Index: AQHZ2s7wVvDu0SkTMkSLs5WwJ5NTr7AB89OAgAFqeqA=
Date: Wed, 30 Aug 2023 21:37:50 +0000
Message-ID: <CY8PR11MB69407FFFFF0D5DDF29EA13A8C3E6A@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230829231648.4438-1-yu.bruce.chang@intel.com>
 <c352ecfe-3b68-72ad-2879-ca053be8201a@intel.com>
In-Reply-To: <c352ecfe-3b68-72ad-2879-ca053be8201a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|CO1PR11MB5123:EE_
x-ms-office365-filtering-correlation-id: 0aac1d11-3158-4da8-9729-08dba9a15bf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4f3wKvRhFfI0aXtVEIT/kaNilWop/OUhkRF3qCaAZRrnDCgd3HqRl8vl3YjeABShLIgrKco/554ie6eEgUej5UaNe76Nklat7fi4l+2jO+whSVoFjScmehmksrRfCdm8t+KL3twq1eArbV1u6mo2MxbcmQltSwAXxDOVhVMtGuBufBZOrlby9Q9PEIKwCu782IaHLOif8gPp5EBoDVYeT91yjuJgxlePy1AviKiKoF80F9UWsA5Q6nDJDsZeCXdMBhhfmpS5Af59fDIlNwfRoovEV29krXV4XbrLBw5z8iAGj/pBjqWMCtCcTpa7S4lKLQiO84wnX8USK1lDy23OS1rtqwvnPy8/FIz7n3yaqL6L4mU+txBuY0r+qZxjNyO7ALwvVop6ivDwu55SCeqKGgo8hyTGBmvVwte24/3hxf3divlCPv3a3106EVv8Ccbv+5N0rxXbo41cwEaKduLAJx464j9Xkz7+AI4pj3/7ONwbdPxIQBMMlaxizzwB3t69ba1LsswkpTp3YD08i0NuerjTS/rx6FmCAMq4ctvHuu4PcqNdJy5RZyogGHKoldVxGMJKfF/L0RitXQ3aGkSmUwLzif93orSI/uO8e6W4+RaKVHn9W4gW3TjTiZU2UDnJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(1800799009)(451199024)(186009)(9686003)(7696005)(71200400001)(6506007)(86362001)(33656002)(38070700005)(38100700002)(82960400001)(122000001)(55016003)(478600001)(110136005)(107886003)(64756008)(83380400001)(53546011)(26005)(4326008)(8936002)(54906003)(5660300002)(66476007)(66946007)(52536014)(76116006)(2906002)(66446008)(41300700001)(66556008)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERDK2g5d0RQODNSdW1QRUp3RmRLMnVpUmUxTC9xR1VBQ2JvVmRMUVo3RFhI?=
 =?utf-8?B?LzNyZGtMbHQ3R1Q2TnhlWVBORFd1a0F2NjFpR1RJQVdzVlFNLzdYUytHYStK?=
 =?utf-8?B?VmNXbEFINDg1MnZnM01iYnRObGtPN0cyZ3hsU2VzbWxucGNsejJ0b0Y4b1FD?=
 =?utf-8?B?ZFVTWDlGMTZvREV5OVRoc3pyZ3lVU3g5ZWdNWHU3OUNlbWNQQXVzYTAvRHR2?=
 =?utf-8?B?cUFkcGJ4RlpGWVB6dTJJeGdoQ04zZmljSmo2SlE2YjZyUXRHa0M0RkNmZFpw?=
 =?utf-8?B?dkExV3hnZ2h5Ylc1ZDJjYThNM09xSFdTMGN3aXJVTXBNUVdiUTVHbFlGK3Nx?=
 =?utf-8?B?czgyQ3h3V3NVbHZZYnZhQWZ0MWFHYldRYy96MTBsK3FOK3FSTklYZHJYeGZS?=
 =?utf-8?B?aE1zVUJNaFcvZlJ1S2c1ZzlsNmhjWkFNL1FhTW5tdHV3OTIrYkJBQUJjQUdD?=
 =?utf-8?B?eVlxMkt2UWRES3NBSTJuaEVnUHpvVnFGdG82V2hXaUNYZWNwb2FhTWlDUHAx?=
 =?utf-8?B?S0lkR3oxNVUzdDhEOTA5eDBhcG1QS1FSLzlFMDlJL2pDd2Q2WkFldVgrUFVr?=
 =?utf-8?B?TWtzV1hsa1dEQmluZU1rNXZNSzY3eUtJSUh0MFk1cFA3S21sM1NKelhTQVZF?=
 =?utf-8?B?NURlb1VUSWR6RmFyWnYzMENPSGFyUm9aSW1FT011UlZsTWJTc2Jid1U0RHZJ?=
 =?utf-8?B?VWpHVUtaZmF6RUVLajZ5ZHBwdFYvMDN4d1lWdTNWVC9HaUVOQzZWajB1QzlL?=
 =?utf-8?B?Q1lwVmtwZ2NTbnY1UlJtVjh6MVBrTkltdzNqRXoxdUN0VlJoUWRxcmNVSTAz?=
 =?utf-8?B?OHl6dFVzWmxsbkxCOVpIQzFNaU84eThTcWExbzBOTWZyN2RBbUlPZHdiNGhX?=
 =?utf-8?B?TkdoS0lBVi9rWFBhVDNYWEI3NE0ydFgvYmNQU3VNZXFKWjFrUER4NStCZTU4?=
 =?utf-8?B?bGJxQzFHVm5ndTkxSkI0YWFHTjZUMlRLMUJEeUJFVUo2OFY1M2RuNWVuWnUx?=
 =?utf-8?B?WFlkaVFRQ3JuTmhQNk5keUFqY3RRZkV3NEI3cURDQzdwcFd6MkVpRFZmVTZE?=
 =?utf-8?B?TmU4ZmNvaTF4cUlObHhTdDRwRjNBQjFRRXdBaG9DUmxKQVJUV21nWDNUY0NE?=
 =?utf-8?B?YS90eGRFaVZiUzdJV2YxdzRua3oxcXI3N2Znck9vck8waXJsMUNUU3Avdlp1?=
 =?utf-8?B?ZUI3azJ4eEZGeTUrUTY5RFVlNlpGNEZIbkZUa2t2RlNyYUpYOElxam80Skxw?=
 =?utf-8?B?SHNKS2M0N2JTUVBzWDZ1dG5maUEyQW15YklzU0NpbzVxa2FyQkU4c25DTUhZ?=
 =?utf-8?B?ZjJ4SzFMaFo3blM1cXh1Z3ozWmJaMHFVQmNBUTAxNnI3dzNISHlxazh1SVVL?=
 =?utf-8?B?ZXBjbTZuUHhLUHoyZnZPZnNGUVNFRm9QYlRJc1JBUXU4RlZFODB3YUg5TVVa?=
 =?utf-8?B?bTkrb29zM3NTUXRETUJIM29uMVB2TytIZDNYQUtrM1UvK1dSR2YvTzh6MWFm?=
 =?utf-8?B?YjVmRXNyeWpPdDh2dEc2OFpQbnJHUEpIblZhVG0vTGh4ZXE2RVhtM2I2TGkw?=
 =?utf-8?B?ZFMrcDhTV3BaVmlVc1huQUlGS3hiK1piUzk5cG1oV3FnMWkzSUczcXNrdHJv?=
 =?utf-8?B?MXpBSHVaRWk3T2FPKzNuL3NlV01JdDh1MW9Ebng1UXNRNThLb3gxcjVLOVZR?=
 =?utf-8?B?ZEppcHA5cTVWVGhyeG9sUVhua0E4WkxiU0NxV1czUnVSTlFxTGlHRTVYQk9R?=
 =?utf-8?B?cC8zdVc3MEFoVEpWMVY4Mm1rcFBSSE5OK2h0WjJWdnI3b21pTWpPRFppa253?=
 =?utf-8?B?QlZNQVRGYlR4WGVScUtRMHA3OEVYU3VzWjF3UEFMT2xVRzN6bDQwS2o4VTRj?=
 =?utf-8?B?d2FKcWd2MW9zWndEM1o0US9lNWZmLy9WbitMTEZkTG9CbVY5TEQ0aVVZTVUz?=
 =?utf-8?B?REM2VXdMenhtYUtJcjRZL3F3a3lHY01DWm5uTnhDakJJOUN0bVJ5Uko3L09i?=
 =?utf-8?B?UUEzeXdlMWFoUnE3cGswbms1SmtQOHV1MGxMd3ZKbFp6YzV1UkEyQnBnK2x4?=
 =?utf-8?B?YTBsMGRrakJ5SUdLQ2k0VmlZd1VrYi92V2xjcXAvdGo2elVWYUR1c0Y5WVl5?=
 =?utf-8?Q?2iGsW66bTJkQ37TWrYK5lgYET?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aac1d11-3158-4da8-9729-08dba9a15bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 21:37:50.0651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kmLaKwOSlr9xkdQfTLIoOpbFKlX77Jzq8/nVqOPihS/FjGPASKQRmXGPTtA16iU/aTZku6ibDAKqKXslEGz38GbSY2tSLKrnwQCdG0f8MQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHksIEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyOSwgMjAyMyA0
OjU5IFBNDQo+IFRvOiBDaGFuZywgWXUgYnJ1Y2UgPHl1LmJydWNlLmNoYW5nQGludGVsLmNvbT47
IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFplbmcsIE9hayA8b2Fr
LnplbmdAaW50ZWwuY29tPjsgVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmENCj4gPG5pcmFuamFu
YS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsgU3VtbWVycywgU3R1YXJ0DQo+IDxzdHVhcnQu
c3VtbWVyc0BpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZTogRW5hYmxlIHNjcmF0Y2ggcGFnZSB3
aGVuIHBhZ2UgZmF1bHQgaXMgZW5hYmxlZA0KPiANCj4gDQo+IA0KPiBPbiA4LzI5LzIwMjMgNDox
NiBQTSwgQ2hhbmcsIEJydWNlIHdyb3RlOg0KPiA+IFRoZSBQVkMgSFcgaGFzIGEgbGltaXRhdGlv
biB0aGF0IHRoZSBwYWdlIGZhdWx0IGR1ZSB0byBpbnZhbGlkIGFjY2Vzcw0KPiA+IHdpbGwgaGFs
dCB0aGUgY29ycmVzcG9uZGluZyBFVXMuIFNvLCBpbiBvcmRlciB0byBhY3RpdmF0ZSB0aGUgZGVi
dWdnZXIsDQo+ID4ga21kIG5lZWRzIHRvIHNldHVwIHRoZSBzY3JhdGNoIHBhZ2VzIHRvIHVuaGFs
dCB0aGUgRVVzLg0KPiA+DQo+ID4gVGhpcyBmZWF0dXJlIGNhbiBvbmx5IGJlIGVuYWJsZWQgaWYg
c2NyYXRjaCBmbGFnIGlzIHNldCBwZXIgVk0uIFNvLCBvbmNlDQo+ID4gRVUgZGVidWdnZXIgaXMg
cnVubmluZywgdGhlIGRlYnVnZ2VyIHVtZCB3aWxsIHNldCB0aGUgc2NyYXRjaCBmbGFnLA0KPiA+
IG90aGVyd2lzZSwgdGhpcyBmbGFnIHNob3VsZCBub3QgYmUgc2V0LiBTbywgaW4gcmVndWxhciBy
dW4sIHRoaXMgZmVhdHVyZQ0KPiA+IHdpbGwgbm90IGJlIGFjdGl2YXRlZC4NCj4gPg0KPiA+IFRo
ZSBpZGVhIGlzIHRvIGJpbmQgYSBzY3JhdGNoIHZtYSBpZiB0aGUgcGFnZSBmYXVsdCBpcyBmcm9t
IGFuDQo+ID4gaW52YWxpZCBhY2Nlc3MuIFRoaXMgcGF0Y2ggaXMgdGFraW5nIGFkdmFudGFnZSBv
ZiBudWxsIHB0ZS4NCj4gPiBBZnRlciB0aGUgYmluZCwgdGhlIHVzZXIgYXBwIGNhbiBjb250aW51
ZSB0byBydW4gd2l0aG91dCBjYXVzaW5nIGENCj4gPiBmYXRhbCBmYWlsdXJlIG9yIHJlc2V0IGFu
ZCBzdG9wLg0KPiA+DQo+ID4gSW4gY2FzZSB0aGUgYXBwIHdpbGwgYmluZCB0aGlzIHNjcmF0Y2gg
dm1hIHRvIGEgdmFsaWQgYWRkcmVzcywgR1BVVkENCj4gPiBoYW5kbGVzIGFsbCBvZiB0aGlzIChl
LmcuIGl0IHdpbGwgY3JlYXRlIG9wcyB0byB1bmJpbmQgdGhlIG9sZA0KPiA+IFZNQSwgYmluZCB0
aGUgbmV3IG9uZSkuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIG9ubHkga2lja3MgaW4gd2hlbiB0aGVy
ZSBpcyBhIGZhaWx1cmUgZm9yIGJvdGggcGFnZSBmYXVsdA0KPiA+IGFuZCBiaW5kLCBzbyBpdCBz
aG91bGQgaGF2ZSBubyBpbXBhY3QgdG8gcmVndWxhciBjb2RlIHBhdGguIE9uDQo+ID4gYW5vdGhl
ciBoYW5kLCBpdCB1c2VzIGFjdHVhbCBwYWdlIHRhYmxlcyBpbnN0ZWFkIG9mIHNwZWNpYWwgc2Ny
YXRjaA0KPiA+IHBhZ2UgdGFibGVzLCBzbyBpdCBtYXkgbm90IHJlcXVpcmUgdG8gaW52YWxpZGF0
ZSBUTEJzIHdoZW4gZG9pbmcNCj4gPiB1bmJpbmQgaWYgYWxsIHVwcGVyIGxheWVyIHBhZ2UgdGFi
bGVzIGFyZSBzdGlsbCBiZWluZyB1c2VkLg0KPiA+DQo+ID4gdGVzdGVkIG9uIG5ldyBzY3JhdGNo
IGlndCB0ZXN0cyB3aGljaCB3aWxsIGJlIHNlbnQgb3V0IGZvciByZXZpZXcuDQo+ID4NCj4gPiB2
MjogcGVyIE1hdHQncyBzdWdnZXN0aW9uLCByZW1vdmUgdGhlIHNjcmF0Y2ggcGFnZSB1bmJpbmQu
DQo+ID4NCj4gPiBDYzogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gPiBDYzogQnJp
YW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4gPiBDYzogTmlyYW5qYW5hIFZpc2h3
YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gQ2M6
IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHRo
ZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jIHwgIDkgKysrKysrKy0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysr
LS0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oICAgICAgICAgICB8ICAyICsr
DQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVs
dC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jDQo+ID4gaW5kZXgg
YjZmNzgxYjNkOWQ3Li5hZGZkMjIwNmI5NDIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3BhZ2VmYXVsdC5jDQo+ID4gQEAgLTEzNyw4ICsxMzcsMTMgQEAgc3RhdGljIGludCBoYW5k
bGVfcGFnZWZhdWx0KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdA0KPiBwYWdlZmF1bHQgKnBmKQ0K
PiA+ICAgCXdyaXRlX2xvY2tlZCA9IHRydWU7DQo+ID4gICAJdm1hID0gbG9va3VwX3ZtYSh2bSwg
cGYtPnBhZ2VfYWRkcik7DQo+ID4gICAJaWYgKCF2bWEpIHsNCj4gPiAtCQlyZXQgPSAtRUlOVkFM
Ow0KPiA+IC0JCWdvdG8gdW5sb2NrX3ZtOw0KPiA+ICsJCWlmICh2bS0+ZmxhZ3MgJiBYRV9WTV9G
TEFHX1NDUkFUQ0hfUEFHRSkNCj4gPiArCQkJdm1hID0geGVfdm1fY3JlYXRlX3NjcmF0Y2hfdm1h
KHZtLCBwZi0NCj4gPnBhZ2VfYWRkcik7DQo+ID4gKw0KPiA+ICsJCWlmICghdm1hKSB7DQo+IA0K
PiBMb29rcyBsaWtlIHZtYSBjb3VsZCBoYXZlIGFuIGVtYmVkZGVkIGVycm9yLiBTbyBtYXliZSBu
ZWVkDQo+IElTX0VSUl9PUl9OVUxMKCkgPw0KPiANCg0KR29vZCBjYXRjaCEgRml4ZWQgbm93Lg0K
DQo+ID4gKwkJCXJldCA9IC1FSU5WQUw7DQo+ID4gKwkJCWdvdG8gdW5sb2NrX3ZtOw0KPiA+ICsJ
CX0NCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAlpZiAoIXhlX3ZtYV9pc191c2VycHRyKHZtYSkgfHwg
IXhlX3ZtYV91c2VycHRyX2NoZWNrX3JlcGluKHZtYSkpIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+
IGluZGV4IDM4OWFjNWJhOGRkZi4uNTE5MDgwNzA4OWU4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPiBAQCAtMTI2Miw3ICsxMjYyLDggQEAgc3RydWN0IHhlX3ZtICp4ZV92bV9jcmVhdGUo
c3RydWN0IHhlX2RldmljZQ0KPiAqeGUsIHUzMiBmbGFncykNCj4gPiAgIAkJfQ0KPiA+ICAgCX0N
Cj4gPg0KPiA+IC0JaWYgKGZsYWdzICYgWEVfVk1fRkxBR19TQ1JBVENIX1BBR0UpIHsNCj4gPiAr
CWlmIChmbGFncyAmIFhFX1ZNX0ZMQUdfU0NSQVRDSF9QQUdFICYmDQo+ID4gKwkgICAgKCEoZmxh
Z3MgJiBYRV9WTV9GTEFHX0ZBVUxUX01PREUpKSkgew0KPiA+ICAgCQlmb3JfZWFjaF90aWxlKHRp
bGUsIHhlLCBpZCkgew0KPiA+ICAgCQkJaWYgKCF2bS0+cHRfcm9vdFtpZF0pDQo+ID4gICAJCQkJ
Y29udGludWU7DQo+ID4gQEAgLTE5OTgsMTAgKzE5OTksNiBAQCBpbnQgeGVfdm1fY3JlYXRlX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHZvaWQgKmRhdGEsDQo+ID4gICAJaWYgKFhF
X0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3MgJg0KPiB+QUxMX0RSTV9YRV9WTV9DUkVBVEVfRkxB
R1MpKQ0KPiA+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+IC0JaWYgKFhFX0lPQ1RMX0RC
Ryh4ZSwgYXJncy0+ZmxhZ3MgJg0KPiBEUk1fWEVfVk1fQ1JFQVRFX1NDUkFUQ0hfUEFHRSAmJg0K
PiA+IC0JCQkgYXJncy0+ZmxhZ3MgJiBEUk1fWEVfVk1fQ1JFQVRFX0ZBVUxUX01PREUpKQ0KPiA+
IC0JCXJldHVybiAtRUlOVkFMOw0KPiA+IC0NCj4gPiAgIAlpZiAoWEVfSU9DVExfREJHKHhlLCBh
cmdzLT5mbGFncyAmDQo+IERSTV9YRV9WTV9DUkVBVEVfQ09NUFVURV9NT0RFICYmDQo+ID4gICAJ
CQkgYXJncy0+ZmxhZ3MgJiBEUk1fWEVfVk1fQ1JFQVRFX0ZBVUxUX01PREUpKQ0KPiA+ICAgCQly
ZXR1cm4gLUVJTlZBTDsNCj4gPiBAQCAtMjc4Myw2ICsyNzgwLDIzIEBAIHN0YXRpYyBpbnQgX194
ZV92bWFfb3BfZXhlY3V0ZShzdHJ1Y3QgeGVfdm0NCj4gKnZtLCBzdHJ1Y3QgeGVfdm1hICp2bWEs
DQo+ID4gICAJcmV0dXJuIGVycjsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdHJ1Y3QgeGVfdm1hICp4
ZV92bV9jcmVhdGVfc2NyYXRjaF92bWEoc3RydWN0IHhlX3ZtICp2bSwgdTY0IGFkZHIpDQo+ID4g
K3sNCj4gPiArCXN0cnVjdCB4ZV92bWEgKnZtYSA9IDA7DQo+ID4gKw0KPiA+ICsJaWYgKHhlX3Zt
X2lzX2Nsb3NlZF9vcl9iYW5uZWQodm0pKQ0KPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQp
Ow0KPiA+ICsNCj4gPiArCXZtYSA9IHhlX3ZtYV9jcmVhdGUodm0sIE5VTEwsIDAsIGFkZHIsIGFk
ZHIgKyBTWl82NEsgLSAxLCBmYWxzZSwNCj4gdHJ1ZSwgMCk7DQo+ID4gKwlpZiAoIXZtYSkNCj4g
PiArCQlyZXR1cm4gMDsNCj4gPiArCVhFX1dBUk5fT04oeGVfdm1faW5zZXJ0X3ZtYSh2bSwgdm1h
KSk7DQo+IA0KPiBJIHRoaW5rIG1pZ2h0IGFzIHdlbGwgcmV0dXJuIHRoZSBlcnJvciB0byBjYWxs
ZXIgaGVyZT8NCj4gKGxldCB0aGUgY2FsbGVyIGRlY2lkZSB0byBpZ25vcmUgaXQgb3Igbm90KS4N
Cj4gQW5kIG9uIGVycm9yLCBzZWVtcyBiZXN0IHRvIGNhbGwgeGVfdm1hX2Rlc3Ryb3lfbGF0ZSgp
IHRvIGZyZWUgdGhlDQo+IG1lbW9yeSBhbGxvY2F0ZWQgZm9yIHZtYSBzdHJ1Y3R1cmUuDQo+IA0K
DQpHb29kIHN1Z2dlc3Rpb25zISBNYWRlIHRoZSBjaGFuZ2UgYW5kIGFsc28gcmVtb3ZlZCB0aGUg
WEVfV0FSTl9PTg0KU2luY2UgeGVfdm1faW5zZXJ0X3ZtYSBhbHJlYWR5IGhhZCBpdC4NCg0KVGhh
bmtzLA0KQnJ1Y2UNCg0KPiANCj4gPiArDQo+ID4gKwkvKiBmYXVsdCB3aWxsIGhhbmRsZSB0aGUg
YmluZCAqLw0KPiA+ICsNCj4gPiArCXJldHVybiB2bWE7DQo+ID4gK30NCj4gPiArDQo+ID4gICBz
dGF0aWMgaW50IHhlX3ZtYV9vcF9leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sIHN0cnVjdCB4ZV92
bWFfb3AgKm9wKQ0KPiA+ICAgew0KPiA+ICAgCWludCByZXQgPSAwOw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5o
DQo+ID4gaW5kZXggNmRlNmUzZWRiMjRhLi5kZGQzODczMzNjZDIgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uaA0KPiA+IEBAIC0yMTIsNiArMjEyLDggQEAgaW50IHhlX3ZtYV91c2VycHRyX3Bpbl9w
YWdlcyhzdHJ1Y3QgeGVfdm1hDQo+ICp2bWEpOw0KPiA+DQo+ID4gICBpbnQgeGVfdm1hX3VzZXJw
dHJfY2hlY2tfcmVwaW4oc3RydWN0IHhlX3ZtYSAqdm1hKTsNCj4gPg0KPiA+ICtzdHJ1Y3QgeGVf
dm1hICp4ZV92bV9jcmVhdGVfc2NyYXRjaF92bWEoc3RydWN0IHhlX3ZtICp2bSwgdTY0IGFkZHIp
Ow0KPiA+ICsNCj4gPiAgIC8qDQo+ID4gICAgKiBYRV9PTlNUQUNLX1RWIGlzIHVzZWQgdG8gc2l6
ZSB0aGUgdHZfb25zdGFjayBhcnJheSB0aGF0IGlzIGlucHV0DQo+ID4gICAgKiB0byB4ZV92bV9s
b2NrX2RtYV9yZXN2KCkgYW5kIHhlX3ZtX3VubG9ja19kbWFfcmVzdigpLg0K
