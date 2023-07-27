Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D35EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 05:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A99F10E0D6;
	Thu, 27 Jul 2023 05:46:27 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9DF10E0DC
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 05:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690436786; x=1721972786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bdv8J0koObQT0JGswsWfJSd2gf8AHCJfmpqY5QZAlxA=;
 b=EVrLLilNgTQ6ThserW4ECPqRkkcgj7vV8fHGUS9O92vzjVRI4KXlIm0d
 MzRur8z/WIeq7EKlRZHPixy3Dl3jkqtIpom9lSWaX3/QSC+g4VeEIqfBS
 dRA/XGPqTO64e5xp8Wa/jiDHVB1ldtgRZRNTcLXR/bSsVFwNdmhkYW93i
 gOoVFGaPB7E1u6JHiPRY3lHtFQ+1vGzNOvVF3RSy70fLFjZ9bnsE1LDSe
 XGeo0uHvThC62Tih2iqU3KvT7O64mFTq1oOWdZJDGYf6Y2Pwa0B/geUX1
 akpkMtTsTM/QkhjRDynOOwedxMSInHbNoOXre2qO+Lf5KH19h8MvfLfbS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="432009024"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="432009024"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 22:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761997998"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="761997998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 22:44:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 22:44:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 22:44:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 22:44:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 22:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAq3Qfqrde9+WCvyDt+9eDHbHqoeQ+G1jx/Vn3ITcDHr1rQ/GH2OIFMIB7kKkVr58QowazdAbFalvUd60Qwf8oXWf6s6zp10RX+o/0ufD7qZvJ4ati/iG7CC0Gc6HrG3VK2vIMurbsb/GZa+J4lyVRfvzKgtPX7MXMl9wDzjfdvOlKkobRMv0v1ZkxQcr304a4LCizo3u5je7DIf+YvVlcbJqbKgexjSz/Z6jq9Jmq03jw1xGmfQEdhg1RMArmnsT+SXofOfB+cVCsdV/IW/mMYSaxxogHX8N8Tu2OfIiw/mCbBaKq2c50C5b7QNR3S04mkmKy6Iqjt4hLh6b0D57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdv8J0koObQT0JGswsWfJSd2gf8AHCJfmpqY5QZAlxA=;
 b=HxEgLkVFlkdXc+GId9clJHnJtGZ1+dS0bGdWUz84XirLBS0YcA02r3mWWPvtpC3+Sunq1uBCJwFQCPv4PP4NYQEsRUOG6qxLMxhIsCbAuDQqvt1ze789k9+onFfoTr2Pdsmi8PllraUJRQR8MXeoYtn/g0QQErUHBWrgM5tlR2fN4v+2Ap4m1OXGVP/VVfNSPEyihVY2qFSmWiVyqsugUrGDrXVIzmMJ2H++iDjC+5kyZAG68NgbTvnmAxTzZ2ivf16XdoAqiPaRkpLoEAd9FY6Gb9Pa/sAXtrQbs1kOmjWewi49UXkfjUzuPWh0pyVYLWvUpnP7RdVH/nMSoEbNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Thu, 27 Jul 2023 05:44:28 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6e2:18ec:9c09:e22e]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6e2:18ec:9c09:e22e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:44:27 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Thread-Topic: [RFC PATCH v2 22/23] drm/i915: Handle dma fences in dirtyfb
 callback
Thread-Index: AQHZgzjP6pTNUJtXj0G/pGmw/hpgZK+4hQUAgBUPVwA=
Date: Thu, 27 Jul 2023 05:44:27 +0000
Message-ID: <8d1199d0f480bcea1894bc15d8a41ddf0117a8c6.camel@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
 <20230510121152.736148-23-jouni.hogander@intel.com>
 <ZLBZpHgWf1eH_RGV@intel.com>
In-Reply-To: <ZLBZpHgWf1eH_RGV@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 1135bfcd-f4c5-4ba2-58df-08db8e648ab4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Vt5OOb5I/jE+J9TXjEWnokLWB6Rq8hgVhawiylRU4CVw/UfR1tZzcXBfFVOZS9oMT9XJWBKSPAiDxtkglSBNze9RFN7rpMsK2VhSrzQZEQxrC4ac6yx2BgpH7Kpr3KYah2tNAmgpMTNlfRtdoSDs1T2jmBcfEWNhmb73JBhrRzUydRNoBFSGdrcWORTuENie1n4PAvY2btkV54gF3ZVC4c0nl9AVPEc+VpInlyls7UfuoEbN/b48Hl20v6ybRao2SISUlop06sIpCJp9zSogDbRP2ucLlkYZY2Y+xgpP8zcHm8mhCbxOS0RbTHHJflR9IOghHVkisf0I7vS/CAx1fq1jl+DL0qSyESnmcFS7S+ZrBYfh1Me+a7UOvdIipvtw+xARk7twNFBfncOzqj29It1ieP2ZAULRqOefrvC4v5kXS3+UrwSDgRbwhIZdhYChGbhVvVx0VPetT/vWJgoKUls2g5qSoM9JAfQw1qdYC+cDFRTIJZiIbVMRMfUNoHHt8AqkSounYM7vcIVOnfvefGTfWIzCDxL7MMkBwtDoiXGUuZzW80+5dsjxY7BfuUTcNjnOsGFWmgjSnlwUQaAYvfRINrlK6vJxx4cjXm9s8g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(2906002)(316002)(8936002)(8676002)(5660300002)(38070700005)(41300700001)(36756003)(86362001)(6486002)(122000001)(71200400001)(54906003)(478600001)(82960400001)(66574015)(26005)(6506007)(186003)(6512007)(966005)(2616005)(66946007)(91956017)(76116006)(66556008)(83380400001)(38100700002)(66476007)(64756008)(66446008)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEg3WEhWQUJtbVJ4RkprcFZ3ODhSSU9MQm90cUt6dDgvVmo4Zm9MQTdGT2RB?=
 =?utf-8?B?TzJFTUdxOUZ2QVNzb3owaDIwWVdYUHlMUHFTWEpzeURmb09aQnZqWEJLczFP?=
 =?utf-8?B?K21IbFZPR2xWUVlXZVF4aEU1ZEV3Y2NCT1JMbEErbGFvUEM0dDBRR04vUVBW?=
 =?utf-8?B?Z2tWUHVBMTE0WGliL0JzU3FBNDhtaFhQbUc0YUJvcHBqR2hnRFpadGMwcXBQ?=
 =?utf-8?B?bkEyeWMyT0VWMlo1SWlmVE9ZOWErZVA0Smw1bXJjdE9waVF4bzdPSCt0RGd6?=
 =?utf-8?B?ZVlFMkVvMG9SbEZSTkZzVUU2VDVINXNKcUNObnFaditDN29Sb3VCdWtiYzFR?=
 =?utf-8?B?VWZtRHAwNm9zTmVFTC8rcEVmZFJNNW4rTmRUenU0WUJYbmxmZWF4RlY1di9q?=
 =?utf-8?B?Z1RTOHo3ektkK1hQRVRIbUVKZWRBWHdCZHBub3hpRnJ3cVpPMjRzSzJodVJR?=
 =?utf-8?B?bkI2SGttZWhkWGtMSGQ2djQ2UXVlWXR2QklESmtYcG1YZDlIRkFBNWNKdGFx?=
 =?utf-8?B?WFozdnMyeXZ0Qk16YkI3b1M1M0phZllPcjFMUTRWUUl5MS9BYk1KbUJiZzhv?=
 =?utf-8?B?MmsrMFpvUUZTbkZwRVFmakc3UU1NcGc1dmxWQ1FQTWpxdUNUaGxCZHUwM1BX?=
 =?utf-8?B?SVRhQlVXNTJpNWtoYnJqK2NqdE1xZ0pMTVBybGpISnhMRUx3Tmc4Ymw1MW1p?=
 =?utf-8?B?TGJPYXdlTlkrMGZickhBcWRZNjlDYXl5d0JETVoweEc5ZnRVOERrNXBSRTBM?=
 =?utf-8?B?VTVFQkRtRDVuSWpua3dRaDZqU0I0SVZaYW5qN0tlYm84SEJLSjhlK29NcmJm?=
 =?utf-8?B?U25RT2ViM2w2bUNQQXlEWVJmK2p6QklYSEovR25Vb0phOTVKQm9aY09WL2h4?=
 =?utf-8?B?Y2FENUFHQU14TVhmc0UzdGdUdlEvaW5WNllQRmdndHY3MVo5V043MzMwbEFs?=
 =?utf-8?B?WXZuOUMzOG5YbE0wanorZjVybm1naXh2eUJYS1hkU1lzeGFBd1ZSYjRjc2dR?=
 =?utf-8?B?NmRCMVlLT0YrSkloRUhielVYb1dPK0FxUyt5TEtRTXNtTTBxcFpsQWljdGpx?=
 =?utf-8?B?UHBEaG9oaW9oL3Z5aEFLajk0MURpaVJZVkh0SDAxN3lxZmRvTnZleGtwTFJ6?=
 =?utf-8?B?WnBJS1UxSWFxUzkwZkJSMThhTkRUMDNOVUFQV3k5alczVkRqbTZBbS9US0tv?=
 =?utf-8?B?RW0xNkx4cHgvd1QxSmpVdTczOUg4YlMwaWFWMVdwVUJXZ3g2U0hRMmM4bWhm?=
 =?utf-8?B?RzB2L2pCUUgvSVVON0t4aDMxdDl0OTZsN2prZ1dhenVVdkw5OVRrdUs1QVBF?=
 =?utf-8?B?RC9hNVJXeGxHa0R0VjR4dUMxWHdxOWI5dDdHOXNyY0J2bUFQbk91dFJadmtj?=
 =?utf-8?B?TUpLWjBOT2J4MTVQL081RDNNbEsxQTNHV0ZVcVBMUWwxUVZJR1JjYTFuUlNX?=
 =?utf-8?B?L29UT2Jzek0zV09wTEFmMjlObmlYak5kYnI2WDR0SUtQQmE2Tk5yUitoQmsv?=
 =?utf-8?B?N29WU1JNY1FEOWFEMy9kek9NT2hZem12cnlLSHBmaGxtMkVhbCtKRkhCR2pJ?=
 =?utf-8?B?UzhlcHFCOTkxM2dSZlZzNmthMm1oNWtrUmxBcVcrTTdSSU0rVmVaOHhxMXE2?=
 =?utf-8?B?dFh3UVlVbFN0U2YrdXhzemZZbElMRHF6YzN4TkE4MmFIa0YzenFYeGhySkx2?=
 =?utf-8?B?dUx2Z3JSOFBGZDIwcW0zUUYybzVOb1RXUDduaWN4b2Y2M08vQnAwVmtzRGtX?=
 =?utf-8?B?ZmdHMmpMUkE3cW1KdlZ3bm9XTVhURVh5b0I0UGMyNzFUZ3dycUhCL28wcnVV?=
 =?utf-8?B?aU94amtseldMS3poWjdheUN3UTlUV0FYZkZTYWtSbEh4dDFrNjMyTGdzL2Qv?=
 =?utf-8?B?ZU1SL2prclJ4VHRObU5oUFY4WGNrMXJ2QU5mRkNXQ3MxQ0w3SHFGLzdaZUxI?=
 =?utf-8?B?MDdoS1lOWDdFZDdlS1E3QXgrOFVYQnkrS2lNcktzbjJQWElwRGFpc01KVFBW?=
 =?utf-8?B?NGJ5Vlh6L3o1NFdkODgzbG9MY1FnRVZkeWJzOElyVHU5Nnd0V1lpcHdSeUZS?=
 =?utf-8?B?QXFiOTJaWUpHRU5rL0syQjlkWXU3SmNIbWpxQTN4ck9DMFZWVnVCV1pnY3Jy?=
 =?utf-8?B?QzZDV1U1Sm4wR0NHUW5tdkN5bU1rY0ZZWjZYaWlES1pDaXNWcFZXVW5McFpQ?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BC6B82DB34061418E8395EE57636AC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1135bfcd-f4c5-4ba2-58df-08db8e648ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 05:44:27.7406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TpKs1n8weiJ6cnhF+MSURPpEV/HM8eVTeeqaWq7l0TumMLVzV9ckChW9mHjgk9KcQVAbB1kgLQ3xZ6AF01+Fbj7W4GsB0F64+1PL/uKawk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH v2 22/23] drm/i915: Handle dma fences in
 dirtyfb callback
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
Cc: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

VGhhbmsgeW91IFZpbGxlIGZvciB5b3VyIGNvbW1lbnRzLiBTZWUgbXkgaW5saW5lIHJlc3BvbnNl
cyBiZWxvdy4KCk9uIFRodSwgMjAyMy0wNy0xMyBhdCAyMzowOCArMDMwMCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDAzOjExOjUxUE0gKzAzMDAsIEpv
dW5pIEjDtmdhbmRlciB3cm90ZToKPiA+IFRha2UgaW50byBhY2NvdW50IGRtYSBmZW5jZXMgaW4g
ZGlydHlmYiBjYWxsYmFjay4gSWYgdGhlcmUgaXMgbm8KPiA+IHVuc2lnbmFsZWQgZG1hIGZlbmNl
cyBwZXJmb3JtIGZsdXNoIGltbWVkaWF0ZWx5LiBJZiB0aGVyZSBhcmUKPiA+IHVuc2lnbmFsZWQg
ZG1hIGZlbmNlcyBwZXJmb3JtIGludmFsaWRhdGUgYW5kIGFkZCBjYWxsYmFjayB3aGljaAo+ID4g
d2lsbAo+ID4gcXVldWUgZmx1c2ggd2hlbiB0aGUgZmVuY2UgZ2V0cyBzaWduYWxlZC4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5j
b20+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5j
IHwgNTUKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMKPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jCj4gPiBpbmRleCBmYTQ0NjRkNDMzYjcuLmZjMzI1
ZjIyOTlhNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZmIuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5j
Cj4gPiBAQCAtOCw2ICs4LDkgQEAKPiA+IMKgI2luY2x1ZGUgPGRybS9kcm1fZnJhbWVidWZmZXIu
aD4KPiA+IMKgI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXIuaD4KPiA+IMKgCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2RtYS1mZW5jZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEtcmVz
di5oPgo+ID4gKwo+ID4gwqAjaW5jbHVkZSAiaTkxNV9kcnYuaCIKPiA+IMKgI2luY2x1ZGUgImlu
dGVsX2Rpc3BsYXkuaCIKPiA+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCIKPiA+
IEBAIC0xODg4LDYgKzE4OTEsMjAgQEAgc3RhdGljIGludAo+ID4gaW50ZWxfdXNlcl9mcmFtZWJ1
ZmZlcl9jcmVhdGVfaGFuZGxlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+ID4gwqB9Cj4g
PiDCoAo+ID4gwqAjaWZkZWYgSTkxNQo+ID4gK3N0cnVjdCBmcm9udGJ1ZmZlcl9mZW5jZV9jYiB7
Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZG1hX2ZlbmNlX2NiIGJhc2U7Cj4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZnJvbnRidWZmZXIgKmZyb250Owo+ID4gK307Cj4gPiArCj4g
PiArc3RhdGljIHZvaWQgaW50ZWxfdXNlcl9mcmFtZWJ1ZmZlcl9mZW5jZV93YWtlKHN0cnVjdCBk
bWFfZmVuY2UKPiA+ICpkbWEsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZG1hX2ZlbmNlX2NiCj4gPiAqZGF0YSkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZnJvbnRidWZmZXJfZmVuY2VfY2IgKmNiID0gY29udGFpbmVyX29mKGRhdGEsCj4gPiB0
eXBlb2YoKmNiKSwgYmFzZSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpbnRlbF9mcm9udGJ1
ZmZlcl9xdWV1ZV9mbHVzaChjYi0+ZnJvbnQpOwo+ID4gK8KgwqDCoMKgwqDCoMKga2ZyZWUoY2Ip
Owo+ID4gK30KPiA+ICsKPiA+IMKgc3RhdGljIGludCBpbnRlbF91c2VyX2ZyYW1lYnVmZmVyX2Rp
cnR5KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIKPiA+ICpmYiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1
bnNpZ25lZCBpbnQgZmxhZ3MsCj4gPiB1bnNpZ25lZCBpbnQgY29sb3IsCj4gPiBAQCAtMTg5NSwx
MSArMTkxMiw0MyBAQCBzdGF0aWMgaW50Cj4gPiBpbnRlbF91c2VyX2ZyYW1lYnVmZmVyX2RpcnR5
KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1
bnNpZ25lZCBpbnQgbnVtX2NsaXBzKQo+ID4gwqB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IGludGVsX2ZiX29iaihmYik7Cj4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZnJvbnRidWZmZXIgKmZyb250ID0gdG9faW50ZWxfZnJvbnRi
dWZmZXIoZmIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9yZXN2X2l0ZXIgY3Vyc29y
Owo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7Cj4gPiArwqDCoMKg
wqDCoMKgwqBpbnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGRtYV9yZXN2X3Rl
c3Rfc2lnbmFsZWQoaW50ZWxfYm9fdG9fZHJtX2JvKG9iaikucmVzdiwKPiA+IGRtYV9yZXN2X3Vz
YWdlX3J3KGZhbHNlKSkpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9ib19mbHVzaF9pZl9kaXNwbGF5KG9iaik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaW50ZWxfZnJvbnRidWZmZXJfZmx1c2goZnJvbnQsIE9SSUdJTl9ESVJUWUZCKTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+ICvCoMKgwqDCoMKg
wqDCoH0KPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBpbnRlbF9ib19mbHVzaF9pZl9kaXNwbGF5
KG9iaik7Cj4gPiAtwqDCoMKgwqDCoMKgwqBpbnRlbF9mcm9udGJ1ZmZlcl9mbHVzaCh0b19pbnRl
bF9mcm9udGJ1ZmZlcihmYiksCj4gPiBPUklHSU5fRElSVFlGQik7Cj4gPiArwqDCoMKgwqDCoMKg
wqBpbnRlbF9mcm9udGJ1ZmZlcl9pbnZhbGlkYXRlKGZyb250LCBPUklHSU5fRElSVFlGQik7Cj4g
PiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiArwqDCoMKgwqDCoMKgwqBkbWFf
cmVzdl9pdGVyX2JlZ2luKCZjdXJzb3IsIGludGVsX2JvX3RvX2RybV9ibyhvYmopLnJlc3YsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
bWFfcmVzdl91c2FnZV9ydyhmYWxzZSkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgZG1hX3Jlc3ZfZm9y
X2VhY2hfZmVuY2VfdW5sb2NrZWQoJmN1cnNvciwgZmVuY2UpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZnJvbnRidWZmZXJfZmVuY2VfY2IgKmNiID0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga21hbGxvYyhzaXpl
b2Yoc3RydWN0Cj4gPiBmcm9udGJ1ZmZlcl9mZW5jZV9jYiksIEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghY2IpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gLUVOT01FTTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGNiLT5mcm9udCA9IGZyb250Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldCA9IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soZmVuY2UsICZjYi0+YmFzZSwK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gaW50ZWxfdXNlcl9mcmFtZWJ1
ZmZlcl9mZW5jZV93YWtlKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
cmV0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGludGVsX3VzZXJfZnJhbWVidWZmZXJfZmVuY2Vfd2FrZShmZW5jZSwKPiA+ICZjYi0+YmFzZSk7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChy
ZXQgPT0gLUVOT0VOVCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IDA7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICvC
oMKgwqDCoMKgwqDCoGRtYV9yZXN2X2l0ZXJfZW5kKCZjdXJzb3IpOwo+IAo+IEFGQUlDUyB3ZSBj
b3VsZCB1c2UgZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbigpIGhlcmUgdG8gZ2V0IGp1c3QgYQo+IHNp
bmdsZSBjYWxsYmFjayBvbmNlIGFsbCB0aGUgaW5jbHVkZWQgZmVuY2VzIGhhdmUgc2lnbmFsbGVk
LiBJdAo+IG1pZ2h0IGFsc28gcmVkdWNlIHRoZSBhbW91bnQgb2Yga21hbGxvY3MoKSBhIGJpdCwg
dGhvdWdoCj4gZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbigpIGRvZXMgc2VlbSB0byBlbmQgdXAgZG9p
bmcgbXVsdGlwbGUKPiBhbGxvY2F0aW9ucyBhcyB3ZWxsLCBidXQgcGVyaGFwcyBpdCBjb3VsZCBi
ZSBvcHRpbWl6ZWQgZnVydGhlci4KPiAKPiBUaGUgb3RoZXIgdGhpbmcgZG1hX3Jlc3ZfZ2V0X3Np
bmdsZXRvbigpIGRvZXMgaXMgaXMgcmVmZXJlbmNlCj4gY291bnRpbmcgb2YgdGhlIGZlbmNlcy4g
QnV0IEknbSBub3Qgc3VyZSB0aGF0J3MgbmVlZGVkIGhlcmUuCj4gSWUuIEknbSBub3Qgc3VyZSB3
aGF0IHRoZSBsaWZldGltZSBydWxlcyBhcmUuCgpJIHNlbnQgYSBuZXcgdmVyc2lvbiB1c2luZyBk
bWFfcmVzdl9nZXRfc2luZ2xldG9uLgoKPiAKPiAKPiBJIHdhcyBhbHNvIHBvbmRlcmluZyB3aGF0
IGtpbmQgb2Ygc2NlbmFyaW9zIHdlIG1pZ2h0IGhpdCBoZXJlIHRoYXQKPiBtaWdodAo+IGJlIGEg
Yml0IHByb2JsZW1hdGljLiBUaGlzIGlzIHdoYXQgSSBjYW1lIHVwIHdpdGg6Cj4gCj4gKiBzY2Vu
YXJpbyAxOgo+IAo+IMKgZmxpcChQTEFORSBBKToKPiDCoCAtPiBGQiBBLmJpdHM9UExBTkUgQQo+
IMKgc2V0IGZlbmNlKEZCIEEpOgo+IMKgIC0+IEZCIEEuZmVuY2UgPSBmZW5jZSAxCj4gwqBkaXJ0
eWZiKEZCIEEpOgo+IMKgIC0+IGZlbmNlIDEgIXNpZ25hbGxlZCAtPiBpbnZhbGlkYXRlIEZCIEEu
Yml0cz09UExBTkUgQQo+IMKgIC0+IGZlbmNlIDEgcXVldWUgY2IKPiDCoGZsaXAoUExBTkUgQSk6
Cj4gwqAgLT4gRkIgQS5iaXRzID0gMAo+IMKgIC0+IEZCIEIuYml0cyA9IFBMQU5FIEEKPiDCoGZl
bmNlIDEgY2IgLT4gZmx1c2ggRkIgQS5iaXRzPTAKPiAKPiDCoEluIHRoZSBlbmQgdHJhY2tpbmcg
aXMgbGVmdCBpbiBpbnZhbGlkYXRlZCBzdGF0ZSwgYXQgbGVhc3QgZm9yCj4gwqBGQkMgQUZBSUNT
LiBQb3NzaWJsZSBmaXggd291bGQgYmUgdG8gY2xlYXIgRkJDIGJ1c3lfYml0cyBvbiBmbGlwCj4g
WzFdPwo+IMKgRFJSUyBpcyBmaW5lIEkgdGhpbmsgc2luY2UgZXZlcnkgZmxpcCBhbHJlYWR5IGNs
ZWFycyBidXN5X2JpdHMuCj4gwqBOb3Qgc3VyZSB3aGF0IFBTUiBkb2VzLgoKWW91ciBzdWdnZXN0
aW9uZyBiZWxvdyBpcyBwYXJ0IG9mIG5ldyBzZXQgaGVyZToKCmh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE2NjIwLwoKQWxzbyBQU1IgYnVzeSBiaXRzIGFyZSB0YWtl
biBjYXJlIHRoZXJlLgoKPiAKPiAKPiBbMV0KPiBAQCAtMTI5OSwxMSArMTI5OSw5IEBAIHN0YXRp
YyB2b2lkIF9faW50ZWxfZmJjX3Bvc3RfdXBkYXRlKHN0cnVjdAo+IGludGVsX2ZiYyAqZmJjKQo+
IMKgwqDCoMKgwqDCoMKgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmZiYy0+bG9jayk7Cj4gCj4gwqDC
oMKgwqDCoMKgwqAgZmJjLT5mbGlwX3BlbmRpbmcgPSBmYWxzZTsKPiArwqDCoMKgwqDCoMKgIGZi
Yy0+YnVzeV9iaXRzID0gMDsKPiAKPiAtwqDCoMKgwqDCoMKgIGlmICghZmJjLT5idXN5X2JpdHMp
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZWxfZmJjX2FjdGl2YXRlKGZiYyk7
Cj4gLcKgwqDCoMKgwqDCoCBlbHNlCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ZWxfZmJjX2RlYWN0aXZhdGUoZmJjLCAiZnJvbnRidWZmZXIgd3JpdGUiKTsKPiArwqDCoMKgwqDC
oMKgIGludGVsX2ZiY19hY3RpdmF0ZShmYmMpOwo+IMKgfQo+IAo+IAo+ICogc2NlbmFyaW8gMjoK
PiAKPiDCoGZsaXAoUExBTkUgQSk6Cj4gwqAgLT4gRkIgQS5iaXRzPVBMQU5FIEEKPiDCoHNldCBm
ZW5jZShGQiBBKToKPiDCoCAtPiBGQiBBLmZlbmNlID0gZmVuY2UgMQo+IMKgZGlydHlmYihGQiBB
KToKPiDCoCAtPiBmZW5jZSAxICFzaWduYWxsZWQgLT4gaW52YWxpZGF0ZSBGQiBBLmJpdHM9PVBM
QU5FIEEKPiDCoCAtPiBmZW5jZSAxIHF1ZXVlIGNiCj4gwqBzZXQgZmVuY2UoRkIgQSk6Cj4gwqAg
LT4gRkIgQS5mZW5jZSA9IGZlbmNlIDIKPiDCoGRpcnR5ZmIoRkIgQSk6Cj4gwqAgLT4gZmVuY2Ug
MiAhc2lnbmFsbGVkIC0+IGludmFsaWRhdGUgRkIgQS5iaXRzPT1QTEFORSBBCj4gwqAgLT4gZmVu
Y2UgMiBxdWV1ZSBjYgo+IMKgZmVuY2UgMSBjYiAtPiBmbHVzaCBGQiBBLmJpdHM9PVBMQU5FIEEK
PiDCoCAtPiBmcm9udGJ1ZmZlciB0cmFja2luZyBmbHVzaGVkIGJlZm9yZSBmZW5jZSAyIGhhcyBz
aWduYWxsZWQKPiDCoC4uLgo+IMKgZmVuY2UgMiBjYiAtPiBmbHVzaCBGQiBBLmJpdHM9PVBMQU5F
IEEKPiAKPiDCoFBlcmhhcHMgd2Ugc2hvdWxkIGtlZXAgdHJhY2sgb2YgaG93IG1hbnkgZmVuY2Vz
IGFyZSBhY3R1YWxseQo+IHBlbmRpbmcsCj4gwqBhbmQgb25seSBkbyB0aGUgZnJvbnRidWZmZXIg
Zmx1c2ggd2hlbiB0aGUgY291bnQgZHJvcHMgdG8gemVybz8KPiDCoE9UT0ggdGhlIGZpbmFsIGZs
dXNoIHNob3VsZCBzdGlsbCBndWFyYW50ZWUgc29tZSBraW5kIG9mIGNvcnJlY3RuZXNzCj4gwqBp
biB0aGUgZW5kLCBzbyBub3Qgc3VyZSB0aGlzIGlzIHJlYWxseSBhIGJpZyBwcm9ibGVtLgo+IAoK
SSBsZWZ0IGZlbmNlIGNvdW50IG91dCBpbiBuZXcgdmVyc2lvbiBhcyB3ZWxsLiBGaW5hbCBmbHVz
aCB3aWxsIHRha2UKY2FyZSBvZiBjb3JyZWN0bmVzcy4gRHJhd2JhY2sgYXJlIGV4dHJhIGZsdXNo
KGVzKSBpbiB0aGlzIHNjZW5hcmlvLgpUaGF0IGlzIGtpbmQgb2Ygb3B0aW1pemF0aW9uIElNTy4g
UGxlYXNlIHBvaW50IG91dCBpZiB5b3UgdGhpbmsgZmVuY2UKY291bnQgc2hvdWxkIGJlIGltcGxl
bWVudGVkIGJlZm9yZSBtZXJnaW5nLgoKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7Cj4gPiDCoH0KPiA+IMKgI2VuZGlmCj4gPiDCoAo+ID4gLS0gCj4gPiAyLjM0LjEKPiAKCkJS
LAoKSm91bmkgSMO2Z2FuZGVyCg==
