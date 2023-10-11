Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77176CD6E7A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5D10E8B2;
	Wed, 11 Oct 2023 14:27:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230C510E8B2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697034463; x=1728570463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J6M5olVILrRIOoBb9CWSPAiFyXlIEMOy1pF67iAPKc4=;
 b=aVbCCAfwjDqtYVE6OnLq5XYZOnLUZEOQJPTO3SQmtyxnI1WHu5yu+ZkN
 ycGHFIXP2RGcqpI4AWgtdoxED8DkWRgB8tYFhZBzm95fuGAQ/MxhIsWuf
 BBhNe29fH12VZ+czenqdPaXMXNaAhKFHWAgptGssJeOe7a469Pi3BagYX
 NBhuTEO1e/k9P7hVhFTFe8i32qhjdI/YyYXYoYQvRhPfeOIbv2E+Z3taD
 /hAeN5hhQXNG5S3Yspi5myGMuVoks8IxpSVfgEtTmfenH0z1wocBFyrbX
 rrwW61FelYYf6fwYeNe6cZV6XaHGtuNF27h72k4S6oli27E2O80oAabBp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6235631"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="6235631"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001125302"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="1001125302"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:15:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:15:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:15:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIxKdOynav7AifP1TuABTbraspszeCYzeHf8/HRnMB2IvyDrxK+LXz+zgxrvAHMtriUGPvhZ8D8RDRRfisdTA4gE9qrMMWZYQ4dFhuYJzNr987t3hC6Ee+x3UfNCTTVhJDUDIx8Pe4/nWUEtuCQVHlohkb/EfD168ffS3dSQHMNUR/hsiv3adZmEANTjri5+UTRqeU61R6HZOfTGuUuK/ZjN3sUwBDB6CTXUGomVwf1xd8L1dScCwmHeGGIeOZg58X3+kx7R0izDgORXIfF46diFyhBDPS3VGkUZAnZ5jKSq/G9nh3qUioigYnoHny0PE9dLhS+rGXas3GGwa5JZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6M5olVILrRIOoBb9CWSPAiFyXlIEMOy1pF67iAPKc4=;
 b=WSzv4FTeo1Fu3LYO7DWH24/JOFD5yT6jlvVmGF8bN3VpMW7tUxKTCwNRkW1Tlro2T3qfWJ7uFbmRWjh+0EkRfndGfyXvbvgSo3P056ruh32VdcOarKrdDcNniop54CV2p9njBg5VAOW3Tcv0uEsTnYfr6CB2N3wGdE8wJr1pz2Xj+0sZsHUSzMbUcBHuoSmsHvCSpNQqvxFWuzgJBAUXfW/eTjqUpmnY08ivUVJDIWDCEhXqYpkWWY2ShEknPRBPUZwfOr63/ukPB+jylHD4QqJd7eTETbNit06QEX/dNC+3hHgUtuO61XRWT63o9skNsEgq98IJHQXYuFU4G/decA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 14:15:36 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 14:15:36 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [RFC v1 16/17] drm/xe/uapi: Be more specific around
 GuC Version Type
Thread-Index: AQHZ/EtrTBbvYJBW0kiBJpPizguMbrBEojMA
Date: Wed, 11 Oct 2023 14:15:36 +0000
Message-ID: <a7f008990493052b07b8662ac704bca9e81935b7.camel@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-17-francois.dugast@intel.com>
In-Reply-To: <20231011135926.7-17-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: 3bf25317-2782-48f6-0011-08dbca6489d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x+JL/8VSV798j4woiCvpWO//wLEI2jKR8VprmOrDXMvg3sJ+nlsBREmeKh9GPctcesdx5hTtBIZuZ6J56zxsexIXEHNnDKpHMLKCi/LEE3qpjzpyYsobvT/cXBOpl1k4BWH8ADjcxBa07MkVCmObP4lCc/PXIgRzZuAdgrouwOcFnW61dZ7PvuZUk/83im+Gge6g9qF1bGFUIxSoYVrHNM8/RPnlrdXRTDKnGyUnJYKIMFgdpoL7XfvdjPuRgR+SMI+vvfY9HXtjWPfi7vgzl2ZdSKSYASpZghpHBIPCsFtzeFbdMq5xFnE5Qsea0s6OEpkUxa056B9kKd3svhm53Are8gm+8ru0mx/Anbtusr21heStsmUOJhEGxz3lWkosqJQQveN8bxpA5D6nFSXp3TjqbJAeKnulIxBLX+xkXtQgHeiz/RUefFyphEepRCGRbG+hJlqsW+Dycpmy6DFAfLr3x92A0KSlbn8BSbNRTgqp5RQSy6K8GpnpzUW14PW/Jqph2hec7p+0ul7p25jPjbrveW18dAEII6QLmh+ZdrdMejPhfREjLp1L0WH0veFDVpP4vhu8UwPYDqRt5qXNYNG9g/dRb3NClLvPJ3ZFzu6M1Zk6HAUfrb0FkOb117ru
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6486002)(478600001)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(316002)(6636002)(91956017)(110136005)(66946007)(86362001)(38070700005)(122000001)(82960400001)(2906002)(8676002)(8936002)(36756003)(4001150100001)(38100700002)(4326008)(5660300002)(41300700001)(26005)(6512007)(2616005)(83380400001)(107886003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXhOT3pmdG16RThybkx3MWtYY1dJc0JwNTFrTUJrUllaaGQ5UVJWbVNsTW9N?=
 =?utf-8?B?dXpkclVicTBReUtjUndJKzVEUGFocmEvVzhlSTh3dkw3VTdNbEZDZ0VYbm9h?=
 =?utf-8?B?bmhmM2JwUkVXWVVsSkZxMUpmWjZiYzdpNTNKQ2J5ZFN5SFNQS0JZVVFITDFr?=
 =?utf-8?B?QW5kTHM2VUUrUThlWUNmZlZFQzFmNTRVdmoxdlVxTmVBUG9qZTVjdTdKWTBl?=
 =?utf-8?B?ZlBjUGRwbmlReW5ZTjd0dytOS2tHMlloTERodTJpNzhRTXQ3ZWRMZU9pSmQ3?=
 =?utf-8?B?eGZQL2s2SEdLV3l6dUcxaWx3MG1sTGI4dThBbERLOUJ1QkU1ZklqQVAwOGRa?=
 =?utf-8?B?d21zRHdRWDVWL0U3ZVdHencralpodUw4aFNCR21XTjlQTzFOZEYwYjhSem9r?=
 =?utf-8?B?d0xoc2QvRm8wd0h4dDVjVmJ4dFdudHVPSitQYWx2anhKWW1ocGNLMHJ6VVBF?=
 =?utf-8?B?czdESjBkbmU3Y2pzeVlZelA1bnI0SVBtT1RlNnBOQUhRbVlYQllqTG85YUlR?=
 =?utf-8?B?MXppTnpyRFc3YS85QkpQeFdMK1l1RmRuQllzN1FJWERsTGRHeGF0RUJiakU0?=
 =?utf-8?B?bENWTDNsQk9ncENJbVljSVV6OGd0QUFKT085UTYxYm1BZ0RaY1U2ZWlNckxB?=
 =?utf-8?B?L3U1MWpsbXRVNEYxK3ZtWmdaTzZJck1sbUZ4YjJNSmhKNHFCS2pvWmw3cTYz?=
 =?utf-8?B?anFDSnNKbFVOSC9CU2d0RzBtZ3NPbktsWWxJeDJYVmwwOG9lWW92WkVLelFm?=
 =?utf-8?B?QUttRlAvM2RBZDVKa3VuZ0hJZ1BUd0Z4eFBrbHJIeGUyY1NJOVR6aUJERlhS?=
 =?utf-8?B?SDJaS0x5b3ZFQk05VHByWDB1dVlXYTF5dkUzNlZBQjJSZnFnZUhWU0hrenh0?=
 =?utf-8?B?TW5ScTV3aGJOTUtWclVvNERWVWFIRnFGbHo4KzFMNXpLQ01zMDlCZVE1V0Zl?=
 =?utf-8?B?UFJrdEMrckZGQU5IRm1YZ3BMcmVvMTJscm9HcDg0ZmIycERUaFlYZzlhbHB0?=
 =?utf-8?B?MEM5WDMvYlVxR3FMTlhSaDhocVpDNnlMaWVwUXVkRHl5Z1d4T3V5TGR6N29w?=
 =?utf-8?B?dnhKT2FEdUVXM1lra0oyaGF2NFFUazJMNjk3S1FNeUg5N1lJNndrN3RhQml1?=
 =?utf-8?B?d2RoY1JVZytOQTdNY2FldkJSY08wM21RQzh0ODlpb3djcUMwSVR6dW9ZMlVj?=
 =?utf-8?B?dDNGUWdueWRvMk9KOUFPT3JDc0dpdzdFSGNNRjBzY2p0ZGZmbU9LcDJROWc3?=
 =?utf-8?B?c3FoQnNHdXhVeU1hMy8yOWh2RnM1NzN1TDNrcnd1RXVVSzRPQStlbUdEWFNB?=
 =?utf-8?B?b015L1NpUVVQMTBEK2g1Slp4VTY2Q2w5cTBkMWFPS09GdHplRlJoamdYMFI5?=
 =?utf-8?B?SVdFbDdyWDNOR2Myb0N1dHVHaEc4VFY0QTJ6b2lMSjY1dmgyRU50ZmNKdWhX?=
 =?utf-8?B?bWhNQWFaSU50L1N4UlJvd0w4S0puT1J3dEFJTFJNdUpzYXVuZ0dvQW1RV04y?=
 =?utf-8?B?b0xYaGI2RnIyMXhDdTE2bGF5TUlkL3dqZmpzc2U4TnA4VFlxYWF0elBKbEhu?=
 =?utf-8?B?d0s3RnIvMUUxeTZMUjVQdVZNcGdIZ0RDVld3V25TUHFKaWNVcGRNd2NYbGVu?=
 =?utf-8?B?YjRoNVAyd2lhdmZ2RXpHaHF6ZExIYmViR05XS0ppYnFnSGNucjdFUTlQQjg0?=
 =?utf-8?B?VWNlOHNMblYvZjQvMUJvS2pyV1NIK2RzdERiYWE2RWJEd0xFbS8rRDVQZ3ky?=
 =?utf-8?B?N0ZEaVRseEFTdXZLTlppeDNDQkg5TDlKeWpwVEZQVVZvUWZHa2M4YnFFTlBa?=
 =?utf-8?B?bVhDakRTUmNBM1ZIT2JuVU9jYUVZdW9qaWIwU25oTGVOSm1sRGxEZjRpYTZU?=
 =?utf-8?B?K2JUNUdaUm9SSDRHSWtYaHFvVTVPZ0dOWjNOdlFOWUlPNytuNlFvZkZtVHFj?=
 =?utf-8?B?WDdnWVhRM0ZhTERqS0hIRHZjYktqTGhmazhVcDBVakg4b3FmMjFvRWsrdllM?=
 =?utf-8?B?ZmdTSllld0ZjR2drQUNGV1RUL2sweitLa3BDMVlhaGtvNlVsSHMxc1FIakFy?=
 =?utf-8?B?NytrV084YmJqdGFCZnlWeTh1OG81aFB6ZjJ4L3hxRVpydEZpZWNoSXk2akdX?=
 =?utf-8?B?ZUh1dE4va3VkMGg5WENBMjVadmJlbytQbi9kVHBrV084NDlmWXFpL1MzaWEy?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C42BBE459147B349A753A90F2E0B11F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf25317-2782-48f6-0011-08dbca6489d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 14:15:36.0929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHFomWpKw0e28KaGhlshGm6S5jFTbBpjIFGiMc9la8gdN/JUt9Ly+0M7P0MIaa41/t4tijT0498+GNnkJYt4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 16/17] drm/xe/uapi: Be more specific around
 GuC Version Type
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEwLTExIGF0IDEzOjU5ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IE1h
a2UgaXQgdmVyeSBjbGVhciBhbmQgZG9jdW1lbnRlZCB0aGF0IGl0IGlzIGFib3V0IHRoZSBzdWJt
aXNzaW9uDQo+IHZlcnNpb24sIGFuZCBhbHNvIHdoYXQgdGhhdCBhY3R1YWxseSBtZWFucy4NCg0K
DQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8ICAyICst
DQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDE2ICsrKysrKysrKysrKysrLS0N
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IGM1MTk2YWJiZDE1ZC4uZTBjNjM0YzZkMzI2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtNTIwLDcgKzUyMCw3IEBAIHF1ZXJ5
X3VjX2Z3X3ZlcnNpb24oc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNl
X3F1ZXJ5ICpxdWVyeSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gIAlzd2l0Y2ggKHJl
c3AudWNfdHlwZSkgew0KPiAtCWNhc2UgRFJNX1hFX1FVRVJZX1VDX1RZUEVfR1VDOiB7DQo+ICsJ
Y2FzZSBEUk1fWEVfUVVFUllfVUNfVFlQRV9HVUNfU1VCTUlTU0lPTjogew0KPiAgCQlzdHJ1Y3Qg
eGVfZ3VjICpndWMgPSAmeGUtPnRpbGVzWzBdLnByaW1hcnlfZ3QtPnVjLmd1YzsNCj4gIA0KPiAg
CQlyZXNwLm1ham9yX3ZlciA9IGd1Yy0+c3VibWlzc2lvbl9zdGF0ZS52ZXJzaW9uLm1ham9yOw0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gaW5kZXggOTdlNWY4ZjRhY2EzLi4zMWE0NmIzMmYzMTUgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2Ry
bS94ZV9kcm0uaA0KPiBAQCAtNDY4LDExICs0NjgsMjMgQEAgc3RydWN0IGRybV94ZV9xdWVyeV90
b3BvbG9neV9tYXNrIHsNCj4gICAqDQo+ICAgKiBHaXZlbiBhIHVjX3R5cGUgdGhpcyB3aWxsIHJl
dHVybiB0aGUgbWFqb3IsIG1pbm9yLCBwYXRjaCBhbmQgYnJhbmNoIHZlcnNpb24NCj4gICAqIG9m
IHRoZSBtaWNyby1jb250cm9sbGVyIGZpcm13YXJlLg0KPiArICoNCj4gKyAqIFRoZSBAdWNfdHlw
ZSBjYW4gYmU6DQo+ICsgKiAgLSAlRFJNX1hFX1FVRVJZX1VDX1RZUEVfR1VDX1NVQk1JU1NJT04g
LSBUaGlzIGlzIHRoZSBHdUMgU3VibWlzc2lvbiBWZXJzaW9uLA0KPiArICogYS5rLmEgJ1ZGIHZl
cnNpb24nLiBJdCBpcyBub3QgdGhlIGFjdHVhbCBHdUMgYmxvYiB2ZXJzaW9uLiBBIHJ1bm5pbmcg
R3VDIGNhbg0KPiArICogc3VwcG9ydCBtdWx0aXBsZSBWRiBBUElzIHdpdGggZGlmZmVyZW50IFN1
Ym1pc3Npb24gVmVyc2lvbnMuIFRoaXMgdmVyc2lvbiBpcw0KPiArICogbmVnb3RpYXRlZCBieSB0
aGUgVkYgS01EIHdpdGggR3VDIGR1cmluZyBWRiBpbml0aWFsaXphdGlvbi4gSW4gbW9zdCBvZiB0
aGUNCj4gKyAqIGN1cnJlbnQgYXZhaWxhYmxlIEd1QyBibG9icywgdGhpcyBpcyBhIDEtMSByZWxh
dGlvbnNoaXAgd2hlcmUgdGhlIFN1Ym1pc3Npb24NCj4gKyAqIHZlcnNpb24gY291bGQgYmUgaW5m
ZXJyZWQgZnJvbSB0aGUgcnVubmluZyB2ZXJzaW9uIGFuZCB2aWNlLXZlcnNhLiBIb3dldmVyLA0K
PiArICogdGhlIHN1Ym1pc3Npb24gdmVyc2lvbiBpcyB0aGUgbW9zdCB1c2VmdWwgaW5mb3JtYXRp
b24gZm9yIHRoZSB1c2VyIHNwYWNlDQo+ICsgKiBwZXJzcGVjdGl2ZSBhbmQgbmVlZHMuDQo+ICsg
KiAgLSAlRFJNX1hFX1FVRVJZX1RZUEVfSFVDIC0gVGhlIGFjdHVhbCBIdUMgYmxvYiB0aGF0IGlz
IGN1cnJlbnRseSBydW5uaW5nDQo+ICsgKiBpbiB0aGUgcGxhdGZvcm0uIEl0IHJldHVybnMgMCB3
aGVuIEh1QyBpcyBub3QgY3VycmVudGx5IGxvYWRlZC4NCj4gICAqLw0KPiAgc3RydWN0IGRybV94
ZV9xdWVyeV91Y19md192ZXJzaW9uIHsNCj4gIAkvKiogQHVjX3R5cGU6IFRoZSBtaWNyby1jb250
cm9sbGVyIHR5cGUgdG8gcXVlcnkgZmlybXdhcmUgdmVyc2lvbiAqLw0KPiAtI2RlZmluZSBEUk1f
WEVfUVVFUllfVUNfVFlQRV9HVUMJMA0KPiAtI2RlZmluZSBEUk1fWEVfUVVFUllfVUNfVFlQRV9I
VUMJMQ0KPiArI2RlZmluZSBEUk1fWEVfUVVFUllfVUNfVFlQRV9HVUNfU1VCTUlTU0lPTgkwDQo+
ICsjZGVmaW5lIERSTV9YRV9RVUVSWV9VQ19UWVBFX0hVQwkJMQ0KPiAgCV9fdTE2IHVjX3R5cGU7
DQo+ICANCj4gIAkvKiogQHBhZDogTUJaICovDQoNCg==
