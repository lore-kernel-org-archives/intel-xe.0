Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A3C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 21:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B8910E349;
	Mon, 18 Sep 2023 21:21:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428810E0FD
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695072116; x=1726608116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sd0xePxJMuEFQXfhrwc7fpwm89inJgaDOp/B247gtUk=;
 b=Lx2cwqrdjridSGev9RX5Gae5WeFJbIuX/0/ge8afepkKwnEpn3MoI7a1
 Z50AtFEk2lr+xqt7qJj/Pn4MWVwC84gczNaWeZZSjkY+AktViL1cpaWii
 HOe4Br+bLnvWFcWRHqrG4MuJSuRI+jX885jzlKQfgGPFvyhFSgBd51tl7
 pb2gsxYbp/MZRjeCcnuDZZ4057Td/FlG5F1qS4oyLGUqTtS4P4XM4ZQ/v
 M8jwnpAiIY5QjnrZwWF5fCLO+5n03n0tLgj80rpuowd/nIgFvPNVeElRi
 2jPRixpPyWlcn0DRfNVo1CMvPKz7mcaJldlUFT62je+v6rCajUbQenYMu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410724619"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="410724619"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 14:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722602704"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="722602704"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 14:21:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:21:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:21:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 14:21:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 14:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaVT1UGl1YVkO9QXgu2T2wDRIfVIF2qXd/YtbD84Ijw/HmCdj3kIV/Jnu7KsD0Wg7Okv3TeY6KQi+Zo0BgRFt8UStjbSXaObJTjsTh9Poll8VPkbHm+ASUTzglxwIKaEIltS7KJ3d3oe4fX4WQAaW3rY8I7Bl67cMU3dGckdTDA6YeipH+uAuoT47id7Kc9wYdhXT5qa4qlLDpUUCgj7tnJySF+a1dA1KZrINWkvCc67V9VS8O5juBJFlAGtTYyM23ZRJHqN5vQWC+1eFnhd4LLpaM6bpWaVjaEge1UT5gFbdc6YwHth/RIItZLyqLsNFNaf5QxRTyqU4ZavEeBOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd0xePxJMuEFQXfhrwc7fpwm89inJgaDOp/B247gtUk=;
 b=mXHTjbmQpiYDtqPUWp9KXRLURXnMLQzBT7q7gGx83iMxnEN3Ezb/AwIixaUV4QVpXuvO1zKgLzUPi/SsQyiBTOYI33MKfAFa5sIC+5TWELRh6VgUF6bMHg18AYWuynkQkLuimVJddEQfifYx0G4XwNeJrZ5Mx8XR9J/dgU4Z7fLG7cRTT7xLqi5XAKS/JI5VvUonYqMftrfjYB551sTxSoS0vG8jC6Omcm5VYoP/EssdiPQ/TM440awY9dEuRqVQIeAR10wrn/iYaT2fih827xKmu7RFVO2LcJFjnPVKn2x5Iijq1mvyujnfr06BsUy9JYn5AWsv+3l8ddrt5bEvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 21:21:52 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 21:21:52 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/4] drm/i915: Remove runtime suspended
 boolean from intel_runtime_pm struct
Thread-Index: AQHZ6f4XuBAT/i/89Ea9tHbbHh9lmbAhGEiA
Date: Mon, 18 Sep 2023 21:21:52 +0000
Message-ID: <efaf7e6e82695bcb0a6a7ee464b2c9f200e8a941.camel@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-3-jouni.hogander@intel.com>
In-Reply-To: <20230918070100.1387082-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|BL3PR11MB6506:EE_
x-ms-office365-filtering-correlation-id: 333f9b15-661d-4382-6997-08dbb88d46cc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ezM1ZYts3s5OpwJ0wiZm01IZ/u1/P9632Im5GNEW/NH6XNXeA1CSNpEGiCL+nv8CbgjtANtM8cOnJfRYx7ByUCeTlFawxYjC6vICfz0gZoitN/cC5Pywyf4QwHJjRvENhVLRIjS3icsanEI1uKG6KrrdSwiNOuWi4AEdna4Xv/MIYWIbxKDz+FmOjBwhX4u8RKzN5TcgnjUybk/SUqVyAccAPKEVgNYoJkc8VMbfNckw1oK03ThzbMDDzYvHorAksp9/Q5kH8aKm3YIgymt0WdBMv+X1G5wzigeqnsQoZTcwvvV4zjz+WzyohocpOPphU5/VyFoWZ9rTZ1tDTMpCb3VTYTV/7pk4+skzryT77PeMdD8bF3YHLXEvO4QqD6P46+gajQtarRvhONjttR6d48p1A4WEKkmgsWqySqLlHNVpYHly97IBKA/AjuTB+5EdmgNoYTs4hUA5jTbPKOFtJk3toEJ80SLzBCbrQXpFEG2cxodmY8FlT4Wwa9LiXTM379IyZ4D9S9GYQq6j2kIicqE+stIStTt/iW705VrzUHYOt7NMBN+BYw8xsehAXYDLt/nEqwNv4EkNSRtcqRCTkeQUeADNtY+NDyl7j0Pj+C0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(6506007)(6486002)(966005)(71200400001)(6512007)(478600001)(2616005)(26005)(107886003)(66574015)(15650500001)(2906002)(5660300002)(64756008)(54906003)(66556008)(6636002)(316002)(66446008)(66946007)(66476007)(76116006)(91956017)(110136005)(41300700001)(8676002)(8936002)(82960400001)(36756003)(4326008)(86362001)(38100700002)(122000001)(38070700005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnNwNk9POEFwWklreWJGbkh6RVAydEcwdXdKbzJTcktoTWJ1dG1vcytFd3M3?=
 =?utf-8?B?UVBDSThRZTdLalh3aGNZazJGVU9Ibm1TYjMwQWhST1M2MXc2bmxGZ2g0WEVG?=
 =?utf-8?B?LzU1d2xZb1Y0cW0rMDFiVzBLZng1Z0owajJ3ZitYbjV5Ly80ZjlOSm9lRDRv?=
 =?utf-8?B?UVFwLyt2UFZyc3I4V1d1S3IzVkNxRnNZRm9rTE1zV2w2U3hWTmo5aTI3TDc1?=
 =?utf-8?B?dy9NT3JsaG43emtVOGlTc2FpUWpIVm1FdkZKQytBb3BPdW9pbnhGZ2Y2bEY4?=
 =?utf-8?B?Z1RBamViTVZMMmowK3ZPL1R2eHBudkdaMFFzbUg1ZWZIYlhpUFpNRHZlK0dO?=
 =?utf-8?B?bFJ5R0hlWFhqKytuQzdLWGozSllQdWozSzQ5UEw5aUJPNGF2akRBcUliN1Ir?=
 =?utf-8?B?TmMrc3Y2YmZKU3JBbW5NRm1wZjFlMkhRQlJOQm5XdHhuc2xoMnBYdTZDTVRN?=
 =?utf-8?B?b21tcm9zeEY0TFVsWUU4THljRWRjVFRtOGgzR2ZnQXhLQ2lTcGtyU2pOYVNk?=
 =?utf-8?B?clZjTjQrNXUrOFZvcjhLYzdLK3VYY1M3OVpZSldrTXZHU2k2bXhZMlJGakMy?=
 =?utf-8?B?eEpJaTlLQ2lEMmxvYW94VmFMaktMYi9jWExPSzhxak9SVERkYlo4V3pIbGZO?=
 =?utf-8?B?VFUzaFlaejlqUm1BRzBCbUNJK3ZXMWFjT0FjMDVRaFlhcjBJdS8rUVZMUmJo?=
 =?utf-8?B?cUNwQzVGc1BMcEh4N0hpcHF5aFpMVUJ3TWF1aE1Yck80b3dkaGdCR2JqN1h5?=
 =?utf-8?B?VFZpdjkzUTlzVk1HN2ZTNW1nWCtHaG5LUTUwVUt4NlFWZVplNDV2WndBWjVw?=
 =?utf-8?B?VVZlcXBWSU00TTk3TVAybDMvUm14ZUU5dWJtUEhnOHUzVzlpZjQ2bGRadlBo?=
 =?utf-8?B?ZEZZc3hQWHAzRkhUcnE3RnJKV1N1TEF6UC9pK0ZRNXZsRlZ5ZGs0Q2NNaWE3?=
 =?utf-8?B?U3JWL0pFZEdhKzdJemdXU01qa3RMbmZmaDlKZ1lYRGNIcXNCUlMrNjVyVzRB?=
 =?utf-8?B?WmZHUnM2dG9qRS9SMVJ2dkxPRDVkb0xoR3hMSmJhbTI0MFFYR01UMnh4VEFX?=
 =?utf-8?B?V3dXQkZJN3pDY0FDem5nRDJuVnM0cHBIK3B3SEVMNm1JWkJMSG1MRGQyeVEx?=
 =?utf-8?B?ODIrZlFLdVdUdTZab3Ayc1BTenhyUGdaY3BuTkdlc2pMeFhoWnZQNk5WOHhk?=
 =?utf-8?B?QkNrSWRWV1JzNDBHSGhpRjFJcTIwUyszMEZYQTJQUEttZVJrSjN0eW5DZXcw?=
 =?utf-8?B?anJ5ZE1xdVpiUDJGQ281NXlLbGVJZzBCZnAvbzE4a05GN3N2clJ1RWVNK3hP?=
 =?utf-8?B?ekNPamt3U2Z1N0JOT0MwakJaRmxic3F6ZDh4SE9QZmQxaWg4VU5McTBzZjdZ?=
 =?utf-8?B?cTM4QTlkanMzQ25xWnJOdytlTXFZTWJ6OUk5TlYzR2QvYjZuTlJZS0xVUDlN?=
 =?utf-8?B?bkZmK3pvK2VPbHlqZmdNY3E4NDErdm9iTDlKajU3aFN5V041b05XcHhtdzFM?=
 =?utf-8?B?SHErNmkxeFd0MUpkVzk2aGlyWW4reWdzTGhndS9jTFFyTkJFaEZRQldoN1Vz?=
 =?utf-8?B?KzJxMGx1UDlJaWxLeU9EYWlZaE53b3FUb3NZdGN0bEwxTHVCU254cEVGSXg5?=
 =?utf-8?B?dEEvTFRRZjVXVlJmZnY1VUc2NCtRZ21tWkhNNTN0S21Md1J6TzFMcGluVEhK?=
 =?utf-8?B?amJUTXJNNHdheTk0bmFNYVlXQlU2UlFVdUt4QnFWRGVZKzNJWndnb1hVQjBp?=
 =?utf-8?B?Qjh5OW4rcjh2WiswQWxOdms5RDhtZ0dxcjVQL3JvNXc3NjhyeDVuMThrQ2h6?=
 =?utf-8?B?c1hPbmhBQStQYjVseVQzYmhURHduV202TE5XWVJtd1ArWEtPaTU5eWxDeE5G?=
 =?utf-8?B?NXF5TXJ3cTZEUklLakxxZlk4TnkvU0Z0aXdzUVl5bUcxS1RzSEcxbzFwa0l4?=
 =?utf-8?B?MGpnOFlUamw5eDFTbUhLTjdjb0ZHajNWalhYMVVKcW9ST3hmL2h0TEhNczdW?=
 =?utf-8?B?RWxrZjJvbi8yNzIrbWViMkRzVXdXaHJFUlZ6Y2RHQlRyS0dYeUdCdjZjUUE2?=
 =?utf-8?B?dkkwMjluWk85d3JKcnhMVDlJUklmWmxKb1VwQklTMmZwTU14YVJmT0RlWEls?=
 =?utf-8?B?Nlg4NVJiRk1jQ3JUUmRINGhoU3prT2hMZmhjekJlT0RZc2lycFpVbUR0Kzdt?=
 =?utf-8?Q?JAMv5L5qVInELVo6Qmj0gDA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <171E117046CEFD469D86F17EF61FE3AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333f9b15-661d-4382-6997-08dbb88d46cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 21:21:52.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzYuMN72ZJ8HevCzY50X2MnpjMSXoXA+I8EFWUlDAqu6qrombtiH4AczFrWDIE3ZssOUjP4PMGQ19UP8QlbuKWEHKjPgev/rSTcgj7AHmiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/i915: Remove runtime suspended
 boolean from intel_runtime_pm struct
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Deak, Imre" <imre.deak@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjAwICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEl0J3Mgbm90IG5lY2Vzc2FyeSB0byBjYXJyeSBzZXBhcmF0ZSBzdXNwZW5kZWQgc3RhdHVz
IGluZm9ybWF0aW9uIGluDQo+IGludGVsX3J1bnRpbWVfcG0gc3RydWN0IGFzIHRoaXMgaW5mb3Jt
YXRpb24gaXMgYWxyZWFkeSBpbiB1bmRlcmx5aW5nIGRldmljZQ0KPiBzdHJ1Y3R1cmUuIFJlbW92
ZSBpdCBhbmQgdXNlIHBtX3J1bnRpbWVfc3VzcGVuZGVkKCkgdG8gb2J0YWluIHN1c3BlbmRlZA0K
PiBzdGF0dXMgaW5mb3JtYXRpb24gd2hlbiBuZWVkZWQuDQo+IA0KPiBDYzogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVs
LmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4g
TGluazoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIw
MjMwOTEzMTAwNDMwLjM0MzM5NjktMS1qb3VuaS5ob2dhbmRlckBpbnRlbC5jb20NCj4gKGNoZXJy
eSBwaWNrZWQgZnJvbSBjb21taXQgODg3NDI4OGM4MDNmYmE3ZmZmNGQ0NDE0NjRjYWMzYTUxMzM2
NGZkMSkNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X3Bvd2VyLmMgfCAyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyAtLS0NCj4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAy
ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEgLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRp
bWVfcG0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICsrLS0NCj4gwqA1IGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IFZpbm9k
IEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bv
d2VyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93
ZXIuYw0KPiBpbmRleCAwNjhkYzIyMzY1M2QuLmNkYTA4NmQ1YzRjNyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4g
QEAgLTIxNiw3ICsyMTYsNyBAQCBib29sIF9faW50ZWxfZGlzcGxheV9wb3dlcl9pc19lbmFibGVk
KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwNCj4gwqDCoMKgwqDCoMKgwqDCoHN0
cnVjdCBpOTE1X3Bvd2VyX3dlbGwgKnBvd2VyX3dlbGw7DQo+IMKgwqDCoMKgwqDCoMKgwqBib29s
IGlzX2VuYWJsZWQ7DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChkZXZfcHJpdi0+cnVudGlt
ZV9wbS5zdXNwZW5kZWQpDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChwbV9ydW50aW1lX3N1c3BlbmRl
ZChkZXZfcHJpdi0+ZHJtLmRldikpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIGZhbHNlOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgaXNfZW5hYmxlZCA9IHRydWU7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiBpbmRleCBmOGRiZWU3YTVhZjcuLmNk
OThlZTc0MDk3NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jDQo+IEBAIC0x
NTY5LDggKzE1NjksNiBAQCBzdGF0aWMgaW50IGludGVsX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICprZGV2KQ0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJvb3RfcGRldikNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY2lfZDNjb2xkX2Rpc2FibGUocm9vdF9wZGV2KTsN
Cj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgcnBtLT5zdXNwZW5kZWQgPSB0cnVlOw0KPiAtDQo+IMKg
wqDCoMKgwqDCoMKgwqAvKg0KPiDCoMKgwqDCoMKgwqDCoMKgICogRklYTUU6IFdlIHJlYWxseSBz
aG91bGQgZmluZCBhIGRvY3VtZW50IHRoYXQgcmVmZXJlbmNlcyB0aGUgYXJndW1lbnRzDQo+IMKg
wqDCoMKgwqDCoMKgwqAgKiB1c2VkIGJlbG93IQ0KPiBAQCAtMTYyMSw3ICsxNjE5LDYgQEAgc3Rh
dGljIGludCBpbnRlbF9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICprZGV2KQ0KPiDCoMKg
wqDCoMKgwqDCoMKgZGlzYWJsZV9ycG1fd2FrZXJlZl9hc3NlcnRzKHJwbSk7DQo+IMKgDQo+IMKg
wqDCoMKgwqDCoMKgwqBpbnRlbF9vcHJlZ2lvbl9ub3RpZnlfYWRhcHRlcihkZXZfcHJpdiwgUENJ
X0QwKTsNCj4gLcKgwqDCoMKgwqDCoMKgcnBtLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gwqANCj4g
wqDCoMKgwqDCoMKgwqDCoHJvb3RfcGRldiA9IHBjaWVfZmluZF9yb290X3BvcnQocGRldik7DQo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAocm9vdF9wZGV2KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9ncHVfZXJyb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
Z3B1X2Vycm9yLmMNCj4gaW5kZXggNDAwOGJiMDlmZGI1Li5hNjBiYWIxNzdjNTUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9ncHVfZXJyb3IuYw0KPiBAQCAtMTk3Miw3ICsxOTcyLDcg
QEAgc3RhdGljIHZvaWQgY2FwdHVyZV9nZW4oc3RydWN0IGk5MTVfZ3B1X2NvcmVkdW1wICplcnJv
cikNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gZXJy
b3ItPmk5MTU7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBlcnJvci0+d2FrZWxvY2sgPSBhdG9t
aWNfcmVhZCgmaTkxNS0+cnVudGltZV9wbS53YWtlcmVmX2NvdW50KTsNCj4gLcKgwqDCoMKgwqDC
oMKgZXJyb3ItPnN1c3BlbmRlZCA9IGk5MTUtPnJ1bnRpbWVfcG0uc3VzcGVuZGVkOw0KPiArwqDC
oMKgwqDCoMKgwqBlcnJvci0+c3VzcGVuZGVkID0gcG1fcnVudGltZV9zdXNwZW5kZWQoaTkxNS0+
ZHJtLmRldik7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBlcnJvci0+aW9tbXUgPSBpOTE1X3Z0
ZF9hY3RpdmUoaTkxNSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBlcnJvci0+cmVzZXRfY291bnQgPSBp
OTE1X3Jlc2V0X2NvdW50KCZpOTE1LT5ncHVfZXJyb3IpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfcnVudGltZV9wbS5jDQo+IGluZGV4IDZkOGU1ZTVjMGNiYS4uODc0MzE1M2ZhZDg3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jDQo+IEBAIC02NTIs
NyArNjUyLDYgQEAgdm9pZCBpbnRlbF9ydW50aW1lX3BtX2luaXRfZWFybHkoc3RydWN0IGludGVs
X3J1bnRpbWVfcG0gKnJwbSkNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoHJwbS0+a2RldiA9IGtk
ZXY7DQo+IMKgwqDCoMKgwqDCoMKgwqBycG0tPmF2YWlsYWJsZSA9IEhBU19SVU5USU1FX1BNKGk5
MTUpOw0KPiAtwqDCoMKgwqDCoMKgwqBycG0tPnN1c3BlbmRlZCA9IGZhbHNlOw0KPiDCoMKgwqDC
oMKgwqDCoMKgYXRvbWljX3NldCgmcnBtLT53YWtlcmVmX2NvdW50LCAwKTsNCj4gwqANCj4gwqDC
oMKgwqDCoMKgwqDCoGluaXRfaW50ZWxfcnVudGltZV9wbV93YWtlcmVmKHJwbSk7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmggYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmgNCj4gaW5kZXggNzY0YjE4M2FlNDUyLi5m
NzljZGE3YTI1MDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1
bnRpbWVfcG0uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50aW1lX3Bt
LmgNCj4gQEAgLTYsNiArNiw3IEBADQo+IMKgI2lmbmRlZiBfX0lOVEVMX1JVTlRJTUVfUE1fSF9f
DQo+IMKgI2RlZmluZSBfX0lOVEVMX1JVTlRJTUVfUE1fSF9fDQo+IMKgDQo+ICsjaW5jbHVkZSA8
bGludXgvcG1fcnVudGltZS5oPg0KPiDCoCNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiDCoA0K
PiDCoCNpbmNsdWRlICJpbnRlbF93YWtlcmVmLmgiDQo+IEBAIC00Myw3ICs0NCw2IEBAIHN0cnVj
dCBpbnRlbF9ydW50aW1lX3BtIHsNCj4gwqDCoMKgwqDCoMKgwqDCoGF0b21pY190IHdha2VyZWZf
Y291bnQ7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlICprZGV2OyAvKiBwb2ludHMg
dG8gaTkxNS0+ZHJtLmRldiAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBhdmFpbGFibGU7DQo+
IC3CoMKgwqDCoMKgwqDCoGJvb2wgc3VzcGVuZGVkOw0KPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBp
cnFzX2VuYWJsZWQ7DQo+IMKgwqDCoMKgwqDCoMKgwqBib29sIG5vX3dha2VyZWZfdHJhY2tpbmc7
DQo+IMKgDQo+IEBAIC0xMTAsNyArMTEwLDcgQEAgaW50ZWxfcnBtX3dha2Vsb2NrX2NvdW50KGlu
dCB3YWtlcmVmX2NvdW50KQ0KPiDCoHN0YXRpYyBpbmxpbmUgdm9pZA0KPiDCoGFzc2VydF9ycG1f
ZGV2aWNlX25vdF9zdXNwZW5kZWQoc3RydWN0IGludGVsX3J1bnRpbWVfcG0gKnJwbSkNCj4gwqB7
DQo+IC3CoMKgwqDCoMKgwqDCoFdBUk5fT05DRShycG0tPnN1c3BlbmRlZCwNCj4gK8KgwqDCoMKg
wqDCoMKgV0FSTl9PTkNFKHBtX3J1bnRpbWVfc3VzcGVuZGVkKHJwbS0+a2RldiksDQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkRldmljZSBzdXNwZW5kZWQgZHVyaW5nIEhX
IGFjY2Vzc1xuIik7DQo+IMKgfQ0KPiDCoA0KDQo=
