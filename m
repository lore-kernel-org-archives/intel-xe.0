Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D56AC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A3310EB94;
	Mon, 22 Jan 2024 18:40:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD34810E5AB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705948854; x=1737484854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fnlU/L5akk2CFrd5acsiGfT8yRaJQfF97W74Glxh1KU=;
 b=Q25NqZykBkCS7rHPVx+jQ90YygQQZUpX5fsjQRFOf2KAH1lN2ateadCi
 b16vY+uAbFjMrY6rFy3YT6v0080u4XwPLE5UWaQ7UWN36KjF0Y/XJRtrw
 9iCFnXKNZv8nvRQP5Bz+COIiJKBuvzLEcfMz16DtE8qiGgLx2NSnjxz/w
 eXN4zzcn3TWgBCTSkFhwkOEvgJQZPU913EK+sOntz4jNLaUqYrhIN0lTo
 UFEGscMqnDiWbtBOHw4Yvno65dsoo9+ZN1strWF2GUijwmm7DpIVg7WWk
 di536rflgCb28yOiUgTl/Ik9dX7BNP5MCnOgcb+RbjiMPLUA2lpYPUo+Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8688980"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8688980"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 10:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="904944265"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="904944265"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 10:40:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:40:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:40:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 10:40:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 10:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KA2KW1Axo53bBHJHuG2BWB6L93SU/WFwZtjPLiAc1Q0wodCx5cbu1PTwb+HuDuvSf5yXUGd9Z1dW3qQLTJpFwD6ev4dxLFxogJpvbIpbBrNcUIMAKy1ca4mJnTK/Hes+gL+KUhv9FTo5PnaHY07LTtyuLok1MtItZRR7v+xLAthEA1o//PXC2MqGnbLHqm3eSWWhbrvT+Kl0ujDcZQMKKp5857DIeO+sYU9/pIrHRX6AQByQQSUMhOxTLsATtQW5QQg1P7YOT1SiPDcH+7El+4BEMCDNMNfMSWiOFd742n3mtc/WZaPFVim8QlYpNiHj37/dxQt12IUXIkVF5pp9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnlU/L5akk2CFrd5acsiGfT8yRaJQfF97W74Glxh1KU=;
 b=kamovbjYtFu/7lNTGVJ6tMQWRGNOjjMFo8+T4hGXriHZ5JYoPYEHINo3ML1/iTs57i3nyJ/GG+B7VN+bKMR2xL3/kr/+4EMF2wa53vUuRJapFgZSBF2Lrfhf2+ifH0Iw9ywWDFvkyTX60eyAllovSUO4Pvxxjf+bsh1/hYiUICWIEgFzbOHQ2jAT9Ll8xaIgvFTC5JsjjsDd7sr/xxL5p4JB5CK4hZG/90UwRmX7ByUV3fVZixjTUO42CLtUxlVfhNjy/pttriACrAtTEG8okckctl+Qa8BH7DRulpHNMtBFpsAHAVV7gr6KmCTDT/XSraDI4DYdx2h905fxqv4fag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 18:40:14 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 18:40:14 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Topic: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Index: AQHaTVUuzmcf3G8UEUSsmLwp7pg7LLDmJvuAgAADOAA=
Date: Mon, 22 Jan 2024 18:40:14 +0000
Message-ID: <1fa902956e2dcd9092934f7587fd1f4fa3e5bd81.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <f787dab50690396e0cf1159da66321a85069009c.camel@intel.com>
In-Reply-To: <f787dab50690396e0cf1159da66321a85069009c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO6PR11MB5585:EE_
x-ms-office365-filtering-correlation-id: 2b7a61f6-3b19-44c1-efcd-08dc1b7992b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K4T46N0bcwsP8hhqO4EulKR9BaNMvf0BBr6+uv81XBPeTWaQfL9CiSt+bcYHEbI+vCQ75AL5z+Hq2RnTKXKMRVC4mlpA7xfZnaNZY+75eocU1peYMu9uOXNlNtFRsmUyp5dez64Vad21IefEu4VG2ckWqMmKRuW9DLQTu8KVDOLmK5vxYUikTKIwla7OwzG2QXXQQXAGcGncyImOdrJi89rNIvTwD/m90dX7S28zQoN0Oi8rbvBdBW9fcRiGnze87LfffO8uJAcgeV5XO8JfibiyQQI6AIIGY4kHFe/MLpH/9L07jvQHsDIN8+f31CL9IhFxdzNxUlU61ycEEuDxRGeT9k0UgZfXU/hBAKDWvdLfN0xa9o09CQyDm+LHGodTqLQAjhLSYq+BwuSvQgFzxCzZFNdoha3G8gRPuiccYPperNQB2egIEUJDiB7/sFQYSG0FN6eRVyMUvt5WVb6u9uLKIfXzuBPXkFVn92Gs0BsmmiCkNPqWp1yG87ZE0N+7UyNFLX98PTySeVJbMnNmUv0WwpG91BgCcvaSaq48t20KHsUjCKRSFr4IHAaMEKaZ90N/5V3RWltqSebID9GRH6mq7J2v8QsE3nQk4UaPeVxusNrNSG+qCNGm50Z/QYim
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(4326008)(6486002)(2616005)(41300700001)(26005)(107886003)(316002)(6512007)(6506007)(478600001)(71200400001)(38100700002)(82960400001)(36756003)(86362001)(122000001)(110136005)(2906002)(8676002)(38070700009)(66476007)(76116006)(66946007)(8936002)(91956017)(66446008)(66556008)(54906003)(5660300002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OS93NXhSc3FvWVVtQWZ3Tm5FVHhwaW0rMWdIZGdMNUQrTE5nTU9haTI2U0xu?=
 =?utf-8?B?bWlYTk1FZzd3UlVBc0ZVam1Ldm5xalR2TVY4TEhxb2VHRi8vS0xrRDBMZllU?=
 =?utf-8?B?ZWRxRVkraEtUdnl2Qm5ieURvZ1J4d29pYUQrTzZjWTZKL2o1Zm9aaFBVa0Fs?=
 =?utf-8?B?MUkweGdiZE9CMXY0aFp5enFRU1VwYmdtUHVBQUFVeXdqeGJHTXZadHMzcEhj?=
 =?utf-8?B?SzRYbDhtbDAwaWlna3VnMlZFZTNTb2E0V3ZHUnhWRjRrRzJHWm56NVk4WXgz?=
 =?utf-8?B?azQwNkFnQ2tadmwxVXVRNE1UTWM4cXo2Q1kyTHZhTWFxRWwxVlpBdjdoL3hI?=
 =?utf-8?B?T1hhRElIMml2ZHpqWUZKZnNPdkdJZGxsS0dXMlhGaUhrL1ZCb3h2d3NHa1kx?=
 =?utf-8?B?Rmt1dUJZZzVXbmJHSzBSMnFVWnVFRHdvaGxOZEx4bmZRWGNyVnp3VTZmdGY1?=
 =?utf-8?B?Y1pyUU5PK2ZwbVRBN2JEeHJmdFdmODI3OHdGQUNEdlp5dHhmalgrRkYvQ1NY?=
 =?utf-8?B?NWhsTWpnS1NCMkU0R3FPd0trVXltZWZ5TUZOWjEvdU5hN1lNZERtWWN4RjVC?=
 =?utf-8?B?aHJ6UmxodVJWcVllVmo4NStPQXFTZ1FrRlBCL20zbkRRMXRsRnR2TGMvcWNE?=
 =?utf-8?B?QTMrVUkrYVRJc0c2aERQSjFzUlkyK0xwSFZJa1V4QXZ2K1FDMzJvVWJmZ3hB?=
 =?utf-8?B?SGdTRmo4UUlTbG5kOEd2cDl1b3R0Zmg5ejI1Z2d0UEZwQWgzbjRSSE0zeTk4?=
 =?utf-8?B?bGxZWWc3L3ZhSFE1UGtEcUlkc1pncEJ6eXFYYVRPb1J0bndUWE56cGY1RENV?=
 =?utf-8?B?NC8rdGYrTnRDYjFPR0laTFNvbUY4cHFPWWh4czYzRklmNEVBMnVic2oxc0Vi?=
 =?utf-8?B?ODRIOVAvdFdjNzB5K2FEUXJQeEhaZlNUWmpmYlpOaXFBS2NidVBLSytoR2d5?=
 =?utf-8?B?QkJRMXN3VFBuUU9ub1JMdlBrU21OV3JMMGQxYXBnME16dkc1S0hPeFYvWWd2?=
 =?utf-8?B?UHN2Z1hIRWFsL0RYcXJleGphMGhlNUt2MUt2MjM0NFMxbjVqL0FUQUQ3c2FB?=
 =?utf-8?B?MGd3WFR1blY1RWF4NWp3TjdXUjZlaWZkOXM4a1dlMlpzNERvc25FalEzcnVV?=
 =?utf-8?B?TTg4T1ZsQURxdklvWFFSTENaODRSb2pKVnlsaCtoZmRwcGRUMmpWSFBpYVlj?=
 =?utf-8?B?MUxpdndQb0s5Uk1NbTNjRFRSUmNPUjFaUjF2ZFBMV3M2cVUvZk9MQ1ovOTg4?=
 =?utf-8?B?ZnpZem52d0gvNnRtamJOTnNVVmRyakM2UmVoSnVBMEZIMURla1lJUFpGRkVO?=
 =?utf-8?B?TkdCdWZpd3F5OGtQY1kvVllIN0hkY0UxUGErMjFOUTlrZXYyN0lFNFNOK2o0?=
 =?utf-8?B?Um1Cb3ZyMzRkS0pZSFNDYW1NL09Scll6S1FqTjhBbld4MkgybTJVYllXazRJ?=
 =?utf-8?B?MXl3ekRUQ1NzeUVDNk1OMkdBanREMGRYbG9maGJEQVE5ZzRlZHJ2eVRqVnBs?=
 =?utf-8?B?a2Y2UDVITDNXVU1abWo1UWNIN00yKzZyNkl6cjA1R2dtTkJtU1M5aVBZaWJK?=
 =?utf-8?B?eXNKLzBQMnB2VEJBSDVTNG5hNlEyRFdKV3AyWjRzcTFVK0dhNTJCV01KZkFk?=
 =?utf-8?B?dHFNSkdPY2d6VmVHazZsazRYV2F5R0FtWWFBSUgzamZtSXowcWFIeE80WW42?=
 =?utf-8?B?NG9TUE5SOGYyOWRrTSswY2F4Wk5nU1R2Ky94SHF6OVlZcHdpZlU4M0NNVFBl?=
 =?utf-8?B?ODVKeVdqVzNzVkZDdFFvcTFsNnQ0bEhzYUhmcG5TRXpDNmVzL0o2cTRhWFlk?=
 =?utf-8?B?azd2MTJYWmUzam5WRWc1dTZ0TldPL0tSajVCWEZ3OHBuR01YUjRPYVUrd2Fq?=
 =?utf-8?B?UWd4R3NzQzFxYnI2cTVLT1JsVnJwb0xHTEl3TkIrTFRVaEQ2NHdOaWFjMjc3?=
 =?utf-8?B?eU5SdWJCU0ZNS0Y4UFJNejcwdkEzVTErcFAwYnRqejdickx4aE9Xa3dYdEdv?=
 =?utf-8?B?ODNla1htQ2VqMURodEltbkdiNzdCMTBUU2pyYTZPcnJtS0Mrbng4bHVEaGEr?=
 =?utf-8?B?c2dHWTFxeXVVcDNXZjlDb0h5VTRwTmlCSXJlcEJRNlduekVoRnc4Smk1MzYz?=
 =?utf-8?B?WTlsaGRRY051YjlhZEpTRGtqTlpuZDUvWVlDUHk0dGhxQloxOGFudk9TZVht?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C37EB074D198A2408CFAF1A59E1FAB09@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a61f6-3b19-44c1-efcd-08dc1b7992b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 18:40:14.5544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIqN9Cj9no18tiyZLawloH6jsduWvqMbZGaJ6V8Vx4TYl+HykFLTqS7mrec5oVdih4YedgIfr7DIXjKWs6hS7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjI4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNC0wMS0yMiBhdCAwOTowNCAtMDgwMCwgSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSB3cm90ZToNCj4gPiBSaWdodCBub3cgZGV2Y29yZWR1bXAgaGFzIGEgbmV3IGxpbmUgYmV0
d2VlbiAnKioqKiBHdUMgQ1QgKioqKicgYW5kDQo+ID4gJ0gyRyBDVEIgKGFsbCBzaXplcyBpbiBE
Vyk6JyB3aGlsZSBvdGhlciBzZWN0aW9ucyBkb24ndCBoYXZlLg0KPiA+IA0KPiA+IENjOiBSb2Ry
aWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19jdC5jIHwgNCArKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfY3QuYw0KPiA+IGluZGV4IGVlNWQ5OTQ1NmFlYmMuLjBjMDczNTU2OTA5NDggMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gQEAgLTEzNjYsNyArMTM2Niw3IEBAIHZvaWQg
eGVfZ3VjX2N0X3NuYXBzaG90X3ByaW50KHN0cnVjdA0KPiA+IHhlX2d1Y19jdF9zbmFwc2hvdCAq
c25hcHNob3QsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47DQo+
ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHNuYXBzaG90LT5jdF9lbmFibGVkKSB7DQo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAsICJcbkgyRyBDVEIg
KGFsbCBzaXplcyBpbiBEVyk6XG4iKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZHJtX3B1dHMocCwgIkgyRyBDVEIgKGFsbCBzaXplcyBpbiBEVyk6XG4iKTsNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd1Y19jdGJfc25hcHNob3RfcHJpbnQoJnNuYXBz
aG90LT5oMmcsIHApOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkcm1fcHV0cyhwLCAiXG5HMkggQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOlxuIik7DQo+IA0KPiBX
aHkgbm90IGhlcmUgdG9vPw0KPiANCj4gQWxzbyBqdXN0IHZpc3VhbGx5IElNTyBpdCBpcyBuaWNl
IHRvIGhhdmUgdGhlIGV4dHJhIHNwYWNpbmcgaGVyZS4gSQ0KPiBkb24ndCBoYXZlIGEgc3Ryb25n
IG9waW5pb24gdGhvdWdoLg0KDQpUaGlzIHNlY3Rpb25zIG91dHB1dHMgbGlrZSBiZWxvdyB3aGF0
IGxvb2tzIGZpbmUgdG8gbWU6DQoNCioqKiogR3VDIENUICoqKioNCkgyRyBDVEIgKGFsbCBzaXpl
cyBpbiBEVyk6DQoJc2l6ZTogMTAyNA0KCXJlc3Zfc3BhY2U6IDANCgloZWFkOiAwDQoJdGFpbDog
NDI0DQoJc3BhY2U6IDU5OQ0KCWJyb2tlbjogMA0KCWhlYWQgKG1lbW9yeSk6IDQyNA0KCXRhaWwg
KG1lbW9yeSk6IDQyNA0KCXN0YXR1cyAobWVtb3J5KTogMHgwDQoNCkcySCBDVEIgKGFsbCBzaXpl
cyBpbiBEVyk6DQoJc2l6ZTogNDA5Ng0KCXJlc3Zfc3BhY2U6IDEwMjQNCgloZWFkOiAxMzcNCgl0
YWlsOiAwDQoJc3BhY2U6IDMwNzENCglicm9rZW46IDANCgloZWFkIChtZW1vcnkpOiAxMzcNCgl0
YWlsIChtZW1vcnkpOiAxMzcNCglzdGF0dXMgKG1lbW9yeSk6IDB4MA0KCWcyaCBvdXRzdGFuZGlu
ZzogMA0KDQpHdUMgSUQ6IDINCglOYW1lOiByY3MyDQoJQ2xhc3M6IDANCglMb2dpY2FsIG1hc2s6
IDB4MQ0KCVdpZHRoOiAxDQoJUmVmOiAyDQoJVGltZW91dDogNTAwMCAobXMpDQoJVGltZXNsaWNl
OiAxMDAwICh1cykNCglQcmVlbXB0IHRpbWVvdXQ6IDY0MDAwMCAodXMpDQoJSFcgQ29udGV4dCBE
ZXNjOiAweDAwNDM1MDAwDQoJTFJDIEhlYWQ6IChtZW1vcnkpIDQxNg0KCUxSQyBUYWlsOiAoaW50
ZXJuYWwpIDU1MiwgKG1lbW9yeSkgNTUyDQoJU3RhcnQgc2Vxbm86IChtZW1vcnkpIC0xMjQNCglT
ZXFubzogKG1lbW9yeSkgLTEyNQ0KCVNjaGVkdWxlIFN0YXRlOiAweDMNCglGbGFnczogMHg4DQoN
Cj4gDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiA+IEBAIC0xMzc1LDcgKzEzNzUsNyBAQCB2
b2lkIHhlX2d1Y19jdF9zbmFwc2hvdF9wcmludChzdHJ1Y3QNCj4gPiB4ZV9ndWNfY3Rfc25hcHNo
b3QgKnNuYXBzaG90LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3By
aW50ZihwLCAiXHRnMmggb3V0c3RhbmRpbmc6ICVkXG4iLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc25hcHNob3QtPmcyaF9vdXRzdGFu
ZGluZyk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7DQo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAsICJcbkNUIGRpc2FibGVkXG4iKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3B1dHMocCwgIkNUIGRpc2FibGVkXG4iKTsN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+IMKgfQ0KPiA+IMKgDQo+IA0KDQo=
