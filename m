Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BEFC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 20:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563DF10E755;
	Thu, 30 Nov 2023 20:59:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D62210E781
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701377983; x=1732913983;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=CjmH/K8GwNy0ZRFLzYMTCauj2UL/xTF89waI74FG9o8=;
 b=URSCaHS7RSUdmT6WLgwHE/HEcNX0bxpwuWCboMrJtjCByt2j4sOXQMbG
 VKVERi8ozZ6Beelx8zG1Qdidx7Vj+KtBdJ7iZXQ1QNaCZTOmJN5a0n7NB
 2T/bZaTvdLwJJLmnbahPsNDwHi9R2glDICeaVZY1iMmO/bgO0O3LR6Umg
 pBfXi39dIM1pU+6qjRO23SJ7OaYTWj3oK3TrbmbCD5UKZgyloMw5SB2o+
 4pXgsTo91bKv3ymUNU26pTWE9+EwekUl6Z/KxIF6BV8prNoAQZGP90r13
 CSOhql4Shr76vzO5bd2MbQJyy0WV2h8cSP1ZTis/Le7snnslgFSOdymbI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373575299"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="373575299"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 12:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798444958"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="798444958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 12:59:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 12:59:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 12:59:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 12:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4yN3PKYShHxVnmp3EEGq87Bzh2KQpI2Tui6+B+dZSESOKi9MpYTRKkinYwZ5h7vlLog14WB7SJ8kkr21ZjPm+ULZzREdBDY6HeliZAYDiQ91d1Be4iur8ymRL0RScQXtwhATFsKxlDAuVaKIyWFVJnXtSPYHxZkerv/0Qr1GdSkizA8KoiwBOxi+/x+wyMV2L1s7FD/+hxA6BB9PfGJitahQjzktH4ADa0+RkcpyotnoWlIbX+YEcy5Q7UiqN+J4jasXLhZ6z6NAgYU7AKUtNZUMb5ujKy1XwUIrdSI4jdyOixBIe1Yv1u5aljrMnvPnZzps1RaQQ3FINNEQ9eYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjmH/K8GwNy0ZRFLzYMTCauj2UL/xTF89waI74FG9o8=;
 b=S+A+dV9FHHdKJ0XS/qzSjJzB3NmYB58z6re7kS569rxCJ4pqAOixfDVuMJmmuqatIAfv5vHcMhaQASBi633QbMwOB+3qsW0KTzIRx+xZaP1yv9Dj0ZxJD6tQkLTl22sP2nLIrArYvSg4iJmlcOK4s4IdVd6WzyhfxGh1xe6pRGVv7+xdRwWXjWC60CKZRXEBipzWrV4HaYBRP9/u44AFd5pooz81TOnwdj/CBfPNHiznNe+GvubmeTBKx9ThLdSmbVseFsoSWTaX4VIvehvykVnxCgawXs+Vzi8IAgqO/Im4d6r+Fd6uEMJH+5S7OmTKXHvL53l2gaGpZb3BXKMq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 30 Nov
 2023 20:59:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 20:59:39 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 00/16] uAPI Alignment - Cleanup and future
 proof
Thread-Index: AQHaI7y2YMOiZIMLcU2xrIxmdJzpRLCTWMYA
Date: Thu, 30 Nov 2023 20:59:39 +0000
Message-ID: <67c5593a0a5619926801f4b1effc3074624d33e4.camel@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5173:EE_
x-ms-office365-filtering-correlation-id: 2ff62dcf-a5dc-425e-5a45-08dbf1e744a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TW8lC5ZXnKzcACC7lJnzYybAFnfCiHhlaFLMCFB/z/qXXAaFr+yWummXLLdsfHWZwNqfxtoFusxkziFzobeQwhTrWTsV5kVRMazzokawWiUhWueZyZBYNRnXWlfrWiomcv0HzlxqORgdjP4tejAIk6GawQj20eLHHmQE7z5AEJe6a1vScv2rOBWmzh04qBtsdRADd20i+G+QmJ+/pL5/HoSrndUfc/9eGIyAPgry0VihYF5Sih5Mtq2Qza+dk+6+36tkcm+7qkcYsT7ESl9eVvL2tXouyK3cqI98G1TrBnbIokiunbzSuxsch1MNKV74tOY6ZHyzRKbJzJ1tSyPeS8jPGB6klnfzPvcZgQVOCYGc1FEOW4e5dS9SwzQJnD8oA3K1jWnnqfi9/iyDBRMNIgC4nch4bKAIEUP3YZAEPSQ2oCU/fgDUXr+VP87hBurKiaFCzxQYeM51eoZ6SG956dZRz7u6yXtA9HtRJCLviYTyyrPdOwIe5CRul1P1cIoP//fEIph0zUDyctExTZR/9FRyqjhpYJJr6FtHiYdbzem29DpzhsWLsfrF3rQ7/lWNRhqjJlL5LrXB3UdezZwKRgPBWk5C3rZ4kqzJcHscX7xCKy+/c4ebe5QgFReB2YdVBrKufL96AAgWBc57JOq2NA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6486002)(2616005)(6512007)(71200400001)(6506007)(478600001)(966005)(83380400001)(41300700001)(76116006)(6636002)(2906002)(4001150100001)(91956017)(82960400001)(316002)(5660300002)(66946007)(8676002)(8936002)(64756008)(66476007)(66556008)(110136005)(38100700002)(86362001)(36756003)(122000001)(66446008)(38070700009)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UThNZW5IR0YyZHdSMCtkZkg0MDB5bVRQeFBZYmFNTmhCc0ZhOFVpMzc1WGNz?=
 =?utf-8?B?TElNNCthSFF3OStjYkd4RmNaOVhtZXZMc1paUFBreStYcnRoSmtoRnB2WTls?=
 =?utf-8?B?ckpwYnBqV3Y4QllhTjl3bERWTHE0VTlaWGpERnVWaVRFdXZjbWZzNi8yek1N?=
 =?utf-8?B?WEZ2T1VpZEphdmdJWnVJRk56a0t2OEttOWc4aDNRU05Rb2VLNWxHbnRkcDBk?=
 =?utf-8?B?R3RRMGdQU1AzbkZhVXZqa2FzSGJVWGxaeUR4WWkxQTlOVUk5VmxlSHFZVEVx?=
 =?utf-8?B?d3JrNWpuSnFTcVNZdG1DK1o0bTB4U2JlNjVOT3NlelJZVEFYOGFSS0wxK2ow?=
 =?utf-8?B?VG16eG5vcEcrT3VocjlONUlyUEs5RWliSy9jdWlvVjg4M2prQjRuSnlmS1N6?=
 =?utf-8?B?Y1RtaDg5b042dmNQNURNRFUxMDl4NlhIRXNmV3lSTklyVmYxb002L3I1cDE0?=
 =?utf-8?B?aks3N0NwOWh0ckJSZjJaY3UwcHo4ckw3S0lBek5kWVE4eWNoWXpIQS9zczNm?=
 =?utf-8?B?UUduTTZwUElNUXZiRWpOYTlXcVdveW5oNDRlRmZCM0ZKTnBMVy92K0VIOTh6?=
 =?utf-8?B?eGtwRC9vVVNvbzkvK1E3V3BUYUg1TUR3TkVjTmFUblQ5M2V0Ylg2NFlWTUh3?=
 =?utf-8?B?c2hPQUM3NmJlNkM5OHVwSncvOEhJSXBtdE5mYU1mWnhBUDFSTElHdmNkWTdy?=
 =?utf-8?B?cTJkQXA0N0JWYU1lYk9Bb3FEMUhtRUtHN0VqbjczbmQybUd1ZnBoaHBlYmxI?=
 =?utf-8?B?eUJFb0o1Um4vK29OWVdwVGlIcW4yOGRqQlVBZk9KejFUS1MxTWdmQ3NvTktE?=
 =?utf-8?B?bjMzQnA1eVBWK09NRXJyVzJRODhTL3NxTlBvVGlZQnRqbWtqZ3FBTGVjRE8v?=
 =?utf-8?B?SU96T3haREJDZUxkVElTK01PZzZuTjUvY1lRMlpQVmxsSDRKazlVRnloZDVI?=
 =?utf-8?B?Q2xwek5Vb0tPZFV1U3BXaFBMOUdPMDU4SXo0dVN0YWlaTE80MExVM3l6QTht?=
 =?utf-8?B?UzA2aUdCQ2NEZGRLQzBJTC9iM0Q4aGI3K3dSSS9UNllrNHF4R1k3RmNHMmxj?=
 =?utf-8?B?ZFJMY3RzMWMraW5DejlHSzhVNmkvSTNuUlJucVJoT3dTdTJhYUF5RWo3ZVhm?=
 =?utf-8?B?R3pPQlZBOFk4M2Q5ZGlqRGxwVld0a1BLNmUwWXNSWWJvZjBNR3dsMlladGlL?=
 =?utf-8?B?cE9iei9pSzNEb0N1b3dUL0RXeHNaOVZsUnAyaGZHL2FEN2p0eXNQZ1MxUWtH?=
 =?utf-8?B?QnROMU0vQ2dDZi9yYXp5MkN5Sk9FejFKR2FOZlpUdzlCMDI4RmdUVCtuMzVW?=
 =?utf-8?B?UjdMa2JiNDBsckJBbnAxNlBTY21SNWs1V09HcERSaVJXS3FCMWF1TjYwK3ln?=
 =?utf-8?B?YXhFZGU4Mmp5WnNPVTVaUlQwRUo0RENGaE91bFlyNGFmb1NFVUpwQUR5WGN5?=
 =?utf-8?B?Tkg0UkE3OTJGMUh0M2pTT3RHZUJUWFdxVThzNTdBcVVYcXl2eWw5Q0t0SDVl?=
 =?utf-8?B?Z3EyRDZiSHljampNN0JpWDBSbER5SVAyMm5FdlNMeXVFQmZUMUltRjZ0ei9Z?=
 =?utf-8?B?UGFwSmx6RWdaWWU1NEp1Z2hRQmZ4MElPOUg4MkJtQmV0d3Y5Rk52OE80aEpo?=
 =?utf-8?B?SVRlZDlxUzNNanc0Zlo1SUlCMG5MUEJDV1lyemNpcEsrVkhlcWhxYThuMWho?=
 =?utf-8?B?V2VCYmQ3UVlFSlVuNTYvb0RjVnlIMjg1cEVicXJ3NVYwQ3VMcHdUOGt6Qm5X?=
 =?utf-8?B?a1d0RVh0bWZFTHdkUmZ1dGJqN2sydTlWeml5N0pFWlYvN05Wd1BJZzY3ckxE?=
 =?utf-8?B?NitKWDFXZnNiMmxOK2l2SjFKNnpvZDBFMnh5UFd3bytZRjZVaUUySjR0OUcr?=
 =?utf-8?B?OTliV1dnKytjbzYxV1h6cGpmOHhzeTY1b0NmdmRwaVJPbmpUN1lxckVZek1D?=
 =?utf-8?B?TFVlNXBmazFWanEydnhFaGluQnpSMDBLUERaQlBadFlFZUxBQkZDYmpDYWhp?=
 =?utf-8?B?RStpemJydzg1NndRbXVqYnNFVTVVTkxoZzJGR3dDRmFYQjR3L2RZVVMxaHBX?=
 =?utf-8?B?L1dQUXl4cXpuSHgyZHkrRWd0Z3pHUkJsd29RWUllemZmRWY4ME42dmFxYnJt?=
 =?utf-8?B?bWIwTWpwN0o1Tm9hTHFNYjFCeXYzeG1wL1ZEaTFIY0o4cStZc25mL2RyRzNz?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E57D4D65792B3448E5D1310F2134734@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff62dcf-a5dc-425e-5a45-08dbf1e744a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 20:59:39.3986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wXlcASfYGZUbUizw2dSlDK09Q+WHglh6Rp3MB7YY09U2x8d10kp/B8nL2XxN3Dbs/Jx1Jrbjb0kEBgjsc6TqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 00/16] uAPI Alignment - Cleanup and future
 proof
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

T24gVGh1LCAyMDIzLTExLTMwIGF0IDE4OjM5ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSBzZXJpZXMgInVBUEkgQWxpZ25tZW50IC0gdGFrZSAyIHYzIiBbMV0gaGFzIGdyb3du
IHRvbyBtdWNoIHdoaWNoIG1ha2VzDQo+IGl0IGRpZmZpY3VsdCB0byByZXZpZXcgYW5kIHRvIGRp
Z2VzdCBieSBVTURzLiBUaGlzIG5ldyBzZXJpZXMgaXMgYSB0aGlyZA0KPiBicmVhayBkb3duLCB3
aGljaCBjbGVhbnMgdXAgdGhlIHVBUEkgYW5kIHByZXBhcmVzIGZvciBmdXR1cmUgbmVlZHMuDQo+
IA0KPiBDb3JyZXNwb25kaW5nIElHVCBzZXJpZXMgaXMgaGVyZSBbMl0uDQo+IA0KPiB2MjogRml4
IGFjY29yZGluZyB0byBmZWVkYmFjayBmcm9tIHYxLCByZWJhc2Ugb24gZHJtLXhlLW5leHQsIGFk
ZCBuZXcgZml4ZXMNCj4gDQo+IHYzOiBSZWJhc2UsIGJ1bmRsZSBvdGhlciBhbHJlYWR5IHJldmll
d2VkIHVBUEkgY2hhbmdlcw0KPiANCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTI2MjAzLw0KPiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xMjY1MzcvDQoNCldob2xlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IEZyYW5jb2lz
IER1Z2FzdCAoMyk6DQo+ICAgZHJtL3hlL3VhcGk6IEFsaWduIG9uIGEgY29tbW9uIHdheSB0byBy
ZXR1cm4gYXJyYXlzIChtZW1vcnkgcmVnaW9ucykNCj4gICBkcm0veGUvdWFwaTogQWxpZ24gb24g
YSBjb21tb24gd2F5IHRvIHJldHVybiBhcnJheXMgKGd0KQ0KPiAgIGRybS94ZS91YXBpOiBBbGln
biBvbiBhIGNvbW1vbiB3YXkgdG8gcmV0dXJuIGFycmF5cyAoZW5naW5lcykNCj4gDQo+IEpvc8Op
IFJvYmVydG8gZGUgU291emEgKDEpOg0KPiAgIGRybS94ZTogTWFrZSBEUk1fWEVfREVWSUNFX1FV
RVJZX0VOR0lORVMgZnV0dXJlIHByb29mDQo+IA0KPiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgKDEp
Og0KPiAgIGRybS94ZS91YXBpOiBSZWplY3QgYm8gY3JlYXRpb24gb2YgdW5hbGlnbmVkIHNpemUN
Cj4gDQo+IE1pa2EgS3VvcHBhbGEgKDEpOg0KPiAgIGRybS94ZTogRXh0ZW5kIGRybV94ZV92bV9i
aW5kX29wDQo+IA0KPiBSb2RyaWdvIFZpdmkgKDkpOg0KPiAgIGRybS94ZS91YXBpOiBTZXBhcmF0
ZSBib19jcmVhdGUgcGxhY2VtZW50IGZyb20gZmxhZ3MNCj4gICBkcm0veGUvdWFwaTogU3BsaXQg
eGVfc3luYyB0eXBlcyBmcm9tIGZsYWdzDQo+ICAgZHJtL3hlL3VhcGk6IEtpbGwgdGlsZV9tYXNr
DQo+ICAgZHJtL3hlL3VhcGk6IENyeXN0YWwgUmVmZXJlbmNlIENsb2NrIHVwZGF0ZXMNCj4gICBk
cm0veGUvdWFwaTogQWRkIFRpbGUgSUQgaW5mb3JtYXRpb24gdG8gdGhlIEdUIGluZm8gcXVlcnkN
Cj4gICBkcm0veGUvdWFwaTogRml4IHZhcmlvdXMgc3RydWN0IHBhZGRpbmcgZm9yIDY0YiBhbGln
bm1lbnQNCj4gICBkcm0veGUvdWFwaTogTW92ZSB4ZV9leGVjIGFmdGVyIHhlX2V4ZWNfcXVldWUN
Cj4gICBkcm0veGU6IFJlbW92ZSB1bnVzZWQgZXh0ZW5zaW9uIGRlZmluaXRpb24NCj4gICBkcm0v
eGUvdWFwaTogS2lsbCBleGVjX3F1ZXVlX3NldF9wcm9wZXJ0eQ0KPiANCj4gVGhvbWFzIEhlbGxz
dHLDtm0gKDEpOg0KPiAgIGRybS94ZS91YXBpOiBVc2UgTFIgYWJicmV2IGZvciBsb25nLXJ1bm5p
bmcgdm1zDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2RtYV9idWYuYyB8ICAg
OCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICB8ICAzOCArKy0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgIHwgICAyIC0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgICAgfCAgMzggLS0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuaCAgICB8ICAgMiAtDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfY2xvY2suYyAgICAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdHlwZXMuaCAgICAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYyAgICAgICAgIHwgIDg3ICsrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5
bmMuYyAgICAgICAgICB8ICAyMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeW5jX3R5
cGVzLmggICAgfCAgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAg
ICB8ICA1NiArKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oICAgICAg
fCAgIDIgLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICAgICB8IDI2NyAr
KysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgMjYyIGluc2Vy
dGlvbnMoKyksIDI3MCBkZWxldGlvbnMoLSkNCj4gDQoNCg==
