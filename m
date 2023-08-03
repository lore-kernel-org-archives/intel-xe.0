Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3065C001DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 19:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B910E049;
	Thu,  3 Aug 2023 19:10:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798310E049
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691089827; x=1722625827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gOSNHRTlJAK/2GFZ73ogbvJJqb53pJiq359Q7WJ0MKQ=;
 b=hG4Bg5OJbK8Bph1bshvFsoEnPopBnI/yBtM/Q4mKQjVCv+/q3BHuNajl
 Sn1rL6+m+p5sk/X305pTTYNfdz0kBnV4rm2kb2ahjPv7x+4sOcw9tQGHf
 tYZXA+Ygmq+Gp1oCz6P1hDVezjE08Ro7vX9A9CNlQyu+YlE43oMFTore7
 4SE3QuPYYOEtO78PqmZf4lSK0b29GHMsFUuo1tYMxQISn70AIpMUpYVHe
 DRVx3L1/qVk2a5i2kQTJQy5rr3kGl7IcUEDSpj1ootBEVrKb0ogahqGKN
 Ewr7ZJHAxb+v658KTWlylvndDsmSlqMRzI11w0sfVceRNjlA6+fmC7ah0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436294765"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="436294765"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 12:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732906289"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="732906289"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 12:10:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 12:10:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 12:10:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 12:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaTeoKDKg2NNb+CKAb7iGV4tv82BaPtktLA+dI5npwsxKolo/vEGJXtQESiqufOkvXisKPf2YAMUVyqj87BVgYRq7rxUQuqaOE2UDPrG5tYoHP5jTvOFjOFbyfQ4rU9NAVKzLs7Dlh7dP9M0tzaAhxoRUyYHvzzX1Flvv7GYQbT26gQmYozwPvyvD4BQHCBnwuQUyOrpB4cHAZyVhSbOm3afsSQoXIfR4zxfAT66qEYlN+HWSdrUOxfqFlEnUlltzaQNqe2M/Li6TmqK18f6wbnMakExiRbt3u+xeFF3bWNATkgn0wpAyNdD/L/QsYDn4VudbEjLeoEz5olhg36Qjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOSNHRTlJAK/2GFZ73ogbvJJqb53pJiq359Q7WJ0MKQ=;
 b=NZSOIvPgg167dZiWFuSBce3rjdNa5mYsiC1+l0bGWmvuWux++1cZjTKIBeH2FQSuyZvmA8vmDC4qqUTS2yrH9ihWImeKV3LzOFYoLnIWU3vH6/EIaDJIXfDyWoh2G/EyILE1YZo92/Ynj2ZecE8P7EcUo8spfm7jjpXt/togkw6UiEmNauYK8Xh/x8U9BclehPp2sAJFbVFW5HNPvlUeBsKUzu+YAuDcTwQjb3GR5//hQg11BCqdrWRSCU4GPJNEmxqn8W5eMuhd9o1rM6YQmtlHcCXHgaGqyPKnIR3f/DMq3LmduvGFPrU8li+f4DL2mYamRHl3S/fAkHHhlT/sdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 19:10:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 19:10:23 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
Thread-Index: AQHZxjutLuZIKIMbRU+KCX5qsQM4NK/Y79SA
Date: Thu, 3 Aug 2023 19:10:23 +0000
Message-ID: <c5b2618cc31febf582651f3f2b7875405851ba09.camel@intel.com>
References: <20230803190149.2637666-1-oak.zeng@intel.com>
In-Reply-To: <20230803190149.2637666-1-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB8206:EE_
x-ms-office365-filtering-correlation-id: 907e6533-98de-4fb5-4b32-08db945549ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QMtIrv4DmlSzrPWGYq4yr02dI094ScM01EhvVsRDIZoxHq7+HeZMlhJ19gzhKZJpMUhjRpH7Hxc3oIvsn7gTHnq6X2YnhsEbooV+kpRkkubYWWugNGltVScj/rSwft/WHRhqwDGB4iOcXrenrmw/K595uXVWPm9wXuhKs2he6sGKKUUQeuk6MG6D0Y54T4NkAywluyxnxRrba7pbRWrQwxPxgtw6BQgrvSwztvOT3vKcSJfhHYX+81keFfcG6dVyKTX1Tz4+Q13baR7dH272V3jyFP4PEnJ3iMdTEnYmqcwepbeM85daSMkbFNjBLKv25d+x07Ror6u5d0lRZVdEB+6PBT4Qlnsxl2tT2mYxuAsSK0oCYJOt0RrpJorkPEITZNUGm5d70L6+Be9vOy/4MzOa37+RsVArbY8/HTtxaomnWWiejxqqvZ9wxctzasFF2ECYMI9zUVittmN0aSXLNURqYUN+GTP+WwFcyr97YgXdesOOShb+ZTfV2MwuARScAgxbme2d0rJEHDksIR8zJbTyKU2MyrxGE/pKYepdAkn17uncgSRBI7ZaGx1Qk9zIZEeBGpYsmT2cME3l8z74MWhTOe8sY126aUowkJZOm2OijF7O7nxLxVC4PAd+llkP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(38070700005)(36756003)(86362001)(54906003)(478600001)(110136005)(38100700002)(122000001)(82960400001)(8676002)(2616005)(107886003)(6506007)(83380400001)(186003)(26005)(8936002)(41300700001)(6486002)(6512007)(71200400001)(2906002)(66556008)(76116006)(316002)(91956017)(66476007)(66446008)(5660300002)(6636002)(4326008)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFdicklvSDFLUDdmYjdFSTVleXhWMzlnWGVhNVV4ZXNVZWg5Q0ZRZlg4N3JU?=
 =?utf-8?B?REpZcEtmcDNVa0NoSTFBYmxiWWJKSmdsUUxYWlNaMzE1QURSSy9LTVFIMTV5?=
 =?utf-8?B?Z2NQNlZjajAyWW82TzBYSlRPOFFTTXJjcDExb1ZNY0UvU09pLy9oSllVYzZI?=
 =?utf-8?B?YmhhL2Yrd0R1dDNJTXROZWo2REQ4Y1dZOXNHQ29OVVdSTTlqdk03cjl3NTdr?=
 =?utf-8?B?bjh2T1VqMVpHbVNYTTlwTVU0eGdmcnl3dkVaV2ZGZ3NvNHgrZE9hRFdoYitT?=
 =?utf-8?B?VEYvdWpnMVdpcmZQR3k5U1pTcDNZa3AxTk1BT0ZkaUtKT2J1bCtLVVpobEY0?=
 =?utf-8?B?Y2tIQUdNdW1Cb29VTHpMdjlFakQ1Vk9GNjVtRWl6MTJiSVBXaWVrVy9vNmxB?=
 =?utf-8?B?MFljaHBWZ1FCTm9CWTVOUXBPMkI2N0lOeEcyYjBEK3JvSVlrSFkxMkZZMGFV?=
 =?utf-8?B?OFE4MHlCU09YWVNwV3lxZmR3WTh5VnNTdTgxUExCWHJPMXh5TnRjTlZrMFJp?=
 =?utf-8?B?TFVzR1FOWERmb0NCbjhRVXZueEJMTkFOVHdRdlFUeVFaQzdNQUJCdjE3Wmdq?=
 =?utf-8?B?L3Jpdm1XWHhjTVpKbWgxV3FpWVRrczNHdGd2UGNqb2t6K0RiMlpMU0diQjdm?=
 =?utf-8?B?VGZyZC9hYVJLVlZCMHZYbGtTU1J3NGtKdGFGbTlpdHAxZSsxcHVZQ3ViWk11?=
 =?utf-8?B?Sm9zb2tHZWRYa2g4NVhjRXVYNXExK0NzRU02bnFXYjdwQVNrQS82eU1jQ29J?=
 =?utf-8?B?TUFQcFpZbitpbjJZM1FmL2REZ2lGS2NuRWdsSmNMemFqcUN4VFdCRmlTcFRi?=
 =?utf-8?B?bTNLMTZDTERLcFMwR3BVYjVsRGYwTGZORGtSTWJPOWpVU0NVYnRkQmRpNy9J?=
 =?utf-8?B?d2hWNWJTZGhJTjJsNUlyOEZDMjBBaTltZzZ4SFpIZTJMZnNvQnZwdi9sOU91?=
 =?utf-8?B?N2hJUFpFVnVqckF0c20xcDZxb1FUV2J4U0N1MjdicERNUDRkcXY0azFOWjlo?=
 =?utf-8?B?cTJidkNuclF6ZVo5eW5OQ2VrKzBRZlRkNUVFdlRSWkRYd1QrNzkzVW1mSlIy?=
 =?utf-8?B?R0JFT3NOR1pBRWRaeVZtcFU5d0pmUWhGNGZ5S2dhU0EybTkycHRXK29CUU5q?=
 =?utf-8?B?T2dTY2tSaVZzbFQ5YkVxdXRMM2JQSzhCVFN6K3l2OEZnanhlOUg1d2lCSWlw?=
 =?utf-8?B?N1A5eWpIWWFQb3lZWEkyaituQzdycW5pSW1HbjVUNmhZY1lNdHBjZWEyUk9H?=
 =?utf-8?B?MjYwVnJ3TEpBdDk1aERUVG5OUDZmc3IwZDBEOTRXYjdnSkkzRWdnaGpMTE9I?=
 =?utf-8?B?NUVncmQwdFIrZUNvcmNmZUVHc0FvT08rUldiMEpHZE8wR3NYdE5kZFl1MG1q?=
 =?utf-8?B?TWc5UlVEdmcvSURuajdyUzkwUS9XQnJxc2NpREFFbVFyU052Yi9NMjcxdlJs?=
 =?utf-8?B?WUJhUzV6WGJ1cFVwTTRtNUdnNkVaMEp2ekFsaW5CRFJLZ2lXVXBnNlVMQlMx?=
 =?utf-8?B?bTk5R0FwZ1BYczBUVmFRMzlMUFd4dmtlcnZaNE1ReUhhQ1B1b3N2VHNsYnRx?=
 =?utf-8?B?L1BqNHc3eDk0UFVFQzR6bUczZ3kzUHlRZWFjODg2bTNEWlhrcWYxdUdIRDBL?=
 =?utf-8?B?MjRhdFFrNlNuVmw4K2UxRWdqckdQZk9QMzF1RGdINERVcENwN3pyNmxIQ3Mw?=
 =?utf-8?B?YmtyakV6bzFoS21vWHJWNDN1U3lYOFZidEd4STVVK0NobTNIRzFIUmFuSjBX?=
 =?utf-8?B?ZjZPMjhJdGY5R0U2akxvTVppRnNEUjk0MVh5bnhzT0FBOFQwbVU1NUg2cThq?=
 =?utf-8?B?NmovbEJJUzI2UjM4QmdPVlpGK3YyeUdiVWRXUjF1Nm5YNVFLN3pwWTJPdTlZ?=
 =?utf-8?B?T1VCdDNuUkpLelB6S3pnR3AyOWRPK25ZdjQzYXRjTHlHVHA1K2dEVk9vbko0?=
 =?utf-8?B?cEZvaDhlSkdpTzJ0YlJDU2hSV0dHL2NTRXVYakVTREg3VUM0aTQzZ1VweC9l?=
 =?utf-8?B?aG5NdGRob21DMEwzRHhuNjNUMWhoQ2JHdW5XVDh6K2Vod05iT1VRQzRMS1Jm?=
 =?utf-8?B?TkVQeUhyWnBMTDJRZTZjRHhPTjlaOUlGelk5aTFBaHlTZW1CQkQ2ckZmbDdq?=
 =?utf-8?B?bUhJOUhKOXhGVlhRNlR1M0QxWmR6dkFsVEp6QnM1Unk3dmdLVnRHeU1BSUVz?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0D0CAC8EDC0DD47BC101CC44035FECA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907e6533-98de-4fb5-4b32-08db945549ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 19:10:23.2553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2eXr/jw6ecHzhco+QhoN+miBlBzAM0K1I3tAO2ut1U4g3Yhn+WkcxXnrBqNIQTJnp3qYJVEDOf4pyTBDlR5ZgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA4LTAzIGF0IDE1OjAxIC0wNDAwLCBPYWsgWmVuZyB3cm90ZToNCj4gVG8g
d29ya2Fyb3VuZCBhIEhXIGJ1ZyBvbiBERzIsIGRyaXZlciBpcyByZXF1aXJlZCB0byBtYXAgdGhl
IHdob2xlDQo+IHBwZ3R0IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBiZWZvcmUgR1BVIHdvcmtsb2Fk
IHN1Ym1pc3Npb24uIFRodXMNCj4gc2V0IHRoZSBYRV9WTV9GTEFHX1NDUkFUQ0hfUEFHRSBmbGFn
IGR1cmluZyB2bSBjcmVhdGUgc28gdGhlIHdob2xlDQo+IGFkZHJlc3Mgc3BhY2UgaXMgbWFwcGVk
IHRvIHBvaW50IHRvIHNjcmF0Y2ggcGFnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5n
IDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2Vm
aWxlICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAg
fCA1ICsrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzIHwgMSArDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPiBpbmRleCBlNzk2MjRhYjJjYjMuLmU2YTA1ZDM1YzkzMSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZQ0KPiBAQCAtMzcsNyArMzcsNyBAQCBxdWlldF9jbWRfd2Ffb29iID0g
R0VOICAgICAkKG5vdGRpciAkKGdlbmVyYXRlZF9vb2IpKQ0KPiAgJChnZW5lcmF0ZWRfb29iKSAm
OiAkKG9iaikveGVfZ2VuX3dhX29vYiAkKHNyY3RyZWUpLyQoc3JjKS94ZV93YV9vb2IucnVsZXMN
Cj4gIAkkKGNhbGwgY21kLHdhX29vYikNCj4gIA0KPiAtJChvYmopL3hlX2d1Yy5vICQob2JqKS94
ZV93YS5vICQob2JqKS94ZV9yaW5nX29wcy5vOiAkKGdlbmVyYXRlZF9vb2IpDQo+ICskKG9iaikv
eGVfZ3VjLm8gJChvYmopL3hlX3dhLm8gJChvYmopL3hlX3Jpbmdfb3BzLm8gJChvYmopL3hlX3Zt
Lm86ICQoZ2VuZXJhdGVkX29vYikNCj4gIA0KPiAgIyBQbGVhc2Uga2VlcCB0aGVzZSBidWlsZCBs
aXN0cyBzb3J0ZWQhDQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggY2IyOGRiYzJiZGJiLi5i
MDQ1YmIzNDFhNWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0yOSw2ICsyOSw4IEBADQo+
ICAjaW5jbHVkZSAieGVfcmVzX2N1cnNvci5oIg0KPiAgI2luY2x1ZGUgInhlX3N5bmMuaCINCj4g
ICNpbmNsdWRlICJ4ZV90cmFjZS5oIg0KPiArI2luY2x1ZGUgImdlbmVyYXRlZC94ZV93YV9vb2Iu
aCINCj4gKyNpbmNsdWRlICJ4ZV93YS5oIg0KPiAgDQo+ICAjZGVmaW5lIFRFU1RfVk1fQVNZTkNf
T1BTX0VSUk9SDQo+ICANCj4gQEAgLTEyMzUsNiArMTIzNyw5IEBAIHN0cnVjdCB4ZV92bSAqeGVf
dm1fY3JlYXRlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgZmxhZ3MpDQo+ICANCj4gIAlJTklU
X0xJU1RfSEVBRCgmdm0tPmV4dG9iai5saXN0KTsNCj4gIA0KPiArCWlmIChYRV9XQSh4ZV9yb290
X21taW9fZ3QoeGUpLCAxNDAxNjc2MzkyOSkpDQo+ICsJCWZsYWdzIHw9IFhFX1ZNX0ZMQUdfU0NS
QVRDSF9QQUdFOw0KDQpJc24ndCBEUk1fWEVfVk1fQ1JFQVRFX0ZBVUxUX01PREUgaW5jb21wYXRp
YmxlIHdpdGggU0NSQVRDSF9QQUdFPw0KV2hhdCBpZiB1c2VyLXNwYWNlIGFza3MgZm9yIGZhdWx0
IG1vZGUgaW4gREcyPw0KDQoNCj4gKw0KPiAgCWlmICghKGZsYWdzICYgWEVfVk1fRkxBR19NSUdS
QVRJT04pKQ0KPiAgCQl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPiAgDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBpbmRleCAxNWMyMzgxMzM5OGEuLjZmYzY4YzU5MmNh
OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+IEBAIC0xNSwzICsxNSw0
IEBADQo+ICAxODAyMDc0NDEyNQlQTEFURk9STShQVkMpDQo+ICAxNTA5MzcyODA0CVBMQVRGT1JN
KFBWQyksIEdSQVBISUNTX1NURVAoQTAsIEMwKQ0KPiAgMTQwOTYwMDkwNwlHUkFQSElDU19WRVJT
SU9OX1JBTkdFKDEyMDAsIDEyNTApDQo+ICsxNDAxNjc2MzkyOQlQTEFURk9STShERzIpDQoNCg==
