Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ABCC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599EE10E91A;
	Thu,  7 Dec 2023 16:04:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30E610E91A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701965068; x=1733501068;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=x5dIJ96RTNsznQksFAtxFjgPmAPCLZlLZ1f74z++Hlg=;
 b=JujJFNTqybFnLogQprr8Xa8xS4/Fy008z78KIUnmg5o9QmhplOP0erVC
 TdI+5uQvEJcCSbxYDlnjB5Ndf//p/UPAYWTn70YNxIdSPs1RQzo6uaM8r
 IfgMvMulIR8w/xbH24QQvXiYQzskI6r39FdafCQNy+v+W/cpTaZ252wso
 XJwQdCewiXWkWogn+S56z9/IRU32J+1vE3Udfzc1ERDm5NWVmpciN3o2Q
 ZqRoo0lqKQVphAqJdCgaZt9/NfDsYFelRrPvh5jAwH65Cm2HMRq0EPFSE
 b2pgBu96/Gs005cq41/ROpNPh2qABuDsFy0dgGUjglN5DNp4ubsgVHVSt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393992687"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393992687"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895195477"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895195477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:03:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:03:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:03:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:03:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8TTaBO8wb9Om8WMCB8kKYmz8s5vguTGpvZsDvCnvdF8qBKp2Ocprk8hmJT+mvmt7jboyeIeL6PMM2U4pBIboTEFYrjzEDnG1RmGirGev/4e0VVpjoaEGt4KPy8slA7yi+ulXLgAbKmN3G2cbSbAccA2au2uXP+wTppWVaghnPng7dOlkUyGcv6iwvqAMRX9MjBbBJlvfCikclVRLzHhQcXL3D+aixgIFNF4YbcsK5oL1ZSGT+wJJqNLIkesuLzerLgBQ5d1sXMzjWysxSCm6Uts8QyVfdVko4oI4d+BcyqxMn+Rsng9cfNtmkILK+avb+Zb+1iPxI2eLmahb2uk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5dIJ96RTNsznQksFAtxFjgPmAPCLZlLZ1f74z++Hlg=;
 b=LnxnV5Q1FXVlv3JrFBkFm43b5UkrQ3gAb/WlFq2gmaGZkoElSs4MlIX1F8FQpZbXIfp0ZqWi4tC6Q2TEoneos/B3LxIW4WiIGdZV1RraNKCTMS7ZUqOyGjtofAYWahyAb2D6TZR67iAqhG+mG0OXgVAmvS4OROTalgVYF8zC8Mljh6tVHxTQ4Y08jRVdEAWwzsoGqpCazx41NdTN95EOEGUdBus+8Q6R6Qdk+b6tVpM66OL+sB9NqlcrMp56vFLWsDW2cFvvF2h4FKQGRYHLCM8yFv2JwghSCTzKsFPs01zbdxhu/BRohaoR2kA+KzykrXmgYR2BuQy1AC97cVXJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 16:03:06 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 16:03:06 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Coelho, Luciano" <luciano.coelho@intel.com>
Subject: Re: [1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for
 xe"
Thread-Topic: [1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for
 xe"
Thread-Index: AQHaKSbd/65mrdYQX0S/yxQX0yoL1A==
Date: Thu, 7 Dec 2023 16:03:06 +0000
Message-ID: <f7739f055ea31e75e7a3effb6ace8aff4138b83e.camel@intel.com>
References: <20231207130106.1676807-1-luciano.coelho@intel.com>
In-Reply-To: <20231207130106.1676807-1-luciano.coelho@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CO1PR11MB4963:EE_
x-ms-office365-filtering-correlation-id: 91c8e1a5-7a34-4972-29d5-08dbf73e0054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g1iCXAzqArGu8EkZOQ3rHg95BKcrAdUWQ+tGwOUdAMZinmJRjOoOtOrIPRI2bInmiXCNMtws/74KywpoWVw6vldl7kIdoxWuK941C8aMQpXcs8TQv/2V/p+U1K1107haidiQyjd/lAbRhxCWHSj16KJRnrpglQGR8hMWUhLcTVFA22BZoaJtxXUp8y7UVwzlKAsR7vGWZJpBfQl+z9ofJlkEkkMBsKAi0lX4U2/RMKV0aGOVQ8bZrEeq7lbHRFWGb0s4k/k0wJSvmTuXokf9ZLZwpaIyMZ4FwrkIaO3D9XGkRtk+0K4lrMy8sCO04hwkFyFNI1lCR9YvKlCyuxPSo2nVZvHhG+YKs6Cs60IjPCkxk4Dxa+EjhDRWNjB4D98gHTFzDHdjR+iAUm7XI19lrZ5OqoJ5K5lZAymvvTPo++kvazm9nP8sDjHaVIUfEooUyMvT9Os0N/0EsXUN1AbA+EQ1Z7M/mfb7w+D+eBdDpPVeeBO46QoMrQEhnlzLXVlbtvtJyae8NHoOAOgWAwjntEBAh3L2FNIjx81bA3yayXwza+cHoG9+8ClRF0ZuzwlUt6sTX9NGGnsacnMOpHPz46aV0G9EGrFjUSNrh/LZepffASzaJq6QcrN8yzhCJ0v5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(2616005)(122000001)(26005)(38100700002)(66574015)(41300700001)(82960400001)(71200400001)(6512007)(83380400001)(76116006)(66946007)(316002)(66556008)(66446008)(66476007)(64756008)(6636002)(91956017)(110136005)(6486002)(478600001)(86362001)(5660300002)(2906002)(8936002)(8676002)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFY5ZUl3YzVEM3ZRTTdMcjlpb2xkTDhPWUh6Ty9GSVc4UmJPOWdKNWlNMmxS?=
 =?utf-8?B?dm5iMlZKbHJUMG8vWm1TcFhZWi9uVFlhcWx2TDJpTDBiUFNoL3NuVjBjSzN4?=
 =?utf-8?B?Zm9pRDdZTUo0WWF1QU1uVndJVlpaLzgzYmtXMEx2M1NSb1JzdGFqYjVqSG1O?=
 =?utf-8?B?L2o0ZFpHSWxtN1lTTHphbGI1a2JlQUFOYmVJYTZSaTFDMEdZZ3hNYkFlZHNz?=
 =?utf-8?B?aUFDMXNtZXNid0VwSVgvME56OEtTcFdYQXVXU2ZUQTBSWE5oZ2RSeWVBWTVs?=
 =?utf-8?B?dmdudjI3M3NvOXp6K3diZjgzcFQ5WU0vb2t4WTlzR2tMZy9SM2YvZ2EyRDJr?=
 =?utf-8?B?VGlEU2ozZklFUi9OemNsdFVkSSt2eHFGRUpMaWcwQVU2QWdwK0dyVWpwbCtv?=
 =?utf-8?B?UEo3ekNtRDFjUWllaWFWOVoxRFNxVkdidk9YTVBOdnRyanNmVkZ2UnpRS1hz?=
 =?utf-8?B?eXhwd0VKcjFIVWVmQUJSVlNlSW02Y3JvWEt5NzVqK0k3RUwvN1FMSXhBajBZ?=
 =?utf-8?B?RTJ6ejlFejFPWlBiVGJ6Q3g4d0d0S3c2Nk1YNWpHNlM3NVhvektKNWFNN2Yx?=
 =?utf-8?B?ajNsb0MrZzlweUtFY3ArS1RYOXM5OXczUkVkWm81alhWOXdDbE1ZZGt5T1Nw?=
 =?utf-8?B?U1JaWnE0aWhBRWJ3NzhSM3d3L20wRElSUzJiWHl5UHVxQThHc3JpN09XaEJx?=
 =?utf-8?B?ZHhncDJZN1NzZzRBM21qZ3RvZ0NZcFh3WUZxaFFkU2ZkS0RwYlc2YW9ldFFN?=
 =?utf-8?B?eXgyeVduaHV3RjZNdFQxUXBDSHl6UzlIa2N2blY5U1UyNGdCN1p0SXBzRThE?=
 =?utf-8?B?OXhtdkprTGJwVDRMbjNpL3NqSVRES3cxUkRpZ0t2TG4rdTBXYy9SVkVvaExk?=
 =?utf-8?B?MFEvMXB5U3Zob3BjQ3VOaUlUTFF5enJVVDU4OHhkempFN2tiN0xTT0xpbG5y?=
 =?utf-8?B?aEFMTnZFMnlTTVZyRVZBd2NkU2ZGd2M5V1VXUU5sWm1DNXhLWVV2cFFpWUhL?=
 =?utf-8?B?b28va3J4djMwcnVUL1hXYkVMcTEzTittTk5mR0ZKY0NsVEpHckh1Y29zZDMx?=
 =?utf-8?B?dFgwT0dzRWZ4NVF1NHlxTUdZM2NsN1NrQWVRK01TcEZLSG0raWlTL2U2S0U1?=
 =?utf-8?B?a3ppNU0rWUE1Y0lwa0MyRHp3Zmk4WU1rVDZadzQ0bGtmK0ZhZGRsQ0xNRUwx?=
 =?utf-8?B?MTdVeWx0enR6ZU1QemczVHNaVFF4aTRFOXB6NVFsZmViQjc2U1hWbW9zV09r?=
 =?utf-8?B?T3JhSUVGWmpFK3dPWWtJb21jOWtjMWVhMHhHUnZVVUVVc1Fqa2dFN1RnM29Q?=
 =?utf-8?B?Q014OVdTUGViRTdJUHRYak5QMGpLclg1RUYrbi9NUDE4d2lFR3VUUUxRZTR0?=
 =?utf-8?B?NUJoYlZsenpGdTV4OUExY2ZLa1ZBRDFRdDNsZ3dLazdlREVRNE8zVlhyVCth?=
 =?utf-8?B?dkorcEtWRGpzWFdTV05XYzNreXZrZXozeDBhUE5HWEhmL052QWN3dmlmNldC?=
 =?utf-8?B?dERhZERXODZBTS9pdys5cjMxWkJGbHFJRU5hZ2RJVkptRGZqYWZjbXJWd3Y5?=
 =?utf-8?B?QmdXZXo0TUx5QllxYlRHNENkZVpFcWp5Z3R1WWxjUklqR1oyQVUrUHNtYy92?=
 =?utf-8?B?QzM1WmpyTG9kUVZOaGx3TUJBTStNQTVRYnFWMG5sS3FIYUp6UzNaendMdjdr?=
 =?utf-8?B?cEZVdTRGbFhBMEtpUVZmN1dXUG5KNWY4UEFTRVk0T0RRZWRPTG4yNUgyREJN?=
 =?utf-8?B?OTlubjZzV0JqdEtTWXBrYmU3aDlWZFVSak9Td1R4ZzdmREtpbThPcEVCbTAr?=
 =?utf-8?B?dVhvYmVsNUU1OFBNcW9FNm9QbTNXaDQ2Tjh6Zis5ZFBoK25nOFVIQ0RaYXRx?=
 =?utf-8?B?dXdxUzUyTnEwUXhqTlhHZFpEay9BRml6SkxsdWRLMWExaW5TbVdrSlNkUEE1?=
 =?utf-8?B?UHZ3M1dlK0pJV2VsZmpWeXFTbHFNRzJ2UXk4V2ZRM2o3SVFwYkhld0N6aHRz?=
 =?utf-8?B?UmhCTGVoOS83V2ZMZ0V1UEtSdzhnNjVaYUhSeDBPU2hOQkNVOE42ZzBTZWZl?=
 =?utf-8?B?eW83R0NqYks1Z1VHeXcyVGdSL21EdnYxdit6dHBSNnFpY3dhTXBMTTZrNjNa?=
 =?utf-8?B?TWo4TFdpQmVMRDNpT3hNK2ZhTHlkc1A3a3ljMmlvQkhVMUN3OURQdkFxV2xK?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A48F16B2BA96439A163A511BEC0FCE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c8e1a5-7a34-4972-29d5-08dbf73e0054
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 16:03:06.7987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SErVB+OJyMioKrvguks1tzp8aWZOlakIiKb6Kj2RiNSEhy+kd+z1fFNQRN1dqf4a7TUEIhO2zSo6+lpru6VuXE+HN0ppqeh+oIlNwPykhNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE1OjAxICswMjAwLCBMdWNhIENvZWxobyB3cm90ZToNCj4g
VGhpcyByZXZlcnRzIGNvbW1pdCA1NGNiZDA3YmQxZDE1Y2I2YzhkMjgzNzVkY2U2ZDZiNzBkZjZk
MjUyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDb2VsaG8gPGx1Y2lhbm8uY29lbGhvQGlu
dGVsLmNvbT4NCg0KVGhhbmsgeW91IEx1Y2EgZm9yIHRoZSBwYXRjaGVzLiBUaGVzZSBhcmUgbm93
IHB1c2hlZCB0byBkcm0teGUtbmV4dA0KYnJhbmNoLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVy
DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmJsYW5rLmMg
fCAyNCArKysrKy0tLS0tLS0tLS0tLS0tDQo+IC0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YmxhbmsuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfdmJsYW5rLmMNCj4gaW5kZXggNmEwZDUxODIzNjU1Li4yY2VjMmFi
Zjk3NDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
dmJsYW5rLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92Ymxh
bmsuYw0KPiBAQCAtMzA2LDExICszMDYsOCBAQCBzdGF0aWMgYm9vbCBpOTE1X2dldF9jcnRjX3Nj
YW5vdXRwb3Moc3RydWN0DQo+IGRybV9jcnRjICpfY3J0YywNCj4gwqDCoMKgwqDCoMKgwqDCoCAq
IHJlZ2lzdGVyIHJlYWRzLCBwb3RlbnRpYWxseSB3aXRoIHByZWVtcHRpb24gZGlzYWJsZWQsIHNv
DQo+IHRoZQ0KPiDCoMKgwqDCoMKgwqDCoMKgICogZm9sbG93aW5nIGNvZGUgbXVzdCBub3QgYmxv
Y2sgb24gdW5jb3JlLmxvY2suDQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gLSNpZmRlZiBJOTE1
DQo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxc2F2ZSgmZGV2X3ByaXYtPnVuY29yZS5s
b2NrLCBpcnFmbGFncyk7DQo+IC0jZWxzZQ0KPiAtwqDCoMKgwqDCoMKgwqBsb2NhbF9pcnFfc2F2
ZShpcnFmbGFncyk7DQo+IC0jZW5kaWYNCj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgLyogcHJlZW1w
dF9kaXNhYmxlX3J0KCkgc2hvdWxkIGdvIHJpZ2h0IGhlcmUgaW4gUFJFRU1QVF9SVA0KPiBwYXRj
aHNldC4gKi8NCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoC8qIEdldCBvcHRpb25hbCBzeXN0ZW0g
dGltZXN0YW1wIGJlZm9yZSBxdWVyeS4gKi8NCj4gQEAgLTM3NywxMSArMzc0LDggQEAgc3RhdGlj
IGJvb2wgaTkxNV9nZXRfY3J0Y19zY2Fub3V0cG9zKHN0cnVjdA0KPiBkcm1fY3J0YyAqX2NydGMs
DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAvKiBwcmVlbXB0X2VuYWJsZV9ydCgpIHNob3VsZCBn
byByaWdodCBoZXJlIGluIFBSRUVNUFRfUlQNCj4gcGF0Y2hzZXQuICovDQo+IMKgDQo+IC0jaWZk
ZWYgSTkxNQ0KPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2X3By
aXYtPnVuY29yZS5sb2NrLCBpcnFmbGFncyk7DQo+IC0jZWxzZQ0KPiAtwqDCoMKgwqDCoMKgwqBs
b2NhbF9pcnFfcmVzdG9yZShpcnFmbGFncyk7DQo+IC0jZW5kaWYNCj4gKw0KPiDCoMKgwqDCoMKg
wqDCoMKgLyoNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFdoaWxlIGluIHZibGFuaywgcG9zaXRpb24g
d2lsbCBiZSBuZWdhdGl2ZQ0KPiDCoMKgwqDCoMKgwqDCoMKgICogY291bnRpbmcgdXAgdG93YXJk
cyAwIGF0IHZibF9lbmQuIEFuZCBvdXRzaWRlDQo+IEBAIC00MTQsMTkgKzQwOCwxNCBAQCBib29s
IGludGVsX2NydGNfZ2V0X3ZibGFua190aW1lc3RhbXAoc3RydWN0DQo+IGRybV9jcnRjICpjcnRj
LCBpbnQgKm1heF9lcnJvciwNCj4gwqANCj4gwqBpbnQgaW50ZWxfZ2V0X2NydGNfc2NhbmxpbmUo
c3RydWN0IGludGVsX2NydGMgKmNydGMpDQo+IMKgew0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGMtPmJhc2UuZGV2KTsNCj4g
wqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgaXJxZmxhZ3M7DQo+IMKgwqDCoMKgwqDCoMKg
wqBpbnQgcG9zaXRpb247DQo+IC0jaWZkZWYgSTkxNQ0KPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGMtPmJhc2UuZGV2KTsNCj4g
wqANCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pcnFzYXZlKCZkZXZfcHJpdi0+dW5jb3Jl
LmxvY2ssIGlycWZsYWdzKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHBvc2l0aW9uID0gX19pbnRlbF9n
ZXRfY3J0Y19zY2FubGluZShjcnRjKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmRldl9wcml2LT51bmNvcmUubG9jaywgaXJxZmxhZ3MpOw0KPiAtI2Vsc2UNCj4g
LcKgwqDCoMKgwqDCoMKgbG9jYWxfaXJxX3NhdmUoaXJxZmxhZ3MpOw0KPiAtwqDCoMKgwqDCoMKg
wqBwb3NpdGlvbiA9IF9faW50ZWxfZ2V0X2NydGNfc2NhbmxpbmUoY3J0Yyk7DQo+IC3CoMKgwqDC
oMKgwqDCoGxvY2FsX2lycV9yZXN0b3JlKGlycWZsYWdzKTsNCj4gLSNlbmRpZg0KPiArDQo+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gcG9zaXRpb247DQo+IMKgfQ0KPiDCoA0KPiBAQCAtNTQ4LDkg
KzUzNyw3IEBAIHZvaWQgaW50ZWxfY3J0Y191cGRhdGVfYWN0aXZlX3RpbWluZ3MoY29uc3QNCj4g
c3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+IMKgwqDCoMKgwqDCoMKgwqAg
KiBOZWVkIHRvIGF1ZGl0IGV2ZXJ5dGhpbmcgdG8gbWFrZSBzdXJlIGl0J3Mgc2FmZS4NCj4gwqDC
oMKgwqDCoMKgwqDCoCAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycXNhdmUoJmk5
MTUtPmRybS52YmxhbmtfdGltZV9sb2NrLCBpcnFmbGFncyk7DQo+IC0jaWZkZWYgSTkxNQ0KPiDC
oMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrKCZpOTE1LT51bmNvcmUubG9jayk7DQo+IC0jZW5kaWYN
Cj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMo
JmNydGMtPmJhc2UsICZhZGp1c3RlZF9tb2RlKTsNCj4gwqANCj4gQEAgLTU1OSw4ICs1NDYsNyBA
QCB2b2lkIGludGVsX2NydGNfdXBkYXRlX2FjdGl2ZV90aW1pbmdzKGNvbnN0DQo+IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiDCoMKgwqDCoMKgwqDCoMKgY3J0Yy0+bW9k
ZV9mbGFncyA9IG1vZGVfZmxhZ3M7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBjcnRjLT5zY2Fu
bGluZV9vZmZzZXQgPQ0KPiBpbnRlbF9jcnRjX3NjYW5saW5lX29mZnNldChjcnRjX3N0YXRlKTsN
Cj4gLSNpZmRlZiBJOTE1DQo+ICsNCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrKCZpOTE1
LT51bmNvcmUubG9jayk7DQo+IC0jZW5kaWYNCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmk5MTUtPmRybS52YmxhbmtfdGltZV9sb2NrLA0KPiBpcnFmbGFncyk7DQo+
IMKgfQ0KDQo=
