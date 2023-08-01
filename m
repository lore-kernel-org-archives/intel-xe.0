Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B8C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 06:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860D310E312;
	Tue,  1 Aug 2023 06:45:52 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5654810E313
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690872349; x=1722408349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nf0IVVMqpYP7+2NGXfkLZKVlXb3aCeFWiCeOclVKpCY=;
 b=IvIEhg7akOkloV+JRRL/ZOujERKo7DJl5dehS1Cd2iwn/v/Rf4n0u8sJ
 oL5fmnpka/b7a9YfdeCzwoU2EQa/F3yUKhm4jxWe03QiHepAhTMO+338z
 rrQbK1IsgFsOsvxSYaGmfc7cndXXKO22f1LSw5GB1BV14tsCXZapzqQ3j
 7YCx3+B5ZzQaUC3B9H2lv7spC6Fmkjkc7jpHH8m+uoznXUpCbwTk2IurS
 tX8OqKRneuP7XzcKvo8OXlJWnQWkTzyTl9PcVIObJO6vJ54e5NgHzyV6f
 Gm4GeEBrHnmUK5yS0Zr3N1vhR9Xt94qO2OKpHTsKug4n3vOB7WJViS+/5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371926318"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371926318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 23:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798539636"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="798539636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 23:45:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 23:45:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 23:45:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 23:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYUpclpeQds7YtO0Q+qGDe2IH4+gjQsY19LuJbFMdyelDqbsy5zDENplXJzpvtMfwOhW1gTOfNmCLSE08RMF47/kKUgKve3GdsMsKyAIOnPnnFz8e7oIn/eOFAjzrqeAQ5VW1bnVFbCjlpMLx67GxN2aqv1rD57QV35gfCG6QOMZY0WWTImYnpWl4ezHP+nxIACdO6Qjn7vXt91pNNZ5dByp5WDhxaLC+7vZ3VChQpQhKGOByQkJF5haNZM6FTflngr8KpBka1YltrEphAcbl3dRcjrPSfTlsClmX2ewc/MRstbRrYxy/FrgMONYuxKS52VcW3iWyL/oI2Z+VqCl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf0IVVMqpYP7+2NGXfkLZKVlXb3aCeFWiCeOclVKpCY=;
 b=CwWpMTqSac6z7xni6+ABa8A5mlUj+FSMvhKTwFebksCMmPev7V3QUYqQw8o61WccUWl+t4G2YhElgSR25jvmPnu/IiPerIC/0LbyAxKXnCchDEzQlbXmR9CEAToG4lnFzAxVaiT+xqaQSWjgjBuMne1n+Mnxfnf7ctOKT2LOs0Ali8h1+ZXYdTxtzD5mnSTp0r3w9P7WvZEh450QSAbb3UfkhmCThxTVe+oTlLJMuZw+aJo18BBjmg7oYugOLg0S2WC3w07YTC0GYzptZ+rgzIcoWD5yq/9yhjx80j48BA+Lpk9OgrPJyFbPzh97TuS4ScOB2pcToRKT5zQhl3icEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB6655.namprd11.prod.outlook.com (2603:10b6:806:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Tue, 1 Aug
 2023 06:45:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 06:45:46 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
Thread-Index: AQHZwBf59cfM18kIo0W+TuHXjgNGlK/T9sqAgAAOnNCAAPXcAIAAAtdQ
Date: Tue, 1 Aug 2023 06:45:46 +0000
Message-ID: <MW4PR11MB7056C765077F19BD80A6A99EB30AA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
 <ZMfFaXW7607Cy45j@bvivekan-mobl>
 <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZMif6Huf+E95GL3J@bvivekan-mobl>
In-Reply-To: <ZMif6Huf+E95GL3J@bvivekan-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SN7PR11MB6655:EE_
x-ms-office365-filtering-correlation-id: d72493e5-bffb-4e4e-3329-08db925aef3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O1pZ4bR7iMsQ04Fh+jbhLPSnFx2C5BVgTsd7NglGITS1vYXPBXEkH4pkvlXPZMp7uRbbDDLPTMIB7W2YXXikbLYAwuTy+a2yd0+AhC5jzYVDeJNiV+8SbQ6YNeQeJQA7nNuNl6iRv2WWM42hsYfXayYi3EdN+uLu9FQ9g2FdZWXS/4KtPfXha0Zui+Rcp24e6Z8jUcuIaS8yZwtKZKAMMgGyG9YV4fbdOr3heWb5KcIQA8xYl/AsgrZzxSnoBjVi/Gtpxe7YDD4AUur6YGjZTlq1BtLOFPWIHpFqm2pDInIdUZETtxZZBLlUKgZMAC50a7gVgUFsJcCxsid2Hp9ae2A7QX/kAJZExRVAVp/BKEy25QKjYbcG45aDRiHHrcH3zpYjEVdHGkzLsJ2OdEGlcl65NRDDSYJep3cTaN8gteeXeKB5JjPj2pOmNuXczk9swiwDZt1+PRd/QLo5Fx8fyzYH+7dDq9HbxKO/xy+FPN3wgfJtBQ6K+jV54Kyl/XMJ9T7LHQ88RxyPhsGAnkDOsWwabq4GXh0UKslBFIDLsRh/YyqtsdutRea02YS8BoAkwsGMgzl/7HNTwY9ZhgykxqKWAxoaVP7FxHVObTSUrKU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(66476007)(53546011)(107886003)(54906003)(478600001)(186003)(6506007)(82960400001)(110136005)(966005)(26005)(122000001)(7696005)(71200400001)(9686003)(66556008)(4326008)(64756008)(66446008)(66946007)(83380400001)(38100700002)(76116006)(5660300002)(52536014)(33656002)(41300700001)(38070700005)(2906002)(316002)(8936002)(8676002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzZubEJzSUxoek1KbUZOWnBkVFkybGoyUXJ0d2o5czk2TWdTZmNDZWlsbmpk?=
 =?utf-8?B?NmFRRFRwbzBlSXplRkxjL0NuTTdUdmx2QlpqemRqSzJyZGNtRml6S3JDbWRu?=
 =?utf-8?B?Z2thUCtMaFZiaHZKTDZ3SDRLQ0dWc1psWkJkRG9DT21hYktUQ01uWm45WnJr?=
 =?utf-8?B?Z1orZDdiQVA0TWd1eXdTOWIwVDZRejR4azNWdGRTQysrbHRDU3MrNXpORTVl?=
 =?utf-8?B?QVVqbjBIVkNWWWhSV2pHR0hPTjZSUk93d2d3amRuSy94cGxoU3l5a29oUkYw?=
 =?utf-8?B?REsydnRIS1JHL2xNOFNoSitWcVZEVzJuWnVjeFdOM2xleFBJWHh4UERFaHVT?=
 =?utf-8?B?aElCN3NzSkxJeG5aejRyYVhUSEF0Tk8rVWxGS0UxK1BmaE1LZlVvU0g5Vy9x?=
 =?utf-8?B?N01KTERlajNOeElXVGhaY255SlU3NW5VMklmNVZwTTRMMmhwTGtnbXU5WWJK?=
 =?utf-8?B?RHIzOFpiWHRFczJvcE1WTW1BTW9LcHBwWHc2eE9tVFVJT3Z4NXJhZzI4L1po?=
 =?utf-8?B?S0lnclRtWk4rQ0Y4YVpoU24ya09rV0tpYldObmlua3FycnIvTThoV1VRTGtj?=
 =?utf-8?B?Tmp0bklKOEtHYVpFaEYrTmtHNGdwZkp0YkgyaW1NaFA4MXJHOUNzeUlFK2g4?=
 =?utf-8?B?ZHYvTnlscFlkVjJzQUNXbjY3TFY3T0tWMUdpanUvTUs4WXNzb3M5WmdYaGdv?=
 =?utf-8?B?eDlveklHSkY2VVVXcFNkV1VXWEtObVBDMExrRmJFSGNHWDBDa3NvSTBVOERM?=
 =?utf-8?B?VkxTRjZGaFA0KzJmTHZ3Um9TWEtVNlJSak5tY2I0Vm9RZlUyUEpRcHdSd1k5?=
 =?utf-8?B?WVNiV3NKamtwTTcxVE82ZGlsUm1KNkIxU3RRbWQvU0RFWWFZQ1orU3dWeFQ3?=
 =?utf-8?B?WDk4OHB4bUtlRDlpZ21oZzFCYkVpNWRYMlZybzlPVDZ0SlF3UzZkeGc1M2pG?=
 =?utf-8?B?OXlZVDZJZkxUTW10UWQwV2cvTkwrWXc4VHBpNEhWOU15UXlNMWJYQTJQNm40?=
 =?utf-8?B?aVlzTHNOU3ByQndPMTluRXBqbTZKVGgyNDhxOWRXMEJtNEVSdzRKTEFMOGQw?=
 =?utf-8?B?NEpEMFR5eC9jWmxzK3QzeWpJZ09WRXc4RHpsa1BJQmthZXpUOWJxSUcvbnBa?=
 =?utf-8?B?dmdONUlaUEF2M0xnbzc4eVRxYUt6YjMrWTZlSEpvakRnc3p0bmV5VGFtTlZj?=
 =?utf-8?B?OWtxYzEyVC9kYXlZUmQ1N3BsajlSZjkwSzFuT0RmNnFGeU56bmI2bVpiMldn?=
 =?utf-8?B?WEZnTXIxcnMzN0hDN25LeXExQkJQQUpFQ2ZPa1A1RmFMRlhTdk5nQU84Qm1V?=
 =?utf-8?B?WWZHTlZ0TUI5OGhDbEVVT2tpSGlZek13akVlbmVRSzlVUVkvUW9xa0QvL2Nn?=
 =?utf-8?B?TVdHaHdHbVRiQXJ0Qi9mc1Y2eUNlaTV3NWxlNEJiYlFFN2ozdndDVXZSU0pE?=
 =?utf-8?B?bXdWSnZqSGJ0T01rcGlnL2ZBV0ZuZHd4Yzl1VVJrdnBkNkQ2VFR3bW1XODNl?=
 =?utf-8?B?S3hTcDJhL2pqZXB1RThWSzU0TU94WG55OVBBVTZlb0pNd3dGREhFbWE5VHhx?=
 =?utf-8?B?LzFpbWVid2dvS3hlaWx6dXdLMmFnK09TUUJGWVhoUUFNSUJheElqL2pBZ3Q2?=
 =?utf-8?B?eUxxajhMQkU3Y25MVkhzQXoyb1JSRWM4ZFpxMXZNN2tOL3BzUzE5MVFmaVdw?=
 =?utf-8?B?QUhLT2Zyd1hrcmt1ZmtCb1FjaXVQS1V6TTZQVlF5TDFvd0N2dkR3VjlsTm1N?=
 =?utf-8?B?YXNZVWlHS21MZERCZkVjVGpjbnJpNktPcldzUXBERWhlUTVwSklLRklnZ0ph?=
 =?utf-8?B?TDYrUkxIQkJRZjhGS2xYSW95Vk1zTHplMFJpZkM1K0FhL3E3RC9lL3FJOVFJ?=
 =?utf-8?B?UXRIODkwUEltdytmK052bWFYMUVRMUpCcXd5b3lTSnBnTlIySUFoYU93R2dQ?=
 =?utf-8?B?MWYrSVRkMDNTdTBBQWZuZUI0dGFXQ3JMdzU2YlNMc2E3bmZ1YWxGVmliVnZR?=
 =?utf-8?B?Vk9wRGs2bEg0U3NGa3pNbk8yZlA0YWs2aWdrRGd1Y0RQQzJoeEJLN2R4N3Rq?=
 =?utf-8?B?TjhBL3FVNUdVNWZjWmZHckNzM0dRZXl1WGRIZmhzRWp4UDkzcDZ3aFhDMmFv?=
 =?utf-8?B?cVlTZjBLN3FUYVhWaGdWQ3ZCa25HaGNrbVJmNjJhdzZ3OFBrT0dPMlhaY0Rr?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72493e5-bffb-4e4e-3329-08db925aef3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:45:46.1610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfpXdDR0Pbr0eDh9nucp2zN56dGRBxNM38zP1pyXdfupglxWPqXm03dGuUxMFwe5oija/ri4uhP+WsLDWgh7Qtc8DrqJ8tjElH+k6Wh+22w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6655
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IDAxIEF1Z3VzdCAyMDIzIDExOjMyDQo+IFRvOiBHaGltaXJheSwgSGltYWwgUHJhc2Fk
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIHY5IDMvM10gZHJtL3hlOiBJbnRyb2R1Y2UgZmF1
bHQgaW5qZWN0aW9uIGZvciBndA0KPiByZXNldA0KPiANCj4gT24gMzEuMDcuMjAyMyAyMDo1NCwg
R2hpbWlyYXksIEhpbWFsIFByYXNhZCB3cm90ZToNCj4gPiBIaSBCYWxhLA0KPiA+DQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVml2ZWthbmFuZGFuLCBCYWxh
c3VicmFtYW5pDQo+ID4gPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0K
PiA+ID4gU2VudDogMzEgSnVseSAyMDIzIDIwOjAwDQo+ID4gPiBUbzogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47IGludGVsLQ0KPiA+ID4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVj
YXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA+ID4gPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggdjkgMy8z
XSBkcm0veGU6IEludHJvZHVjZSBmYXVsdA0KPiA+ID4gaW5qZWN0aW9uIGZvciBndCByZXNldA0K
PiA+ID4NCj4gPiA+IE9uIDI3LjA3LjIwMjMgMDQ6NTYsIEhpbWFsIFByYXNhZCBHaGltaXJheSB3
cm90ZToNCj4gPiA+ID4gVG8gdHJpZ2dlciBndCByZXNldCBmYWlsdXJlOg0KPiA+ID4gPiAgZWNo
byAxMDAgPg0KPiA+ID4gPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvPGNhcmRYPi9mYWlsX2d0X3Jl
c2V0L3Byb2JhYmlsaXR5DQo+ID4gPiA+ICBlY2hvIDIgPiAgL3N5cy9rZXJuZWwvZGVidWcvZHJp
LzxjYXJkWD4vZmFpbF9ndF9yZXNldC90aW1lcw0KPiA+ID4gPg0KPiA+ID4gPiBDYzogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gPiBDYzogTHVjYXMgRGUgTWFy
Y2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IFJldmlld2Vk
LWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheQ0KPiA+ID4gPiA8aGltYWwucHJhc2FkLmdo
aW1pcmF5QGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGVidWdmcy5jIHwgMTAgKysrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0LmMgICAgICB8ICA4ICsrKysrKystDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3QuaCAgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gPiA+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPg0KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiA+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgaW5kZXgNCj4gMDQ3MzQxZDU2ODlhLi4xZmQw
MTZlNmY3YTANCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZWJ1Z2ZzLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVn
ZnMuYw0KPiA+ID4gPiBAQCAtNSw2ICs1LDcgQEANCj4gPiA+ID4NCj4gPiA+ID4gICNpbmNsdWRl
ICJ4ZV9kZWJ1Z2ZzLmgiDQo+ID4gPiA+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZmF1bHQt
aW5qZWN0Lmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc3RyaW5nX2hlbHBlcnMuaD4NCj4g
PiA+ID4NCj4gPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4NCj4gPiA+ID4gQEAg
LTIwLDYgKzIxLDEwIEBADQo+ID4gPiA+ICAjaW5jbHVkZSAieGVfdm0uaCINCj4gPiA+ID4gICNl
bmRpZg0KPiA+ID4gPg0KPiA+ID4gPiArI2lmZGVmIENPTkZJR19GQVVMVF9JTkpFQ1RJT04NCj4g
PiA+ID4gK0RFQ0xBUkVfRkFVTFRfQVRUUihndF9yZXNldF9mYWlsdXJlKTsNCj4gPiA+ID4gKyNl
bmRpZg0KPiA+ID4gPiArDQo+ID4gPiA+ICBzdGF0aWMgc3RydWN0IHhlX2RldmljZSAqbm9kZV90
b194ZShzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqbm9kZSkgIHsNCj4gPiA+ID4gIAlyZXR1cm4gdG9f
eGVfZGV2aWNlKG5vZGUtPm1pbm9yLT5kZXYpOyBAQCAtMTM1LDQgKzE0MCw5IEBADQo+ID4gPiB2
b2lkDQo+ID4gPiA+IHhlX2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ID4gPiA+DQo+ID4gPiA+ICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkNCj4gPiA+ID4gIAkJeGVf
Z3RfZGVidWdmc19yZWdpc3RlcihndCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNpZmRlZiBDT05G
SUdfRkFVTFRfSU5KRUNUSU9ODQo+ID4gPiA+ICsJZmF1bHRfY3JlYXRlX2RlYnVnZnNfYXR0cigi
ZmFpbF9ndF9yZXNldCIsIHJvb3QsDQo+ID4gPiA+ICsmZ3RfcmVzZXRfZmFpbHVyZSk7ICNlbmRp
Zg0KPiA+ID4gPiArDQo+ID4gPiA+ICB9DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGlu
ZGV4IDVlNzBlNDg2YjI3Yy4uNjkxZTNiYWY5N2M5DQo+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiBAQCAtNTI1LDYgKzUyNSwxMSBAQCBzdGF0aWMgaW50
IGd0X3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiA+DQo+ID4gPiA+ICAJeGVfZ3RfaW5m
byhndCwgInJlc2V0IHN0YXJ0ZWRcbiIpOw0KPiA+ID4gPg0KPiA+ID4gPiArCWlmICh4ZV9mYXVs
dF9pbmplY3RfZ3RfcmVzZXQoKSkgew0KPiA+ID4gPiArCQllcnIgPSAtRUNBTkNFTEVEOw0KPiA+
ID4gPiArCQlnb3RvIGVycl9mYWlsOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+ID4gPiAg
CXhlX2d0X3Nhbml0aXplKGd0KTsNCj4gPiA+ID4NCj4gPiA+ID4gIAl4ZV9kZXZpY2VfbWVtX2Fj
Y2Vzc19nZXQoZ3RfdG9feGUoZ3QpKTsNCj4gPiA+ID4gQEAgLTU2Myw2ICs1NjgsNyBAQCBzdGF0
aWMgaW50IGd0X3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiA+ICBlcnJfbXNnOg0KPiA+
ID4gPiAgCVhFX1dBUk5fT04oeGVfdWNfc3RhcnQoJmd0LT51YykpOw0KPiA+ID4gPiAgCXhlX2Rl
dmljZV9tZW1fYWNjZXNzX3B1dChndF90b194ZShndCkpOw0KPiA+ID4gPiArZXJyX2ZhaWw6DQo+
ID4gPiA+ICAJeGVfZ3RfZXJyKGd0LCAicmVzZXQgZmFpbGVkICglcGUpXG4iLCBFUlJfUFRSKGVy
cikpOw0KPiA+ID4gPg0KPiA+ID4gPiAgCS8qIE5vdGlmeSB1c2Vyc3BhY2UgYWJvdXQgZ3QgcmVz
ZXQgZmFpbHVyZSAqLyBAQCAtNTg0LDcgKzU5MCw3DQo+ID4gPiA+IEBAIHZvaWQgeGVfZ3RfcmVz
ZXRfYXN5bmMoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+ID4gIAl4ZV9ndF9pbmZvKGd0LCAidHJ5
aW5nIHJlc2V0XG4iKTsNCj4gPiA+ID4NCj4gPiA+ID4gIAkvKiBEb24ndCBkbyBhIHJlc2V0IHdo
aWxlIG9uZSBpcyBhbHJlYWR5IGluIGZsaWdodCAqLw0KPiA+ID4gPiAtCWlmICh4ZV91Y19yZXNl
dF9wcmVwYXJlKCZndC0+dWMpKQ0KPiA+ID4gPiArCWlmICgheGVfZmF1bHRfaW5qZWN0X2d0X3Jl
c2V0KCkgJiYgeGVfdWNfcmVzZXRfcHJlcGFyZSgmZ3QtPnVjKSkNCj4gPiA+DQo+ID4gPiBXaGVu
IGBmYWlsX2d0X3Jlc2V0L3Byb2JhYmlsaXR5YCBpcyBzZXQgdG8gYSBsZXNzIHRoYW4gMTAwIHZh
bHVlLA0KPiA+ID4gdGhlbg0KPiA+ID4geGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KCkgd2lsbCBu
b3QgYWx3YXlzIHJldHVybiB0cnVlLiBTbyBpZiB0aGUNCj4gPiA+IHhlX2ZhdWx0X2luamVjdF9n
dF9yZXNldCgpIHJldHVybnMgZGlmZmVyZW5ldCB2YWx1ZXMgd2hlbiBpbnZva2VkDQo+ID4gPiBm
cm9tDQo+ID4gPiB4ZV9ndF9yZXNldF9hc3luYygpIGFuZCBndF9yZXNldCgpLCB3ZSB3aWxsIGhh
dmUgdW5leHBlY3RlZCBiZWhhdmlvdXIuDQo+ID4gPg0KPiA+ID4gV2Ugc2hvdWxkIGF2b2lkIGNh
bGxpbmcgeGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KCkgbW9yZSB0aGFuIG9uY2UgaW4NCj4gPiA+
IGEgc2luZ2xlIHJlc2V0IGN5Y2xlLg0KPiA+ID4gV2UgY291bGQgZXhpdCBpbW1lZGlhdGVseSBp
biB4ZV9ndF9yZXNldF9hc3luYygpIGlmIGZhdWx0IGluamVjdGlvbiBpcw0KPiBlbmFibGVkLg0K
PiA+IEludGVudGlvbiBoZXJlIGlzIHRvIGNhdXNlIG5leHQgcmVzZXQgZmFpbC4gVW5sZXNzIHlv
dSBtYWtlIHRoZSBwcm9iYWJpbGl0eQ0KPiAxMDAgdGhhdCBpcyBub3QgZ3VhcmFudGVlZC4NCj4g
PiBBbmQgbm8ub2YgdGltZXMgbW9yZSB0aGFuIDEgYXJlIHBlcmZlY3RseSBmaW5lIGFzIGxvbmcg
YXMgcHJvYmFiaWxpdHkgaXMgMTAwLg0KPiA+IEV2ZW4gaW4gY29tbWl0IG1lc3NhZ2UgaXQgaXMg
bWVudGlvbmVkIGNsZWFybHkgdG8gdXNlIHByb2JhYmlsaXR5IGFzIDEwMC4NCj4gDQo+IFRocm91
Z2ggdGhlIGNvbW1pdCBtZXNzYWdlIGl0IGlzIHVuZGVyc3Rvb2QgdGhhdCB3ZSBuZWVkIHRvIHN1
cHBseSAxMDANCj4gYW5kID4xIHZhbHVlcyBmb3IgcHJvYmFiaWxpdHkgYW5kIG5vIG9mIHRpbWVz
IGRlYnVnZnMgZW50cmllcy4gQnV0IGl0IGRvZXNuJ3QNCj4gcHJldmVudCBhbnlvbmUgZnJvbSB0
cnlpbmcgb3RoZXIgdmFsdWVzLiBJbiBzdWNoIGNhc2VzLCBpdCBpcyBmaW5lIGZvciB0aGUgZmF1
bHQNCj4gaW5qZWN0aW9uIHRvIG5vdCB3b3JrLCBidXQgaXQgc2hvdWxkIG5vdCBjYXVzZSBhbnkg
aXNzdWVzIGluIHRoZSBkcml2ZXIuDQo+IEkgdGhpbmsgaWYgeGVfZmF1bHRfaW5qZWN0X2d0X3Jl
c2V0KCkgcmV0dXJucyBmYWxzZSBpbg0KPiB4ZV9ndF9yZXNldF9hc3luYygpIGFuZCB0cnVlIGlu
IGd0X3Jlc2V0KCksIHRoZW4gd2Ugd2lsbCBlbmQgdXAgaW4NCj4geGVfdWNfcmVzZXRfcHJlcGFy
ZSgpIGludm9rZWQgYnV0IG5vIGd0IHJlc2V0IGNvbXBsZXRlbHkgZXhlY3V0ZWQuDQo+IFRob3Vn
aHQgSSBoYXZlbid0IGFuYWx5emVkIGhvdyBpdCB3b3VsZCBpbXBhY3QgZHJpdmVyLCBJIHRoaW5r
IHRoZSBkcml2ZXINCj4gd291bGQgYmUgbGVmdCBpbiBzb21lIHVuZXhwZWN0ZWQgc3RhdGUuIFdl
IHNob3VsZCBhdm9pZCB0aGlzLg0KPiANCj4gV3JvbmcgdmFsdWVzIGZvciB0aGUgZGVidWdmcyBl
bnRyaWVzIHNob3VsZCBoYXZlIG5vIGltcGFjdCBvbiB0aGUgZHJpdmVyLg0KV3JvbmcgdmFsdWVz
IGluIGRlYnVnZnMgd2lsbCBhbHdheXMgaW1wYWN0IGRyaXZlciBoZXJlLg0KMSkgSWYgcHJvYmFi
aWxpdHkgaXMgbm90IDEwMC4gDQpZb3UgZG9u4oCZdCBrbm93IHdoaWNoIHJlc2V0IHdpbGwgZmFp
bCBhbmQgd2hpY2ggd2lsbCBwYXNzLCB3aGljaCBpcyBmdXJ0aGVyIGluZGV0ZXJtaW5pc3RpYyBm
cm9tIHNvZnR3YXJlIHBlcnNwZWN0aXZlLg0KU28gcGFzc2luZyB3cm9uZyB2YWx1ZSB0byBwcm9i
YWJpbGl0eSB3aWxsIGltcGFjdCBpcnJlc3BlY3RpdmUgb2YgdGltZXMuDQoyKSBJZiBwcm9iYWJp
bGl0eSBpcyAxMDAgYW5kIHRpbWVzID0gLTEsIGFsbCB0aGUgcmVzZXRzIHdpbGwgZmFpbCBpcnJl
c3BlY3RpdmUgd2Ugd2FudCBmYXVsdCBpbmplY3Rpb24gb3Igbm90LiANCg0KU28gcGFzc2luZyBv
ZiB3cm9uZyB2YWx1ZXMgaXMgc29tZXRoaW5nIHdlIGNhbnQgZ3VhcmFudGVlIHRvIHdvcmsgd2l0
aCBpbiBjYXNlIG9mIGZhdWx0X2luamVjdGlvbi4NCkp1c3QgdG8gbWFrZSBjb2RlIGZsb3cgd29y
ayB3aXRoIHRpbWVzID0gMSwgIEkgY2FuIGNhY2hlIHRoZSBzdGF0ZSBvZiB4ZV9mYXVsdF9pbmpl
Y3RfZ3RfcmVzZXQoKSBhbmQgdXNlIGl0IEluIGJvdGggcGxhY2VzLCANCmJ1dCBpdCBkb2Vzbid0
IGhlbHAgd2l0aCBwYXNzaW5nIG9mIHdyb25nIHZhbHVlcyB0byBkZWJ1Z2ZzIGF0IGFsbC4NCg0K
SGFkIGRpc2N1c3Npb24gd2l0aCBhcmNoaXRlY3RzICByZWdhcmRpbmcgdGhpcyBiZWZvcmUsIGlt
cGxlbWVudGF0aW9uOg0KUXVlcnk6ICIgT24gZnVydGhlciBleHBsb3JhdGlvbjogIEluIGZhdWx0
IGluamVjdGlvbiBtZWNoYW5pc20gdGhlIHByaXZpbGVnZSB1c2VyIGNhbiBtYWtlIGFsbCB0aGUg
cmVzZXRzIGZhaWwsIHdoZXJlYXMgaW1wYWN0IG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMTE5Nzg0LyBpcyBsaW1pdGVkIHRvIHRoZSAgcmVzZXQgY2F1c2VkIGJ5
IHRoaXMgcGFydGljdWxhciBkZWJ1Z2ZzLg0KZm9yIGV4YW1wbGUgOiBpZiB1c2VyIHNldHMgYXR0
cjogdGltZXMgPSAtMSggbWVhbmluZyB1bmxpbWl0ZWQgKSBhbmQgYXR0ciBwcm9iYWJpbGl0eSBh
cyAxMDAsIGFsbCB0aGUgdHJpYWxzIHRvIGd0X3Jlc2V0IHdpbGwgZmFsbCAgZHVlIHRvIGZhdWx0
IGluamVjdGlvbi4gIFRoaXMgc2hvdWxkbid0IGJlIG9mIGNvbmNlcm4gYXMgbG9uZyBhcyB3ZSBh
cmUgc2V0dGluZyBjb3JyZWN0IHZhbHVlcy4iDQoNClJlc3BvbnNlIHdhczoNCiIgWWVhaCwgdGhl
cmUgc2hvdWxkIGJlIG5vIGNvbmNlcm4gb24gdXNlciB3cml0aW5nIGJhZCB2YWx1ZXMgdG8gZGVi
dWdmcywgaXQncyBtb3N0bHkgb25seSBzeXNmcyB3ZSBuZWVkIHRvIGJlIGNhcmVmdWwgd2l0aCIN
Cg0KPiANCj4gUmVnYXJkcywNCj4gQmFsYQ0KPiANCj4gPg0KPiA+IEJSDQo+ID4gSGltYWwNCj4g
PiA+DQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gQmFsYQ0KPiA+ID4gPiAgCQlyZXR1cm47DQo+ID4g
PiA+DQo+ID4gPiA+ICAJeGVfZ3RfaW5mbyhndCwgInJlc2V0IHF1ZXVlZFxuIik7IGRpZmYgLS1n
aXQNCj4gPiA+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5oIGluZGV4DQo+ID4gPiA+IDcyOTg2NTNhNzNkZS4uY2FkZWQyMDNhOGEwIDEw
MDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0KPiA+ID4gPiBAQCAtNyw2ICs3LDcgQEAN
Cj4gPiA+ID4gICNkZWZpbmUgX1hFX0dUX0hfDQo+ID4gPiA+DQo+ID4gPiA+ICAjaW5jbHVkZSA8
ZHJtL2RybV91dGlsLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+
DQo+ID4gPiA+DQo+ID4gPiA+ICAjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+ID4gPiA+
ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ID4gPiA+IEBAIC0xNiw2ICsxNywxOSBAQA0K
PiA+ID4gPiAgCQlmb3JfZWFjaF9pZigoKGh3ZV9fKSA9IChndF9fKS0+aHdfZW5naW5lcyArIChp
ZF9fKSkgJiYgXA0KPiA+ID4gPiAgCQkJICB4ZV9od19lbmdpbmVfaXNfdmFsaWQoKGh3ZV9fKSkp
DQo+ID4gPiA+DQo+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0ZBVUxUX0lOSkVDVElPTg0KPiA+ID4g
PiArZXh0ZXJuIHN0cnVjdCBmYXVsdF9hdHRyIGd0X3Jlc2V0X2ZhaWx1cmU7IHN0YXRpYyBpbmxp
bmUgYm9vbA0KPiA+ID4gPiAreGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KHZvaWQpIHsNCj4gPiA+
ID4gKwlyZXR1cm4gc2hvdWxkX2ZhaWwoJmd0X3Jlc2V0X2ZhaWx1cmUsIDEpOyB9ICNlbHNlIHN0
YXRpYyBpbmxpbmUNCj4gPiA+ID4gK2Jvb2wNCj4gPiA+ID4gK3hlX2ZhdWx0X2luamVjdF9ndF9y
ZXNldCh2b2lkKSB7DQo+ID4gPiA+ICsJcmV0dXJuIGZhbHNlOw0KPiA+ID4gPiArfQ0KPiA+ID4g
PiArI2VuZGlmDQo+ID4gPiA+ICsNCj4gPiA+ID4gIHN0cnVjdCB4ZV9ndCAqeGVfZ3RfYWxsb2Mo
c3RydWN0IHhlX3RpbGUgKnRpbGUpOyAgaW50DQo+ID4gPiA+IHhlX2d0X2luaXRfZWFybHkoc3Ry
dWN0IHhlX2d0ICpndCk7ICBpbnQgeGVfZ3RfaW5pdChzdHJ1Y3QgeGVfZ3QNCj4gPiA+ID4gKmd0
KTsNCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4yNS4xDQo+ID4gPiA+DQo=
